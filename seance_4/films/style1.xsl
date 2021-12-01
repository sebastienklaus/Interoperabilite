<?xml version='1.0' encoding="UTF-8" ?>
 <xsl:stylesheet version="1.0"
		 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

   <!-- On démarre de la racine -->
   <xsl:template match="/"> 
     <!-- On parcourt le sous-arbre dans l'ordre 'normal' -->
     <html>
      <body>
          <h1>List Of Movies</h1>
          <ul>
             <xsl:apply-templates /> 
          </ul>
      </body>
   </html>
   </xsl:template>
   
   <!-- Régle à appliquer lorsque le parcours 
	arrive sur un élément nommé 'Film' -->
   <xsl:template match="./Film">
     <!-- Cette fois on ne parcourt que le sous élement 'Titre' -->
     <!-- à noter que si le parcours arrive sur une feuille, le contenu de la feuille est inscrit en sortie --> 
     <xsl:apply-templates select="Titre"/>  
   </xsl:template>

   <xsl:template match="Titre">
      <!-- Cette fois on ne parcourt que le sous élement 'Titre' -->
      <!-- à noter que si le parcours arrive sur une feuille, le contenu de la feuille est inscrit en sortie --> 
      
      <li>Titre du film : <xsl:value-of select="."/></li>  
      <xsl:text>    </xsl:text>
   </xsl:template>


   <xsl:template match="text()"/>

</xsl:stylesheet>
