<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<jsp:useBean id="lekerdez" class="lekerdez.AdatbazisLekerdezBean" scope="session"/>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezel�</title>
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
      <h1>Oracle HR JSP kezel� (Fizet�s m�dos�t�s oldal)</h1>
      <hr>
      <p>Az oldal tartalma csak bejelentkez�s ut�n �rhet� el.</p>
      <hr>
      <p><a href="loginOK.jsp">Vissza a "foablakra"</a></p>
    <% } else { %>
      <h1>Oracle HR JSP kezel� 
        (bejelentkezve: <%= session.getAttribute("felhasznalonev")%>)
        <br>
        Fizet�s m�dos�t�s
      </h1> <%--TODO Jogkort kiiratni--%>
      <p> A jogk�r�d: <%= lekerdez.getJogkor()%> </p>
      <hr>
      <p>
        Ezt a dolgoz�t v�lasztottam ki:<br> 
        A dolg�z� azonos�t�ja = <%= request.getParameter("id")%><br>
        A dolgoz� neve = <%= lekerdez.getDolgozoNeve(request.getParameter("id"))%><br>
        R�szlege: <%= lekerdez.getDolgozoRszlege(request.getParameter("id"))%><br>
        Munkak�re: <%= lekerdez.getDolgozoMunkakore(request.getParameter("id"))%><br>
        Adhat� maxim�lis fizet�s: <%= "valami"%><br>
        Adhat� minim�lis fizet�s: <%= "vlami"%><br>
      </p> 
      <table>
        <tr>
          <td>A dolg�z� azonos�t�ja</td>
          <td><%= request.getParameter("id")%></td>
        </tr>
      </table>
      �j fizet�s:<input type="text" name="username"><br>
      <input type="submit" value="Mehet">


      <hr>
      <p><a href="loginOK.jsp">Foablakra (Igazabol ellenorzes kell mentes utan)</a></p>
      <% }%>
  </body>
</html>
