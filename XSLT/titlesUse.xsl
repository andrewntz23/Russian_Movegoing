<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:variable name="interviews" select="collection('../interview_xml_files')"/>
    <xsl:variable name="index" select="document('../index.xml')"/>
    <xsl:template match="/">

        <!--    Works with counts across the board with all interviews at once    -->

        <html>
            <head/>

            <body>

                <p><xsl:value-of
                    select="
                        'Total Titles Cited by Interviewees:',
                        count($interviews//distinct-values(title/@ref)),
                        '&#10;'"/></p>
                <hr/>   
                <xsl:apply-templates select="$interviews//body"/>
                    
                
            </body>

        </html>

    </xsl:template>


    <!--    Works at the context of individual documents by processing one body at a time.   -->
    <xsl:template match="$interviews//body">

        <xsl:text> Count and List of Titles Mentioned by </xsl:text>
        <xsl:value-of select="
                //interviewee/@ref,
                ':'"/>

        <ul>
            <xsl:value-of select="count(distinct-values(//title/@ref))"/>
            <br/>
            
            <!--<xsl:apply-templates select="distinct-values(//title/@ref)" />-->
            <xsl:for-each select="//title/@ref[not(preceding::title/@ref = .)]">
                <xsl:variable name="ref" select="."/>
                <li><xsl:value-of select="$index//title[@xml:id = $ref]/fullTitle"/></li>
            </xsl:for-each>
        </ul>
        
    </xsl:template>
    
<xsl:template match="title">
    <li><xsl:apply-templates/></li>
</xsl:template>

</xsl:stylesheet>
