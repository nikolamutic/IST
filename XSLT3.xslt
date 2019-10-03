<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:strip-space elements="*"/>
  <xsl:output method="xml" indent="yes"/>
  
  <xsl:template match="Adresar">
    <Adresar>
      <xsl:apply-templates select="Osoba"/>
      <xsl:apply-templates select="Kompanija"/>
    </Adresar>
  </xsl:template>

  <!-- Osoba -->
  <xsl:template match="Osoba">   
    <Osoba>
      <xsl:attribute name="id">
        <xsl:value-of select="@id"/>
      </xsl:attribute>
      <PunoIme>
        <Ime>
          <xsl:value-of select="PunoIme/Ime"/>
        </Ime>
        <xsl:if test="PunoIme/SrednjeIme">
          <SrednjeIme>
            <xsl:value-of select="PunoIme/SrednjeIme"/>
          </SrednjeIme>
        </xsl:if>
        <xsl:for-each select="PunoIme/Prezime">
          <Prezime>
            <xsl:value-of select="."/>
          </Prezime>
        </xsl:for-each>
      </PunoIme>
      <DatumRodjenja>
        <Dan>
          <xsl:value-of select="DatumRodjenja/Dan"/>
        </Dan>
        <Mesec>
          <xsl:value-of select="DatumRodjenja/Mesec"/>
        </Mesec>
        <Godina>
          <xsl:value-of select="DatumRodjenja/Godina"/>
        </Godina>
      </DatumRodjenja>
      <xsl:apply-templates select="Adresa"/>
      <Telefon>
        <xsl:attribute name="status">
          <xsl:value-of select="Telefon/@status"/>
        </xsl:attribute>
        <xsl:value-of select="Telefon"/>
      </Telefon>
      <xsl:for-each select="Email">
        <Email>
          <xsl:attribute name="status">
            <xsl:value-of select="./@status"/>
          </xsl:attribute>
          <xsl:value-of select="."/>
        </Email>
      </xsl:for-each>
    </Osoba>
  </xsl:template>

  <!-- Adresa -->
  <xsl:template match="Adresa">
    <Adresa>
      <xsl:attribute name="status">
        <xsl:value-of select="@status"/>
      </xsl:attribute>
      <xsl:attribute name="Ulica">
        <xsl:value-of select="Ulica"/>
      </xsl:attribute>
      <xsl:attribute name="Broj">
        <xsl:value-of select="Broj"/>
      </xsl:attribute>
      <xsl:attribute name="Grad">
        <xsl:value-of select="Grad"/>
      </xsl:attribute>
      <xsl:if test="Drzava">
        <Drzava>
          <xsl:value-of select="Drzava"/>
        </Drzava>
      </xsl:if>
    </Adresa>
  </xsl:template>
  
  <!-- Kompanija -->
  <xsl:template match="Kompanija">
    <Kompanija>
      <xsl:attribute name="id">
        <xsl:value-of select="@id"/>
      </xsl:attribute>
      <Naziv>
        <xsl:value-of select="Naziv"/>
      </Naziv>
      <xsl:apply-templates select="Adresa"/>
      <Telefon>
        <xsl:attribute name="status">
          <xsl:value-of select="Telefon/@status"/>
        </xsl:attribute>
        <xsl:value-of select="Telefon"/>
      </Telefon>
      <xsl:for-each select="Email">
        <Email>
          <xsl:attribute name="status">
            <xsl:value-of select="./@status"/>
          </xsl:attribute>
          <xsl:value-of select="."/>
        </Email>
      </xsl:for-each>
    </Kompanija>
  </xsl:template>
</xsl:stylesheet>