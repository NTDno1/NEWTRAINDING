
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
package dao;

import entity.Device;
import entity.Room;
import java.util.ArrayList;
import java.util.Vector;

/**
 * Lớp này chứa các interface của DeviceDAOImpl
 *
 * @author
 */
public interface DeviceDAO {
    /**
     * get list all device from Device table
     *
     * @return  <code>ArrayList<Device></code> object.
     * @throws java.lang.Exception
     */
    public Vector<Device> getAllDevice(String sql) throws Exception;
    /**
     * get list device by roomid from Device table
     *
     * @return  <code>ArrayList<Device></code> object.
     * @throws java.lang.Exception
     */
    public Vector<Device> getDevicebyroom(String cateRoom, int n) throws Exception;

    /**
     * get list device and count from Device table
     *
     * @return  <code>ArrayList<Device></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<Device> numberOfDevice() throws Exception;
    /**
     * get list device by roomCateid count from Device table
     *
     * @return  <code>ArrayList<Device></code> object.
     * @throws java.lang.Exception
     */
    public Vector<Device> getDevicebycateroom(String cateRoom) throws Exception;
    /**
     * insert device from Device table
     */
    public void insertDevice(String DeviceName, String Price) throws Exception;
    /**
     * delete device from Device table
     */
    public void deletetDevice(String RoomID, String DeviceID) throws Exception;
    /**
     * insert device from DeviceRoom table
     */
    public void insertDeviceRoom(String RoomID, String DeviceID, String Quantity, String Status, String Note, String ImageDevice) throws Exception;
    /**
     * Update device from Device table
     */
    public void updateDeviceinfor(String roomid, String quantity, String status, String note, String deviceid, String image) throws Exception;
    /**
     * search Device from Device table
     *
     * @return  <code>ArrayList<Device></code> object.
     * @throws java.lang.Exception
     */
    public Vector<Device> searchDevicebyname(String mess, String roomcateid) throws Exception;
    /**
     * Update deviceQuantity from Device table
     */
    public void updateDeviceQuan(String quan, String deviceid, String roomcateid) throws Exception;
    /**
     * Delete device from Device table
     */
    public void deleteDevice(String Roomcateid) throws Exception;
    /**
     * get Device from Device table
     *
     * @return  <code>Objcect<Device></code> object.
     * @throws java.lang.Exception
     */
    public Device Getdevice(String sql) throws Exception;
    /**
     * get Device from Device table
     *
     * @return  <code>ArrayList<Device></code> object.
     * @throws java.lang.Exception
     */
    public Device Getdevices(String sql) throws Exception;
    /**
     * get all Device from Device table where device inValite
     *
     * @return  <code>ArrayList<Device></code> object.
     * @throws java.lang.Exception
     */
    public Vector<Device> getAllDevicetoAdd(String sql) throws Exception;
}
