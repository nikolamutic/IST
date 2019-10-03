<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:template match="Adresar">
    <html>
      <head>
        <title>XSLT | Osobe i Kompanije Sa Vise Od 2 Email Adrese</title>
      </head>
      <body>
        <table border="1" cellpadding="10">
          <thead style="background-color:#b5b148">
            <tr>
              <th>Ime</th>
              <th>SrednjeIme</th>
              <th>Prezime</th>
              <th>Dan</th>
              <th>Mesec</th>
              <th>Godina</th>
              <th>Ulica</th>
              <th>Broj</th>
              <th>Grad</th>
              <th>Drzava</th>
              <th>Telefon</th>
              <th>Email</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="Osoba"/>
          </tbody>
        </table>
        <br/>
        <table border="1" cellpadding="10">
          <thead style="background-color:#b5b148">
            <tr>
              <th>Naziv</th>
              <th>Ulica</th>
              <th>Broj</th>
              <th>Grad</th>
              <th>Drzava</th>
              <th>Telefon</th>
              <th>Email</th>
            </tr>
          </thead>
          <tbody>
            <xsl:apply-templates select="Kompanija"/>
          </tbody>
        </table>
      </body>
    </html>
  </xsl:template>
  
  <!-- Osoba -->
  <xsl:template match="Osoba">
    <xsl:if test="count(Email) &gt; 2">
      <tr>
        <td>
          <xsl:value-of select="PunoIme/Ime"/>
        </td>
        <td>
          <xsl:if test="not(PunoIme/SrednjeIme)">
            <xsl:text>/</xsl:text>
          </xsl:if>
          <xsl:if test="PunoIme/SrednjeIme">
            <xsl:value-of select="PunoIme/SrednjeIme"/>
          </xsl:if>
        </td>
        <td>
          <xsl:value-of select="PunoIme/Prezime"/>
        </td>
        <td>
          <xsl:value-of select="DatumRodjenja/Dan"/>
        </td>
        <td>
          <xsl:value-of select="DatumRodjenja/Mesec"/>
        </td>
        <td>
          <xsl:value-of select="DatumRodjenja/Godina"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/Ulica"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/Broj"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/Grad"/>
        </td>
        <td>
          <xsl:if test="Adresa/Drzava">
            <xsl:value-of select="Adresa/Drzava"/>
          </xsl:if>
          <xsl:if test="not(Adresa/Drzava)">
            <xsl:text>/</xsl:text>
          </xsl:if>
        </td>
        <td>
          <xsl:value-of select="Telefon"/>
        </td>
        <td>
          <xsl:for-each select="Email">
            <xsl:value-of select="."/>
            <br/>
          </xsl:for-each>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>
  
  <!-- Kompanija -->
  <xsl:template match="Kompanija">
    <xsl:if test="count(Email) &gt; 2">
      <tr>
        <td>
          <xsl:value-of select="Naziv"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/Ulica"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/Broj"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/Grad"/>
        </td>
        <td>
          <xsl:if test="Adresa/Drzava">
            <xsl:value-of select="Adresa/Drzava"/>
          </xsl:if>
          <xsl:if test="not(Adresa/Drzava)">
            <xsl:text>/</xsl:text>
          </xsl:if>
        </td>
        <td>
          <xsl:value-of select="Telefon"/>
        </td>
        <td>
          <xsl:for-each select="Email">
            <xsl:value-of select="."/>
            <br/>
          </xsl:for-each>
        </td>
      </tr>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
