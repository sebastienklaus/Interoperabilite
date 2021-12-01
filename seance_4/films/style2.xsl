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
          <table border="1">
              <tbody>
                <tr>
                    <td>Titre</td>
                    <td>Réalisateur</td>
                    <td>Pays</td>
                    <td>Genre</td>
                    <td>Durée</td>
                </tr>
                <xsl:apply-templates /> 
              </tbody>
          </table>
      </body>
   </html>
   </xsl:template>
   

   <xsl:template match="FILMS">
    <xsl:apply-templates select="Film"/>
   </xsl:template>

   <xsl:template match="Film">
            <tr>
                <td><xsl:value-of select="./Titre"/></td>
                <td><xsl:value-of select="./Realisateur[1]/Nom"/></td>
                <td><xsl:value-of select="./Pays"/></td>
                <td><xsl:value-of select="./Genre"/></td>
                <td><xsl:value-of select="./Duree"/></td>
           </tr>
   </xsl:template>


   <xsl:template match="text()"/>

</xsl:stylesheet>