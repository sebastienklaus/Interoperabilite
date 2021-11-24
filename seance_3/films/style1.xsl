<?xml version='1.0' encoding="UTF-8" ?>
 <xsl:stylesheet version="1.0"
		 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="text" encoding="UTF-8" indent="yes"/>

   <!-- On démarre le parcours de l'arbre xml de la racine -->
   <xsl:template match="/"> 
     <!-- On parcourt le sous-arbre dans l'ordre 'normal' -->
     <xsl:apply-templates /> 
     <html>
         <body>
            <xsl:for-each select="FILMS/Film">
            <h3><xsl:value-of select="Titre"/></h3>
            </xsl:for-each>
         </body>
     </html> 
   </xsl:template>
  
</xsl:stylesheet>
