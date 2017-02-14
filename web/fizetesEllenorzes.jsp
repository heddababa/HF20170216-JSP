

<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>JSP Page</title>
  </head>
  <body>
    <% int fizetes = Integer.parseInt(request.getParameter("fizetes")); 
       int minFiz = (Integer)session.getAttribute("minFizEll");
       int maxFiz = (Integer)session.getAttribute("maxFizEll");
    %> 
    <h1>Ezt kéne ellenőrizni, hogy jó-e :  <%= fizetes %></h1>
    
    <p>Minimum fizetés = <%= minFiz %></p>
    <p>Maximum fizetés = <%= maxFiz %></p>
    <% if(fizetes<minFiz || fizetes>maxFiz){
      response.sendRedirect("fizetesError.jsp");
    }else{%>
    <p>Fizetés rendbne lehet menteni</p>
    <%}
    %>
  </body>
</html>
