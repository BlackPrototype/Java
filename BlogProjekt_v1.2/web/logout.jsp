<%-- 
    Document   : logout
    Created on : 2019.05.14., 20:23:10
    Author     : Prototype_
--%>
<% 
session.removeAttribute("username"); 
session.invalidate(); 
response.sendRedirect("index.jsp");  
%>
