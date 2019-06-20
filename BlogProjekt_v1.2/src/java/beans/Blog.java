/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.beans.*;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Prototype_
 */
public class Blog implements Serializable {
    
    Connection conn = null; //sql kapcsolathoz kellenek
    java.sql.Statement stmt = null;
    ResultSet result = null;
    
    public Blog() {
        try {
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/blog","user1","user1"); //megadom, hova kapcsolódjon, milyen felhasználónévvel és jelszóval
            stmt = conn.createStatement();//sql.Statement osztály be kell importlni, hogy ne a beans osztályt használja.
        } catch (SQLException ex) {
            Logger.getLogger(Blog.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private String first_name;

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }
    
    private String last_name;

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }
    
    private String user;

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }
    
    private String pwd;

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
//szerkesztéshez
    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    private String content;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    
    public void addUser() throws SQLException{
         String sql = "INSERT INTO USER1.USERS (FIRSTNAME, LASTNAME, USERNAME, PASSWORD) VALUES ('" + first_name +"', '" + last_name + "', '" + user + "', '" + pwd + "')";
         stmt.executeUpdate(sql);
    }    
    
    public ResultSet userLogin() throws SQLException{
        String sql = "SELECT * FROM USER1.USERS WHERE (USERNAME = '"+ user +"') AND (PASSWORD = '" + pwd + "')";
        result = stmt.executeQuery(sql);
        return result;
    }
    
    public void addPost() throws SQLException{
        String dataInput = "INSERT INTO USER1.USER_DATA (USERNAME, POST_TITLE, POST, POST_DATE) VALUES ('" + user + "', '" + title + "', '" + content + "', CURRENT_TIMESTAMP)";
        stmt.executeUpdate(dataInput);
    }
}
