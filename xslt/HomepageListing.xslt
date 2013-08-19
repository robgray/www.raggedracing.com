<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#x00A0;">
]>
<xsl:stylesheet
  version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:msxml="urn:schemas-microsoft-com:xslt"
  xmlns:umbraco.library="urn:umbraco.library"
  xmlns:tagsLib="urn:tagsLib"
  xmlns:Exslt.ExsltStrings="urn:Exslt.ExsltStrings"
  xmlns:BlogLibrary="urn:BlogLibrary"
  exclude-result-prefixes="msxml umbraco.library tagsLib Exslt.ExsltStrings BlogLibrary">


  <xsl:output method="html" omit-xml-declaration="yes"/>

  <xsl:param name="currentPage"/>
  <xsl:variable name="numberOfPosts" select="12"/>

  <xsl:variable name="pageNumber">
    <xsl:choose>
      <xsl:when test="umbraco.library:RequestQueryString('page') &lt;= 0 or string(umbraco.library:RequestQueryString('page')) = '' or string(umbraco.library:RequestQueryString('page')) = 'NaN'">1</xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="umbraco.library:RequestQueryString('page')"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="filter">
    <xsl:choose>
      <xsl:when test="string-length(umbraco.library:Request('filterby')) &gt; 0">
        <xsl:value-of select="umbraco.library:Request('filterby')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="''"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:variable name="numberOfRecords">
    <xsl:choose>
      <xsl:when test="$filter = ''">
        <xsl:value-of select="count($currentPage/ancestor-or-self::umbBlog//umbBlogPost)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="count($currentPage/ancestor-or-self::umbBlog//umbBlogPost [contains(Exslt.ExsltStrings:lowercase(./tags), Exslt.ExsltStrings:lowercase($filter))])"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>

  <xsl:template match="/">  
    <xsl:if test="$filter = ''">
      
      
      <xsl:for-each select="$currentPage/ancestor-or-self::umbBlog//umbBlogPost">
        <xsl:sort select="./PostDate" order="descending" />

        <xsl:if test="position() &gt; $numberOfPosts * (number($pageNumber)-1) and
                      position() &lt;= number($numberOfPosts * (number($pageNumber)-1) +
                      $numberOfPosts )">          
          <xsl:call-template name="showpost">
            <xsl:with-param name="post" select="."/>
          </xsl:call-template>
      
        </xsl:if>
        
       </xsl:for-each>
    </xsl:if>

    <xsl:if test="$filter != ''">

      <xsl:for-each select="$currentPage/ancestor-or-self::umbBlog//umbBlogPost [contains(Exslt.ExsltStrings:lowercase(./tags), Exslt.ExsltStrings:lowercase($filter))]">
        <xsl:sort select="./PostDate" order="descending" />
        <xsl:if test="position() &gt; $numberOfPosts * (number($pageNumber)-1) and
        position() &lt;= number($numberOfPosts * (number($pageNumber)-1) +
        $numberOfPosts )">
          <xsl:call-template name="showpost">
            <xsl:with-param name="post" select="."/>
          </xsl:call-template>
        </xsl:if>
      </xsl:for-each>
    </xsl:if>   
    
  
  </xsl:template>

  <xsl:template name="showpost">
    <xsl:param name="post"/>

    <section class="front-page-tile">                  
      <div>
        <xsl:attribute name="class">inner <xsl:value-of select="$post/blogTopic" /></xsl:attribute>
        <header>
          <strong><a href="{umbraco.library:NiceUrl($post/@id)}" title="Permalink to {$post/@nodeName}" class="post-link bluetape">
            <xsl:value-of select="$post/@nodeName"/>
            </a></strong>                
        </header>
      
        <div class="entry-content">        
          <xsl:if test="string-length($post/teaser) = 0">          
            <xsl:value-of select="umbraco.library:TruncateString(umbraco.library:StripHtml($post/bodyText) ,220, '...')" disable-output-escaping="yes"/>
          </xsl:if>
          <xsl:if test="string-length($post/teaser) > 0">
            <xsl:value-of select="umbraco.library:TruncateString($post/teaser,220, '...')" disable-output-escaping="yes"/>
          </xsl:if>
        </div>                      
          </div>
      <footer class="bottom">        
        <xsl:variable name="numberofcomments" select="count(BlogLibrary:GetCommentsForPost($post/@id)//comment)"/>    
        <xsl:choose>
          <xsl:when test="$numberofcomments = 0">              
          </xsl:when>            
          <xsl:otherwise>
            <div class="pull-left" style="margin-left: -10px;margin-right: 10px;margin-top:-4px;">
              <div class="badge badge-success comment-badge" data-placement="right" data-original-title="{$numberofcomments} comments">                 
                  <xsl:value-of select="$numberofcomments"/>                
              </div>
            </div>
          </xsl:otherwise>
        </xsl:choose>        
        <div class="datetag pull-right" style="margin-right: -10px;">        
          <span class="day"><xsl:value-of select="umbraco.library:FormatDateTime($post/@createDate, 'MMM d')"/></span>
          <span class="year"><xsl:value-of select="umbraco.library:FormatDateTime($post/@createDate, 'yyyy')"/></span>
        </div>         
      </footer>            
    </section>
  </xsl:template>
</xsl:stylesheet>