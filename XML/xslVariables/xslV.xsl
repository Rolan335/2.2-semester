<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:variable select="//items/item[@parentid=0]" name="topicstarter"/>

<xsl:template match="/">
<html>
<body>
    <ul>    
        <xsl:apply-templates select="$topicstarter"/>
    </ul>
</body>
</html>
</xsl:template>

<xsl:template match="item">

    <li>
	    <ul>
        <xsl:value-of select="@author"/> Пишет: <xsl:value-of select="current()"/>
            <xsl:apply-templates select="//items/item[@parentid=current()/@id]"/>
        </ul>
    </li>
	
</xsl:template>
</xsl:stylesheet>
