/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var fonts = document.querySelectorAll("select#fontChanger > option");
for (var i = 0; i < fonts.length; i++) {
    fonts[i].style.fontFamily = fonts[i].value;
}
window.addEventListener("load", function () {
    var editor = theWYSIWYG.document;
    editor.designMode = "on"; //emiatt lesz szerkeszthető az iframe, lehetne még a content ediatble is és akkor nem kellene iframe

    //document.execCommand(aCommandName, aShowDefaultUI, aValueArgument)

    boldButton.addEventListener("click", function () {
        editor.execCommand("Bold", false, null);
    }, false);

    italicButton.addEventListener("click", function () {
        editor.execCommand("Italic", false, null);
    }, false);

    underButton.addEventListener("click", function () {
        editor.execCommand("underline", false, null);
    }, false);

    supButton.addEventListener("click", function () {
        editor.execCommand("Superscript", false, null);
    }, false);

    subButton.addEventListener("click", function () {
        editor.execCommand("Subscript", false, null);
    }, false);

    strikeButton.addEventListener("click", function () {
        editor.execCommand("Strikethrough", false, null);
    }, false);

    orderedListButton.addEventListener("click", function () {
        editor.execCommand("Insertorderedlist", false, "newOl" + Math.round(Math.random() * 1000));
    }, false);

    unorderedListButton.addEventListener("click", function () {
        editor.execCommand("Insertunorderedlist", false, "newOl" + Math.round(Math.random() * 1000));
    }, false);

    fontColorButton.addEventListener("change", function (event) {
        editor.execCommand("ForeColor", false, event.target.value);
    }, false);

    highlightButton.addEventListener("change", function (event) {
        editor.execCommand("BackColor", false, event.target.value);
    }, false);

    fontChanger.addEventListener("change", function (event) {
        editor.execCommand("FontName", false, event.target.value);
    }, false);

    fontSizeChanger.addEventListener("change", function (event) {
        editor.execCommand("FontSize", false, event.target.value);
    }, false);

    linkButton.addEventListener("click", function () {
        var url = prompt("Enter a URL:", "http://");
        editor.execCommand("CreateLink", false, url);
    }, false);

    unLinkButton.addEventListener("click", function () {
        editor.execCommand("Unlink", false, null);
    }, false);

    undoButton.addEventListener("click", function () {
        editor.execCommand("undo", false, null);
    }, false);

    redoButton.addEventListener("click", function () {
        editor.execCommand("redo", false, null);
    }, false);

    //itt a Mentés gomb után megkérdezi, hogy tuti el akarja-e menteni és csak utána küldi az editServletbe
    document.getElementById("tuti").hidden = true;
    Save.addEventListener("click", function () {
        var title = document.getElementById("blog_title").value;
        var blogPost = document.getElementById('theWYSIWYG').contentWindow.document.body.innerHTML;
        if ((title === "") || (blogPost === "")) {
            alert("Nem maradhat üres mező!");
        } else {
            document.getElementById("blogTitle").value = title;
            document.getElementById("saving").value = "<div name=\"content\"><p>" + blogPost + "</div>";
            document.getElementById("tuti").hidden = false;
        }
        console.log(document.getElementById("saving").innerHTML);
    }, false);

}, false);

//a szövegszerkesztő leírásának bekapcsolása
function helpOn() {
    document.getElementById("help").hidden = false;
}

//a szövegszerkesztő leírásának kikapcsolása
function helpOff() {
    document.getElementById("help").hidden = true;
}

//a blog cím törlése, ha az oldal újratöltődik
function clearInp() {
    document.getElementById("blog_title").value = "";
}
clearInp();

