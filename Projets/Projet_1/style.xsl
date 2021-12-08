<?xml version='1.0' encoding="UTF-8" ?>
 <xsl:stylesheet version="1.0"
		 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="html" encoding="UTF-8" indent="yes"/>

   <xsl:strip-space elements="Film"/>

   <!-- On démarre de la racine -->
   <xsl:template match="/"> 
     <!-- On parcourt le sous-arbre dans l'ordre 'normal' -->
     <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
     <html>
      <body>
          <h1>Previsions</h1>
          <table border="1">
              <tbody>
                <tr>
                    <td><b>Journée</b></td>
                    <td><b>Température</b></td>
                    <td><b>Pluie</b></td>
                    <td><b>Vent</b></td>
                    <td><b>Humidité</b></td>
                    <td><b>Pression</b></td>
                </tr>
                <xsl:apply-templates /> 
              </tbody>
          </table>
      </body>
   </html>
   </xsl:template>

   <xsl:template match="Previsions/Jour">
            <tr>
                <td><xsl:value-of select="@Timestamp"/></td>
                <td><xsl:value-of select="./Temperature"/></td>
                <td><xsl:value-of select="./Pluie"/><xsl:text> mm</xsl:text></td>
                <td><xsl:apply-templates select="./Vent"/></td>
                <td><xsl:value-of select="./Humidite"/><xsl:text> %</xsl:text></td>
                <td><xsl:value-of select="./Pression"/><xsl:text> P</xsl:text></td>
           </tr>
   </xsl:template>

   <xsl:template match="Vent">
       Une vitesse de <xsl:value-of select="./Vitesse"/> km/h avec 
       <br/>
       des rafales jusqu'a <xsl:value-of select="./Rafales"/> km/h !
   </xsl:template>

</xsl:stylesheet>