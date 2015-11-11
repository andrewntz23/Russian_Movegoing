<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="3.0">
    <xsl:variable name="interviews" select="collection('interview_xml_files')"/>
    <xsl:template match="$interviews//body">
        <xsl:apply-templates/>
    </xsl:template>
</xsl:stylesheet>