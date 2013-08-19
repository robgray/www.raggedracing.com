<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [ <!ENTITY nbsp "&#x00A0;"> ]>
<xsl:stylesheet 
  version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library" xmlns:Exslt.ExsltCommon="urn:Exslt.ExsltCommon" xmlns:Exslt.ExsltDatesAndTimes="urn:Exslt.ExsltDatesAndTimes" xmlns:Exslt.ExsltMath="urn:Exslt.ExsltMath" xmlns:Exslt.ExsltRegularExpressions="urn:Exslt.ExsltRegularExpressions" xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings" xmlns:Exslt.ExsltSets="urn:Exslt.ExsltSets" xmlns:tagsLib="urn:tagsLib" xmlns:BlogLibrary="urn:BlogLibrary" xmlns:uTube.XSLT="urn:uTube.XSLT" xmlns:twitter.library="urn:twitter.library" 
  exclude-result-prefixes="msxml umbraco.library Exslt.ExsltCommon Exslt.ExsltDatesAndTimes Exslt.ExsltMath Exslt.ExsltRegularExpressions Exslt.ExsltStrings Exslt.ExsltSets tagsLib BlogLibrary uTube.XSLT twitter.library ">


<xsl:output method="xml" omit-xml-declaration="yes"/>

<xsl:param name="currentPage"/>

<xsl:variable name="thumbWidth" select="number(300)" />

<xsl:template match="/">
    <!-- Displays all images from a folder in the Media Library -->  
  <xsl:for-each select="$currentPage/ImageGallery">
    <xsl:if test="number(./galleryId)">
        <ul id="thumbnails">
          <xsl:for-each select="umbraco.library:GetMedia(./galleryId, true())/Image">
                <xsl:if test="umbracoFile !=''">
                    <li class="span4">
                      <div class="thumbnail">
                        <a href="{umbracoFile}" title="{@nodeName}" rel="gallery">
                            <img src="/imageGen.ashx?image={umbraco.library:UrlEncode(umbracoFile)}&amp;width={$thumbWidth}" width="{$thumbWidth}" alt="{@nodeName}" title="{@nodeName}" class="thumbnail" />
                        </a>
                      </div>
                    </li>
                </xsl:if>
            </xsl:for-each>
        </ul>

    </xsl:if>
  </xsl:for-each>

</xsl:template>   

</xsl:stylesheet>