

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
    <h1>Ezt k�ne ellen�rizni, hogy j�-e :  <%= fizetes %></h1>
    
    <p>Minimum fizet�s = <%= minFiz %></p>
    <p>Maximum fizet�s = <%= maxFiz %></p>
    <% if(fizetes<minFiz || fizetes>maxFiz){
      response.sendRedirect("fizetesError.jsp");
    }else{%>
    <p>Fizet�s rendbne lehet menteni</p>
    <%}
    %>
  </body>
</html>
