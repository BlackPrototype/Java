<%-- 
    Document   : edit
    Created on : 2019.05.09., 18:25:20
    Author     : Prototype_
--%>

<%@page contentType="text/html" pageEncoding="iso-8859-2"%>
<!DOCTYPE html>
<html lang="hu">
    <head>
        <meta charset="utf-8">
        <title>Bejegyzés szerkesztõ</title>
        <link rel="stylesheet" href="CSS/edit.css">
        <link rel="stylesheet" href="CSS/navbar.css">
        <link rel="stylesheet" href="CSS/data_section.css">
    </head>
    <%
            String username = (String) session.getAttribute("username");
    %>
    <body>
        <div class="navBar">
            <a href="logout.jsp">Kilépés</a>
            <a href="own_page.jsp">BlogProjekt</a>
            <a href="blogs.jsp">Bejegyzések</a>
            <a onclick="contactOn();">Kapcsolat</a>
            <a href="edit.jsp">Blog szerkesztése</a>
            <span style="font-family: Arial;margin: 2%;position: fixed; top: -15px;"><strong><%= username %></strong> &nbsp;blogszerkesztõje</span>
        </div>
        <!-- Itt a vége a vízszintes menünek -->
        <!--a fõcím és a bejegyés címének blokkja itt KEZDÕDIK-->
        <div class="postForm">
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
            <!-- kapcsolat szekció kezdete -->
            <h1>Blogbejegyzés hozzáadása</h1>
            <input type="text" placeholder="Bejegyzés címe..." size="109" name="blog_title" id="blog_title" title="Ide csak írd be a bejegyzés címét, nem lehet szerkeszteni!" required/><br/><br/>
        
        <!--a fõcím és a bejegyés címének blokkja itt VÉGZÕDIK-->

        <!--a szövegszerkesztõ blokkja itt kezdõdik-->
        <div id="textEditor">
            <div id="theHeader"><!--az opciók blokkja itt kezdõdik-->
                <button id="boldButton" title="Félkövér"><b>B</b></button>
                <button id="italicButton" title="Dõlt"><i>I</i></button>
                <button id="underButton" title="Aláhúzott"><u>U</u></button>
                <button id="supButton" title="Felsõ index">X<sup>2</sup></button>
                <button id="subButton" title="Alsó index">X<sub>2</sub></button>
                <button id="strikeButton" title="Áthúzott"><s>abc</s></button>
                <button id="orderedListButton" title="Számozott lista">(i)</button>
                <button id="unorderedListButton" title="Számozatlan lista">&bull;</button>
                <input type="color" id="fontColorButton" title="Betûszín megváltoztatása"/>
                <input type="color" id="highlightButton" title="Szövegkiemelõ szín"/>
                <select id="fontChanger">
                    <option value="Times New Roman">Times New Roman</option>
                    <option value="Consolas">Consolas</option>
                    <option value="Tahoma">Tahoma</option>
                    <option value="Monospace">Monospace</option>
                    <option value="Sans-serif">Sans-serif</option>
                    <option value="Calibri">Calibri</option>
                </select>
                <select id="fontSizeChanger">
                    <script>
                        for (var i = 1; i < 11; i++) {
                            document.write("<option value='" + i + "'>" + i + "</option>");
                        }
                    </script>
                </select>
                <button id="linkButton" title="Link létrehozása">Link</button>
                <button id="unLinkButton" title="Link eltávolítása">unLink</button>
                <button id="undoButton" title="Változtatás vissza">&larr;</button>
                <button id="redoButton" title="Változtatás mégis">&rarr;</button>
                <button id="Save" title="Mentés">Mentés</button>
                <button id="helpButton" title="Segítség a használathoz." onclick="helpOn();">Segítség</button>

                <!--a szerkesztõ leírás blokkja itt kezdõdik-->

                <div class="alert" id="help" hidden="true">
                    <span class="closebtn" onclick="helpOff();">&times;</span> 
                    <strong><u>A szerkesztõ használata:</u> </strong>
                    <p>Kezdd el leírni a bejegyzésed. Majd miután ezzel végeztél jelöld ki a szerkeszteni kívánt szöveget!<br/>Miután kijelölted a fenti &uarr; formázási opciók közül válassz, amelyik szükséges.</p>
                    <p>Ha kész vagy a szerkesztéssel a <b><u>Mentés</u></b> gombra kell kattintani, melynek hatására a szerkesztõ alatt megjelenik<br/>Mégegyszer a blogbejegyzés egy <b><u>Tutira szeretném menteni</u></b> gombbal. Ha megfelel a bejegyzés, akkor természetesen kattints rá. </p>
                    <p>Mind a <strong>cím</strong>, mind a <strong>bejegyzés</strong> rész <u><span style="color: #0040ff;">kitöltendõ!</span></u></p> 
                </div>

                <!--a szerkesztõ leírás blokkja itt végzõdik-->

            </div><!--az opciók blokkja itt végzõdik-->

            <!--a konkrét beírni való szöveg blokkja itt kezdõdik-->

            <div id="richText" title="A bejegyzés szövegét írd ide!">
                <iframe id="theWYSIWYG" name="theWYSIWYG" frameborder="0"></iframe>
            </div><br/>

            <!--a konkrét beírni való szöveg blokkja itt végzõdik-->

            <!--a konkrét beít szöveg itt jelenik meg-->
            <!-- meg kellene próbálni ezt is onchange="myScript();-->
            <form action="editServlet" method="POST">
                <input type="text" name="blogTitle" id="blogTitle" hidden="true"/>
                <textarea id="saving" name="saving" hidden="true"> </textarea>
                <span style="margin-left: 40%;">
                      <input type="submit" value="Tutira szeretném menteni. " id="tuti" />
                </span
            </form>
            <!--a konkrét beít szöveg itt jelent meg-->
        </div>
</div>
        <!--a szövegszerkesztõ blokkja itt végzõdik-->

        <script src="JavaScript/editor.js"></script>
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

