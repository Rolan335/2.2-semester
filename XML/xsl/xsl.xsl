<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="html" encoding="UTF-8" />
    <xsl:attribute-set name="even">
        <xsl:attribute name="style">border: 1px solid #000; background-color: #808080;</xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="border-only">
        <xsl:attribute name="style">border: 1px solid #000;</xsl:attribute>
    </xsl:attribute-set>
    <xsl:template match="/">
        <html>
        <table>
            <tr>
                <xsl:element name="th" use-attribute-sets="border-only">
                    <xsl:attribute name="style">border: 1px solid #000;</xsl:attribute>
                    <xsl:attribute name="colspan">2</xsl:attribute>
                    Всего элементов: <xsl:value-of select="count(//element)" />
                </xsl:element>
            </tr>
            <tr>
                <xsl:element name="th" use-attribute-sets="border-only">
                    Тип
                </xsl:element>
                <xsl:element name="th" use-attribute-sets="border-only">
                    Наименование
                </xsl:element>
            </tr>
            <xsl:for-each select="items/element">
                <xsl:choose>
                    <xsl:when test="position() mod 2 = 0">
                        <tr>
                            <xsl:element name="td" use-attribute-sets="even">
                                <xsl:apply-templates select="attribute::*[local-name() = 'name']" />
                            </xsl:element>
                            <xsl:element name="td" use-attribute-sets="even">
                                <xsl:apply-templates select="attribute::*[local-name() = 'value']" />
                            </xsl:element>
                        </tr>
                    </xsl:when>
                    <xsl:otherwise>
                        <tr>
                            <xsl:element name="td" use-attribute-sets="border-only">
                                <xsl:apply-templates select="attribute::*[local-name() = 'name']" />
                            </xsl:element>
                            <xsl:element name="td" use-attribute-sets="border-only">
                                <xsl:apply-templates select="attribute::*[local-name() = 'value']" />
                            </xsl:element>
                        </tr>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </table>
        </html>
    </xsl:template>
</xsl:stylesheet>