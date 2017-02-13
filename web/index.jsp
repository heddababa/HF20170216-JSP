<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezelő</title>
  </head>  
  <body>
    <h1>Oracle HR JSP kezelő (bejelentkező oldal)</h1>
    <hr>
    <p>Üdvözöljük a HR JSP kezelőben! Kérjük a folytatáshoz jelentkezzen be!</p>  
    <form action="loginEllenorzo.jsp" method="post"><br>
      Felhasználónév:<input type="text" name="username"><br>
      Jelszó:<input type="password" name="password"><br>
      <input type="submit" value="Belép">
    </form>
    <hr>
  </body>
</html>
