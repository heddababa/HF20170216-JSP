<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezel�</title>
  </head>
  
  <body>
    <% if(session.getAttribute("felhasznalonev")==null) { %>
      <h1>Oracle HR JSP kezel� (sikeres bejelentkez�si oldal)</h1>
      <hr>
      <p>Az oldal tartalma csak bejelentkez�s ut�n �rhet� el.</p>
      <hr>
      <p><a href="login.jsp">Vissza a bejelentkez�shez</a></p>
    <% } else { %>
      <h1>Oracle HR JSP kezel� 
        (bejelentkezve: <%= session.getAttribute("felhasznalonev") %>)</h1> <%--TODO Jogkort kiiratni--%>
      <hr>
      <p><a href="Dolgozok.jsp">Dolgoz�k adatai</a></p>
      <%-- csak ha session.getAttribute("jogkor")=="HR2"-vel! vagy lekerdez.getjogkor.equals("HR2") --%>
   <%--TODO   <p><a href="ujDolgozoFelvetele.jsp">Dolgoz�k �tlagfizet�se</a></p> --%>
   <%--TODO   <p><a href="fizetesModositas.jsp">Dolgoz�k �tlagfizet�se</a></p> --%>   
      <hr>
      <p><a href="logout.jsp">Kijelentkez�s</a></p>
    <% } %>
  </body>
</html>
