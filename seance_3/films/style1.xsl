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
      <div style="border : 2px solid grey; margin : 1em 0">
         <xsl:apply-templates select="Titre"/>  
         <ul>
            <span style="color:#ff0000">Realisateur :</span>
            <xsl:apply-templates select="Realisateur"/>
         </ul>
         <xsl:apply-templates select="Genre"/>
         <xsl:apply-templates select="Pays"/>
         <xsl:apply-templates select="Duree"/>
         <ul>
            <span style="color:#0000ff">Resume :</span>
            <xsl:apply-templates select="Resume"/>
         </ul>
         <ul>
            <span style="color:#0000ff">Acteurs :</span>
            <xsl:apply-templates select="Acteurs"/>
         </ul>
         <xsl:apply-templates select="Image"/>
         <ul>
            <span style="color:#0000ff">Montage :</span>
            <xsl:apply-templates select="Montage"/>
         </ul>
         <xsl:apply-templates select="Musique"/>
         <xsl:apply-templates select="Producteur"/>
         <xsl:apply-templates select="Distributeur"/>
         <table>
            <span style="color:#ff0000">Critique :</span>
            <xsl:apply-templates select="Critique"/>
         </table>
      </div>
   </xsl:template>

   <xsl:template match="Titre">
      Titre : <span style="color:#ff0000">
      <xsl:value-of select="."/></span>
      <br/>
   </xsl:template>

   <xsl:template match="Realisateur">
         <li><xsl:value-of select="."/></li>
   </xsl:template>

   <xsl:template match="Genre">
      Genre : <span style="color:#ff0000">
      <xsl:value-of select="."/></span>
      <br/>
   </xsl:template>

   <xsl:template match="Pays">
      Pays : <span style="color:#ff0000">
      <xsl:value-of select="."/></span>
      <br/>
   </xsl:template>

   <xsl:template match="Duree">
      Duree : <span style="color:#ff0000">
      <xsl:value-of select="."/></span>
      <br/>
   </xsl:template>

   <xsl:template match="Resume">
         <li><xsl:value-of select="./Titre"/></li>
         <li><xsl:value-of select="./Texte"/></li>
   </xsl:template>

   <xsl:template match="Acteurs">
         <li><xsl:value-of select="./Acteur"/></li>
   </xsl:template>

   <xsl:template match="Image">
         Image : <span><xsl:value-of select="."/></span>
         <br/>
   </xsl:template>

   <xsl:template match="Montage">
         <li><xsl:value-of select="."/></li>
   </xsl:template>

   <xsl:template match="Musique">
         Musique : <span><xsl:value-of select="."/></span>
         <br/>
   </xsl:template>

   <xsl:template match="Producteur">
         Producteur : <span><xsl:value-of select="."/></span>
         <br/>
   </xsl:template>

   <xsl:template match="Distributeur">
         Distributeur : <span><xsl:value-of select="."/></span>
         <br/>
   </xsl:template>

   <xsl:template match="Critique">
         <tr>
            <td style="border: 1px solid #333;"><xsl:value-of select="./Media"/></td>
            <td style="border: 1px solid #333;"><xsl:value-of select="./Auteur"/></td>
            <td style="border: 1px solid #333;"><xsl:value-of select="./Texte"/></td>
         </tr>
   </xsl:template>

  
</xsl:stylesheet>
