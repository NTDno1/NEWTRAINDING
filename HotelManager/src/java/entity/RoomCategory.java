/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 19/07/2022    1.0        HieuLBM       Comment
 */
package entity;

public class RoomCategory {

    /* Category Id */
    private int RoomcateID;
    /* Category name */
    private String Catename;
    /* Category note */
    private String Note;
    /* Category count */
    private int count;

    /**
     * Blank Constructor
     */
    public RoomCategory() {
    }

    /**
     * Complete Constructor
     *
     * @param RoomcateID
     * @param Catename
     * @param Note
     */
    public RoomCategory(int RoomcateID, String Catename, String Note) {
        this.RoomcateID = RoomcateID;
        this.Catename = Catename;
        this.Note = Note;
    }

    /**
     * Complete Constructor
     *
     * @param RoomcateID
     * @param Catename
     * @param count
     */
    public RoomCategory(int RoomcateID, String Catename, int count) {
        this.RoomcateID = RoomcateID;
        this.Catename = Catename;
        this.count = count;
    }

    /**
     * Complete Constructor
     *
     * @param RoomcateID
     * @param Catename
     */
    public RoomCategory(int RoomcateID, String Catename) {
        this.RoomcateID = RoomcateID;
        this.Catename = Catename;
    }

    /**
     * @return count
     */
    public int getCount() {
        return count;
    }

    /**
     * Set count
     *
     * @param count
     */
    public void setCount(int count) {
        this.count = count;
    }

    /**
     * @return RoomcateID
     */
    public int getRoomcateID() {
        return RoomcateID;
    }

    /**
     * Set RoomcateID
     *
     * @param RoomcateID
     */
    public void setRoomcateID(int RoomcateID) {
        this.RoomcateID = RoomcateID;
    }

    /**
     * @return Catename
     */
    public String getCatename() {
        return Catename;
    }

    /**
     * Set Catename
     *
     * @param Catename
     */
    public void setCatename(String Catename) {
        this.Catename = Catename;
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
