<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">
    <xsl:output method="xhtml" indent="yes" doctype-system="about:legacy-compat"/>

    <xsl:template match="/">

        <html>
            <head>
                <title>Interview #</title>
                <link rel="stylesheet" type="text/css" href="prokhorova_10_28_xslt-06.css"/>
            </head>
            <body>

                <xsl:apply-templates select="//interview"/>


            </body>
        </html>

    </xsl:template>

    <xsl:template match="meta">
<!--        <h1> Interview with NAME </h1>-->

        <h2>
            <a href="http://mtp.blogs.wm.edu">
                <xsl:apply-templates select="project"/>
            </a>

        </h2>

        <h3>
            <ul>
                <li>
                    <xsl:apply-templates select="university"/>
                </li>
                <li>
                    Interview<sup><a href="#{@fn}">1</a></sup> date: 
                    <xsl:apply-templates select="date[1]"/>
                </li>
                <li>
                   Translation date: 
                    <xsl:apply-templates select="date[2]"/>
                </li>
            </ul>
        </h3>

        <hr/>


    </xsl:template>

    <xsl:template match="speech">
        <xsl:choose>
            <xsl:when test="@speaker = 'parks'">
                <em>
                    <xsl:text>Interviewer:</xsl:text>
                </em>
            </xsl:when>
            <xsl:when test="@speaker = 'voronin'">
                <em>
                    <xsl:text>Voronin:</xsl:text>
                </em>
            </xsl:when>
        </xsl:choose>
        <p>
            <h3>
                <xsl:apply-templates/>
            </h3>
        </p>


    </xsl:template>
    
    <xsl:template match="nationalCinema | pron | genre | title | place | person | epit | lex | nonlex | pers | collective | poss">
        <span class="{name()}">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    
    
 

</xsl:stylesheet>
