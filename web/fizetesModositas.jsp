<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezelő</title>
  </head>
  <style>
    table {
      font-family: arial, sans-serif;
      border-collapse: collapse;
      width: 25%;
    }

    td, th {
      border: 1px solid #dddddd;
      text-align: left;
      padding: 8px;
    }

    tr:nth-child(even) {
      background-color: #dddddd;
    }
  </style>  
  <body>
    <% if(session.getAttribute("felhasznalonev")==null) { %>
      <h1>Oracle HR JSP kezelő (Fizetés módosítás oldal)</h1>
      <hr>
      <p>Az oldal tartalma csak bejelentkezés után érhető el.</p>
      <hr>
      <p><a href="loginOK.jsp">Vissza a "foablakra"</a></p>
    <% } else { %>
      <h1>Oracle HR JSP kezelő 
        (bejelentkezve: <%= session.getAttribute("felhasznalonev")%>)
        <br>
        Fizetés módosítás
      </h1> <%--TODO Jogkort kiiratni--%>
      <p> A jogköröd: <%= lekerdez.getJogkor()%> </p>
      <hr>
      <p>
        Ezt a dolgozót választottam ki:<br> 
        A dolgózó azonosítója = <%= request.getParameter("id")%><br>
        A dolgozó neve = <%= lekerdez.getDolgozoNeve(request.getParameter("id"))%><br>
        Részlege: <%= lekerdez.getDolgozoRszlege(request.getParameter("id"))%><br>
        Munkaköre: <%= lekerdez.getDolgozoMunkakore(request.getParameter("id"))%><br>
        Adható maximális fizetés: <%= "valami"%><br>
        Adható minimális fizetés: <%= "vlami"%><br>
      </p> 
      <table>
        <tr>
          <td>A dolgózó azonosítója</td>
          <td><%= request.getParameter("id")%></td>
        </tr>
      </table>
      Új fizetés:<input type="text" name="username"><br>
      <input type="submit" value="Mehet">


      <hr>
      <p><a href="loginOK.jsp">Foablakra (Igazabol ellenorzes kell mentes utan)</a></p>
      <% }%>
  </body>
</html>
