package database;

import java.sql.*;
import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Db_Connection 
{
    public Connection Connection()
    {   
        PrintWriter out = null;
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            String TechWorld3g_2 = "jdbc:mysql://database.com:3306/weblove_attirerentals?user=weblab";
            Connection myConnection = DriverManager.getConnection(TechWorld3g_2);
            
            return myConnection;
        } catch (Exception e){
            out.println(e);
        }
        return null;
    }
}
