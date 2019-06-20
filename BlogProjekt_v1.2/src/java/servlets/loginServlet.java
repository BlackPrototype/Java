/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.Blog;
import java.io.IOException;
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
@WebServlet(name = "loginServlet", urlPatterns = {"/loginServlet"})
public class loginServlet extends HttpServlet {

    Connection conn = null; //sql kapcsolathoz kellenek
    java.sql.Statement stmt = null;
    ResultSet result = null;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=iso-8859-2");
//        request.setCharacterEncoding("UTF-8");
//        response.setCharacterEncoding("UTF-8");
        
        try {
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/blog","user1","user1"); //megadom, hova kapcsolódjon, milyen felhasználónévvel és jelszóval
            stmt = conn.createStatement();//sql.Statement osztály be kell importlni, hogy ne a beans osztályt használja.
        } catch (SQLException ex) {
            Logger.getLogger(Blog.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        String s_Username = "SELECT USERNAME,PASSWORD FROM USER1.USERS WHERE USERNAME = '"+ username +"'";
        result = stmt.executeQuery(s_Username);
        
        HttpSession session = request.getSession(true);
        session.setMaxInactiveInterval(1800);
        String uName = null;
        String uPass = null;
        
        while(result.next()){
             uName = result.getString("USERNAME");
             uPass = result.getString("PASSWORD");
        }
        
        if(username.equals(uName)){ 
            if(password.equals(uPass)){
            response.sendRedirect("own_page.jsp");
            session.setAttribute("username", uName);
        }else {
            response.sendRedirect("index.jsp");
        }
        }else {
            response.sendRedirect("index.jsp");
        }       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
