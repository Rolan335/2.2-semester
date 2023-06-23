<li>
    <ul>
        <xsl:for-each select="current-group()">
            <li>
                <xsl:value-of select="@org" />
            </li>
        </xsl:for-each>
    </ul>
</xsl:for-each-group>
        </li>