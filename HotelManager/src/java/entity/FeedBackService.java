/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 19/07/2022    1.0        HieuLBM            Comment
 */
package entity;

import java.sql.Date;

/**
 * @author NTD This class represents the Events table in database
 */
public class FeedBackService {

    /* FeedBackService CommentID */
    int CommentID;
    /* FeedBackService ServiceId */
    int ServiceId;
    /* FeedBackService AccountId */
    int AccountId;
    /* FeedBackService date */
    Date date;
    /* FeedBackService Comment */
    String Comment;
    /* FeedBackService Status */
    int Status;
    /* FeedBackService  Note */
    String Note;

    /**
     * Blank Constructor
     */
    public FeedBackService() {
    }

    /**
     * Complete Constructor
     *
     * @param CommentID
     * @param ServiceId
     * @param AccountId
     * @param date
     * @param Comment
     * @param Status
     * @param Note
     */
    public FeedBackService(int CommentID, int ServiceId, int AccountId, Date date, String Comment, int Status, String Note) {
        this.CommentID = CommentID;
        this.ServiceId = ServiceId;
        this.AccountId = AccountId;
        this.date = date;
        this.Comment = Comment;
        this.Status = Status;
        this.Note = Note;
    }

    /**
     * @return CommentID
     */
    public int getCommentID() {
        return CommentID;
    }

    /**
     * Set CommentID
     *
     * @param CommentID
     */
    public void setCommentID(int CommentID) {
        this.CommentID = CommentID;
    }

    /**
     * @return ServiceId
     */
    public int getServiceId() {
        return ServiceId;
    }

    /**
     * Set ServiceId
     *
     * @param ServiceId
     */

    public void setServiceId(int ServiceId) {
        this.ServiceId = ServiceId;
    }

    /**
     * @return AccountId
     */
    public int getAccountId() {
        return AccountId;
    }

    /**
     * Set AccountId
     *
     * @param AccountId
     */
    public void setAccountId(int AccountId) {
        this.AccountId = AccountId;
    }

    /**
     * @return date
     */
    public Date getDate() {
        return date;
    }

    /**
     * Set date
     *
     * @param date
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * @return Comment
     */
    public String getComment() {
        return Comment;
    }

    /**
     * Set Comment
     *
     * @param Comment
     */
    public void setComment(String Comment) {
        this.Comment = Comment;
    }

    /**
     * @return Status
     */
    public int getStatus() {
        return Status;
    }

    /**
     * Set Status
     *
     * @param Status
     */
    public void setStatus(int Status) {
        this.Status = Status;
    }

    /**
     * @return Note
     */
    public String getNote() {
        return Note;
    }

    /**
     * Set Note
     *
     * @param Note
     */

    public void setNote(String Note) {
        this.Note = Note;
    }
}
