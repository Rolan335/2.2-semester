<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output indent="yes" method="xml" encoding="UTF-8"/>
	<xsl:template match="/">
	<goods>
	<xsl:comment>Всего элементов: <xsl:value-of select="count(//element)"/></xsl:comment>
	<xsl:for-each select="item/element">
	<xsl:element name="{attribute::*[local-name() = 'name']}">
		<xsl:apply-templates select="attribute::*[local-name() = 'value']"/>
	</xsl:element>
	</xsl:for-each>
	</goods>
	</xsl:template>	
</xsl:stylesheet>