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
package dao;

import entity.DateOfRoom;
import entity.Reservation;
/**
 * Lớp này chứa các interface của DateOfRoomDAOImpl
 *
 * @author HieuHT
 */
public interface DateOfRoomDAO {

    /**
     * update DateRoom from the DateOfRoom table
     *
     * @param date is an <code>Notification</code> object
     * @return
     * @throws java.lang.Exception
     */
    public int updateReservation(DateOfRoom date) throws Exception;
    /**
     * add DateRoom from the DateOfRoom table
     *
     * @param date is an <code>Notification</code> object
     * @return 
     * @throws java.lang.Exception
     */
    public int addReservation(DateOfRoom date) throws Exception;
}
