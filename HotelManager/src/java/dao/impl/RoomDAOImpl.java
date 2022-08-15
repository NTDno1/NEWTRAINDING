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
package dao.impl;

import dao.RoomDAO;
import entity.Room;
import entity.RoomByDate;
import context.DBContext;
import entity.RoomCategory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * The class has methods needed for initialize connection with database and
 * execute queries with Room and associate tables
 *
 * @author
 */
public class RoomDAOImpl extends DBContext implements RoomDAO {

    @Override
    public Vector<Room> getRoomList(String sql) throws Exception {
        Vector<Room> vector = new Vector<Room>();
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                int cateid = rs.getInt(4);
                String image = rs.getString(14);
                double Roomprice = rs.getDouble(6);
                int NumberPerson = rs.getInt(7);
                float Square = rs.getFloat(8);
                String Comment = rs.getString(9);
                int Rate = rs.getInt(10);
                String Note = rs.getString(11);
                String cateroom = rs.getString(19);
                Room im = new Room(id, name, des, cateid, image, Roomprice, NumberPerson, Square, Comment, Rate, Note, cateroom);
                vector.add(im);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return vector;
    }

    /**
     * Get List Room By command sql from Room table
     *
     * @param roomName
     * @return
     * @throws Exception
     */
    @Override
    public Vector<Room> getRoomList1(String sql) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        Vector<Room> vector = new Vector<Room>();
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                int cateid = rs.getInt(4);
                String image = rs.getString(17);
                double Roomprice = rs.getDouble(6);
                int NumberPerson = rs.getInt(7);
                float Square = rs.getFloat(8);
                String Comment = rs.getString(9);
                int Rate = rs.getInt(10);
                String Note = rs.getString(11);
                int Status = rs.getInt(12);
                String cateroom = rs.getString(14);
                Room im = new Room(id, name, des, cateid, image, Roomprice, NumberPerson, Square, Comment, Rate, Note, cateroom, Status);
                vector.add(im);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return vector;
    }

    public Room getRoom1(String sql) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                int cateid = rs.getInt(4);
                String image = rs.getString(5);
                double Roomprice = rs.getDouble(6);
                int NumberPerson = rs.getInt(7);
                float Square = rs.getFloat(8);
                String Comment = rs.getString(9);
                int Rate = rs.getInt(10);
                String Note = rs.getString(11);
                int Status = rs.getInt(12);
                String cateroom = rs.getString(14);
                return new Room(id, name, des, cateid, image, Roomprice, NumberPerson, Square, Comment, Rate, Note, cateroom, Status);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return null;
    }

    @Override
    public Room getRoom(String roomid) throws Exception {
        String query = "select * from Room INNER JOIN Image on Image.RoomimgaeID= Room.RoomimgaeID \n"
                + "                     JOIN CateRoom on Room.RoomcateID = CateRoom.RoomcateID\n"
                + "                   where RoomID = ?";
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(query);
            pre.setString(1, roomid);
            rs = pre.executeQuery();
            while (rs.next()) {
                return new Room(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(14), rs.getDouble(6), rs.getInt(7), rs.getFloat(8), rs.getString(9), rs.getInt(10), rs.getString(11), rs.getString(19));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return null;
    }

    /**
     * Get last room  from Room table
     *
     * @param getLastRooms
     * @return
     * @throws Exception
     */
    @Override
    public Room getLastRooms() throws Exception {
        String query = "select top(1)* from Room join CateRoom on Room.RoomcateID = CateRoom.RoomcateID\n"
                + "order by RoomID desc";
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        try {
            pre = conn.prepareStatement(query);
            conn = getConnection();
            pre = conn.prepareStatement(query);
            rs = pre.executeQuery();
            while (rs.next()) {
                return new Room(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(11), rs.getDouble(6), rs.getInt(7), rs.getFloat(8), rs.getString(9), rs.getInt(10), rs.getString(11), rs.getString(14));
            }
        } catch (Exception e) {
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return null;
    }

    @Override
    public void updateRoom(Room Room) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteRoom(int roomid) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    /**
     * count Rooms from Room table
     *
     * @return
     * @throws Exception
     */
    @Override
    public int getPage() throws Exception {
        int n = 0;
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        String sql = "select COUNT(*) from Room where Status=0";
        Vector<Room> vector = new Vector<Room>();
        try {
            int totalPage = 0;
            int countPage = 0;
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {
                totalPage = rs.getInt(1);
                countPage = totalPage / 6;
                if (totalPage % 6 != 0) {
                    countPage++;
                }
                return countPage;
            }
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return n;
    }

    @Override
    public int getPage(String sql) throws Exception {
        int n = 0;
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        try {
            int totalPage = 0;
            int countPage = 0;
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {
                totalPage = rs.getInt(1);
                countPage = totalPage / 6;
                if (totalPage % 6 != 0) {
                    countPage++;
                }
                return countPage;
            }
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return n;
    }

    /**
     * Show Room by page from Room table
     *
     * @param n
     * @return
     * @throws Exception
     */
    @Override
    public Vector<Room> getRoomByPage(int n) throws Exception {
        Vector<Room> vector = new Vector<Room>();
        int begin = 1;
        int end = 6;
        for (int i = 2; i <= n; i++) {
            begin += 6;
            end += 6;
        }
        String sql = "with t as(SELECT r.RoomID,r.Roomname,r.Roomdesc, r.RoomcateID,i.image1,r.Roomprice,r.NumberPerson,r.[Square],r.Comment,r.Rate,r.Note,c.Catename,ROW_NUMBER() OVER (order by r.RoomID) \n"
                + "AS RowNum FROM Room r INNER JOIN [Image] i on i.RoomimgaeID= r.RoomimgaeID \n"
                + "          JOIN CateRoom c on r.RoomcateID = c.RoomcateID\n"
                + "where r.Status=0"
                + ")\n"
                + "select * from t Where RowNum between " + begin + " AND " + end;
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                int cateid = rs.getInt(4);
                String image = rs.getString(5);
                double Roomprice = rs.getDouble(6);
                int NumberPerson = rs.getInt(7);
                float Square = rs.getFloat(8);
                String Comment = rs.getString(9);
                int Rate = rs.getInt(10);
                String Note = rs.getString(11);
                String cateroom = rs.getString(12);
                Room im = new Room(id, name, des, cateid, image, Roomprice, NumberPerson, Square, Comment, Rate, Note, cateroom);
                vector.add(im);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return vector;
    }

    /**
     * count Rooms by status from Room table
     *
     * @return
     * @throws Exception
     */
    @Override
    public int getPageByPageStatus() throws Exception {
        int n = 0;
        String sql = "select COUNT(*) from Room where status=0";
        Vector<Room> vector = new Vector<Room>();
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        try {
            int totalPage = 0;
            int countPage = 0;
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                totalPage = rs.getInt(1);
                countPage = totalPage / 3;
                if (totalPage % 3 != 0) {
                    countPage++;
                }
                return countPage;
            }
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return n;
    }

    /**
     * Show Rooms by page and status from Room table
     *
     * @param n
     * @return
     * @throws Exception
     */
    @Override
    public Vector<Room> getRoomByPageStatus(int n) throws Exception {
        Vector<Room> vector = new Vector<Room>();
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        int begin = 1;
        int end = 3;
        for (int i = 2; i <= n; i++) {
            begin += 3;
            end += 3;
        }
        String sql = "with t as(SELECT r.RoomID,r.Roomname,r.Roomdesc, r.RoomcateID,i.image1,r.Roomprice,r.NumberPerson,r.[Square],r.Comment,r.Rate,r.Note,c.Catename,ROW_NUMBER() OVER (order by r.RoomID) \n"
                + "AS RowNum FROM Room r INNER JOIN [Image] i on i.RoomimgaeID= r.RoomimgaeID \n"
                + "          JOIN CateRoom c on r.RoomcateID = c.RoomcateID\n"
                + "where r.Status=0"
                + ")\n"
                + "select * from t Where RowNum between " + begin + " AND " + end;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                int cateid = rs.getInt(4);
                String image = rs.getString(5);
                double Roomprice = rs.getDouble(6);
                int NumberPerson = rs.getInt(7);
                float Square = rs.getFloat(8);
                String Comment = rs.getString(9);
                int Rate = rs.getInt(10);
                String Note = rs.getString(11);
                String cateroom = rs.getString(12);
                Room im = new Room(id, name, des, cateid, image, Roomprice, NumberPerson, Square, Comment, Rate, Note, cateroom);
                vector.add(im);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return vector;
    }

    /**
     * count Rooms by Price from Room table
     *
     * @param n
     * @param from
     * @param to
     * @return
     * @throws Exception
     */
    @Override
    public Vector<Room> getRoomListbyPrice(int n, int from, int to) throws Exception {
        Vector<Room> vector = new Vector<Room>();
        int begin = 1;
        int end = 6;
        for (int i = 2; i <= n; i++) {
            begin += 3;
            end += 6;
        }
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        String sql = "with t as(SELECT r.RoomID,r.Roomname,r.Roomdesc, r.RoomcateID,i.image1,r.Roomprice,r.NumberPerson,r.[Square],r.Comment,r.Rate,r.Note,c.Catename,ROW_NUMBER() OVER (order by r.RoomID) \n"
                + "AS RowNum FROM Room r INNER JOIN [Image] i on i.RoomimgaeID= r.RoomimgaeID \n"
                + "          JOIN CateRoom c on r.RoomcateID = c.RoomcateID\n"
                + "where r.Status=0\n"
                + " and r.Roomprice between " + from + " and " + to + "\n"
                + ")\n"
                + "select * from t Where RowNum between " + begin + " AND " + end;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                int cateid = rs.getInt(4);
                String image = rs.getString(5);
                double Roomprice = rs.getDouble(6);
                int NumberPerson = rs.getInt(7);
                float Square = rs.getFloat(8);
                String Comment = rs.getString(9);
                int Rate = rs.getInt(10);
                String Note = rs.getString(11);
                String cateroom = rs.getString(12);
                Room im = new Room(id, name, des, cateid, image, Roomprice, NumberPerson, Square, Comment, Rate, Note, cateroom);
                vector.add(im);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return vector;
    }

    /**
     * count Rooms by Price from Room table
     *
     * @param p1
     * @param p2
     * @return
     * @throws Exception
     */
    @Override
    public int getPageByPrice(int p1, int p2) throws Exception {
        int n = 0;
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        String sql = "select COUNT(*) from Room Where Roomprice between " + p1 + " and " + p2 + "";
        Vector<Room> vector = new Vector<Room>();
        try {
            int totalPage = 0;
            int countPage = 0;
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                totalPage = rs.getInt(1);
                countPage = totalPage / 6;
                if (totalPage % 6 != 0) {
                    countPage++;
                }
                return countPage;
            }
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return n;
    }

    /**
     * Show Rooms by price max from Room table
     *
     * @param n
     * @return
     * @throws Exception
     */
    @Override
    public Vector<Room> getRoomByPriceMax(int n) throws Exception {
        Vector<Room> vector = new Vector<Room>();
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        int begin = 1;
        int end = 6;
        for (int i = 2; i <= n; i++) {
            begin += 6;
            end += 6;
        }
        String sql = "with t as(SELECT r.RoomID,r.Roomname,r.Roomdesc, r.RoomcateID,i.image1,r.Roomprice,r.NumberPerson,r.[Square],r.Comment,r.Rate,r.Note,c.Catename,ROW_NUMBER() OVER (order by r.RoomPrice DESC) \n"
                + "AS RowNum FROM Room r INNER JOIN [Image] i on i.RoomimgaeID= r.RoomimgaeID \n"
                + "          JOIN CateRoom c on r.RoomcateID = c.RoomcateID\n"
                + "where r.Status=0"
                + ")\n"
                + "select * from t Where RowNum between " + begin + " AND " + end;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                int cateid = rs.getInt(4);
                String image = rs.getString(5);
                double Roomprice = rs.getDouble(6);
                int NumberPerson = rs.getInt(7);
                float Square = rs.getFloat(8);
                String Comment = rs.getString(9);
                int Rate = rs.getInt(10);
                String Note = rs.getString(11);
                String cateroom = rs.getString(12);
                Room im = new Room(id, name, des, cateid, image, Roomprice, NumberPerson, Square, Comment, Rate, Note, cateroom);
                vector.add(im);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return vector;
    }

    /**
     * Show Rooms by price min from Room table
     *
     * @param n
     * @return
     * @throws Exception
     */
    @Override
    public Vector<Room> getRoomByPriceMin(int n) throws Exception {
        Vector<Room> vector = new Vector<Room>();
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        int begin = 1;
        int end = 6;
        for (int i = 2; i <= n; i++) {
            begin += 6;
            end += 6;
        }
        String sql = "with t as(SELECT r.RoomID,r.Roomname,r.Roomdesc, r.RoomcateID,i.image1,r.Roomprice,r.NumberPerson,r.[Square],r.Comment,r.Rate,r.Note,c.Catename,ROW_NUMBER() OVER (order by r.RoomPrice ASC) \n"
                + "AS RowNum FROM Room r INNER JOIN [Image] i on i.RoomimgaeID= r.RoomimgaeID \n"
                + "          JOIN CateRoom c on r.RoomcateID = c.RoomcateID\n"
                + "where r.Status=0"
                + ")\n"
                + "select * from t Where RowNum between " + begin + " AND " + end;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                int cateid = rs.getInt(4);
                String image = rs.getString(5);
                double Roomprice = rs.getDouble(6);
                int NumberPerson = rs.getInt(7);
                float Square = rs.getFloat(8);
                String Comment = rs.getString(9);
                int Rate = rs.getInt(10);
                String Note = rs.getString(11);
                String cateroom = rs.getString(12);
                Room im = new Room(id, name, des, cateid, image, Roomprice, NumberPerson, Square, Comment, Rate, Note, cateroom);
                vector.add(im);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return vector;
    }

    /**
     * Show Rooms by Rate from Room table
     *
     * @param n
     * @return
     * @throws Exception
     */
    @Override
    public Vector<Room> getRoomByRate(int n) throws Exception {
        Vector<Room> vector = new Vector<Room>();
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        int begin = 1;
        int end = 6;
        for (int i = 2; i <= n; i++) {
            begin += 6;
            end += 6;
        }
        String sql = "with t as(SELECT r.RoomID,r.Roomname,r.Roomdesc, r.RoomcateID,i.image1,r.Roomprice,r.NumberPerson,r.[Square],r.Comment,r.Rate,r.Note,c.Catename,ROW_NUMBER() OVER (order by r.Rate DESC) \n"
                + "AS RowNum FROM Room r INNER JOIN [Image] i on i.RoomimgaeID= r.RoomimgaeID \n"
                + "          JOIN CateRoom c on r.RoomcateID = c.RoomcateID\n"
                + "where r.Status=0"
                + ")\n"
                + "select * from t Where RowNum between " + begin + " AND " + end;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                int cateid = rs.getInt(4);
                String image = rs.getString(5);
                double Roomprice = rs.getDouble(6);
                int NumberPerson = rs.getInt(7);
                float Square = rs.getFloat(8);
                String Comment = rs.getString(9);
                int Rate = rs.getInt(10);
                String Note = rs.getString(11);
                String cateroom = rs.getString(12);
                Room im = new Room(id, name, des, cateid, image, Roomprice, NumberPerson, Square, Comment, Rate, Note, cateroom);
                vector.add(im);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return vector;
    }

    /**
     * search Rooms by date check in check out from Room table
     *
     * @param a
     * @param datein
     * @param dateout
     * @return
     * @throws Exception
     */
    @Override
    public Vector<RoomByDate> seachRoom(String a, String datein, String dateout) throws Exception {

        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        SimpleDateFormat format = new SimpleDateFormat("E MMM dd yyyy");
        Vector<RoomByDate> vector = new Vector<RoomByDate>();
        String sql = "select * from Room r  \n"
                + "inner join Image i on i.RoomimgaeID=r.RoomimgaeID join CateRoom c on \n"
                + "r.RoomcateID =c.RoomcateID \n"
                + "left join DateOfRoom d \n"
                + "on r.RoomID=d.RoomID \n";
        int b =Integer.parseInt(a);
        int c =b+1;
        if (datein != null && dateout != null && datein != "" && dateout != "") {
            java.util.Date date1 = (java.util.Date) format.parse(datein);
            java.sql.Date sDate = new java.sql.Date(date1.getTime());
            java.util.Date date2 = (java.util.Date) format.parse(dateout);
            java.sql.Date cDate = new java.sql.Date(date2.getTime());

            sql += "where((d.DateOut < " + sDate + " or d.DateIn> " + cDate + ") or (d.DateIn is null and d.DateOut is null))\n";
        }
        if (a != null && a != "") {
            sql += "and (r.NumberPerson= " + a +"or r.NumberPerson= "+b+")";
        }
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                int cateid = rs.getInt(4);
                String image = rs.getString(14);
                double Roomprice = rs.getDouble(6);
                int NumberPerson = rs.getInt(7);
                float Square = rs.getFloat(8);
                String Comment = rs.getString(9);
                int Rate = rs.getInt(10);
                String Note = rs.getString(11);
                String cateroom = rs.getString(19);
                RoomByDate im = new RoomByDate(cateid, name, Comment, cateid, image, Roomprice, NumberPerson, Square, Comment, Rate, Note, cateroom, null, null);
                vector.add(im);
            }
        } catch (SQLException ex) {
            throw ex;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return vector;
    }

    /**
     * get list Room from Room table
     *
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<Room> getRoomListAll() throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        String sql = "select * from Room";
        ArrayList<Room> vector = new ArrayList<>();
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                int cateid = rs.getInt(4);
                String image = rs.getString(5);
                double Roomprice = rs.getDouble(6);
                int NumberPerson = rs.getInt(7);
                float Square = rs.getFloat(8);
                String Comment = rs.getString(9);
                int Rate = rs.getInt(10);
                String Note = rs.getString(11);
                int status = rs.getInt(12);
                Room im = new Room(id, name, des, cateid, image, Roomprice, NumberPerson, Square, Comment, Rate, Note, status);
                vector.add(im);
            }
        } catch (SQLException ex) {
            throw ex;

        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }

        return vector;

    }

    /**
     * update Room from Room table
     *
     * @param rID
     * @param rStatus
     * @throws Exception
     */
    @Override
    public void updateStatus(int rID, int rStatus) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        String sql = "UPDATE [SWPgroup3].[dbo].[Room]\n"
                + "   SET [Status] = ?\n"
                + " WHERE [RoomID]=?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, rStatus);
            pre.setInt(2, rID);

            pre.executeUpdate();

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
    }

    /**
     * get list and search Room from Room table
     *
     * @param rName
     * @param status
     * @return
     * @throws Exception
     */
    public ArrayList<Room> selectRoom(String rName, int status) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        ArrayList<Room> vector = new ArrayList<>();
        String sql = "select * from [Room] where Roomname like N'%" + rName + "%'";
        if (status >= 0) {
            sql = sql.concat(" and [status]=" + status);
        }

        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                int cateid = rs.getInt(4);
                String image = rs.getString(5);
                double Roomprice = rs.getDouble(6);
                int NumberPerson = rs.getInt(7);
                float Square = rs.getFloat(8);
                String Comment = rs.getString(9);
                int Rate = rs.getInt(10);
                String Note = rs.getString(11);

                int status1 = rs.getInt(12);
                Room im = new Room(id, name, des, cateid, image, Roomprice, NumberPerson, Square, Comment, Rate, Note, rs.getInt("status"));

                vector.add(im);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return vector;
    }

    /**
     * get list and search Room from Room table
     *
     * @param roomName
     * @param cateID
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<Room> searchRoomNamebyAjax(String roomName, int cateID) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        ArrayList<Room> vector = new ArrayList<>();
        String sql = "select * from Room where Roomname like '%" + roomName + "%' and  RoomcateID=" + cateID;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                int cateid = rs.getInt(4);
                String image = rs.getString(5);
                double Roomprice = rs.getDouble(6);
                int NumberPerson = rs.getInt(7);
                float Square = rs.getFloat(8);
                String Comment = rs.getString(9);
                int Rate = rs.getInt(10);
                String Note = rs.getString(11);
                int status1 = rs.getInt(12);
                Room im = new Room(id, name, des, cateid, image, Roomprice, NumberPerson, Square, Comment, Rate, Note, status1);

                vector.add(im);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return vector;
    }

    /**
     * get a Room from Room table
     *
     * @param roomid
     * @return
     * @throws Exception
     */
    @Override
    public Room getOneRoom(int roomid) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        String sql = "select * from Room INNER JOIN Image on Image.RoomimgaeID= Room.RoomimgaeID \n"
                + "  JOIN CateRoom on Room.RoomcateID = CateRoom.RoomcateID\n"
                + "    where RoomID = " + roomid;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                return new Room(rs.getInt("RoomId"), rs.getString("Roomname"), rs.getString("Roomdesc"), rs.getInt("RoomcateID"), rs.getDouble("Roomprice"), rs.getInt("NumberPerson"), rs.getFloat("Square"), rs.getString("Comment"), rs.getInt("Rate"), rs.getString("Note"), rs.getInt("status"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return null;
    }

    /**
     * get count Room from Room table
     *
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<Room> sumOfRoom() throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        ArrayList< Room> vector = new ArrayList<>();

        String sql = "select Room.[Status],COUNT(Room.[Status]) as Sumstatus from Room \n"
                + "group by  Room.[Status]";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                vector.add(new Room(rs.getInt("Status"), rs.getInt("Sumstatus")));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return vector;
    }

    /**
     * check room Name from Room table
     *
     * @param roomName
     * @return
     * @throws Exception
     */
    @Override
    public String checkRoom(String roomName) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        String sql = "select * from Room where Roomname = '" + roomName + "'";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getString("Roomname");

            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return null;
    }

    @Override
    public void crudRoom(String sql) throws Exception {
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.executeUpdate();
            System.out.println("done");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Room> getRoomBill() throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        ArrayList<Room> vector = new ArrayList<>();
        String sql = "Select RoomID from Reservation";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                Room im = new Room(id, "", "", 0, "", 0, 0, 0, "", 0, "", 0);

                vector.add(im);
            }
        } catch (Exception e) {
            throw e;
        }
        return vector;
    }

    public static void main(String[] args) {
        try {
            RoomDAOImpl dao = new RoomDAOImpl();
        } catch (Exception ex) {
            Logger.getLogger(RoomDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
