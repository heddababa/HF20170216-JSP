<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezelő</title>
  </head>  
  <body>
    <% if(session.getAttribute("felhasznalonev")==null) { %>
      <h1>Oracle HR JSP kezelő (Fizetés módosítás oldal)</h1>
      <hr>
      <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
      <hr>
      <p><a href="loginOK.jsp">Vissza a "foablakra"</a></p>
    <% } else { %>
      <h1>Oracle HR JSP kezelő 
        (bejelentkezve: <%= session.getAttribute("felhasznalonev") %>)
        <br>
        Fizetés módosítás
      </h1> <%--TODO Jogkort kiiratni--%>
      <hr>
      <p>
        Ezt a dolgozót választottam ki: 
        ID = <%= request.getParameter("id") %>
        Neve = <%= lekerdez.getDolgozoNeve(request.getParameter("id"))%>
        
      </p> 
      
      <hr>
      <p><a href="loginOK.jsp">Foablakra (Igazabol ellenorzes kell mentes utan)</a></p>
    <% } %>
  </body>
</html>
