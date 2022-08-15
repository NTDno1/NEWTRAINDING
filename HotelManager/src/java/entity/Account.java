/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 13/07/2022    1.0        HieuLBM          Comment
 */
package entity;

/**
 * @author
 * This class represents the Account table in database
 */
public class Account {

    /* Account Id */
    private int AccountID;
    /* Account RoleId */
    private int RoleID;
    /* Account user */
    private String user;
    /*Account password */
    private String password;

    /**
     * Blank Constructor
     */
    public Account() {
    }

    /**
     * Complete Constructor
     *
     * @param AccountID
     * @param RoleID
     * @param user
     * @param password
     */
    public Account(int AccountID, int RoleID, String user, String password) {
        this.AccountID = AccountID;
        this.RoleID = RoleID;
        this.user = user;
        this.password = password;
    }

    /**
     * Complete Constructor
     *
     * @param RoleID
     * @param user
     * @param password
     */
    public Account(int RoleID, String user, String password) {
        this.AccountID = AccountID;
        this.RoleID = RoleID;
        this.user = user;
        this.password = password;
    }

    /**
     * @return AccountID
     */
    public int getAccountID() {
        return AccountID;
    }

    /**
     * Set AccountID
     * @param AccountID
     */
    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    /**
     * @return RoleID
     */
    public int getRoleID() {
        return RoleID;
    }

    /**
     * Set RoleID
     * @param RoleID
     */
    public void setRoleID(int RoleID) {
        this.RoleID = RoleID;
    }

    /**
     * @return user
     */
    public String getUser() {
        return user;
    }

    /**
     * Set user
     * @param user
     */
    public void setUser(String user) {
        this.user = user;
    }

    /**
     * @return password
     */
    public String getPassword() {
        return password;
    }

    /**
     * Set password
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }
}
