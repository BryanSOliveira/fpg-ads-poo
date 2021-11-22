/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;
import java.util.ArrayList;
import web.BryanDbListener;

/**
 *
 * @author spbry
 */
public class Tasks {
    private long rowId;
    private String title;
    private String user;
    
    public static ArrayList<Tasks> getTasks() throws Exception {
        ArrayList<Tasks> list = new ArrayList<>();
        Connection con = BryanDbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select rowid, * from Bryan_tasks");
        while(rs.next()) {
            long rowId = rs.getLong("rowid");
            String title = rs.getString("title");
            String user = rs.getString("user");
            list.add(new Tasks(rowId, title, user));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    public static void addTask(String taskName, String userName) throws Exception {
        Connection con = BryanDbListener.getConnection();
        String sql  = "insert into Bryan_tasks(title, user) "
                + "values(?,?)";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, taskName);
        stmt.setString(2, userName);
        stmt.execute();
        stmt.close();
        con.close();
    }
    public static void removeTask(String taskName) throws Exception {
        Connection con = BryanDbListener.getConnection();
        String sql = "delete from Bryan_tasks where title = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, taskName);
        stmt.execute();
        stmt.close();
        con.close();
    }

    public Tasks(long rowId, String title, String user) {
        this.rowId = rowId;
        this.title = title;
        this.user = user;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public long getRowId() {
        return rowId;
    }

    public void setRowId(long rowId) {
        this.rowId = rowId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}
