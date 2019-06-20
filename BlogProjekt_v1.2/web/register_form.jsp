<%-- 
    Document   : register_form
    Created on : 2019.05.13., 17:43:19
    Author     : Prototype_
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="iso-8859-2">
        <title>Regisztráció</title>
        <link rel="stylesheet" href="CSS/registration_form.css">
        <link rel="stylesheet" href="CSS/main.css">
    </head>
    <body id="index">
        <jsp:useBean id="user" class="beans.Blog" scope="page"/>
        <jsp:setProperty name="user" property="*"/>
        <% 
            String iButton = request.getParameter("insert");
            if (iButton != null) {
                   user.addUser();
                   request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            
        %>
        <div id="header" class="header">
            <h1>BloggingPage</h1>
        </div>
        <div class="registrationForm">
            <form name="register" method="POST">
                <center>
                    <table>
                        <thead>
                            <tr>
                                <th colspan="2">Regisztráció</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>    
                                <td>Keresztnév : </td>
                                <td><input type="text" name="first_name"></td>
                            </tr>
                            <tr>    
                                <td>Vezetéknév : </td>
                                <td><input type="text" name="last_name"></td>
                            </tr>
                            <tr>    
                                <td>Felhasználónév : </td>
                                <td><input type="text" name="user"></td>
                            </tr>
                            <tr>
                                <td>Jelszó : </td>
                                <td><input type="password" name="pwd"></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="float: right;"><input type="submit" name="insert" value="Regisztráció"></td>
                            </tr>
                        </tbody>             
                    </table>
                </center>
            </form>
        </div>
        <div class="footer">Szabó Zoltán - AXS2KI<br/> 2019</div>
    </body>
</html>
