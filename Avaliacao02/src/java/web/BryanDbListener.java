/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import java.sql.*;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author spbry
 */
public class BryanDbListener implements ServletContextListener {
    
    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:tasks.db";
    
    public static Exception exception = null;
    
    public static Connection getConnection() throws Exception {
        return DriverManager.getConnection(URL);
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Class.forName(CLASS_NAME);
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            stmt.execute("create table if not exists Bryan_tasks("
                    + "title varchar(50) not null unique,"
                    + "user varchar(200) not null"
                    + ")");
            stmt.close();
            con.close();
        } catch(Exception ex) {
            exception = ex;
        }

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}
