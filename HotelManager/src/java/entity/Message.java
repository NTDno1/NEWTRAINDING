/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 13/07/2022    1.0        HuyTQ          Comment
 */
package entity;

/**
 * @author
 * This class represents the Message table in database
 */
public class Message {
    /* Message Id */
    private int MessageID;
    /* Account Id */
    private int AccountID;
    /* Message To */
    private String MessageTo;
    /* Message From */
    private String MessageFrom;
    /* date */
    private String Date;
    /* content */
    private String content;
    /* Status Message */
    private String StatusMess;
    /* Room Id */
    private int RoomID;
    
    /**
     * Blank Constructor
     */
    public Message() {
    }

    /**
     * Complete Constructor
     *
     * @param MessageID
     * @param AccountID
     * @param MessageTo
     * @param MessageFrom
     * @param Date
     * @param content
     * @param StatusMess
     * @param RoomID
     */
    public Message(int MessageID, int AccountID, String MessageTo, String MessageFrom, String Date, String content, String StatusMess, int RoomID) {
        this.MessageID = MessageID;
        this.AccountID = AccountID;
        this.MessageTo = MessageTo;
        this.MessageFrom = MessageFrom;
        this.Date = Date;
        this.content = content;
        this.StatusMess = StatusMess;
        this.RoomID = RoomID;
    }
    
    /**
     * Complete Constructor
     *
     * @param MessageID
     * @param AccountID
     * @param MessageTo
     * @param MessageFrom
     * @param Date
     * @param content
     */
    public Message(int MessageID, int AccountID, String MessageTo, String MessageFrom, String Date, String content) {
        this.MessageID = MessageID;
        this.AccountID = AccountID;
        this.MessageTo = MessageTo;
        this.MessageFrom = MessageFrom;
        this.Date = Date;
        this.content = content;
    }
    
    /**
     * Complete Constructor
     *
     * @param MessageID
     * @param AccountID
     * @param Date
     * @param content
     * @param RoomID
     */
    public Message(int MessageID, int AccountID, String Date, String content, int RoomID) {
        this.MessageID = MessageID;
        this.AccountID = AccountID;
        this.Date = Date;
        this.content = content;
        this.RoomID = RoomID;
    }

    /**
     * Complete Constructor
     *
     * @param MessageID
     * @param AccountID
     * @param MessageTo
     * @param MessageFrom
     * @param Date
     */
    public Message(int MessageID, int AccountID, String MessageTo, String MessageFrom, String Date) {
        this.MessageID = MessageID;
        this.AccountID = AccountID;
        this.MessageTo = MessageTo;
        this.MessageFrom = MessageFrom;
        this.Date = Date;
    }

    /**
     * Complete Constructor
     *
     * @param AccountID
     * @param Date
     * @param content
     * @param RoomID
     */
    public Message(int AccountID, String Date, String content, int RoomID) {
        this.AccountID = AccountID;
        this.Date = Date;
        this.content = content;
        this.RoomID= RoomID;
    }
    
    /**
     * Complete Constructor
     *
     * @param AccountID
     * @param Date
     * @param content
     */
    public Message(int AccountID, String Date, String content) {
        this.AccountID = AccountID;
        this.Date = Date;
        this.content = content;
    }
    
    /**
     * Complete Constructor
     *
     * @param AccountID
     * @param content
     */
    public Message(int AccountID, String content) {
        this.AccountID = AccountID;
        this.content = content;
    }
    
    /**
     * Complete Constructor
     *
     * @param AccountID
     */
    public Message(int AccountID) {
        this.AccountID = AccountID;
    }

    /**
     * @return MessageID
     */
    public int getMessageID() {
        return MessageID;
    }

    /**
     * Set MessageID
     * @param MessageID
     */
    public void setMessageID(int MessageID) {
        this.MessageID = MessageID;
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
     * @return MessageTo
     */
    public String getMessageTo() {
        return MessageTo;
    }

    /**
     * Set MessageTo
     * @param MessageTo
     */
    public void setMessageTo(String MessageTo) {
        this.MessageTo = MessageTo;
    }

    /**
     * @return MessageFrom
     */
    public String getMessageFrom() {
        return MessageFrom;
    }

    /**
     * Set MessageFrom
     * @param MessageFrom
     */
    public void setMessageFrom(String MessageFrom) {
        this.MessageFrom = MessageFrom;
    }

    /**
     * @return Date
     */
    public String getDate() {
        return Date;
    }

    /**
     * Set Date
     * @param Date
     */
    public void setDate(String Date) {
        this.Date = Date;
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
     * @return StatusMess
     */
    public String getStatusMess() {
        return StatusMess;
    }

    /**
     * Set StatusMess
     * @param StatusMess
     */
    public void setStatusMess(String StatusMess) {
        this.StatusMess = StatusMess;
    }

    /**
     * @return RoomID
     */
    public int getRoomID() {
        return RoomID;
    }

    /**
     * Set RoomID
     * @param RoomID
     */
    public void setRoomID(int RoomID) {
        this.RoomID = RoomID;
    }


}
