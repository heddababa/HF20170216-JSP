

<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>JSP Page</title>
  </head>
  <body>
    <h1>Ezt k�ne ellen�rizni, hogy j�-e :  <%= request.getParameter("fizetes") %></h1>
    <p>Minimum fizet�s = <%= session.getAttribute("minFizEll") %></p>
    <p>Maximum fizet�s = <%= session.getAttribute("maxFizEll") %></p>
  </body>
</html>
