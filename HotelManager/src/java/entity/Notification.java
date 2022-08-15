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
 * This class represents the Notification table in database
 */
public class Notification {
    /* Notification Id */
    private int NID;
    /* Title notification */    
    private String Title;
    /* Name notification */
    private String Name;
    /* Purpose of notification */    
    private String Focus;
    /* Content */        
    private String content;
    /* Date */        
    private String Date;
    /* Status */        
    private String Status;
    
    /**
     * Blank Constructor
     */
    public Notification() {
    }

    /**
     * Complete Constructor
     *
     * @param NID
     * @param Title
     * @param Name
     * @param Focus
     * @param content
     * @param Date
     */
    public Notification(int NID, String Title, String Name, String Focus, String content, String Date) {
        this.NID = NID;
        this.Title = Title;
        this.Name = Name;
        this.Focus = Focus;
        this.content = content;
        this.Date = Date;
    }
    
    /**
     * Complete Constructor
     *
     * @param Title
     * @param Name
     * @param Focus
     * @param content
     * @param Date
     */
    public Notification(String Title, String Name, String Focus, String content, String Date) {
        this.Title = Title;
        this.Name = Name;
        this.Focus = Focus;
        this.content = content;
        this.Date = Date;
    }
    
    /**
     * Complete Constructor
     *
     * @param Title
     * @param Name
     * @param content
     * @param Date
     */
    public Notification(String Title, String Name, String content, String Date) {
        this.Title = Title;
        this.Name = Name;
        this.content = content;
        this.Date = Date;
    }

    /**
     * @return NID
     */
    public int getNID() {
        return NID;
    }

    /**
     * Set NID
     * @param NID
     */
    public void setNID(int NID) {
        this.NID = NID;
    }

    /**
     * @return Title
     */
    public String getTitle() {
        return Title;
    }

    /**
     * Set Title
     * @param Title
     */
    public void setTitle(String Title) {
        this.Title = Title;
    }

    /**
     * @return Name
     */
    public String getName() {
        return Name;
    }

    /**
     * Set Name
     * @param Name
     */
    public void setName(String Name) {
        this.Name = Name;
    }

    /**
     * @return Focus
     */
    public String getFocus() {
        return Focus;
    }

    /**
     * Set Focus
     * @param Focus
     */
    public void setFocus(String Focus) {
        this.Focus = Focus;
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
     * @return Status
     */
    public String getStatus() {
        return Status;
    }

    /**
     * Set Status
     * @param Status
     */
    public void setStatus(String Status) {
        this.Status = Status;
    }
    
}
