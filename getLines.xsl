<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : getLines.xsl
    Created on : 2014年5月30日, 下午8:23
    Author     : crazydog
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>getLines.xsl</title>
            </head>
            <body>
                <ul>
                    <xsl:for-each select="ACT">
                        <xsl:if test="SCENE/LINE">
                        <li>
                        <xsl:element name="h3">
                            <xsl:attribute name="style">font-family:verdana;</xsl:attribute>
                            <xsl:value-of select="TITLE"/>
                        </xsl:element>
                        <br/>
                        <ul>
                        <xsl:for-each select="SCENE">
                            <xsl:if test="LINE">
                            <li>
                            <xsl:element name="h4">
                            <xsl:attribute name="style">font-family:verdana;</xsl:attribute>
                            <xsl:value-of select="TITLE"/>
                            </xsl:element>
                            <br/>
                            <ul>
                            <xsl:for-each select="LINE">
                                     <li><xsl:value-of select="." /></li>
                            </xsl:for-each>
                            </ul>
                            </li>
                            </xsl:if>
                        </xsl:for-each>
                        </ul>
                        </li>
                        </xsl:if>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
