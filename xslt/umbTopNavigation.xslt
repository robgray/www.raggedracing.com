<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
    <!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library"
  exclude-result-prefixes="msxml umbraco.library">


    <xsl:output method="xml" omit-xml-declaration="yes" />

    <xsl:param name="currentPage"/>

    <!-- Input the documenttype you want here -->
    <xsl:variable name="level" select="1"/>

    <xsl:template match="/">

<div class="navbar navbar-inverse">      
  <div class="container">
  <div class="navbar-inner">      
   <div class="nav-collapse collapse">     
     <ul class="nav pull-right">
         <li>
           <xsl:if test="$currentPage/@id = $currentPage/ancestor-or-self::* [@level=$level]/@id">
               <xsl:attribute name="class">active</xsl:attribute>
           </xsl:if>
           <a href="/">Home</a>
         </li>
        <xsl:for-each select="$currentPage/ancestor-or-self::* [@level=$level]/* [@isDoc and string(umbracoNaviHide) != '1']">
          <li>
           <xsl:if test="@id = $currentPage/@id">
            <xsl:attribute name="class">active</xsl:attribute>
           </xsl:if>
            <a href="{umbraco.library:NiceUrl(@id)}"><xsl:value-of select="@nodeName"/></a>
          </li>   
        </xsl:for-each>
      </ul>   
    </div>
  </div>
  </div>
</div>
</xsl:template>
</xsl:stylesheet>