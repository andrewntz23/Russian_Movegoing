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

                <line x1="0" y1="0" x2="500" y2="0" stroke="black" stroke-width="2px"/>
                <line x1="0" y1="0" x2="0" y2="-200" stroke="black" stroke-width="2px"/>

               
                
                <rect 
                    x="30"
                    y= "-{100}"
                    height= "{100}"
                    width="70" 
                    fill="blue"/>
                
                <rect 
                    x="30"
                    y="-{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron))*200}"
                    height="{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron))*200}"
                    width="70" 
                    fill="yellow"/>
                
                <rect 
                    x="200"
                    y= "-{100}"
                    height= "{100}"
                    width="70" 
                    fill="blue"/>
                
                <rect 
                    x="200"
                    y="-{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron[@number='plur']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron[@number='plur']))*200}"
                    height="{(count($interviews[//interviewee/@ref = $index//person[.//gender/text() = 'm']/@xml:id]//pron[@number='plur']) div count($interviews[//interviewee/@ref = $index//person/@xml:id]//pron[@number='plur']))*200}"
                    width="70" 
                    fill="yellow"/>
                
                
                <text
                    x="30"
                    y="-250" stroke="black" stroke-width="1"
                    >
                    Use of Pronouns in Interviews by Gender (%)
                    
                </text>
                
                <text
                    x="30"
                    y="-230" stroke="black" stroke-width="1"
                    >
                    Blue represent female interviewees and Yellow represents male interviewees.
                    Interviews are weighed.
                </text>
                
                <text
                x="30"
                y="40" stroke="black" stroke-width="1"
                >
                    Total
                </text>
                
                <text
                    x="200"
                    y="40" stroke="black" stroke-width="1"
                    >
                    Plural
                </text>
                
                <xsl:for-each select="1 to 10">
                    <xsl:variable name="yPosition" select=". * -10"/>
                    
                    <line x1="-3" y1="{$yPosition}" x2="3" y2="{$yPosition}" stroke="black"
                        stroke-width="2"/>
                    <!--    create the lable-->
                    
                </xsl:for-each>
                
                <text
                    x="-50"
                    y="-100" stroke="black" stroke-width="1"
                    >
                    100%
                </text>
                    

            </g>


        </svg>


    </xsl:template>

</xsl:stylesheet>
