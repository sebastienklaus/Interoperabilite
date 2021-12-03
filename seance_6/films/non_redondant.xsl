<?xml version='1.0' encoding="UTF-8" ?>
 <xsl:stylesheet version="1.0"
		 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

   <!-- xsltproc with non_r.xml, this file  -->
    <xsl:template match="/FILMS">
        <xsl:copy>
            <ListeReal>
                <xsl:apply-templates select="Films/Realisateur[not(@ID = ../preceding-sibling::*/Realisateur/@ID)]" mode="liste"/>
            </ListeReal>
            <ListeFilm>
                <xsl:apply-templates select="Film"/>
            </ListeFilm>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Realisateur" mode="liste">
        <xsl:copy-of select="."/>
    </xsl:template>

    <xsl:template match="Film">
        <xsl:copy>
            <xsl:attribute name="Realisateurs">
                <xsl:apply-templates select="Realisateur" mode="references"/>
            </xsl:attribute>
            <xsl:copy-of select="*[name() != 'Realisateur']"/>
            <xsl:copy-of select="@*"/>
        </xsl:copy>
    </xsl:template>


    <xsl:template match="Realisateur" mode="references">
        <xsl:value-of select="@ID"/>
        <xsl:text> </xsl:text>
    </xsl:template>

</xsl:stylesheet>