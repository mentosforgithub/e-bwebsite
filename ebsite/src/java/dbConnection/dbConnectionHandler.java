/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConnection;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author hment
 */
public class dbConnectionHandler {
    Connection con = null;
 
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");//Mysql Connection
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(dbConnectionHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost/eb_module", "root", "87445151");//mysql database
            //System.out.println("connected sucessfully!" + con);
 
        } catch (SQLException ex) {
            Logger.getLogger(dbConnectionHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        return con;
    }
}
