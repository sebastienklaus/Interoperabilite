<?xml version='1.0' encoding="UTF-8" ?>
 <xsl:stylesheet version="1.0"
		 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

   <!-- xsltproc with non_r.xml, this file & films1.xml  -->
    <xsl:template match="/FILMS">
        <xsl:copy>
            <ListeReal>
                <!-- Pour éviter la répéetition d'un réalisatieur qui pourrait aparaitre plusieurs fois 
                preceding-sibling va chercher dans chaque balise Realisateur l'attribut ID et comparer la valeur, et not pour dire qu'on prend pas le doublon-->
                <xsl:apply-templates select="Film/Realisateur[not(@ID = ../preceding-sibling::*/Realisateur/@ID)]" mode="liste"/>
            </ListeReal>
            <ListeActeurs>
                <xsl:apply-templates select="Film/Acteurs/Acteur[not(@ID = ../preceding-sibling::*/Acteurs/Acteur/@ID)]" mode="liste"/>
            </ListeActeurs>
            <ListeFilm>
                <xsl:apply-templates select="Film"/>
            </ListeFilm>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="Realisateur" mode="liste">
        <xsl:copy-of select="."/> 
    </xsl:template>

    <xsl:template match="Acteurs/Acteur" mode="liste">
        <xsl:copy-of select="."/> 
    </xsl:template>

    <xsl:template match="Film">
        <xsl:copy>
            <xsl:attribute name="Realisateurs">
                <xsl:apply-templates select="Realisateur" mode="references" disable-output-escaping="yes"/>
            </xsl:attribute>
            <xsl:if test="count(./Acteurs) > 0">
                <xsl:attribute name="Acteurs">
                    <xsl:apply-templates select="Acteurs/Acteur" mode="references" disable-output-escaping="yes"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:copy-of select="@*"/>
            <xsl:copy-of select="*[name() != 'Realisateur' and name() != 'Acteurs']"/>
        </xsl:copy>
    </xsl:template>


    <xsl:template match="Realisateur" mode="references">
        <xsl:value-of select="@ID"/>
        <xsl:if test="position() != last()"><xsl:text> </xsl:text></xsl:if>
    </xsl:template>

    <xsl:template match="Acteur" mode="references">
        <xsl:if test="position() != 1"><xsl:text> </xsl:text></xsl:if>
        <xsl:value-of select="@ID"/>
    </xsl:template>

</xsl:stylesheet>