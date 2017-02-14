
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
    <% int fizetes = Integer.parseInt(request.getParameter("fizetes")); 
       int minFiz = (Integer)session.getAttribute("minFizEll");
       int maxFiz = (Integer)session.getAttribute("maxFizEll");
       String id = (String)session.getAttribute("id");
    %> 
    <h1>Oracle HR JSP kezel� (Fizet�s ellen�rz�s oldal)</h1>
    <h1>Ezt k�ne ellen�rizni, hogy j�-e :  <%= fizetes %></h1>
    <h1>Dolgz� azonosit� = <%= id %></h1>
    <p>Minimum fizet�s = <%= minFiz%></p>
    <p>Maximum fizet�s = <%= maxFiz%></p>
    <% if (fizetes < minFiz || fizetes > maxFiz) {
        response.sendRedirect("fizetesError.jsp");
      } else {%>
    <p>Fizet�s rendbne lehet menteni, ment�s</p>
<!--    boolean ok = lekerdez.modositFizet�s(Integer.parseInt(id), fizetes);-->
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
