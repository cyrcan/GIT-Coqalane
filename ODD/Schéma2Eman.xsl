<?xml version="1.0" encoding="UTF-8"?>
    <xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        xmlns:rng="http://relaxng.org/ns/structure/1.0">
        
        <xsl:output method="xml" indent="yes"/>
        
        <xsl:template match="/">
            <elements>
                <xsl:apply-templates select="//rng:element"/>
            </elements>
        </xsl:template>
        
        <xsl:template match="rng:element">
            <element>
                <xsl:attribute name="name">
                    <xsl:value-of select="@name"/>
                </xsl:attribute>
            </element>
        </xsl:template>
        
    </xsl:stylesheet>
