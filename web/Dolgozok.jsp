<%@page import="lekerdez.Reszleg"%>
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
    <h1>Oracle HR JSP lek�rdez� (Dolgoz�k fizet�seinek m�dos�t�sa)</h1>
    <hr>
    <% if(!lekerdez.isLoginOK()) { %>
      <p>Az oldal tartalma csak bejelentkez�s ut�n �rhet� el.</p>
      <hr>
      <p><a href="login.jsp">Oracle HR JSP lek�rdez� (bejelentkez�s)</a></p>
    <% } else { %>
    <p>Dolgoz�k adatai</p>
    <form action="Dolgozok.jsp" method="POST">
      <select name="reszlegId">
        <option selected value="mindenki" >Minden dolgoz�</option>
        <% for (Reszleg reszleg : lekerdez.reszlegek) {%>
        <option value="<%= reszleg.getReszlegId()%>"><%= reszleg.getReszlegNev()%></option>
        <% }%>
      </select>
      <input type="submit" value="R�szleg v�lszt�s" />
    </form>
    <hr>
    <%= lekerdez.getDolgozokAdatai(request.getParameter("reszlegId"))%>
    <hr>
      <a href="loginOK.jsp">Vissza</a>
    <% } %>    
  </body>
</html>