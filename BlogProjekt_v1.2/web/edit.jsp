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
        <title>Bejegyz�s szerkeszt�</title>
        <link rel="stylesheet" href="CSS/edit.css">
        <link rel="stylesheet" href="CSS/navbar.css">
        <link rel="stylesheet" href="CSS/data_section.css">
    </head>
    <%
            String username = (String) session.getAttribute("username");
    %>
    <body>
        <div class="navBar">
            <a href="logout.jsp">Kil�p�s</a>
            <a href="own_page.jsp">BlogProjekt</a>
            <a href="blogs.jsp">Bejegyz�sek</a>
            <a onclick="contactOn();">Kapcsolat</a>
            <a href="edit.jsp">Blog szerkeszt�se</a>
            <span style="font-family: Arial;margin: 2%;position: fixed; top: -15px;"><strong><%= username %></strong> &nbsp;blogszerkeszt�je</span>
        </div>
        <!-- Itt a v�ge a v�zszintes men�nek -->
        <!--a f�c�m �s a bejegy�s c�m�nek blokkja itt KEZD�DIK-->
        <div class="postForm">
            <!-- kapcsolat szekci� kezdete -->
            <div id="contact" hidden="true" class="contactForm">
                <span class="closebtn" onclick="contactOff();">&times;</span>
                <h2><u>Kapcsolat:</u></h2>
                <table align="center">
                    <tr>
                        <td style="text-align: center; font-size: 14pt;font-weight: bold;">Szab� Zolt�n</td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">Neptun-k�d: AXS2KI</td>
                    </tr>
                    <tr>
                        <td style="text-align: center;">szabo.zoltan.91@gmail.com</td>
                    </tr>
                </table>
            </div>
            <!-- kapcsolat szekci� kezdete -->
            <h1>Blogbejegyz�s hozz�ad�sa</h1>
            <input type="text" placeholder="Bejegyz�s c�me..." size="109" name="blog_title" id="blog_title" title="Ide csak �rd be a bejegyz�s c�m�t, nem lehet szerkeszteni!" required/><br/><br/>
        
        <!--a f�c�m �s a bejegy�s c�m�nek blokkja itt V�GZ�DIK-->

        <!--a sz�vegszerkeszt� blokkja itt kezd�dik-->
        <div id="textEditor">
            <div id="theHeader"><!--az opci�k blokkja itt kezd�dik-->
                <button id="boldButton" title="F�lk�v�r"><b>B</b></button>
                <button id="italicButton" title="D�lt"><i>I</i></button>
                <button id="underButton" title="Al�h�zott"><u>U</u></button>
                <button id="supButton" title="Fels� index">X<sup>2</sup></button>
                <button id="subButton" title="Als� index">X<sub>2</sub></button>
                <button id="strikeButton" title="�th�zott"><s>abc</s></button>
                <button id="orderedListButton" title="Sz�mozott lista">(i)</button>
                <button id="unorderedListButton" title="Sz�mozatlan lista">&bull;</button>
                <input type="color" id="fontColorButton" title="Bet�sz�n megv�ltoztat�sa"/>
                <input type="color" id="highlightButton" title="Sz�vegkiemel� sz�n"/>
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
                <button id="linkButton" title="Link l�trehoz�sa">Link</button>
                <button id="unLinkButton" title="Link elt�vol�t�sa">unLink</button>
                <button id="undoButton" title="V�ltoztat�s vissza">&larr;</button>
                <button id="redoButton" title="V�ltoztat�s m�gis">&rarr;</button>
                <button id="Save" title="Ment�s">Ment�s</button>
                <button id="helpButton" title="Seg�ts�g a haszn�lathoz." onclick="helpOn();">Seg�ts�g</button>

                <!--a szerkeszt� le�r�s blokkja itt kezd�dik-->

                <div class="alert" id="help" hidden="true">
                    <span class="closebtn" onclick="helpOff();">&times;</span> 
                    <strong><u>A szerkeszt� haszn�lata:</u> </strong>
                    <p>Kezdd el le�rni a bejegyz�sed. Majd miut�n ezzel v�gezt�l jel�ld ki a szerkeszteni k�v�nt sz�veget!<br/>Miut�n kijel�lted a fenti &uarr; form�z�si opci�k k�z�l v�lassz, amelyik sz�ks�ges.</p>
                    <p>Ha k�sz vagy a szerkeszt�ssel a <b><u>Ment�s</u></b> gombra kell kattintani, melynek hat�s�ra a szerkeszt� alatt megjelenik<br/>M�gegyszer a blogbejegyz�s egy <b><u>Tutira szeretn�m menteni</u></b> gombbal. Ha megfelel a bejegyz�s, akkor term�szetesen kattints r�. </p>
                    <p>Mind a <strong>c�m</strong>, mind a <strong>bejegyz�s</strong> r�sz <u><span style="color: #0040ff;">kit�ltend�!</span></u></p> 
                </div>

                <!--a szerkeszt� le�r�s blokkja itt v�gz�dik-->

            </div><!--az opci�k blokkja itt v�gz�dik-->

            <!--a konkr�t be�rni val� sz�veg blokkja itt kezd�dik-->

            <div id="richText" title="A bejegyz�s sz�veg�t �rd ide!">
                <iframe id="theWYSIWYG" name="theWYSIWYG" frameborder="0"></iframe>
            </div><br/>

            <!--a konkr�t be�rni val� sz�veg blokkja itt v�gz�dik-->

            <!--a konkr�t be�t sz�veg itt jelenik meg-->
            <!-- meg kellene pr�b�lni ezt is onchange="myScript();-->
            <form action="editServlet" method="POST">
                <input type="text" name="blogTitle" id="blogTitle" hidden="true"/>
                <textarea id="saving" name="saving" hidden="true"> </textarea>
                <span style="margin-left: 40%;">
                      <input type="submit" value="Tutira szeretn�m menteni. " id="tuti" />
                </span
            </form>
            <!--a konkr�t be�t sz�veg itt jelent meg-->
        </div>
</div>
        <!--a sz�vegszerkeszt� blokkja itt v�gz�dik-->

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

