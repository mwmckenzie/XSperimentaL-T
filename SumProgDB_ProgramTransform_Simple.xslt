<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns="http://www.w3.org/1999/xhtml"
	version="1.0">

  <xsl:output method="html" indent="yes"/>

  <xsl:template match="Details/ProgTypeList">
    <h1>Program Details and Information</h1>
    <ul>
    <xsl:for-each select="progType">
      <li><xsl:value-of select="text()"/></li>
    </xsl:for-each>
    </ul>
  </xsl:template>
  
  <xsl:template match="Details/SubjList">
    <h2>Subjects</h2>
    <ul>
    <xsl:for-each select="subject">
      <li><xsl:value-of select="text()"/></li>
    </xsl:for-each>
    </ul>
  </xsl:template>
  
  <xsl:template match="Details/TopicList">
    <xsl:choose>
      <xsl:when test="count(topic) > 1">
        <h2>Topics</h2>
      </xsl:when>
      <xsl:when test="count(topic) = 1">
        <h2>Topic</h2>
      </xsl:when>
    </xsl:choose>
    <ul>
    <xsl:for-each select="topic">
      <li><xsl:value-of select="text()"/></li>
    </xsl:for-each>
    </ul>
  </xsl:template>
  
  <xsl:template match="Details/NamePrimary">
    <xsl:if test="starts-with(text(),'UNKNOWN') = false">
      <h2>
        <xsl:value-of select="text()"/>
      </h2>
    </xsl:if>
  </xsl:template>

  <xsl:template match="Applications">
    <xsl:if test = "count(Application) > 1" >
    <h1>Program Applications</h1>
    </xsl:if>
    <xsl:if test = "count(Application) = 1" >
    <h3>Program Application</h3>
    </xsl:if>
    <xsl:for-each select="Application">
      <xsl:apply-templates select="Details/NamePrimary"/>
      <h5>Application Period</h5>
      <ul>
        <li>Begin: <xsl:value-of select="Details/DateStart"/></li>
        <li>End: <xsl:value-of select="Details/DateEnd"/></li>
      </ul>
      <xsl:apply-templates select="Links"/>
      <xsl:apply-templates select="Tags"/>
    </xsl:for-each>
  </xsl:template>
  
    <xsl:template match="Sessions">
    <xsl:if test = "count(Session) > 1" >
    <h5>Program Sessions</h5>
    </xsl:if>
    <xsl:if test = "count(Session) = 1" >
    <h5>Program Session</h5>
    </xsl:if>
    <xsl:for-each select="Session">
      <xsl:apply-templates select="Details/NamePrimary"/>
      <h5>Session Dates</h5>
      <ul>
        <li>Begin: <xsl:value-of select="Details/DateStart"/></li>
        <li>End: <xsl:value-of select="Details/DateEnd"/></li>
      </ul>
      <xsl:apply-templates select="Links"/>
      <xsl:apply-templates select="Tags"/>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="Orgs">
    <xsl:if test = "count(Org) > 1" >
    <h5>Supporting Organizations</h5>
    </xsl:if>
    <xsl:if test = "count(Org) = 1" >
    <h5>Supporting Organization</h5>
    </xsl:if>
    <xsl:for-each select="Org">
      <h3>
        <xsl:value-of select="Details/NamePrimary"/>
      </h3>
      <h5>
        <xsl:apply-templates select="Details/OrgType"/>
      </h5>
      <xsl:apply-templates select="Links"/>
      <xsl:apply-templates select="Tags"/>
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template match="Tags">
    <xsl:if test="count(tag) > 0">
    <h5>Tags</h5>
    <ul>
    <xsl:for-each select="tag">
      <li><xsl:value-of select="text()"/></li>
    </xsl:for-each>
    </ul>
    </xsl:if>
  </xsl:template>

  <xsl:template match="Links">
    <xsl:if test="count(link) > 0">
    <h5>Links</h5>
    <ul>
    <xsl:for-each select="link">
      <li><a href="{text()}"><xsl:value-of select="text()"/></a></li>
    </xsl:for-each>
    </ul>
    </xsl:if>
  </xsl:template>
  
  <xsl:template match="SummerProgram">
    <xsl:apply-templates select="Details/NamePrimary"/>
    <h4>Summer Program</h4>
    <xsl:apply-templates select="Details/ProgTypeList"/>
    <xsl:apply-templates select="Details/TopicList"/>
    <xsl:apply-templates select="Details/SubjList"/>
    <xsl:apply-templates select="Links"/>
    <xsl:apply-templates select="Tags"/>
    <xsl:apply-templates select="Orgs"/>
    <xsl:apply-templates select="Sessions"/>
    <xsl:apply-templates select="Applications"/>
  </xsl:template>

  <xsl:template match="/">
    <html>
      <head>
        <title><xsl:value-of select="SummerProgram/Details/NamePrimary"/></title>
      </head>
      <body>
        <xsl:apply-templates select="SummerProgram" />
      </body>
    </html>
    <xsl:comment>Summer Program Web Template Prototype</xsl:comment>
  </xsl:template>
  
</xsl:stylesheet>