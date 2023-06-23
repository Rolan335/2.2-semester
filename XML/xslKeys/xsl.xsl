<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:key name="Teacher" match="/courses/course" use="teachers/teacher"/>
	<xsl:key name="Subject" match="/courses/course" use="keywords/keyword"/>
	<xsl:template match="/">
		<html>
			<body>
				<h1> 
					Наши курсы
				</h1>
				<h3>Курсы, которые читает Борисов И.О.</h3>
				<ul>
					<xsl:for-each select="key('Teacher','Борисов И.О.')">
						<li>
							<xsl:value-of select="title"/>
						</li>
					</xsl:for-each>
				</ul>
				<h3>Курсы, которые используют XML</h3>
				<ul>
					<xsl:for-each select="key('Subject','XML')">
						<li>
							<xsl:value-of select="title"/>
						</li>
					</xsl:for-each>
				</ul>
				<h3>Курсы, которые читает Борисов И.О. в которых есть тема XSLT</h3>
				<ul>
					<xsl:for-each select="key('Teacher','Борисов И.О.')">
						<xsl:if test="keywords/keyword[text() = 'XSLT']">
							<li>
								<xsl:value-of select="title"/>
							</li>
						</xsl:if>
					</xsl:for-each>
				</ul>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>