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
 * This class represents the RoomDevice table in database
 */
public class RoomDevice {

    /* RoomDevice RoomcateID */
    private int RoomcateID;
    /* RoomDevice Id */
    private int DeviceID;
    /* RoomDevice Quantity */
    private int Quantity;

    /**
     * Blank Constructor
     */
    public RoomDevice() {
    }

    /**
     * Complete Constructor
     *
     * @param RoomcateID
     * @param DeviceID
     * @param Quantity
     */
    public RoomDevice(int RoomcateID, int DeviceID, int Quantity) {
        this.RoomcateID = RoomcateID;
        this.DeviceID = DeviceID;
        this.Quantity = Quantity;
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
     * @return DeviceID
     */
    public int getDeviceID() {
        return DeviceID;
    }

    /**
     * Set DeviceID
     *
     * @param DeviceID
     */
    public void setDeviceID(int DeviceID) {
        this.DeviceID = DeviceID;
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
}
