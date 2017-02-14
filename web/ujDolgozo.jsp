<%@page import="lekerdez.Reszleg"%>
<%@page import="lekerdez.Munkakor"%>
<%@page import = "lekerdez.AdatbazisLekerdezBean"
   contentType="text/html" pageEncoding="ISO-8859-2" errorPage="loginHiba.jsp"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezelő</title>
  </head>  
  <body>
    <h1>Oracle HR JSP kezelő (Új dolgozó felvitele oldal)
        (bejelentkezve: <%= session.getAttribute("felhasznalonev") %>)</h1> <%--TODO Jogkort kiiratni--%>
    <hr>
    <% if(!lekerdez.isLoginOK()) { %>
      <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
      <hr>
      <p><a href="login.jsp">Vissza a bejelentkezéshez</a></p>
    <% } else { %>      
      <p>Új dolgozók adatai</p>
      <form action="ujDolgozoEllenorzo.jsp" method="post"><br>
        Vezetéknév: <input type="text" name="first_name" width="25"><br><br>
        Keresztnév: <input type="text" name="last_name" width="20"><br><br>
        Nick név (emailhez): <input type="text" name="email" width="25"><br><br>
        Telefonszám: <input type="tel" name="phone_number" width="20"><br><br>
        Részleg: 
          <select id="departments" name="department_id" onchange="fizetesHatarok()">
            <% for (Reszleg reszleg : lekerdez.getReszleg()) {%>
              <option value="<%= reszleg.getReszlegId()%>"><%= reszleg.getReszlegNev()%>
            <% } %>
          </select><br><br>
        Munkakör: 
          <select id="jobs" name="job_Id" onchange="fizetesHatarok()">
            <% for (Munkakor munkakor : lekerdez.getMunkakor()) {%>
              <option value="<%= munkakor.getMunkakorId()%>"><%= munkakor.getMunkakorNev()%>
            <% } %> 
          </select><br> 
        
        <p id="adhatoFizu">Adható fizetés: </p>
        <script>
          function fizetesHatarok() {
            var reszleg = document.getElementById("departments").value;
            var munkakor = document.getElementById("jobs").value;
            document.getElementById("adhatoFizu").innerHTML = "Adható fizetés: " + reszleg + " "+munkakor; // request.getParameter("reszlegId");
          }
        </script>
        
        Fizetés: <input type="number" name="salary" width="8"><br><br>
        <input type="submit" value="Mentés">
      </form>
      <hr>
      <p><a href="loginOK.jsp">Vissza</a></p>
    <% } %>   
  </body>
</html>
