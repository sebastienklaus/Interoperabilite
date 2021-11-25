<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text"	/>
  <xsl:strip-space elements="*"/>
  
	<xsl:template match="*" >
    BALISE "<xsl:value-of select="name(.)"/>" :
    <xsl:if test="count(@*) > 0">
      ATTRIBUTS :
      <xsl:apply-templates select="@*"/>
    </xsl:if>
    <xsl:if test="count(@*) = 0">
      (SANS ATTRIBUT.)
    </xsl:if>
    <xsl:choose>
      <xsl:when test="text() != ''">
        TEXTE : #<xsl:value-of select="text()"/>#
      </xsl:when>
      <xsl:otherwise>
        (SANS TEXTE.)
      </xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates select="./*"/>
	</xsl:template>
  
	<xsl:template match="@*" >
        - ATTRIBUT n°<xsl:value-of select="position()"/> "<xsl:value-of select="name(.)"/>" : @<xsl:value-of select="."/>@
	</xsl:template>
  
</xsl:stylesheet>
