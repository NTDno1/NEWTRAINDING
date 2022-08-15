/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0        HieuLBM          First Deploy
 * 13/07/2022    1.0        HieuLBM          Comment
 */
package entity;

/**
 * @author HieuLBM
 * This class represents the MessageRequest table in database
 */
public class RequestMessage {

    /* RequestMessage Id */
    private int mId;
    /* RequestMessage title */
    private String title;
    /*RequestMessage email */
    private String email;
    /*RequestMessage content */
    private String content;
    /* If RequestMessage is read */
    private String isRead;

    /**
     * Blank Constructor
     */
    public RequestMessage() {
    }

    /**
     * Complete Constructor
     *
     * @param mId
     * @param title
     * @param email
     * @param content
     * @param isRead
     */
    public RequestMessage(int mId, String title, String email, String content, String isRead) {
        this.mId = mId;
        this.title = title;
        this.email = email;
        this.content = content;
        this.isRead = isRead;
    }

    /**
     * Complete Constructor
     *
     * @param title
     * @param email
     * @param content
     * @param isRead
     */
    public RequestMessage(String title, String email, String content, String isRead) {
        this.title = title;
        this.email = email;
        this.content = content;
        this.isRead = isRead;
    }

    /**
     * Complete Constructor
     *
     * @param title
     * @param email
     * @param content
     */
    public RequestMessage(String title, String email, String content) {
        this.title = title;
        this.email = email;
        this.content = content;
    }

    /**
     * @return mId
     */
    public int getmId() {
        return mId;
    }
    /**
     * Set  mId
     * @param  mId
     */
    public void setmId(int mId) {
        this.mId = mId;
    }

    /**
     * @return title
     */
    public String getTitle() {
        return title;
    }
    /**
     * Set title
     * @param title
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return email
     */
    public String getEmail() {
        return email;
    }
    /**
     * Set email
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return content
     */
    public String getContent() {
        return content;
    }
    /**
     * Set content
     * @param content
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return isRead
     */
    public String getIsRead() {
        return isRead;
    }
    /**
     * Set isRead
     * @param isRead
     */
    public void setIsRead(String isRead) {
        this.isRead = isRead;
    }

}
