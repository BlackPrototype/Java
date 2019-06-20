<%-- 
    Document   : blogs
    Created on : 2019.05.13., 22:41:01
    Author     : Prototype_
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="hu">
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="iso-8859-2">
        <title>Minden bejegyzés</title>
        <link rel="stylesheet" href="CSS/data_section.css">
        <link rel="stylesheet" href="CSS/navbar.css">
    </head>
    <jsp:useBean id="post" class="beans.fromTable" scope="page"></jsp:useBean>
    <body>
        <%
            String username = (String) session.getAttribute("username");
            ResultSet result = post.listPost();
        %>
        <!-- Itt kezdődik a vízszintes menü -->
        <div class="navBar">
            <a href="logout.jsp">Kilépés</a>
            <a href="own_page.jsp">BlogProjekt</a>
            <a href="blogs.jsp">Bejegyzések</a>
            <a onclick="contactOn();">Kapcsolat</a>
            <a href="edit.jsp">Blog szerkesztése</a>
            <span style="font-family: Arial;margin: 2%;position: fixed; top: -15px;">Bejelentkezve <strong><%= username %></strong> néven</span>
        </div>
        <!-- Itt a vége a vízszintes menünek -->
        <div class="allPostForm">
            <div id="contact" hidden="true" class="contactForm">
                <span class="closebtn" onclick="contactOff();">&times;</span>
                <h2><u>Kapcsolat:</u></h2>
                <table align="center">
                    <tr>
                        <td style="text-align: center; font-size: 14pt;font-weight: bold;">Szabó Zoltán</td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">Neptun-kód: AXS2KI</td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">szabo.zoltan.91@gmail.com</td>
                    </tr>
                </table>
            </div>
            <h1>Böngéssz és olvass a legújabb bejegyzések között!</h1>
            <%  while (result.next()) {%>
            <table style="width: 100%;" cellpadding="10">
                    <tr>
                        <td class="tableDataTitle"><%= result.getString("POST_TITLE")%></td>
                    </tr>
                    <tr>
                        <td class="tableData"><%= result.getString("POST")%><h5 style="float: right;"><i><%= result.getString("USERNAME")%></i><br/><u><%= result.getDate("POST_DATE")%></u></h5></td>
                    </tr>
                    <% }%>
                </table>
        </div>
                <script>
            function contactOff() {
                document.getElementById("contact").hidden = true;
            }

            function contactOn() {
                document.getElementById("contact").hidden = false;
            }
        </script>
    </body>
</html>
