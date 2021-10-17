<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:output method="xml" indent="yes" encoding="UTF-8"/>
  <xsl:template match="/Resume">
    <html>
      <head>
        <title> Saniya CV </title>
        <style>
          body{
          background-image: url("cv_back.png");
          background-repeat: no-repeat;
          font-family: Arial;
          }
          #details{
          position: absolute;
          left:17%;
          }
          td{
          padding:0 15px 0 15px;
          }
          .button {
          background-color: #3090C7;
          border: none;
          color: white;
          padding: 10px 30px;
          text-align: center;
          text-decoration: none;
          font-size: 16px;
          cursor: pointer;
          position: relative;
          left:72%;
          }
        </style>
      </head>
      <body>
        <a href="AboutMe.html" class="button">Back to Home</a>
        <a href="#skill" class="button">Skills</a>
        <a href="#achive" class="button">Achievements</a>
        <span id="summary"></span>
        <div id="details">
          <h1 style="text-align:center;"> Saniya Kolangde </h1>
          <p style="text-align:center;"> Address: <xsl:value-of select="me/address" />   ||   Phone: <xsl:value-of select="me/phone" />   ||   Email: <xsl:value-of select="me/email" /> </p>
          <hr />
          <h2> Summary </h2>
          <p> A young, enthusiastic indiviual pursuing Undergraduation in Computer Science. Frequently praised as hard-working and efficient by peers. </p>
          <h2> Education </h2>
          <ol>
            <xsl:for-each select="education">
              <li style="font-weight: bold;">
                <xsl:value-of select="institution" />
              </li>
              <ul>
                <li style="font-weight:normal;">
                  <xsl:value-of select="level" />
                </li>
                <li style="font-weight:normal;">
                  <xsl:value-of select="grade" />
                </li>
                <li style="font-weight:normal;">
                  <xsl:value-of select="year" />
                </li>
              </ul>
            </xsl:for-each>
          </ol>

          <h2> Experience </h2>
          <table>
            <tr>
              <td> Job: </td>
              <td>
                <xsl:value-of select="experience/job" />
              </td>
            </tr>
            <tr>
              <td> Organization: </td>
              <td>
                <xsl:value-of select="experience/organization" />
              </td>
            </tr>
            <tr>
              <td> Duration: </td>
              <td>
                <xsl:value-of select="experience/duration" />
              </td>
            </tr>
            <tr>
              <td> Description: </td>
              <td>
                <ul>
                  <xsl:for-each select="experience/description">
                    <li>
                      <xsl:value-of select="." />
                    </li>
                  </xsl:for-each>
                </ul>
              </td>
            </tr>
          </table>
          <span id="skill"></span>
          <h2> Skills </h2>
          <ul>
            <xsl:for-each select="skills/name">
              <li>
                <xsl:value-of select="." />
              </li>
            </xsl:for-each>
          </ul>
          <span id="achive"> </span>
          <h2> Achievements </h2>
          <a href="#summary" class="button" style="left:114%;">Top the top</a>
          <table border="1">
            <tr>
              <th> Title </th>
              <th> Year </th>
            </tr>
            <xsl:for-each select="achievements">
              <tr>
                <td>
                  <xsl:value-of select="title" />
                </td>
                <td>
                  <xsl:value-of select="year" />
                </td>
              </tr>
            </xsl:for-each>
          </table>
          <hr />
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
