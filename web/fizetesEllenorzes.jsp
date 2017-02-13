<%-- 
    Document   : fizetesEllenorzes
    Created on : Feb 13, 2017, 9:27:17 PM
    Author     : Karoly
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-2"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-2">
    <title>JSP Page</title>
  </head>
  <body>
    <h1>Ezt kéne ellenőrizni, hogy jó-e :  <%= request.getParameter("fizetes") %></h1>
  </body>
</html>
