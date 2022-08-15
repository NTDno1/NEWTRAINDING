/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 13/07/2022    1.0        HieuLBM            Comment
 * 14/07/2022    1.1        HuyTQ            Comment
 */
package dao.impl;

import dao.AccountDAO;
import entity.Account;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * The class has methods needed for initialize connection with database and
 * execute queries with Account and associate tables
 *
 * @author HuyTQ
 */
public class AccountDAOImpl extends DBContext implements AccountDAO {

    /**
     * Get all Account from database
     *
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<Account> getAccountList() throws Exception {
        Connection conn = null;
         /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        ArrayList<Account> vector = new ArrayList<>();
        try {
            String sql = "select * from Account";
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {
                int AccountID = rs.getInt(1);
                int RoleID = rs.getInt(2);
                String Username = rs.getString(3);
                String Password = rs.getString(4);
                Account a = new Account(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
                vector.add(a);

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
     * get user from Account table Using mail and password
     *
     * @param aName
     * @param aPass
     * @return
     * @throws Exception
     */
    @Override
    public Account getAccount(String aName, String aPass) throws Exception {
        Connection conn = null;
         /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        String sql = "SELECT * FROM [SWPgroup3].[dbo].[Account] where [user]=? and [password]=?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, aName);
            pre.setString(2, aPass);
            rs = pre.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
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
@Override
    public ArrayList<Account> getAccountList1() throws Exception {
        Connection conn = null;
         /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        ArrayList<Account> vector = new ArrayList<>();
        try {
            String sql = "select * from Account except (select * from Account where [user] = 'Admin')";
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {
                int AccountID = rs.getInt(1);
                int RoleID = rs.getInt(2);
                String Username = rs.getString(3);
                String Password = rs.getString(4);
                Account a = new Account(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
                vector.add(a);

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
     * update account from the Account table
     *
     * @param aUser
     * @param aPassword
     * @return
     * @throws Exception
     */
    @Override
    public int updateAccount(String aUser, String aPassword) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        int n = 0;

        String sql = "UPDATE [SWPgroup3].[dbo].[Account]\n"
                + "   SET [password] =?\n"
                + " WHERE [user]=?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);

            pre.setString(1, aPassword);
            pre.setString(2, aUser);

            //run
            n = pre.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return n;
    }


    /**
     * checks name to get user's information
     *
     * @param aName
     * @return
     * @throws
     */
    @Override
    public Account checkAccount(String aName) throws Exception {
        Connection conn = null;
       /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        String xSql = "select * from [Account] where [user]=?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(xSql);
            pre.setString(1, aName);
            rs = pre.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
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
     * update role user from the User table
     *
     * @param roleId
     * @param user
     * @return
     * @throws Exception
     */
    @Override
    public void updateRole(int roleId, String user) {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        int n = 0;
        String sql = "UPDATE [dbo].[Account] SET [RoleID] = ? WHERE [user] = ?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, roleId);
            pre.setString(2, user);
            n = pre.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    /**
     * register account customer and insert to the Account table
     *
     * @param ac
     * @param name
     * @param email
     * @return
     * @throws Exception
     */
    @Override
    public int Register(Account ac, String name, String email) throws Exception {
        Connection conn = null;
        PreparedStatement pre = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre1 = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        int n = 0;
        String sql = "insert into Account(RoleID, [user],[password]) values(1,?,?)";
        String sql1 = "insert into [User](AccountID,UserName, UserEmail) values(?,?,?)";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre1 = conn.prepareStatement(sql1);
            pre.setString(1, ac.getUser());
            pre.setString(2, ac.getPassword());
            n = pre.executeUpdate();
            rs = getData("select top(1)* from Account\n"
                    + "order by AccountID desc ");
            while (rs.next()) {
                pre1.setInt(1, rs.getInt(1));
            }
            pre1.setString(2, name);
            pre1.setString(3, email);
            pre1.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closePreparedStatement(pre1);
            closeConnection(conn);

        }
        return n;
    }

    /**
     * update account and user from the Account table and User table
     *
     * @param aPassword
     * @param uGmail
     * @return
     * @throws Exception
     */
    @Override
    public int updateAccountAndUser(String aPassword, String uGmail) throws Exception {
        Connection conn = null;
         /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        int n = 0;
        String sql = "UPDATE [Account] set password=? from [Account] ac, [User] u\n"
                + " where ac.AccountID=u.AccountID and u.UserEmail=?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, aPassword);
            pre.setString(2, uGmail);

            n = pre.executeUpdate();

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return n;
    }

}
