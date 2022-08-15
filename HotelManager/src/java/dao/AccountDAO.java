/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 13/07/2022    1.0        HieuLBM          Comment
 * 13/07/2022    1.1        HuyTQ            Comment
 */
package dao;

import entity.Account;
import java.util.ArrayList;

/**
 * Lớp này chứa các interface của AccountDAOImpl
 *
 * @author HuyTQ
 */
public interface AccountDAO {

    /**
     * Get all Account from database
     *
     * @return a list of <code>Account</code> objects
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    public ArrayList<Account> getAccountList() throws Exception;

    /**
     * get user from Account table Using mail and password
     *
     * @param aName is an String
     * @param aPass is an String
     * @return <code>Account</code> object.
     * @throws java.lang.Exception
     */
     public ArrayList<Account> getAccountList1() throws Exception;
     /**
     * get user from Account table Using mail and password
     *
     * @param aName is an String
     * @param aPass is an String
     * @return <code>Account</code> object.
     * @throws java.lang.Exception
     */
    public Account getAccount(String aName, String aPass) throws Exception;

    /**
     * update request from the MessageRequest table
     *
     * @param aUser is an String
     * @param aPassword is an String
     * @return Integer
     * @throws java.lang.Exception
     */
    public int updateAccount(String aUser, String aPassword) throws Exception;

    /**
     * checks name to get user's information
     *
     * @param aName is an String
     * @return <code>Account</code> object.
     * @throws java.lang.Exception
     */
    public Account checkAccount(String aName) throws Exception;

    /**
     * Register account customer and insert to database
     *
     * @param ac is an Account
     * @param name is an String
     * @param email is an String
     * @return Integer
     * @throws java.lang.Exception
     */
    public int Register(Account ac, String name, String email) throws Exception;

    /**
     * update account and user in Account table and User table
     *
     * @param aPassword is an String
     * @param uGmail is an String
     * @return Integer
     * @throws java.lang.Exception
     */
    public int updateAccountAndUser(String aPassword, String uGmail) throws Exception;

    /**
     * update role account 
     *
     * @param RoleID is an Integer
     * @param user is an String
     * @return int
     * @throws java.lang.Exception
     */
    public void updateRole(int RoleID, String user);
}
