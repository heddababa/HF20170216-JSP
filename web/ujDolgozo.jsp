<%@page import="lekerdez.Reszleg"%>
<%@page import="lekerdez.Munkakor"%>
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
    <h1>Oracle HR JSP kezel� (�j dolgoz� felvitele oldal)
        (bejelentkezve: <%= session.getAttribute("felhasznalonev") %>)</h1> <%--TODO Jogkort kiiratni--%>
    <hr>
    <% if(!lekerdez.isLoginOK()) { %>
      <p>Az oldal tartalma csak bejelentkez�s ut�n �rhet� el.</p>
      <hr>
      <p><a href="login.jsp">Vissza a bejelentkez�shez</a></p>
    <% } else { %>      
      <p>�j dolgoz�k adatai</p>
      <form action="ujDolgozoEllenorzo.jsp" method="post"><br>
        Vezet�kn�v: <input type="text" name="first_name" width="25"><br><br>
        Keresztn�v: <input type="text" name="last_name" width="20"><br><br>
        Nick n�v (emailhez): <input type="text" name="email" width="25"><br><br>
        Telefonsz�m: <input type="tel" name="phone_number" width="20"><br><br>
        R�szleg: 
          <select id="departments" name="department_id" onchange="fizetesHatarok()">
            <% for (Reszleg reszleg : lekerdez.getReszleg()) {%>
              <option value="<%= reszleg.getReszlegId()%>"><%= reszleg.getReszlegNev()%>
            <% } %>
          </select><br><br>
        Munkak�r: 
          <select id="jobs" name="job_Id" onchange="fizetesHatarok()">
            <% for (Munkakor munkakor : lekerdez.getMunkakor()) {%>
              <option value="<%= munkakor.getMunkakorId()%>"><%= munkakor.getMunkakorNev()%>
            <% } %> 
          </select><br> 
        
        <p id="adhatoFizu">Adhat� fizet�s: </p>
        <script>
          function fizetesHatarok() {
            var reszleg = document.getElementById("departments").value;
            var munkakor = document.getElementById("jobs").value;
            document.getElementById("adhatoFizu").innerHTML = "Adhat� fizet�s: " + reszleg + " "+munkakor; // request.getParameter("reszlegId");
          }
        </script>
        
        Fizet�s: <input type="number" name="salary" width="8"><br><br>
        <input type="submit" value="Ment�s">
      </form>
      <hr>
      <p><a href="loginOK.jsp">Vissza</a></p>
    <% } %>   
  </body>
</html>
