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
 * @author This class represents the DateOfRoom table in database
 */
public class DateOfRoom {

    /* Room Id */
    private int RoomID;
    /* Datei in */
    private Date Datein;
    /* Datei out */
    private Date Dateout;
    /* status */
    private int status;

    /**
     * Blank Constructor
     */
    public DateOfRoom() {
    }

    /**
     * Complete Constructor
     *
     * @param RoomID
     * @param Datein
     * @param Dateout
     * @param status
     */
    public DateOfRoom(int RoomID, Date Datein, Date Dateout, int status) {
        this.RoomID = RoomID;
        this.Datein = Datein;
        this.Dateout = Dateout;
        this.status = status;
    }

    /**
     * @return RoomID
     */
    public int getRoomID() {
        return RoomID;
    }

    /**
     * Set RoomID
     *
     * @param RoomID
     */
    public void setRoomID(int RoomID) {
        this.RoomID = RoomID;
    }

    /**
     * @return Datein
     */
    public Date getDatein() {
        return Datein;
    }

    /**
     * Set Datein
     *
     * @param Datein
     */
    public void setDatein(Date Datein) {
        this.Datein = Datein;
    }

    /**
     * @return Dateout
     */
    public Date getDateout() {
        return Dateout;
    }

    /**
     * Set Dateout
     *
     * @param Dateout
     */
    public void setDateout(Date Dateout) {
        this.Dateout = Dateout;
    }

    /**
     * @return status
     */
    public int getStatus() {
        return status;
    }

    /**
     * Set status
     *
     * @param status
     */
    public void setStatus(int status) {
        this.status = status;
    }
}
