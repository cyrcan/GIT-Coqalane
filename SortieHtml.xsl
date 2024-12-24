<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0">

  <xsl:output method="html"/>

  <xsl:template match="TEI">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>
          <xsl:value-of select="teiHeader/fildeDesc/titleStmt/title"/>
        </title>
      </head>
      <!--Métadonnées du document généré-->
      <body>
        <!--Contenu de notre document en appliquant la cmd suivante-->
        <b>
          <xsl:apply-templates select="//title"/>
        </b>
        <br/>
        <xsl:apply-templates select="text"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="l">
    <br/>
    <l style="margin-left:40px"> </l>
    <xsl:apply-templates/>
  </xsl:template>
 

  <xsl:template match="fw"/>

  <xsl:param name="modernisation">oui</xsl:param>

  <xsl:template match="choice">
    <xsl:choose>
      <xsl:when test="$modernisation = 'oui'">
        <xsl:apply-templates select="reg | corr | expan"/>
      </xsl:when>
      <xsl:when test="$modernisation = 'non'">
        <xsl:apply-templates select="orig | sic | abbr"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:comment>Valeur du paramètre "modernisation" non reconnue (<xsl:value-of select="$modernisation"/>).</xsl:comment>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <xsl:param name="annotation">oui</xsl:param>
  <xsl:template match="note">
    <xsl:choose>
      <xsl:when test="$annotation = 'oui'">
        <xsl:apply-templates select="editor"/>
      </xsl:when>
    </xsl:choose>
    <font color="#FF8833" size="2.5pt">
      <text>[<xsl:value-of select="."/>]</text>
    </font>
  </xsl:template>


  <xsl:template match="persName">
    <b>
      <xsl:apply-templates/>
    </b>

  </xsl:template>

  <xsl:template match="placeName">
    <b style="color:blue">
      <xsl:apply-templates/>
    </b>

  </xsl:template>


</xsl:stylesheet>
