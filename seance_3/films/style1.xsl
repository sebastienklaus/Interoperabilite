<?xml version='1.0' encoding="UTF-8" ?>
 <xsl:stylesheet version="1.0"
		 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

   <!-- On démarre le parcours de l'arbre xml de la racine -->
   <xsl:template match="/"> 
     <!-- On parcourt le sous-arbre dans l'ordre 'normal' -->
     <html>
        <body>
            <h1>List Of Movies</h1>
            <xsl:apply-templates /> 
        </body>
     </html>
   </xsl:template>

   <xsl:template match="Film">
      <p>
         <xsl:apply-templates select="Titre"/>  
         <xsl:apply-templates select="Realisateur"/>
      </p>
   </xsl:template>

   <xsl:template match="Titre">
      Titre: <span style="color:#ff0000">
      <xsl:value-of select="."/></span>
      <br />
   </xsl:template>

   <xsl:template match="Realisateur">
      Realisateur: <span style="color:#00ff00">
      <xsl:value-of select="."/></span>
      <br />
   </xsl:template>
  
</xsl:stylesheet>
