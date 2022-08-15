/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 15/07/2022    1.0        QuanNT          Comment
 */
package entity;

/**
 * @author This class represents the Comment table in database
 */
public class Comment {

    /* Comment CommentId */
    private String CommentId;
    /* Comment content */
    private String content;
    /* Comment username */
    private String username;
    /* Comment Date */
    private String Date;
    /* Comment Blogid */
    private String Blogid;
    /* Comment ParentId */
    private String ParentId;

    /**
     * Blank Constructor
     */
    public Comment() {
    }

    /**
     * Complete Constructor
     *
     * @param CommentId
     * @param content
     * @param username
     * @param Date
     * @param Blogid
     * @param ParentId
     */
    public Comment(String CommentId, String content, String username, String Date, String Blogid, String ParentId) {
        this.CommentId = CommentId;
        this.content = content;
        this.username = username;
        this.Date = Date;
        this.Blogid = Blogid;
        this.ParentId = ParentId;
    }

    /**
     * @return CommentId
     */
    public String getCommentId() {
        return CommentId;
    }

    /**
     * Set AccountID
     *
     * @param CommentId
     */
    public void setCommentId(String CommentId) {
        this.CommentId = CommentId;
    }

    /**
     * @return content
     */
    public String getContent() {
        return content;
    }

    /**
     * Set AccountID
     *
     * @param content
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * @return username
     */
    public String getUsername() {
        return username;
    }

    /**
     * Set AccountID
     *
     * @param username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return Date
     */
    public String getDate() {
        return Date;
    }

    /**
     * Set AccountID
     *
     * @param Date
     */
    public void setDate(String Date) {
        this.Date = Date;
    }

    /**
     * @return Blogid
     */
    public String getBlogid() {
        return Blogid;
    }

    /**
     * Set AccountID
     *
     * @param Blogid
     */
    public void setBlogid(String Blogid) {
        this.Blogid = Blogid;
    }

    /**
     * @return ParentId
     */
    public String getParentId() {
        return ParentId;
    }

    /**
     * Set AccountID
     *
     * @param ParentId
     */
    public void setParentId(String ParentId) {
        this.ParentId = ParentId;
    }
}
