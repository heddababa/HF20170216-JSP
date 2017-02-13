<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezel�</title>
  </head>  
  <body>
    <% if(session.getAttribute("felhasznalonev")==null) { %>
      <h1>Oracle HR JSP kezel� (Fizet�s m�dos�t�s oldal)</h1>
      <hr>
      <p>Az oldal tartalma csak bejelentkez�s ut�n �rhet� el.</p>
      <hr>
      <p><a href="loginOK.jsp">Vissza a "foablakra"</a></p>
    <% } else { %>
      <h1>Oracle HR JSP kezel� 
        (bejelentkezve: <%= session.getAttribute("felhasznalonev") %>)
        <br>
        Fizet�s m�dos�t�s
      </h1> <%--TODO Jogkort kiiratni--%>
      <hr>
      <p>
        Ezt a dolgoz�t v�lasztottam ki: 
        ID = <%= request.getParameter("id") %>
        Neve = <%= lekerdez.getDolgozoNeve(request.getParameter("id"))%>
        
      </p> 
      
      <hr>
      <p><a href="loginOK.jsp">Foablakra (Igazabol ellenorzes kell mentes utan)</a></p>
    <% } %>
  </body>
</html>
