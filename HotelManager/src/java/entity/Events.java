/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 18/07/2022    1.0        HieuHT            Comment
 */
package entity;

import java.sql.Date;

/**
 * @author This class represents the Events table in database
 */
public class Events {

    /* Event Id */
    private int EventID;
    /* Event Name */
    private String EventName;
    /* Event Image */
    private String EventImage;
    /* Event Date */
    private Date EventDate;
    /* Event Date  */
    private Date EventDateEnd;
    /* Event Date End */
    private String EventCode;
    /* Event Quangtity*/
    private int Quantity;

    /**
     * Blank Constructor
     */
    public Events() {
    }

    /**
     * Complete Constructor
     *
     * @param EventID
     * @param EventName
     * @param EventImage
     * @param EventDate
     * @param EventDateEnd
     * @param EventCode
     * @param Quantity
     */
    public Events(int EventID, String EventName, String EventImage, Date EventDate, Date EventDateEnd, String EventCode, int Quantity) {
        this.EventID = EventID;
        this.EventName = EventName;
        this.EventImage = EventImage;
        this.EventDate = EventDate;
        this.EventDateEnd = EventDateEnd;
        this.EventCode = EventCode;
        this.Quantity = Quantity;
    }

    /**
     * Complete Constructor
     *
     * @param EventID
     * @param EventName
     * @param EventImage
     * @param EventDate
     * @param EventCode
     * @param Quantity
     */
    public Events(int EventID, String EventName, String EventImage, Date EventDate, String EventCode, int Quantity) {
        this.EventID = EventID;
        this.EventName = EventName;
        this.EventImage = EventImage;
        this.EventDate = EventDate;
        this.EventCode = EventCode;
        this.Quantity = Quantity;
    }

    /**
     * @return EventID
     */
    public int getEventID() {
        return EventID;
    }

    /**
     * Set EventID
     *
     * @param EventID
     */
    public void setEventID(int EventID) {
        this.EventID = EventID;
    }

    /**
     * @return EventName
     */
    public String getEventName() {
        return EventName;
    }

    /**
     * Set EventName
     *
     * @param EventName
     */
    public void setEventName(String EventName) {
        this.EventName = EventName;
    }

    /**
     * @return EventImage
     */
    public String getEventImage() {
        return EventImage;
    }

    /**
     * Set EventImage
     *
     * @param EventImage
     */
    public void setEventImage(String EventImage) {
        this.EventImage = EventImage;
    }

    /**
     * @return EventDate
     */
    public Date getEventDate() {
        return EventDate;
    }

    /**
     * Set EventDate
     *
     * @param EventDate
     */
    public void setEventDate(Date EventDate) {
        this.EventDate = EventDate;
    }

    /**
     * @return EventDateEnd
     */
    public Date getEventDateEnd() {
        return EventDateEnd;
    }

    /**
     * Set EventDateEnd
     *
     * @param EventDateEnd
     */
    public void setEventDateEnd(Date EventDateEnd) {
        this.EventDateEnd = EventDateEnd;
    }

    /**
     * @return EventCode
     */
    public String getEventCode() {
        return EventCode;
    }

    /**
     * Set EventCode
     *
     * @param EventCode
     */
    public void setEventCode(String EventCode) {
        this.EventCode = EventCode;
    }

    /**
     * @return Quantity
     */
    public int getQuantity() {
        return Quantity;
    }

    /**
     * Set Quantity
     *
     * @param Quantity
     */
    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    @Override
    public String toString() {
        return "Events{" + "EventID=" + EventID + ", EventName=" + EventName + ", EventImage=" + EventImage + ", EventDate=" + EventDate + ", EventDateEnd=" + EventDateEnd + ", EventCode=" + EventCode + ", Quantity=" + Quantity + '}';
    }

}
