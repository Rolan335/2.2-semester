<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:key name="ixCity" match="item" use="@city"/>
    <xsl:key name="ixOrg" match="item" use="concat(@city,@org)"/>
    <xsl:template match="orgs">
        <h1>Города и компании</h1>
        <xsl:apply-templates select="item[generate-id(.)=generate-id(key('ixCity',@city))]"/>
    </xsl:template>

    <xsl:template match="item">
        <ul>
            <li>
                <h3>
                    <xsl:value-of select="@city"/>
                </h3>
                <p>Всего товаров:                    <xsl:value-of select="count(key('ixCity',@city))"/>
                </p>
            </li>
            <xsl:for-each select="key('ixCity', @city)">
                <xsl:choose>
                    <xsl:when test="current()[generate-id(.)=generate-id(key('ixOrg',concat(@city,@org)))]">
                        <ul>
                            <xsl:call-template name="list"/>
                        </ul>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </ul>
    </xsl:template>
    <xsl:template name="list">
        <li>
            <h4>
                <xsl:value-of select="@org"/>
                <p>Всего товаров:                    <xsl:value-of select="count(key('ixOrg',concat(@city,@org)))"/>
                </p>
            </h4>
            <ul>
                <xsl:for-each select="key('ixOrg',concat(@city,@org))">
                    <li>
                        <xsl:value-of select="@title"/>
                    </li>
                </xsl:for-each>
            </ul>
        </li>
    </xsl:template>
</xsl:stylesheet>