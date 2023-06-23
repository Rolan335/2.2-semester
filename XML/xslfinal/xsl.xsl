<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>
    <xsl:template match="/">
        <xsl:variable name="from" select="sum-of-sequence/from"/>
        <xsl:variable name="to" select="sum-of-sequence/to"/>
        <items>
            <xsl:call-template name="while">
                <xsl:with-param name="from" select="$from" />
                <xsl:with-param name="to" select="$to" />
                <xsl:with-param name="sum" select="0"/>
            </xsl:call-template>
        </items>
    </xsl:template>

    <xsl:template name="while">
        <xsl:param name="from" select="sum-of-sequence/from"/>
        <xsl:param name="to" select="sum-of-sequence/to"/>
        <xsl:param name="i" select="$from"/>
        <xsl:param name="sum" select="$from"/>
        <xsl:if test="$i != $to + 1">
            <xsl:call-template name="while">
                <xsl:with-param name="i" select="$i + 1" />
                <xsl:with-param name="sum" select="$sum + $i"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="$i = $to + 1">
            <xsl:value-of select="$sum"></xsl:value-of>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>