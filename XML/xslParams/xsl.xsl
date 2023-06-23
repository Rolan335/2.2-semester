<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>
    <xsl:template match="/">
        <items>
            <xsl:apply-templates select="//ul/li"></xsl:apply-templates>
        </items>
    </xsl:template>


    <xsl:template match="li">
        <xsl:param name="parentId" select="../../@data-id"/>
        <xsl:param name="currentId" select="current()/@data-id"/>
        <xsl:param name="content" select="current()/span"/>
        <xsl:param name="author" select="current()/b"/>
        <xsl:choose>
            <xsl:when test="not(../../@data-id)">
                <item id='{$currentId}' parentId='0' author='{$author}'>
                    <xsl:value-of select="$content"/>
                </item>
            </xsl:when>
            <xsl:otherwise>
                <item id='{$currentId}' parentId='{$parentId}' author='{$author}'>
                    <xsl:value-of select="$content"/>
                </item>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>