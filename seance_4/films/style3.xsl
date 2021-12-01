<?xml version='1.0' encoding="UTF-8" ?>
 <xsl:stylesheet version="1.0"
		 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

   <!-- On démarre de la racine -->
   <xsl:template match="/"> 
     <!-- On parcourt le sous-arbre dans l'ordre 'normal' -->
     <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
     <html>
      <body>
          <h1>List Of <xsl:value-of select="count(/FILMS/Film)"/> Movies</h1>
          <table border="1">
              <tbody>
                <tr>
                    <td><b>N°</b></td>
                    <td><b>Titre</b></td>
                    <td><b>Réalisateur</b></td>
                    <td><b>Pays</b></td>
                    <td><b>Genre</b></td>
                    <td><b>Durée</b></td>
                    <td><b>Affiche</b></td>
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

   <xsl:template match="FILMS/Film">
            <tr>
                <td><xsl:number value="position()"/>.</td>
                <td><b><xsl:value-of select="./Titre"/></b></td>
                <td>
                    <xsl:for-each select="./Realisateur">
                        <b><xsl:value-of select="./Nom"/></b>
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="./Prenom"/>
                        <br />
                    </xsl:for-each>
                </td>
                <td><xsl:value-of select="./Pays"/></td>
                <td><xsl:value-of select="./Genre"/></td>
                <td><xsl:value-of select="./Duree"/></td>
                <td>
                    <a>
                        <xsl:attribute name="href">
                            <xsl:value-of select="@Affiche"/>
                        </xsl:attribute>
                        <img width="70">
                            <xsl:attribute name="src">
                                <xsl:value-of select="@Affiche"/>
                            </xsl:attribute>
                        </img>
                    </a>
                </td>
           </tr>
   </xsl:template>

</xsl:stylesheet>