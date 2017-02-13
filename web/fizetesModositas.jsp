<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezelő</title>
  </head>  
  <body>
    <% if(session.getAttribute("felhasznalonev")==null) { %>
      <h1>Oracle HR JSP kezelő (Új dolgozó felvitele oldal)</h1>
      <hr>
      <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
      <hr>
      <p><a href="loginOK.jsp">Vissza a "foablakra"</a></p>
    <% } else { %>
      <h1>Oracle HR JSP kezelő 
        (bejelentkezve: <%= session.getAttribute("felhasznalonev") %>)</h1> <%--TODO Jogkort kiiratni--%>
      <hr>
      <p>TODO Itt lenne a fizu modositas egy elozoleg kivalasztott dolgozo fizetesehez. A megengedett
        ertekhatarokat ki kell iratni es kell egy mezo, meg egy mentes gomb</p> 
      <hr>
      <p><a href="loginOK.jsp">Foablakra (Igazabol ellenorzes kell mentes utan)</a></p>
    <% } %>
  </body>
</html>
