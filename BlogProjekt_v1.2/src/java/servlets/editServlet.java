/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Prototype_
 */
@WebServlet(name = "editServlet", urlPatterns = {"/editServlet"})
public class editServlet extends HttpServlet {

    Connection conn = null; //sql kapcsolathoz kellenek
    java.sql.Statement stmt = null;
    ResultSet result = null;
    
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=iso-8859-2");
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
        try {
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/blog","user1","user1"); 
            stmt = conn.createStatement();
        } catch (SQLException ex) {
            out.print("<script>console.log(\"Nem jó!\");</script>"); 
            //Logger.getLogger(Blog.class.getName()).log(Level.SEVERE, null, ex);
        }
            HttpSession session = request.getSession(true);
            session.setMaxInactiveInterval(1800);
    
            String data = request.getParameter("saving");//editor
            String title = request.getParameter("blogTitle");
            String uName = (String) session.getAttribute("username");
            
            String dataInput = "INSERT INTO USER1.USER_DATA (USERNAME, POST_TITLE, POST, POST_DATE) VALUES ('" + uName + "', '" + title + "', '" + data + "', CURRENT_TIMESTAMP)";
            stmt.executeUpdate(dataInput);
            response.sendRedirect("blogs.jsp");
            //out.print("<p>Sikeres mentés!</p>");
            
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(editServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(editServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
