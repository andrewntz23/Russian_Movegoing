<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:variable name="interviews" select="collection('interview_xml_files')"/>
    
    <xsl:template match="/">
        <xsl:value-of select="'Total pronouns:', count($interviews//pron), '&#10;'"/>
        <xsl:value-of select="'Personal pronouns:', count($interviews//pron[@type='pers']), '&#10;'"/>
        <xsl:value-of select="'Possessive pronouns:', count($interviews//pron[@type='poss']), '&#10;'"/>
        
        <xsl:apply-templates select="$interviews//body"/>

    </xsl:template>
    
    <xsl:template match="$interviews//body">
        <xsl:text>Number of pronouns in </xsl:text>
        <xsl:value-of select="//interviewee/@ref, ':'"/>
        <xsl:value-of select="count(//pron) div count($interviews//pron) * 100,  '&#10;'"/>
    </xsl:template>
</xsl:stylesheet>