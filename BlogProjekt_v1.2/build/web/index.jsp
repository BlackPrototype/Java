<%-- 
    Document   : index
    Created on : 2019.05.13., 17:37:00
    Author     : Prototype_
--%>

<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>BlogProject</title>
        <meta charset="iso-8859-2">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/main.css">
        <link rel="stylesheet" href="CSS/registration_form.css">
    </head>
    <body id="index">
        <div id="header" class="header">
            <h1>BloggingPage</h1>
        </div>
        <div style="margin: 80px 0px 0px 50px; color: white; font-family: Albertus, sans-serif;">
            <h2>Üdvözöllek az oldalon! <br/>Kérlek lépj be vagy regisztrálj!</h2>
        </div>
        <div class="loginForm">
            <form action="loginServlet" method="POST" class="login" name="login">
                <p class="loginData">
                    Felhasználónév:<input class="inputData" type="text" name="username" size="24"/>
                </p>
                <p class="loginData">
                    Jelszó:<input class="inputData" type="password" name="password" size="24"/>
                </p>
                <input style="display: inline-block;" type="submit" name="login" value="Bejelentkezés"/>
            </form>
            <form class="login" method="POST" action="register_form.jsp">
                    <input type="submit" value="Regisztráció"/>
            </form>
        </div>
        <div class="footer">Szabó Zoltán - AXS2KI<br/> 2019</div>
    </body>
</html>
