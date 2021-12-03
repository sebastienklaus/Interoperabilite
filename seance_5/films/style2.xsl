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
                    <td><b>Critique(<span class="aime">Ils ont aimé</span>)</b></td>
                </tr>
                <xsl:apply-templates select="FILMS/Film" mode="Table">
                <!-- Pour le sort, on le place dans la balise xslapply-templates du tableau Film, et donc ne s'applique pas à List Film -->
                    <xsl:sort select="./Titre" order="ascending" data-type="text" />
                </xsl:apply-templates>
            </tbody>
        </table>
        <xsl:apply-templates select="FILMS/Film" mode="List"/>
        <!-- <xsl:apply-templates /> -->
      </body>
   </html>
   </xsl:template>


   <!-- <xsl:template match="FILMS">
    <xsl:apply-templates select="Film"/>
   </xsl:template> -->

   <xsl:template match="Film" mode="Table">
            <tr>
                <td><xsl:number value="position()"/>.</td>
                <td>
                    <b></b>
                    <b><xsl:value-of select="./Titre"/></b>
                </td>
                <td>
                    <xsl:choose>
                        <!-- &lt; est égal à < -->
                        <xsl:when test="count(./Realisateur) &lt; 3"> 
                            <xsl:apply-templates select="./Realisateur" mode="RealTable"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <em>Film collectif</em>
                        </xsl:otherwise>
                    </xsl:choose>
                </td>
                <td><xsl:value-of select="./Pays"/></td>
                <td><xsl:value-of select="./Genre"/></td>
                <td><xsl:value-of select="./Duree"/></td>
                <td>
                    <!-- 2 façons de faire : 1. {@}     2.attribute & value-of -->
                    <a href="{@Affiche}">
                        <img width="70">
                            <xsl:attribute name="src">
                                <xsl:value-of select="@Affiche"/>
                            </xsl:attribute>
                        </img>
                    </a>
                </td>
                <td class="try">
                    <xsl:apply-templates select="./Critique" mode="CritTable"/>
                    <div>
                        <a href="#{@ID}">Lire les critiques</a>
                    </div>
                </td>
           </tr>
   </xsl:template>

   <xsl:template match="Realisateur" mode="RealTable">
        <b><xsl:value-of select="./Nom"/></b>
        <xsl:text> </xsl:text>
        <xsl:choose>
            <xsl:when test="count(../Realisateur) = 2">
                <xsl:value-of select="substring(./Prenom, 1, 2)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="./Prenom"/>
            </xsl:otherwise>
        </xsl:choose>
        <br/>
   </xsl:template>

   <xsl:template match="Critique" mode="CritTable">
        <xsl:if test="./Note >= 2.5 ">
            <div class="aime">
               <xsl:value-of select="./Media"/>
            </div>
            <!-- Possible aussi de revenir en arrière avec ../Media en étant dans le match Critique/Note -->
        </xsl:if>
   </xsl:template>

   <xsl:template match="Film" mode="List">
            <!-- on crée l'ance avec l'id du film -->
            <a name="{@ID}"></a>
            <h1><xsl:value-of select="./Titre"/></h1>
            <xsl:apply-templates select="./Critique" mode="CritList"/>
            <p>
                <font size="3" color="steelblue" face="verdana">
                    <b><xsl:value-of select="./Critique/Media"/></b>
                </font>
                <font size="3" color="steelblue" face="verdana">
                    (<i><xsl:value-of select="./Critique/Auteur"/></i>)
                </font>
                  <div align="justify">
                    <xsl:value-of select="./Critique/Texte"/>
                  </div>
            </p>
   </xsl:template>

   <xsl:template match="Critique" mode="CritList">
    <p>
        <font size="3" color="steelblue" face="verdana">
            <b><xsl:value-of select="./Media"/></b>
        </font>
        <font size="3" color="steelblue" face="verdana">
            (<i><xsl:value-of select="./Auteur"/></i>)
        </font>
          <div align="justify">
            <xsl:value-of select="./Texte"/>
          </div>
    </p>
   </xsl:template>


</xsl:stylesheet>