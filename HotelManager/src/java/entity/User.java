/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 13/07/2022    1.0        HieuLBM       Comment
 */
package entity;

import java.sql.Date;

/**
 * @author 
 * This class represents the User table in database
 */
public class User {

    /* User Id */
    private int UserID;
    /* User AccountID */
    private int AccountID;
    /* User Name */
    private String UserName;
    /* User Phone */
    private String UserPhone;
    /* User Email */
    private String UserEmail;
    /* User Gender */
    private int UserGender;
    /* User Birthday */
    private Date Birthday;
    /* User Adress */
    private String UserAdress;
    /* User CMT */
    private String CMT;
    /* User ImgCMT */
    private String ImgCMT;

    /**
     * Blank Constructor
     */
    public User() {
    }

    /**
     * Complete Constructor
     *
     * @param UserID
     * @param AccountID
     * @param UserName
     * @param UserPhone
     * @param UserEmail
     * @param UserGender
     * @param Birthday
     * @param UserAdress
     * @param CMT
     * @param ImgCMT
     */
    public User(int UserID, int AccountID, String UserName, String UserPhone, String UserEmail, int UserGender, Date Birthday, String UserAdress, String CMT, String ImgCMT) {
        this.UserID = UserID;
        this.AccountID = AccountID;
        this.UserName = UserName;
        this.UserPhone = UserPhone;
        this.UserEmail = UserEmail;
        this.UserGender = UserGender;
        this.Birthday = Birthday;
        this.UserAdress = UserAdress;
        this.CMT = CMT;
        this.ImgCMT = ImgCMT;
    }

    /**
     * Complete Constructor
     *
     * @param UserID
     * @param UserName
     * @param UserPhone
     * @param UserEmail
     * @param UserGender
     * @param Birthday
     * @param UserAdress
     * @param CMT
     */
    public User(int UserID, String UserName, String UserPhone, String UserEmail, int UserGender, Date Birthday, String UserAdress, String CMT) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.UserPhone = UserPhone;
        this.UserEmail = UserEmail;
        this.UserGender = UserGender;
        this.Birthday = Birthday;
        this.UserAdress = UserAdress;
        this.CMT = CMT;
    }

    /**
     * Complete Constructor
     *
     * @param UserID
     * @param UserName
     * @param UserPhone
     * @param UserEmail
     * @param UserGender
     * @param Birthday
     * @param UserAdress
     * @param CMT
     */
    public User(int UserID, String UserName, String UserPhone, String UserEmail, Date Birthday, String UserAdress, String CMT) {
        this.UserID = UserID;
        this.UserName = UserName;
        this.UserPhone = UserPhone;
        this.UserEmail = UserEmail;
        this.Birthday = Birthday;
        this.UserAdress = UserAdress;
        this.CMT = CMT;
    }

    /**
     * Complete Constructor
     *
     * @param UserName
     * @param UserPhone
     * @param UserEmail
     * @param UserAdress
     *
     */
    public User(String UserName, String UserPhone, String UserEmail, String UserAdress) {
        this.UserName = UserName;
        this.UserPhone = UserPhone;
        this.UserEmail = UserEmail;
        this.UserAdress = UserAdress;
    }

    /**
     * Complete Constructor
     *
     * @param UserID
     * @param UserPhone
     * @param UserEmail
     * @param UserAdress
     * @param CMT
     */
    public User(int UserID, String UserPhone, String UserEmail, String UserAdress, String CMT) {
        this.UserID = UserID;
        this.UserPhone = UserPhone;
        this.UserEmail = UserEmail;
        this.UserAdress = UserAdress;
        this.CMT = CMT;
    }

    /**
     * @return UserID
     */
    public int getUserID() {
        return UserID;
    }
      /**
     * Set UserID
     * @param UserID
     */
    public void setUserID(int UserID) {
        this.UserID = UserID;
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
     * @return UserName
     */
    public String getUserName() {
        return UserName;
    }
     /**
     * Set UserName
     * @param UserName
     */
    public void setUserName(String UserName) {
        this.UserName = UserName;
    }

    /**
     * @return UserPhone
     */
    public String getUserPhone() {
        return UserPhone;
    }
     /**
     * Set UserPhone
     * @param UserPhone
     */
    public void setUserPhone(String UserPhone) {
        this.UserPhone = UserPhone;
    }

    /**
     * @return UserEmail
     */
    public String getUserEmail() {
        return UserEmail;
    }
     /**
     * Set UserEmail
     * @param UserEmail
     */
    public void setUserEmail(String UserEmail) {
        this.UserEmail = UserEmail;
    }

    /**
     * @return UserGender
     */
    public int getUserGender() {
        return UserGender;
    }
     /**
     * Set UserGender
     * @param UserGender
     */
    public void setUserGender(int UserGender) {
        this.UserGender = UserGender;
    }

    /**
     * @return Birthday
     */
    public Date getBirthday() {
        return Birthday;
    }
     /**
     * Set Birthday
     * @param Birthday
     */
    public void setBirthday(Date Birthday) {
        this.Birthday = Birthday;
    }

    /**
     * @return UserAdress
     */
    public String getUserAdress() {
        return UserAdress;
    }
     /**
     * Set UserAdress
     * @param UserAdress
     */
    public void setUserAdress(String UserAdress) {
        this.UserAdress = UserAdress;
    }

    /**
     * @return CMT
     */
    public String getCMT() {
        return CMT;
    }
     /**
     * Set CMT
     * @param CMT
     */
    public void setCMT(String CMT) {
        this.CMT = CMT;
    }

    /**
     * @return ImgCMT
     */
    public String getImgCMT() {
        return ImgCMT;
    }
     /**
     * Set ImgCMT
     * @param ImgCMT
     */
    public void setImgCMT(String ImgCMT) {
        this.ImgCMT = ImgCMT;
    }
}
