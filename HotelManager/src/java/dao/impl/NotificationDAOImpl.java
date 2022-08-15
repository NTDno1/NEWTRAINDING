/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 14/07/2022    1.0        HuyTQ            Comment
 */
package dao.impl;

import context.DBContext;
import dao.NotificationDAO;
import entity.Notification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * The class has methods needed for initialize connection with database and
 * execute queries with Notification and associate tables
 *
 * @author HuyTQ
 */
public class NotificationDAOImpl extends DBContext implements NotificationDAO{

    /**
     * add notification from the Notification table
     *
     * @param n
     * @throws Exception
     */
    @Override
    public void insertNotification(Notification n) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        
        String sql = "insert into Notification values(?,?,?,?,?,0)";
          try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            
            pre.setString(1, n.getTitle());
            pre.setString(2, n.getName());
            pre.setString(3, n.getFocus());
            pre.setString(4, n.getContent());
            pre.setString(5, n.getDate());
            pre.executeUpdate();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
    }
    
    /**
     * add message of admin from the Notification table
     *
     * @param n
     * @throws Exception
     */
    @Override
    public void insertMessageadmin(Notification n) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;       
        String sql = "insert into Notification values(?,?,'0',?,?,1)";
          try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            
            pre.setString(1, n.getTitle());
            pre.setString(2, n.getName());
            pre.setString(3, n.getContent());
            pre.setString(4, n.getDate());
            pre.executeUpdate();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
    }
    
    /**
     * get a list notification from the Notification table
     *
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<Notification> getAllNotification() throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        ArrayList<Notification> vector = new ArrayList<>();
        try {
            String sql = "select * from Notification where Status=0 order by NID desc";
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {
                int Nid =rs.getInt(1);
                String title = rs.getString(2);
                String name = rs.getString(3);
                String focus = rs.getString(4);
                String content = rs.getString(5);
                String date = rs.getString(6);
                Notification n=new Notification(Nid,title, name, focus, content, date);
                vector.add(n);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return vector;
    }
    
    /**
     * get a list message of admin from the Notification table
     *
     * @param nameAccount
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<Notification> getMessagedmin(String nameAccount) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        ArrayList<Notification> vector = new ArrayList<>();
        try {
            String sql = "select * from Notification where Status=1 and Name='"+nameAccount+"' order by NID desc";
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {
                int Nid =rs.getInt(1);
                String title = rs.getString(2);
                String name = rs.getString(3);
                String focus = rs.getString(4);
                String content = rs.getString(5);
                String date = rs.getString(6);
                Notification n=new Notification(Nid,title, name, focus, content, date);
                vector.add(n);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return vector;
    }

    
    /**
     * delete a notification from the Notification table
     *
     * @param nId
     * @throws Exception
     */
    @Override
    public void deleteNotification(int nId) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        
        String sql = "delete from Notification where NID="+nId;
          try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.executeUpdate();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }    }
    
}
