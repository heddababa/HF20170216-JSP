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
    <h1>Oracle HR JSP kezel� (�j dolgoz� adatainak ellen�rz�se)</h1>
    <% String vezetekNev = request.getParameter("vezet�k_n�v"); 
       String keresztNev = request.getParameter("kereszt_n�v");
       String nickNev = request.getParameter("email");
       String telSzam = request.getParameter("tel_szam");
       String reszlegId= request.getParameter("r�szleg");
       String munkakorId= request.getParameter("munkakor_id");
       String fizetes= request.getParameter("fizet�s");
       int managerId=lekerdez.lekerdezReszlegFonoke(Integer.parseInt(reszlegId));
    
    %>
    <p>Itt mar elvileg minden ok, lehet menteni, de a fizetest ellenorizni kell</p>
    <p>A mentend� dolgozo neve: <%= vezetekNev+" "+keresztNev %></p>
    
    <%--   <% if (vezetekNev.isEmpty() || keresztNev.isEmpty() || nickNev.isEmpty() || telSzam.isEmpty() ) {
        response.sendRedirect("ujDolgozoHiba.jsp");
      } else {%>  --%>
    <%  
      boolean ok=lekerdez.ujDolgozoFelvetele( vezetekNev, 
                                              keresztNev, 
                                              nickNev, 
                                              telSzam, 
                                              munkakorId, 
                                              Integer.parseInt(fizetes), 
                                              -1, 
                                              managerId,
                                              Integer.parseInt(reszlegId));
      if (ok) {
        response.sendRedirect("ujDolgozoMentesSiker.jsp");
      }
      else {
        response.sendRedirect("ujDolgozoMentesHiba.jsp");
      }
    %>
  </body>
</html>
