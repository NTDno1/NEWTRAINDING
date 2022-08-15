/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 14/07/2022    1.0        HieuLBM          Comment
 */
package dao.impl;

import entity.RequestMessage;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import dao.RequestMessageDAO;

/**
 * The class has methods needed for initialize connection with database and
 * execute queries with RequestMessage and associate tables
 *
 * @author HieuLBM
 */
public class RequestMessageDAOIpml extends DBContext implements RequestMessageDAO {

    /**
     * get a list request from the MessageRequest table
     *
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<RequestMessage> getMessage() throws Exception {
        ArrayList<RequestMessage> v = new ArrayList<>();
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        String sql = "select * from [MessageRequest] order by mId asc";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                v.add(new RequestMessage(rs.getInt("mId"), rs.getString("title"), rs.getString("email"), rs.getString("content"), rs.getString("isRead")));
            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return v;
    }

    /**
     * add request from the MessageRequest table
     *
     * @param message
     * @throws Exception
     */
    @Override
    public void insert(RequestMessage message) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        String sql = "INSERT INTO [MessageRequest] VALUES (?,?,?,0)";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, message.getTitle());
            pre.setString(2, message.getEmail());
            pre.setString(3, message.getContent());
            pre.executeUpdate();
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
    }

    /**
     * update request from the MessageRequest table
     *
     * @param id
     * @param isread
     * @return
     * @throws Exception
     */
    @Override
    public int updateRead(int id, String isread) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        int n = 0;
        String sql = " UPDATE [SWPgroup3].[dbo].[MessageRequest] SET [isRead] = ?  WHERE [mId] = ?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, "1");
            pre.setInt(2, id);
            n = pre.executeUpdate();
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return n;
    }

    /**
     * get a request from the MessageRequest table
     *
     * @param Id
     * @return
     * @throws Exception
     */
    @Override
    public RequestMessage getMessageById(int Id) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        RequestMessage message = new RequestMessage();
        String sql = "select * from [MessageRequest] where mId=" + Id;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                message.setmId(rs.getInt("mId"));
                message.setTitle(rs.getString("title"));
                message.setEmail(rs.getString("email"));
                message.setContent(rs.getString("content"));
                message.setIsRead("1");
            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return message;
    }

    /**
     * delete a request from the MessageRequest table
     *
     * @param id
     * @throws Exception
     */
    @Override
    public void delete(int id) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        String sql = "DELETE FROM [SWPgroup3].[dbo].[MessageRequest]\n"
                + " WHERE mId=" + id;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);

            pre.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
    }

    /**
     * get a list unread request from the MessageRequest table
     *
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<RequestMessage> getMessageUnread() throws Exception {
        ArrayList<RequestMessage> v = new ArrayList<>();
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        String sql = "  select * from [MessageRequest] where isRead=0";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                v.add(new RequestMessage(rs.getInt("mId"), rs.getString("title"), rs.getString("email"), rs.getString("content"), rs.getString("isRead")));
            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return v;
    }

    /**
     * get paging from the MessageRequest table
     *
     * @param index
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<RequestMessage> pagingMessage(int index) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        ArrayList<RequestMessage> ArrayList = new ArrayList<>();
        String sql = "select * from \n"
                + "(select ROW_NUMBER() over (order by mId asc) as r, * from dbo.[MessageRequest]) \n"
                + "as x\n"
                + "where r between ? and ?";
        //get informations from database
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, index * 3 - 2);
            pre.setInt(2, index * 3);
            rs = pre.executeQuery();
            while (rs.next()) {
                ArrayList.add(new RequestMessage(rs.getInt("mId"), rs.getString("title"), rs.getString("email"), rs.getString("content"), rs.getString("isRead")));
            }
        } catch (Exception e) {
            throw e;

        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }

        return ArrayList;
    }

    /**
     * get paging and search from the MessageRequest table
     *
     * @param index
     * @param title
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<RequestMessage> searchName(int index, String title) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        ArrayList<RequestMessage> v = new ArrayList<>();
        String sql = "select * from \n"
                + "(select ROW_NUMBER() over (order by mId asc) as r, * from dbo.[MessageRequest] where dbo.[MessageRequest].title like N'%" + title + "%') \n"
                + "as x\n"
                + "where r between ? and ?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, index * 3 - 2);
            pre.setInt(2, index * 3);
            rs = pre.executeQuery();
            while (rs.next()) {
                v.add(new RequestMessage(rs.getInt("mId"), rs.getString("title"), rs.getString("email"), rs.getString("content"), rs.getString("isRead")));
            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return v;
    }

    /**
     * get search from the MessageRequest table
     *
     * @param title
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<RequestMessage> getMessageOfTitle(String title) throws Exception {
        ArrayList<RequestMessage> v = new ArrayList<>();
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        String sql = "select * from [MessageRequest] where title like N'%" + title + "%'  order by mId asc";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                v.add(new RequestMessage(rs.getInt("mId"), rs.getString("title"), rs.getString("email"), rs.getString("content"), rs.getString("isRead")));
            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return v;
    }

}
