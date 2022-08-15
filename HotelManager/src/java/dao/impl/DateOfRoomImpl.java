/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 19/07/2022    1.0        HieuHT          Comment
 */
package dao.impl;

import dao.DateOfRoomDAO;
import entity.DateOfRoom;
import entity.Reservation;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DateOfRoomImpl extends DBContext implements DateOfRoomDAO {

    @Override
    public int updateReservation(DateOfRoom date) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    /**
     * add a Reservation with date from the Reservation table
     *
     * @return
     * @throws Exception
     */
    @Override
    public int addReservation(DateOfRoom date) throws Exception {
        String sql = "INSERT INTO [SWPgroup3].[dbo].[DateOfRoom]\n"
                + "           ([RoomID],[DateIn],[DateOut],[Status])\n"
                + "     VALUES(?,?,?,?)";
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        try {
            //        create statement: execute sql
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, date.getRoomID());
            pre.setDate(2, date.getDatein());
            pre.setDate(3, date.getDateout());
            pre.setInt(4, date.getStatus());
            pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return 0;
    }

}
