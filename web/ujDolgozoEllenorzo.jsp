<%@page import = "lekerdez.AdatbazisLekerdezBean"
   contentType="text/html" pageEncoding="ISO-8859-2" errorPage="loginHiba.jsp"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezel�</title>    
  </head>  
  <body>  
    <h1>Oracle HR JSP lek�rdez� (Uj dolgozo adatainak ellenorzese)</h1>
    <hr>
    <% if(!lekerdez.isLoginOK()) { %>
      <p>Az oldal tartalma csak bejelentkez�s ut�n �rhet� el.</p>
      <hr>
      <p><a href="login.jsp">Vissza a bejelentkez�shez</a></p>
    <% } else { %>
    <p>Dolgoz�k adatai</p>
    
    
    <hr>
    <hr>
      <a href="loginOK.jsp">Vissza</a>
    <% } %>    
  </body>
</html>
