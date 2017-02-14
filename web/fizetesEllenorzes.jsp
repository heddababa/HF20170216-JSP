
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
    <% int fizetes = Integer.parseInt(request.getParameter("fizetes")); 
       int minFiz = (Integer)session.getAttribute("minFizEll");
       int maxFiz = (Integer)session.getAttribute("maxFizEll");
       String id = (String)session.getAttribute("id");
    %> 
    <h1>Oracle HR JSP kezelő (Fizetés ellenőrzés oldal)</h1>
    <h1>Ezt kéne ellenőrizni, hogy jó-e :  <%= fizetes %></h1>
    <h1>Dolgzó azonositó = <%= id %></h1>
    <p>Minimum fizetés = <%= minFiz%></p>
    <p>Maximum fizetés = <%= maxFiz%></p>
    <% if (fizetes < minFiz || fizetes > maxFiz) {
        response.sendRedirect("fizetesError.jsp");
      } else {%>
    <p>Fizetés rendbne lehet menteni, mentés</p>
<!--    boolean ok = lekerdez.modositFizetés(Integer.parseInt(id), fizetes);-->
    <%
      boolean ok=false;
        if (ok) {
           response.sendRedirect("loginOK.jsp");
        }
        else{
          response.sendRedirect("mentesHiba.jsp");
        }
      }
    %>
  </body>
</html>
