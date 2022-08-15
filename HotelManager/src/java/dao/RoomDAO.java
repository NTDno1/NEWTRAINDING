/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 13/07/2022    1.0        HieuLBM          Comment
 * 18/07/2022    1.0        HieuHT           Comment
 */
package dao;

import entity.Room;
import entity.RoomByDate;
import entity.RoomCategory;
import java.util.ArrayList;
import java.util.Vector;

/**
 * Lớp này chứa các interface của RoomDAOImpl
 *
 * @author
 */
public interface RoomDAO {

    /**
     * get list Room from Room table
     *
     * @return <code>ArrayList<Room></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<Room> getRoomListAll() throws Exception;

    /**
     * update Room from Room table
     *
     * @param rID is an int.
     * @param rStatus is an int.
     * @throws java.lang.Exception
     */
    public void updateStatus(int rID, int rStatus) throws Exception;

    /**
     * get list and search Room from Room table
     *
     * @param roomName <code>Room</code> object.
     * @param status <code>Room</code> object.
     * @return <code>ArrayList<Room></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<Room> selectRoom(String roomName, int status) throws Exception;

    /**
     * get list and search Room from Room table
     *
     * @param roomName <code>Room</code> object.
     * @param cateID <code>Room</code> object.
     * @return <code>ArrayList<Room></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<Room> searchRoomNamebyAjax(String roomName, int cateID) throws Exception;

    /**
     * get a Room from Room table
     *
     * @param roomid <code>Room</code> object.
     * @return <code>Room</code> object.
     * @throws java.lang.Exception
     */
    public Room getOneRoom(int roomid) throws Exception;

    /**
     * get count Room from Room table
     *
     * @return <code>ArrayList<Room></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<Room> sumOfRoom() throws Exception;

    /**
     * check room Name from Room table
     *
     * @param roomName is an String
     * @return String
     * @throws java.lang.Exception
     */
    public String checkRoom(String roomName) throws Exception;

    public Vector<Room> getRoomList(String sql) throws Exception;

    /**
     * count Rooms from Room table
     *
     * @return int
     * @throws java.lang.Exception
     */
    public int getPage() throws Exception;

    /**
     * Show Room by page from Room table
     *
     * @param n
     * @return <code>Room</code> object.
     * @throws java.lang.Exception
     */
    public Vector<Room> getRoomByPage(int n) throws Exception;

    /**
     * Show Rooms by page and status from Room table
     *
     * @param n
     * @return <code>Room</code> object.
     * @throws java.lang.Exception
     */
    public Vector<Room> getRoomByPageStatus(int n) throws Exception;

    /**
     * count Rooms by status from Room table
     *
     * @return int
     * @throws java.lang.Exception
     */
    public int getPageByPageStatus() throws Exception;

    public Room getRoom(String roomid) throws Exception;

    public void crudRoom(String sql) throws Exception;

    public void updateRoom(Room Room) throws Exception;

    public void deleteRoom(int roomid) throws Exception;

    /**
     * count Rooms by Price from Room table
     *
     * @param p1
     * @param p2
     * @return int
     * @throws java.lang.Exception
     */
    public int getPageByPrice(int p1, int p2) throws Exception;

    /**
     * Show Rooms by price between from Room table
     *
     * @param n
     * @param from
     * @param to
     * @return <code>Room</code> object.
     * @throws java.lang.Exception
     */
    public Vector<Room> getRoomListbyPrice(int n, int from, int to) throws Exception;

    /**
     * Show Rooms by price max from Room table
     *
     * @param n
     * @return <code>Room</code> object.
     * @throws java.lang.Exception
     */
    public Vector<Room> getRoomByPriceMax(int n) throws Exception;

    /**
     * Show Rooms by price min from Room table
     *
     * @param n
     * @return <code>Room</code> object.
     * @throws java.lang.Exception
     */

    public Vector<Room> getRoomByPriceMin(int n) throws Exception;

    /**
     * Show Rooms by Rate from Room table
     *
     * @param n
     * @return <code>Room</code> object.
     * @throws java.lang.Exception
     */

    public Vector<Room> getRoomByRate(int n) throws Exception;

    /**
     * search Rooms by date check in check out from Room table
     *
     * @param a
     * @param datein
     * @param dateout
     * @return <code>Room</code> object.
     * @throws java.lang.Exception
     */

    public Vector<RoomByDate> seachRoom(String a, String datein, String dateout) throws Exception;

    public int getPage(String sql) throws Exception;

    public Vector<Room> getRoomList1(String sql) throws Exception;
    public Room getLastRooms() throws Exception;
}
