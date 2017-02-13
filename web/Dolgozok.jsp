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
    <form action="Dolgozok.jsp" method="POST">
      <select name="employeeId">
        <option value="1">Egy</option>
        <option value="2">Kettő</option>
        <option value="3">Harom</option>
        <option value="4">Négy</option>
      </select>
      <input type="submit" value="Kiválszt" />
    </form>
    <hr>
    <p><%=request.getParameter("employeeId")%></p>
    <%= lekerdez.getDolgozokAdatai()%>
    <hr>
      <a href="loginOK.jsp">Vissza</a>
    <% } %>    
  </body>
</html>