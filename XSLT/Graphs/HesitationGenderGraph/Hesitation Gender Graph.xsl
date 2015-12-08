<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg" version="2.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:variable name="interviews" select="collection('../interview_xml_files')"/>
    <xsl:variable name="index" select="document('../index.xml')"/>
    <xsl:variable name="scale" select="3" as="xs:integer"/>

    <xsl:template match="/">


        <svg>
            <g transform="translate(80, 400)">

               
                <line x1="0" y1="0" x2="1000" y2="0" stroke="black" stroke-width="2px"/>
              
                <line x1="0" y1="0" x2="0" y2="-200" stroke="black" stroke-width="2px"/>
                
                <rect 
                    x="30"
                    y= "-100"
                    height= "100"
                    width="90" 
                    fill="red"
                    stroke="black"
                    stroke-width="1"/>
                
                <rect 
                    x="30"
                    y="-{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//hes) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//hes))*200}"
                    height="{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//hes) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//hes))*200}"
                    width="90" 
                    fill="blue"/>

            </g>
        </svg>

    </xsl:template>
</xsl:stylesheet>
