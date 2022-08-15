/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 
 */
package dao;

import entity.RoomDevice;
import java.util.Vector;


public interface RoomDeviceDAO {
    
    public Vector<RoomDevice> getRoomDeviceList();

    public RoomDevice getRoomDevice(String cateroomid);

    public void insertRoomDevice(RoomDevice RoomDevice);

    public void updateRoomDevice(RoomDevice RoomDevice);

    public void deleteRoomDevice(int RDid);


}
