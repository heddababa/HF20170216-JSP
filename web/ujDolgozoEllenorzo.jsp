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
    <h1>Oracle HR JSP kezelő (Új dolgozó adatainak ellenőrzése)</h1>
    <% String vezetekNev = request.getParameter("vezeték_név"); 
       String keresztNev = request.getParameter("kereszt_név");
       String nickNev = request.getParameter("email");
       String telSzam = request.getParameter("tel_szam");
       String reszlegId= request.getParameter("részleg");
       String munkakorId= request.getParameter("munkakor_id");
       String fizetes= request.getParameter("fizetés");
       int managerId=lekerdez.lekerdezReszlegFonoke(Integer.parseInt(reszlegId));
    
    %>
    <p>Itt mar elvileg minden ok, lehet menteni, de a fizetest ellenorizni kell</p>
    <p>A mentendő dolgozo neve: <%= vezetekNev+" "+keresztNev %></p>
    
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
