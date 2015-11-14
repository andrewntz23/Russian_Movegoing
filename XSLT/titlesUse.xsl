<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="3.0">
    <xsl:variable name="interviews" select="collection('../interview_xml_files')"/>

    <xsl:template match="/">

        <!--    Works with counts across the board with all interviews at once    -->

        <html>
            <head/>

            <body>

                <p><xsl:value-of
                    select="
                        'Total Titles Cited by Interviewees:',
                        count($interviews//distinct-values(title)),
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
            <xsl:value-of select="count(//title)"/>
            <br/>
            
            <xsl:apply-templates select="//title" />
        </ul>
        
    </xsl:template>
    
<xsl:template match="title">
    <li><xsl:apply-templates/></li>
</xsl:template>

</xsl:stylesheet>
