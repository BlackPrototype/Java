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
public class deleteBean implements Serializable {
    
    Connection conn = null; //sql kapcsolathoz kellenek
    java.sql.Statement stmt = null;
    ResultSet result = null;
    
    public deleteBean() {
        try {
            conn = DriverManager.getConnection("jdbc:derby://localhost:1527/blog","user1","user1"); //megadom, hova kapcsolódjon, milyen felhasználónévvel és jelszóval
            stmt = conn.createStatement();//sql.Statement osztály be kell importlni, hogy ne a beans osztályt használja.
        } catch (SQLException ex) {
            Logger.getLogger(Blog.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private String postTitle = "";

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public void deletePost() throws SQLException{
        String sql = "DELETE FROM USER1.USER_DATA WHERE POST_TITLE = '"+ postTitle +"'"; 
        stmt.executeQuery(sql);
    }
    
}
