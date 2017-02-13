<%@page import = "lekerdez.AdatbazisLekerdezBean"
   contentType="text/html" pageEncoding="ISO-8859-2" errorPage="loginHiba.jsp"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP lek�rdez�</title>
  </head>  
  <body>
    <h1>Oracle HR JSP lek�rdez� (Dolgozok adatainak lek�rdez� oldala)</h1>
    <hr>
    <% if(!lekerdez.isLoginOK()) { %>
      <p>Az oldal tartalma csak bejelentkez�s ut�n �rhet� el.</p>
      <hr>
      <p><a href="login.jsp">Oracle HR JSP lek�rdez� (bejelentkez�s)</a></p>
    <% } else { %>
    <p>Dolgoz�k adatai</p>
    <form action="Dolgozok.jsp" method="POST">
      <select name="employeeId">
        <option value="1">Egy</option>
        <option value="2">Kett�</option>
        <option value="3">Harom</option>
        <option value="4">N�gy</option>
      </select>
      <input type="submit" value="Kiv�lszt" />
    </form>
    <hr>
    <p><%=request.getParameter("employeeId")%></p>
    <%= lekerdez.getDolgozokAdatai()%>
    <hr>
      <a href="loginOK.jsp">Vissza</a>
    <% } %>    
  </body>
</html>