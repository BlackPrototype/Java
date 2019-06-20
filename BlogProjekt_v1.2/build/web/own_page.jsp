<%-- 
    Document   : blogs
    Created on : 2019.05.07., 22:09:38
    Author     : Prototype_
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-2">
        <title>Blog Page</title>
        <link rel="stylesheet" href="CSS/navbar.css">
        <link rel="stylesheet" href="CSS/data_section.css">
        <link rel="stylesheet" href="CSS/own_page.css">
    </head>
    <jsp:useBean id="post" class="beans.own_Posts" scope="page"></jsp:useBean>
    <jsp:setProperty name="username" property="*"/>
    <body>
        <%
            String username = (String) session.getAttribute("username");
            
            ResultSet info = post.personalInfo(username);
            
        %>
        
        <!-- Itt kezdődik a vízszintes menü -->
        <div class="navBar">
            <a href="logout.jsp">Kilépés</a>
            <a href="own_page.jsp">BlogProjekt</a>
            <a href="blogs.jsp">Bejegyzések</a>
            <a onclick="contactOn();">Kapcsolat</a>
            <a href="edit.jsp">Blog szerkesztése</a>
            <span style="font-family: Arial;margin: 2%;position: fixed; top: -15px;">Üdvözöllek <strong><%= username %></strong></span>
        </div>
        <!-- Itt a vége a vízszintes menünek -->       
        <!-- itt kezdődik a profilkép --> 
        <div class="picture">
            <img src="pics/profil.png" width="150" height="150"></img>
        </div>
        <!-- itt végződik a profilkép -->

        <!-- itt kezdődik az adatok megadása -->
        <div class="dataSection" id="dataSection">
            <!-- kapcsolat szekció kezdete -->
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
            <!-- alapadatok szekció kezdete -->
            <button id="formOn" title="Alapadatok" onclick="basicDataFormOn();">Alapadatok megadása</button>
            <div class="dataForm" hidden="true" id="basicDataForm">
                <span class="closebtn" onclick="basicDataFormOff();">&times;</span>
                <form name="basicDataForm" action="alapServlet" method="POST"><!-- action="userDataServlet"  method="POST"-->
                    <table>
                        <tr>
                            <td>Születési év: <br/>
                                <input type="text" size="32" placeholder="pl: 1991" name="bDate" id="bDate"/></td>
                        </tr>
                        <tr>
                            <td>Város ahol élsz: <br/>
                                <input type="text" size="32" placeholder="pl: Abony" name="town" id="town"/></td>
                        </tr>
                        <tr>
                            <td>Iskoláid:<br/>
                                <textarea rows="5" cols="50" id="schools" name="schools">Felsorolhatod, milyen iskolákba jártál...</textarea></td>
                        </tr>
                        <tr>
                            <td><input type="submit" title="Mentés" value="Mentés"/></td>
                        </tr>
                    </table>
                </form>
            </div><br/>
            <!-- elérhetőségi szekció kezdete -->
            <button id="formOn" title="Elérhetőségek" onclick="contactDataFormOn();">Elérhetőségek megadása</button>
            <div class="dataForm" hidden="true" id="contactDataForm">
                <span class="closebtn" onclick="contactDataFormOff();">&times;</span>
                <form name="contactForm" method="POST" action="contactServlet"><!-- action="userDataServlet"  method="POST"-->
                    <table>
                        <tr>
                            <td>E-mail cím: </td>
                            <td><input type="text" placeholder="pelda@sample.com" name="email" id="email"/></td>
                        </tr>
                        <tr>
                            <td>Facebook: </td>
                            <td><input type="text" placeholder="Facebook elérhetőség" name="fbook" id="fbook"/></td>
                        </tr>
                        <tr>    
                            <td>Instagram: </td>
                            <td><input type="text" placeholder="Instagram elérhetőség" name="insta" id="insta"/></td>
                        </tr>
                        <tr>    
                            <td>Youtube: </td>
                            <td><input type="text" placeholder="Youtube elérhetőség" name="youtube" id="youtube"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><input type="submit" title="Mentés" value="Mentés"/></td>
                        </tr>
                    </table>
                </form>
            </div><br/>
            <!-- érdeklődési szekció kezdete -->
            <button id="formOn" title="Érdeklődés" onclick="interestDataFormOn();">Érdeklődés és témakörök megadása</button>
            <div class="dataForm" hidden="true" id="interestDataForm">
                <span class="closebtn" onclick="interestDataFormOff();">&times;</span>
                <form name="interestForm" method="POST" action="interestServlet"><!-- action="userDataServlet"  method="POST"-->
                    <table>
                        <tr>
                            <td>Érdeklődési körök: <br/>
                                <input type="text" size="32" placeholder="Témák, amik érdekelnek..." name="interest" id="interest"/></td>
                        </tr>
                        <tr>
                            <td>Bemutatkozás:<br/>
                                <textarea rows="5" cols="50" id="aboutMe" name="aboutMe">Egy pár szóban írd le, amit érdemes tudni rólad...</textarea></td>
                        </tr>
                        <tr>
                            <td><input type="submit" title="Mentés" value="Mentés"/></td>
                        </tr>
                    </table>
                </form>
            </div>
            <!-- itt kezdődik az adatok kiírása -->
            <div class="userDatas" id="userDatas">
                <p><strong>Adataid:</strong></p>
                <%  while (info.next()) {%>
                <table>
                    <tr>
                        <td>Születési éved:</td><td><%= info.getString("BIRTH_DATE")%></td>
                    </tr>
                    <tr>
                        <td>Város:</td><td><%= info.getString("TOWN")%></td>
                    </tr>
                    <tr>
                        <td>Iskoláid:</td><td><%= info.getString("SCHOOLS")%></td>
                    </tr>
                    <tr>
                        <td>Email címed:</td><td><%= info.getString("EMAIL")%></td>
                    </tr>
                    <tr>
                        <td>Facebook:</td><td><%= info.getString("FBOOK")%></td>
                    </tr>
                    <tr>
                        <td>Instagram:</td><td><%= info.getString("INSTAGRAM")%></td>
                    </tr>
                    <tr>
                        <td>Youtube:</td><td><%= info.getString("YOUTUBE")%></td>
                    </tr>
                    <tr>
                        <td>Érdeklődési köreid:</td><td><%= info.getString("TOPICS")%></td>
                    </tr>
                    <tr>
                        <td>Bemutatkozás:</td><td><%= info.getString("ABOUT_ME")%></td>
                    </tr>
                    <% }%>
                </table>
            </div>
            <!-- itt végződik az adatok kiírása -->
            <% ResultSet result = post.listPost(username); %>
            <!-- ide jöhetnének a felhasználó bejegyzései -->
            <div id="userPosts" class="dataForm">
                    <%  while (result.next()) {%>
                <table style="width: 100%;" cellpadding="10">
                    <tr>
                        <td class="tableDataTitle"><%= result.getString("POST_TITLE")%></td><td><form name="form2" method="POST" action="deleteOwnPostServlet"><input type="text" name="postTitle" id="postTitle" value="<%= result.getString("POST_TITLE")%>" hidden="true"/><input type="submit" name="delete" value="Törlés"/></form></td>
                    </tr>
                    <tr>
                        <td class="tableData"><%= result.getString("POST")%><h5 style="float: right;"><i><%= result.getString("USERNAME")%></i><br/><u><%= result.getDate("POST_DATE")%></u></h5></td>
                    </tr>
                    <% }%>
                </table>
            </div>
            <!-- itt fejeződhetnének be a felhasználó bejegyzései -->
        </div>
        <!-- itt végződik az adatok megadása -->
        
        
        <script>
            function basicDataFormOff() {
                document.getElementById("basicDataForm").hidden = true;
            }

            function basicDataFormOn() {
                document.getElementById("basicDataForm").hidden = false;
            }
            function contactDataFormOff() {
                document.getElementById("contactDataForm").hidden = true;
            }

            function contactDataFormOn() {
                document.getElementById("contactDataForm").hidden = false;
            }
            function interestDataFormOff() {
                document.getElementById("interestDataForm").hidden = true;
            }

            function interestDataFormOn() {
                document.getElementById("interestDataForm").hidden = false;
            }
            function contactOff() {
                document.getElementById("contact").hidden = true;
            }

            function contactOn() {
                document.getElementById("contact").hidden = false;
            }
        </script>
    </body>
</html>
