
/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 13/07/2022    1.0        HieuLBM          Comment
 * 14/07/2022    1.1        HuyTQ            Comment
 */
package dao.impl;

import dao.UserDAO;
import entity.User;
import context.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * The class has methods needed for initialize connection with database and
 * execute queries with User and associate tables
 *
 * @author HuyTQ
 */
public class UserDAOImpl extends DBContext implements UserDAO {

    /**
     * update user from the User table
     *
     * @param User
     * @return
     * @throws Exception
     */
    @Override
    public int updateUser(User User) throws Exception {
        int n = 0;
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        String sqlPre = "update [User] set UserName =?, UserAdress=?, CMT=?,UserEmail =?, UserPhone=?, UserGender=?, Birthday=? where UserID=?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sqlPre);
            pre.setString(1, User.getUserName());
            pre.setString(2, User.getUserAdress());
            pre.setString(3, User.getCMT());
            pre.setString(4, User.getUserEmail());
            pre.setString(5, User.getUserPhone());
            pre.setInt(6, User.getUserGender());
            pre.setDate(7, User.getBirthday());
            pre.setInt(8, User.getUserID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return n;
    }

    /**
     * get a customer information by user id from User table
     *
     * @param Accountid
     * @return
     * @throws Exception
     */
    @Override
    public User getUserByaID(int Accountid) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        String sql = "select u.* from Account a join [User] u\n"
                + "on a.AccountID=u.AccountID\n"
                + "where a.AccountID=?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, Accountid);
            rs = pre.executeQuery();
            if (rs.next()) {
                return new User(rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(8));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return null;
    }

    /**
     * get a customer information from User table
     *
     * @param Accountid
     * @return
     * @throws Exception
     */
    @Override
    public User getUser(int accountID) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        String sql = "select * from [User] where AccountID=?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, accountID);
            rs = pre.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getDate(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return null;
    }

    /**
     * update a user from User table
     *
     * @param User
     * @throws Exception
     */
    @Override
    public void updateUserEcept(User User) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;

        String sqlPre = "update [User] set UserName =?, UserAdress=?, CMT=?,UserEmail =?, UserPhone=?,Birthday=? where UserID=?";

        try {
            conn = getConnection();
            pre = conn.prepareStatement(sqlPre);

            pre.setString(1, User.getUserName());
            pre.setString(2, User.getUserAdress());
            pre.setString(3, User.getCMT());
            pre.setString(4, User.getUserEmail());
            pre.setString(5, User.getUserPhone());
            pre.setDate(6, User.getBirthday());
            pre.setInt(7, User.getUserID());
            pre.executeUpdate();
        } catch (SQLException ex) {
            throw ex;
        } finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
    }

    /**
     * Check String input is string of number
     *
     * @param str
     * @return
     * @throws Exception
     */
    @Override
    public boolean isNumeric(String str) throws Exception {
        for (char c : str.toCharArray()) {
            if (!Character.isDigit(c)) {
                return false;
            }
        }
        return true;
    }

    /**
     * Check customer information by email from User table
     *
     * @param uGmail
     * @return
     * @throws Exception
     */
    @Override
    public User checkUser(String uGmail) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        String sql = "select * from [User] \n"
                + " where UserEmail=?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);

            pre.setString(1, uGmail);
            rs = pre.executeQuery();
            if (rs.next()) {

                return new User(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getDate(7), rs.getString(8), rs.getString(9), rs.getString(10));
            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return null;
    }

    /**
     * get a list of all customers from the Users table
     *
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<User> getCustomerListByReceptionist() throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        ArrayList<User> ArrayList = new ArrayList<>();
        try {
            String sql = "select u.*  from Account c inner join [User] u on c.AccountID = u.AccountID\n"
                    + "where c.RoleID=1";
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {
                int uID = rs.getInt(1);
                int uAID = rs.getInt(2);
                String uName = rs.getString(3);
                String uPhone = rs.getString(4);
                String uEmail = rs.getString(5);
                int uGender = rs.getInt(6);
                Date birthday = rs.getDate(7);
                String uAdress = rs.getString(8);
                String uCMT = rs.getString(9);
                String uImgCmt = rs.getString(10);

                User u = new User(uID, uAID, uName, uPhone, uEmail, uGender, birthday, uAdress, uCMT, uImgCmt);
                ArrayList.add(u);

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
     * search name from the Users table
     *
     * @param uName
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<User> getSearchNameCustomerListByReceptionist(String uName) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        ArrayList<User> ArrayList = new ArrayList<>();
        String sql = "select u.*  from Account c inner join [User] u on c.AccountID = u.AccountID\n"
                + "where u.UserName like N'%" + uName + "%' and c.RoleID=1";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);

            rs = pre.executeQuery();

            while (rs.next()) {
                int uID = rs.getInt(1);
                int uAID = rs.getInt(2);
                uName = rs.getString(3);
                String uPhone = rs.getString(4);
                String uEmail = rs.getString(5);
                int uGender = rs.getInt(6);
                Date birthday = rs.getDate(7);
                String uAdress = rs.getString(8);
                String uCMT = rs.getString(9);
                String uImgCmt = rs.getString(10);

                User u = new User(uID, uAID, uName, uPhone, uEmail, uGender, birthday, uAdress, uCMT, uImgCmt);
                ArrayList.add(u);

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
     * get all User by roleID from the Users table
     *
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<User> getListByReceptionist() throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        ArrayList<User> ArrayList = new ArrayList<>();
        try {
            String sql = "select u.*  from Account c inner join [User] u on c.AccountID = u.AccountID\n"
                    + "where c.RoleID=2";
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {
                int uID = rs.getInt(1);
                int uAID = rs.getInt(2);
                String uName = rs.getString(3);
                String uPhone = rs.getString(4);
                String uEmail = rs.getString(5);
                int uGender = rs.getInt(6);
                Date birthday = rs.getDate(7);
                String uAdress = rs.getString(8);
                String uCMT = rs.getString(9);
                String uImgCmt = rs.getString(10);

                User u = new User(uID, uAID, uName, uPhone, uEmail, uGender, birthday, uAdress, uCMT, uImgCmt);
                ArrayList.add(u);

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
}
