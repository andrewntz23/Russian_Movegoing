<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/">

        <html>
            <head>
                <title>XSLT INTERVIEW TEMPLATE</title>
                <link rel="stylesheet" type="text/css" href="CSStest5nov15.css"/>" </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>

    </xsl:template>

    <xsl:template match="meta">
<!--        FOR ANDREW: How do we output authors of the interview (transcribers and transltors)?-->
        <h2 style="color: green"><xsl:text>Interview with Mikhail Voronin.</xsl:text></h2>
        <!--          FOR ANDREW:  how does one enter interviewee's name automatically?-->
        <ul>
            
                
            
            <li>
                <xsl:text>Interviewer: Jessica Parks</xsl:text>
                <!--          FOR ANDREW:  how does one enter interviewee's name automatically?-->
            </li>
            <li>
                <a href="http://mtp.blogs.wm.edu">
                    <xsl:apply-templates select="project"/>
                </a>
            </li>
            <li>
                <a href="https://www.wm.edu">
                    <xsl:apply-templates select="university"/>
                </a>
            </li>
            <li><xsl:text>Interview Date: </xsl:text><xsl:apply-templates select="date[1]"/></li>
            <li><xsl:text>Transcription and Translation Date: </xsl:text><xsl:apply-templates select="date[2]"/></li>

        </ul>
        
        <hr/>
    </xsl:template>

    <xsl:template match="speech">

        <!--<xsl:choose>
            <xsl:when test="@speaker = 'parks'">
                <!-\-          FOR ANDREW:  how does one enter interviewer's name automatically?-\->
                <strong>
                    <xsl:text>Паркс: </xsl:text>
                </strong>
            </xsl:when>
            
            <xsl:when test="@speaker = 'voronin'">
                <strong>
                    <xsl:text>Воронин: </xsl:text>
                </strong>
            </xsl:when>
        </xsl:choose>-->
        
        <xsl:variable name="index" select="document('../index.xml')"/>  
        <xsl:variable name="speaker" select="@speaker"/>
        <h2>
            <xsl:value-of select="$index//person[@xml:id = $speaker]/surname"></xsl:value-of>
        </h2>
        <p>
            <xsl:apply-templates/>
        </p>

    </xsl:template>

<!--    Below is a template for pronouns: personal and possessive, singular and plural.-->
    <xsl:template match="pron">
        <span class="{@type} {@number}">

            <xsl:apply-templates/>
        </span>
    </xsl:template>

<!--   Below is a template for hesitation marks: lexical and non-lexical-->
    <xsl:template match="hes">
        <span class="lex">        
            <xsl:apply-templates/>
        </span>
    
    
        <span class="nonlex">        
            <xsl:if test="@type='nonlex'">
             <strong><xsl:value-of>...</xsl:value-of></strong>  
            </xsl:if>
        </span>
    </xsl:template>
    
    <xsl:template match="collective">
        <span class="collective">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="epit">
         <span class="epit">
                <xsl:apply-templates/>
         </span>           
    </xsl:template>
    
    
    <xsl:template match="person">
        <span class="person">
            <xsl:apply-templates/>
        </span>   
    </xsl:template>
    
    
    <xsl:template match="title">
        <span class="title">
            <xsl:apply-templates/>
        </span> 
    </xsl:template>
    
    <xsl:template match="genre">
        <span class="genre">
            <xsl:apply-templates/>
        </span> 
    </xsl:template>
    
    <xsl:template match="nationalCinema">
        <span class="nationalCinema">
            <xsl:apply-templates/>
        </span> 
    </xsl:template>
    

</xsl:stylesheet>

