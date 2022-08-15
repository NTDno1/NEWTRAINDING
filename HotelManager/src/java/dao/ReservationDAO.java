/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 13/07/2022    1.0        HieuLBM          Comment
 * 18/07/2022    1.0        HieuHT          Comment
 */
package dao;

import entity.Reservation;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Vector;

/**
 * Lớp này chứa các interface của ReservationDAOImpl
 *
 * @author
 */
public interface ReservationDAO {

    /**
     * update information from Reservation table
     *
     * @param re is a Reservation object
     * @return int,
     * @throws java.lang.Exception
     */
    public int updateReservation(Reservation re) throws Exception;

    /**
     * add information from Reservation table
     *
     * @param re is a Reservation object
     * @return int,
     * @throws java.lang.Exception
     */
    public int addReservation(Reservation re) throws Exception;
    /**
     * show information from Reservation table
     *
     * @param sql is string
     * @return <code>Reservation</code> object.
     * @throws java.lang.Exception
     */

    public Vector<Reservation> Reservation(String sql) throws Exception;
    /**
     * remove booking information from Reservation table
     *
     * @param id is int
     * @return int,
     * @throws java.lang.Exception
     */

    public int removeReservation(int id) throws Exception;
    /**
     * count ID in Reservation
     *
     * @return int
     * @throws java.lang.Exception
     */

    public int getPage() throws Exception;
    /**
     * show Reservation information from Reservation table by Page
     *
     * @param n is a int
     * @return <code>Reservation</code> object.
     * @throws java.lang.Exception
     */

    public Vector<Reservation> getReservationByPage(int n) throws Exception;
    /**
     * search booking information from Reservation table
     *
     * @param a is string
     * @param b is string
     * @return <code>Reservation</code> object.
     * @throws java.lang.Exception
     */

    public Vector<Reservation> searchRoom(String a, String b) throws Exception;

    /**
     * show booking information from Reservation table
     *
     * @param uID is a int
     * @return <code>Reservation</code> object.
     * @throws java.lang.Exception
     */
    public Reservation viewOrderDetails(int uID) throws Exception;

    /**
     * show booking information from Reservation table
     *
     * @param uID is a int
     * @return <code>ArrayList<Reservation></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<Reservation> OrderDetails(int uID) throws Exception;

    /**
     * get the total amount from from Reservation table
     *
     * @return int
     * @throws java.lang.Exception
     */
    public int sumReservation() throws Exception;

    /**
     * Show the service that the customer has used from Reservation table
     *
     * @return <code>ArrayList<Reservation></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<Reservation> sumService() throws Exception;

    /**
     * search from Reservation table
     *
     * @param name in a String
     * @param from in a Date
     * @param to in a Date
     * @return <code>ArrayList<Reservation></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<Reservation> totalOfRoomSearch(String name, Date from, Date to) throws Exception;

    /**
     * Show revenue by Room Reservation table
     *
     * @return <code>ArrayList<Reservation></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<Reservation> totalOfRoom() throws Exception;

    /**
     * search and display how much each Room earns from Reservation table
     *
     * @param month in a String
     * @param year in a Date
     * @return <code>ArrayList<Reservation></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<Reservation> totalOfRoomByMonth(int month, int year) throws Exception;

    /**
     * show year from Reservation table
     *
     * @return <code>ArrayList<Integer></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<Integer> selectAllYear() throws Exception;

    /**
     * show month from Reservation table
     *
     * @return <code>ArrayList<Integer></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<Integer> selectAllMotnh() throws Exception;
}
