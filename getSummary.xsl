<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : shakespeare.xsl
    Created on : 2014年5月30日, 下午12:09
    Author     : crazydog
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="PLAY">
                <h2 style="font-family:verdana;"><xsl:value-of select="TITLE"/></h2>
                <h4 style="font-family:verdana;">Author: William Shakespeare</h4>
                <ul>
                <li style="font-family:verdana;">Characters:
                    <ul>
                    <xsl:for-each select="PERSONAE//PERSONA">
                        <li style="font-family:verdana;">
                        <xsl:element name="a">
                            <xsl:attribute name="herf">#</xsl:attribute>
                            <xsl:attribute name="onclick">showChar(this.innerText);return false;</xsl:attribute>
                            <xsl:attribute name="style">font-family:verdana;</xsl:attribute>
                            <xsl:value-of select="."/>
                        </xsl:element>
                        </li>
                    </xsl:for-each>
                    </ul>
                </li>
                <li style="font-family:verdana;">Stage Requirements:
                <ul>
                            <xsl:for-each select="//STAGEDIR[not(preceding::STAGEDIR/. = .)]">
                                     <li><xsl:value-of select="." /></li>
                            </xsl:for-each>
                </ul>
                </li>
                </ul>       
    </xsl:template>

</xsl:stylesheet>
