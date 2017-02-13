<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>Oracle HR JSP kezelő</title>
  </head>  
  <body>
    <% if(session.getAttribute("felhasznalonev")==null) { %>
      <h1>Oracle HR JSP kezelő (Új dolgozó felvitele oldal)</h1>
      <hr>
      <p>itt nemcsak a bejelentkezest, hanem a jogosultsagot is ellenorizni kell szerintem! </p>
      <hr>
      <p><a href="loginOK.jsp">Vissza a "foablakra"</a></p>
    <% } else { %>
      <h1>Oracle HR JSP kezelő 
        (bejelentkezve: <%= session.getAttribute("felhasznalonev") %>)</h1> <%--TODO Jogkort kiiratni--%>
      <hr>
      <p>TODO Itt lehetne új dolgozót felvenni. Először részleglistából kiválasztani melyik 
        rélszleghez szeretne új dolgozot felvenni, aztan a kivalasztas utan uj jsp jelenik meg urlapmezokkel 
        (loginhoz hasonloan, belepes helyett mentes gombbal) vagy ha meg tudjuk oldani a comboboxos kivalasztast, akkor
        mar itt lehet az urlapos kitoltes. Aztan ellenorzes, mentes ha ok, hiba ha nem ok, es vissza a foablakra...</p> 
      <hr>
      <p><a href="loginOK.jsp">Foablakra (Igazabol ellenorzes kene mentes utan)</a></p>
    <% } %>
  </body>
</html>
