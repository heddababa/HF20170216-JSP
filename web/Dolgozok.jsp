<%@page import = "lekerdez.AdatbazisLekerdezBean"
   contentType="text/html" pageEncoding="ISO-8859-2" errorPage="loginHiba.jsp"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP lekérdező</title>
  </head>  
  <body>
    <h1>Oracle HR JSP lekérdező (Dolgozok adatainak lekérdező oldala)</h1>
    <hr>
    <% if(!lekerdez.isLoginOK()) { %>
      <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
      <hr>
      <p><a href="login.jsp">Oracle HR JSP lekérdező (bejelentkezés)</a></p>
    <% } else { %>
      <p>Dolgozók adatai</p>
      <hr>
      <%= lekerdez.getDolgozokAdatai() %>
      <hr>
      <a href="loginOK.jsp">Vissza</a>
    <% } %>    
  </body>
</html>