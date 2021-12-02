<?xml version='1.0' encoding="UTF-8" ?>
 <xsl:stylesheet version="1.0"
		 xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="xml" encoding="UTF-8" indent="yes"/>

   <xsl:strip-space elements="Film"/>

   <!-- On démarre de la racine -->
   <xsl:template match="/"> 
        <!-- On parcourt le sous-arbre dans l'ordre 'normal' -->
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
            <style>
                .aime {
                color           : red;
                }
               .lire {
                text-decoration : none;
                text-align      : right;
                font-size       : small;
                }
            
                a {text-decoration : inherit;}				
            
                </style>
            </head>
            <body>
                    <xsl:apply-templates /> 
            </body>
        </html>
   </xsl:template>
   

   <xsl:template match="FILMS">
        <xsl:apply-templates select="Film"/>
   </xsl:template>

   <xsl:template match="FILMS/Film">
            <!-- on crée l'ance avec l'id du film -->
            <a name="{@ID}"></a>
            <h1><xsl:value-of select="./Titre"/></h1>
            <xsl:apply-templates select="./Critique"/>
   </xsl:template>

   <xsl:template match="Critique">
    <p>
        <font size="3" color="steelblue" face="verdana"><b><xsl:value-of select="./Media"/></b></font>
              <font size="3" color="steelblue" face="verdana">
            (<i><xsl:value-of select="./Auteur"/></i>)
          </font>
          <div align="justify">
            <xsl:value-of select="./Texte"/>
          </div>
    </p>
   </xsl:template>


</xsl:stylesheet>