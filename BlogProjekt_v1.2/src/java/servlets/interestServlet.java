/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "interestServlet", urlPatterns = {"/interestServlet"})
public class interestServlet extends HttpServlet {

    Connection conn = null; //sql kapcsolathoz kellenek
    java.sql.Statement stmt = null;
    ResultSet result = null;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/blog","user1","user1"); 
            stmt = conn.createStatement();
        } catch (SQLException ex) {
            out.print("<script>console.log(\"Nem jó!\");</script>"); 
            //Logger.getLogger(Blog.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession session = request.getSession(true);
        
        String interest = request.getParameter("interest"); 
        String aboutMe = request.getParameter("aboutMe");
        String uName = (String) session.getAttribute("username");
        String user_Name = new String();
        
        String userValid = "SELECT USERNAME FROM USER1.PERSONAL_INFO WHERE USERNAME = '" + uName + "'";
        result = stmt.executeQuery(userValid);
        
        while(result.next()){
             user_Name = result.getString("USERNAME");
        }
        if((user_Name.isEmpty()) || !(user_Name.equals(uName))){                
            String dataInput = "INSERT INTO USER1.PERSONAL_INFO (USERNAME, TOPICS, ABOUT_ME) VALUES ('" + uName + "', '" + interest + "', '" + aboutMe + "')";
            stmt.executeUpdate(dataInput);
            response.sendRedirect("own_page.jsp");
        }else{
            String dataInput = "UPDATE USER1.PERSONAL_INFO SET TOPICS = '" + interest + "', ABOUT_ME = '" + aboutMe + "' WHERE USERNAME = '" + uName + "'";
            stmt.executeUpdate(dataInput);
            response.sendRedirect("own_page.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(interestServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(interestServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
