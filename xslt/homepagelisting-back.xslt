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
  <xsl:variable name="numberOfPosts" select="15"/>

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
          <xsl:if test="position() = 2">
            <div style="width: 468px;margin: auto;">
              <a href='http://www.mammoth.net.au?ref=ccefb3cff3b14418af1f9d2600e1411b'><img src='http://www.mammoth.net.au/res/images/referral-banners/468-60-mvps-black-claw.jpg' /></a>
            </div>
          </xsl:if>            
          
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
    
    <div id="nav-below" class="navigation">

      <div class="nav-previous">
        <xsl:if test="(($pageNumber ) * $numberOfPosts) &lt; ($numberOfRecords)">
          <span class="meta-nav">&#171; </span>
          <a href="?page={$pageNumber +1}">Older posts</a>
        </xsl:if>
      </div>

      <div class="nav-next">
        <xsl:if test="$pageNumber &gt; 1">
          <a href="?page={$pageNumber -1}">Newer posts</a>
          <span class="meta-nav"> &#187;</span>
        </xsl:if>
      </div>

    </div>
  </xsl:template>

  <xsl:template name="showpost">
    <xsl:param name="post"/>

    <div class="media front-page-tile well">
      <div class="pull-left">
        <div class="datetag">        
          <span class="day"><xsl:value-of select="umbraco.library:FormatDateTime($post/@createDate, 'MMM d')"/></span>
          <span class="year"><xsl:value-of select="umbraco.library:FormatDateTime($post/@createDate, 'yyyy')"/></span>
        </div>
         <xsl:variable name="numberofcomments" select="count(BlogLibrary:GetCommentsForPost($post/@id)//comment)"/>    
          <xsl:choose>
            <xsl:when test="$numberofcomments = 0">              
            </xsl:when>            
            <xsl:otherwise>
              <div class="badge badge-success comment-badge" data-placement="right" data-original-title="{$numberofcomments} comments">                 
                  <xsl:value-of select="$numberofcomments"/>                
              </div>
            </xsl:otherwise>
          </xsl:choose>
      </div>      
      <div class="media-body">
        <strong><a href="{umbraco.library:NiceUrl($post/@id)}" title="Permalink to {$post/@nodeName}" class="post-link">
          <xsl:value-of select="$post/@nodeName"/>
          </a></strong>
        
        <div class="entry-meta">       
        <span class="tag-links">
          <xsl:variable name="tags" select="tagsLib:getTagsFromNode(@id)" />
          <xsl:choose>
            <xsl:when test="count($tags/tags/tag) = 0">        
            </xsl:when>
            <xsl:otherwise>
              
              <xsl:for-each select="$tags/tags/tag">
                <a class="label" href="{umbraco.library:NiceUrl($currentPage/ancestor-or-self::umbBlog/@id)}?filterby={.}" rel="tag">
                  <i class="icon-tag icon-white"></i>
                  <xsl:value-of select="."/>
                </a>
                <xsl:if test="position() != last()">&nbsp;&nbsp;</xsl:if>
              </xsl:for-each>
            </xsl:otherwise>
          </xsl:choose>
        </span>        
      </div>
        
        <div class="entry-content">
          <xsl:value-of select="$post/teaser" disable-output-escaping="yes"/>
        </div>      
        
        <a href="{umbraco.library:NiceUrl($post/@id)}" title="Permalink to {$post/@nodeName}" class="post-link">
          Read more
        </a>
      </div>
      
      
      
    </div>
  </xsl:template>
</xsl:stylesheet>