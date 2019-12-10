/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connections;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import javax.naming.Context;
import javax.naming.InitialContext;
/**
 *
 * @author thmma
 */
public class ConnectionClass implements Serializable
{
    public static Connection getConnection()
    {
        Connection conn = null;
        try 
        {
            Context context = (Context)new InitialContext().lookup("java:comp/env");
            String driver = (String) context.lookup("driver");
            String url = (String) context.lookup("connectionURL");
            
            Class.forName(driver);
            conn = DriverManager.getConnection(url);

            System.out.println("ConnectionClass conn =" + conn);
            System.out.println("ConnectionClass successful");

        } 
        catch (Exception e) 
        {
             e.printStackTrace();
        }
        
        return conn;
    }
}
