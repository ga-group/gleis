<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0">

  <xsl:strip-space elements="*"/>
  <xsl:output method="text"/>

  <xsl:template match="div[@class='results-wrapper']">
    <xsl:apply-templates select=".//li"/>
  </xsl:template>

  <xsl:template match="li[@class='live']">
    <xsl:value-of select="span[@class='note']"/>
    <xsl:text>&#0009;</xsl:text>
    <xsl:value-of select="a[@class='label']"/>
    <xsl:text>&#0010;</xsl:text>
  </xsl:template>

  <xsl:template match="text()"/>

</xsl:stylesheet>
