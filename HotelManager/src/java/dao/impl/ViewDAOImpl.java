/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 * 16/07/2022    1.0        HieuLBM          First Deploy         
 * 16/07/2022    1.0        HieuLBM          Comment
 */
package dao.impl;

import context.DBContext;
import dao.ViewDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Count view, update view in database
 *
 * @author HieuLBM
 */
public class ViewDAOImpl extends DBContext implements ViewDAO {

    /**
     * update View when a session is created
     *
     * @return number of lines changed. It is a <code>int</code>
     * @throws java.lang.Exception
     */
    @Override
    public int updateView() throws Exception {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pre = null;

        Date currentDateRaw = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String currentDate = sdf.format(currentDateRaw);
        String sql;
        //if current day view is not exist then create new row, else update current day view
        if (checkCurrentDateViewExist() == true) {
            sql = "UPDATE [View] SET [view] = [view] + 1 WHERE [date] = '" + currentDate + "'";
        } else {
            sql = "INSERT INTO [View] values('" + currentDate + "'," + 1 + ")";
        }
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            return pre.executeUpdate();
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
    }

    /**
     * get total view count
     *
     * @return <code>int</code>
     * @throws java.lang.Exception
     */
    @Override
    public int getTotalView() throws Exception {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pre = null;
        String sql = "select SUM([view]) AS totalView FROM [View]";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getInt("totalView");
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return 0;
    }

     /**
     * check if current date view exist
     *
     * @return <code>boolean</code>
     * @throws java.lang.Exception
     */
    @Override
    public boolean checkCurrentDateViewExist() throws Exception {
        Connection conn = null;
        ResultSet rs = null;
        PreparedStatement pre = null;

        Date currentDateRaw = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String currentDate = sdf.format(currentDateRaw);

        String sql = "SELECT * FROM [View] WHERE date = '" + currentDate + "'";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return false;
    }
}
