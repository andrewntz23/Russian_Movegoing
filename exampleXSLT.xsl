<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title/>
            </head>
            <body>
            <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="speech">
       <p>
           <xsl:apply-templates/>
       </p>
    </xsl:template>
<!--  Catch all to get any element and output it 
        as a span inside of speech tags  -->
    <xsl:template match="speech/*">
        <!--<span><xsl:attribute name="class" select="node-name()"/>
            <xsl:apply-templates/></span>-->
        
    </xsl:template>
    
<!--  This is how you could do it with two seperate rules -->
    <!--<xsl:template match="hes[@type='non-lex']">
    </xsl:template>-->
    <xsl:template match="hes">
<!--  Two different ways to handle non-lex vs. lex      -->
        <xsl:if test="@type = 'non-lex'">
            <xsl:value-of>... </xsl:value-of>
        </xsl:if>
        <xsl:if test="@type = 'lex'">
            <!--however we'll handle this-->
        </xsl:if>
        
        <xsl:choose>
            <xsl:when test="@type='non-lex'">
                <xsl:value-of>... </xsl:value-of>
            </xsl:when>
            <xsl:otherwise>
                <!--however we'll handle this-->
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
<!--Basically can just go througha and create template rules similar
    to the one above for remainder of non-structural tags-->
</xsl:stylesheet>
