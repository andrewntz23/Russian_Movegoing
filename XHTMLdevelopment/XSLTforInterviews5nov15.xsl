<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/1999/xhtml" version="2.0">

    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="index" select="document('../index.xml')"/>
    <xsl:template match="/">

        <html>
            <head>
                <title>Cinema and Memory</title>
                <link rel="stylesheet" type="text/css" href="/css/interview.css"/>
                <link rel="stylesheet" type="text/css" href="/css/style.css"/>
                <script type="text/javascript" src="/javascript/interview.js"/>
            </head>
            <body>
 <xsl:comment>#include virtual="/inc/menuSSI.xhtml"</xsl:comment>
                <div id="boxes">
                                   
                    <label for="person">Person</label>
                    <input type="radio" id="person" name="selector"></input>
                    <label for="title">Title</label>
                    <input type="radio" id="title" name="selector"></input>
                    <label for="genre">Genre</label>
                    <input type="radio" id="genre" name="selector"></input>
                    <label for="nationalCinema">National Cinema</label>
                    <input type="radio" id="nationalCinema" name="selector"></input>
                    <label for="place">Place</label>
                    <input type="radio" id="place" name="selector"></input>
                    
                    <label for="epit">Epithet</label>
                    <input type="radio" id="epit" name="selector"></input>
                    
                    <label for="persSing">Personal Singular</label>
                    <input type="radio" id="persSing" name="selector"></input>
                    <label for="persPlur">Personal Plural</label>
                    <input type="radio" id="persPlur" name="selector"></input>
                    <label for="possSing">Possessive Singular</label>
                    <input type="radio" id="possSing" name="selector"></input>
                    <label for="possPlur">Possessive Plural</label>
                    <input type="radio" id="possPlur" name="selector"></input>
                    <label for="collective">Collective</label>
                    <input type="radio" id="collective" name="selector"></input>
                    
                    <label for="lex">Lex Hes Marks</label>
                    <input type="radio" id="lex" name="selector"></input>
                    <label for="nonLex">Nonlex Hes Marks</label>
                    <input type="radio" id="nonLex" name="selector"></input>
                    
                    
                </div>
                <div id="rightPanel"></div>
              <div id='centerPanel'>  <xsl:apply-templates/></div>
            </body>
        </html>

    </xsl:template>

    <xsl:template match="meta">
        <xsl:variable name="interviewee" select="//interviewee/@ref"/>
        <xsl:variable name="interviewer" select="//interviewer[1]/@ref"/>
        <h1>
            <xsl:value-of
                select="
                    'Interview with',
                    $index//person[@xml:id = $interviewee]/forename,
                    $index//person[@xml:id = $interviewee]/surnameEng"
            />
        </h1>
        <ul>

            <li>
                <xsl:value-of
                    select="
                        'Interviewer:',
                        $index//person[@xml:id = $interviewer]/forename,
                        $index//person[@xml:id = $interviewer]/surnameEng"
                />
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
            <!--     We'll also want to link to the XML file       -->
            <li>
                <xsl:text>Interview Date: </xsl:text>
                <xsl:apply-templates select="date[1]"/>
            </li>
            <li>
                <xsl:text>Transcription and Translation Date: </xsl:text>
                <xsl:apply-templates select="date[2]"/>
            </li>

        </ul>

        <hr/>
    </xsl:template>

    <xsl:template match="speech">
        <xsl:variable name="speaker" select="@speaker"/>
        
        <h3>   <xsl:if test="@speechtype = 'q'">
            <xsl:value-of select="$index//person[@xml:id = $speaker]/surnameEng"/>
        </xsl:if>
            
            <xsl:value-of select="$index//person[@xml:id = $speaker]/surnameRus"/>
            <xsl:text>: </xsl:text>
            
        </h3>
        
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
        <!--        <span class="lex">        
            <xsl:apply-templates/>
        </span>-->



        <!--<xsl:if test="@type='nonlex'">
             <strong><xsl:value-of>...</xsl:value-of></strong>  
            </xsl:if>-->
        <xsl:choose>
            <xsl:when test="@type = 'nonlex'">
                <span class="nonlex">
                    <xsl:text>...</xsl:text>
                </span>
            </xsl:when>
            <xsl:otherwise>
                <span class="lex">
                    <xsl:apply-templates/>
                </span>
            </xsl:otherwise>
        </xsl:choose>

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
    
    <xsl:template match="place">
        <span class="place">
            <xsl:apply-templates/>
        </span>
    </xsl:template>





</xsl:stylesheet>
