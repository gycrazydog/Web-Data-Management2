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
                    <xsl:for-each select="ACT">
                        <li>
                        <xsl:element name="a">
                            <xsl:attribute name="href">#<xsl:value-of select="TITLE"/></xsl:attribute>
                            <xsl:attribute name="style">font-family:verdana;font-size:20px</xsl:attribute>
                            <xsl:value-of select="TITLE"/>
                        </xsl:element>
                        <br/>
                        <ul>
                        <xsl:for-each select="SCENE">
                            <li>
                            <xsl:element name="a">
                            <xsl:attribute name="href">#<xsl:value-of select="TITLE"/></xsl:attribute>
                            <xsl:attribute name="style">font-family:verdana;font-size:20px</xsl:attribute>
                            <xsl:value-of select="TITLE"/>
                            </xsl:element>
                            <br/>
                            <ul>
                            <xsl:for-each select="//SPEAKER[not(preceding::SPEAKER/. = .)]">
                                     <li><xsl:value-of select="." /></li>
                            </xsl:for-each>
                            </ul>
                            </li>
                        </xsl:for-each>
                        </ul>
                        </li>
                    </xsl:for-each>
                    <hr>ALL LINES</hr>
                    <xsl:for-each select="ACT">
                        <xsl:element name="a">
                            <xsl:attribute name="name"><xsl:value-of select="TITLE"/></xsl:attribute>
                            <xsl:attribute name="style">font-family:verdana;font-size:30px</xsl:attribute>
                            <xsl:value-of select="TITLE"/>
                        </xsl:element>
                                                    <br/>
                        <xsl:for-each select="SCENE">
                            <xsl:element name="a">
                            <xsl:attribute name="name"><xsl:value-of select="TITLE"/></xsl:attribute>
                            <xsl:attribute name="style">font-family:verdana;font-size:25px</xsl:attribute>
                            <xsl:value-of select="TITLE"/>
                            </xsl:element>
                            <br/>
                            <xsl:for-each select="SPEECH">
                            <xsl:element name="p">
                            <xsl:attribute name="style">font-family:verdana;color:#993333</xsl:attribute>
                            <xsl:value-of select="SPEAKER"/>:
                            </xsl:element>
                            <xsl:for-each select="LINE">
                                <xsl:element name="p">
                                <xsl:attribute name="style">font-family:verdana;color:#003366</xsl:attribute>
                                <xsl:value-of select="."/>
                                </xsl:element>
                            </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:for-each>
                </ul>       
    </xsl:template>

</xsl:stylesheet>