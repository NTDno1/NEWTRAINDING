
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

import dao.ReservationDAO;
import entity.Reservation;
import context.DBContext;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

/**
 * The class has methods needed for initialize connection with database and
 * execute queries with Reservation and associate tables
 *
 * @author
 */
public class ReservationDAOImpl extends DBContext implements ReservationDAO {

    /**
     * update Reservation in Reservation table of database
     *
     * @param re
     * @return
     * @throws Exception
     */
    @Override
    public int updateReservation(Reservation re) throws Exception {
        int n = 0;
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        String sql = "UPDATE [SWPgroup3].[dbo].[Reservation]\n"
                + "   SET [UserID] = ?\n"
                + "      ,[RoomID] = ?\n"
                + "      ,[Name] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[NumberOfPerson] = ?\n"
                + "      ,[Checkin] = ?\n"
                + "      ,[Checkout] = ?\n"
                + "      ,[Total] = ?\n"
                + "      ,[Status] = ?\n"
                + "      ,[Date] =?\n"
                + " WHERE BillID=?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, re.getUserID());
            pre.setInt(2, re.getRoomID());
            pre.setString(3, re.getName());
            pre.setString(4, re.getEmail());
            pre.setString(5, re.getAddress());
            pre.setString(6, re.getPhone());
            pre.setInt(7, re.getNumberOfPerson());
            pre.setDate(8, re.getCheckin());
            pre.setDate(9, re.getCheckout());
            pre.setDouble(10, re.getTotal());
            pre.setInt(11, re.getStatus());
            pre.setDate(12, re.getDate());
            pre.setInt(13, re.getBillID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return n;
    }

    /**
     * add Reservation in Reservation table of database
     *
     * @param re
     * @return
     * @throws Exception
     */
    @Override
    public int addReservation(Reservation re) throws Exception {
        String sql = "INSERT INTO [SWPgroup3].[dbo].[Reservation]\n"
                + "([UserID],[RoomID],[Name],[Email],[Address],[Phone],[NumberOfPerson],[Checkin],[Checkout],[Total],[Status],[Date]) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        try {
            //        create statement: execute sql
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setInt(1, re.getUserID());
            pre.setInt(2, re.getRoomID());
            pre.setString(3, re.getName());
            pre.setString(4, re.getEmail());
            pre.setString(5, re.getAddress());
            pre.setString(6, re.getPhone());
            pre.setInt(7, re.getNumberOfPerson());
            pre.setDate(8, re.getCheckin());
            pre.setDate(9, re.getCheckout());
            pre.setDouble(10, re.getTotal());
            pre.setInt(11, re.getStatus());
            pre.setDate(12, re.getDate());
            pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return 0;
    }

    /**
     * show Reservation in Reservation table of database
     *
     * @param sql
     * @return
     * @throws Exception
     */
    public Vector<Reservation> Reservation(String sql) throws Exception {
        Vector<Reservation> re = new Vector<Reservation>();
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        try {
            //        create statement: execute sql
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int UserID = rs.getInt(2);
                int RoomID = rs.getInt(3);
                String Name = rs.getString(4);
                String Email = rs.getString(5);
                String Address = rs.getString(6);
                String Phone = rs.getString(7);
                int NumberOfPerson = rs.getInt(8);
                Date checkin = rs.getDate(9);
                Date checkout = rs.getDate(10);
                double total = rs.getDouble(11);
                int Status = rs.getInt(12);
                Date dat = rs.getDate(13);

                Reservation im = new Reservation(id,UserID, RoomID, Name, Email, Address, Phone, NumberOfPerson, checkin, checkout, total, Status, dat);
                re.add(im);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return re;
    }

    /**
     * delete Reservation in Reservation table of database
     *
     * @param id
     * @return
     * @throws Exception
     */
    public int removeReservation(int id) throws Exception {
        int n = 0;
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        String sql = "update Reservation set [Status] =3\n"
                + "where BillID=" + id;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return n;
    }

    /**
     * get the total amount from from Reservation table
     *
     * @return
     * @throws Exception
     */
    @Override
    public int sumReservation() throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        try {
            String sql = "select SUM(Total) as Total from Reservation";
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {

                return rs.getInt("Total");

            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return 0;
    }

    /**
     * search from Reservation table
     *
     * @param name
     * @param from
     * @param to
     * @return
     * @throws Exception
     */
    @Override

    public ArrayList<Reservation> totalOfRoomSearch(String name, Date to, Date from) throws Exception {

        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        ArrayList<Reservation> ArrayList = new ArrayList<>();
        String sql = "select r.RoomID,r.Roomname,SUM(re.Total) as Total from Reservation re full outer join  Room r on re.RoomID = r.RoomID\n"
                + "where r.RoomID like '%" + name + "%' \n"
                + "group by r.RoomID,r.Roomname \n"
                + "order by r.RoomID asc";
        if (to != null && from != null) {
            sql = " select r.RoomID,r.Roomname,SUM(re.Total) as Total from Reservation re full outer join  Room r on re.RoomID = r.RoomID\n"
                    + "                  where r.RoomID like '%" + name + "%' and  re.Checkin >= '" + to + "'  and   re.Checkin <= '" + from + "'\n"
                    + "                    group by r.RoomID,r.Roomname\n"
                    + "                    order by r.RoomID asc";
        }
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {

                ArrayList.add(new Reservation(rs.getInt("RoomID"), rs.getString("Roomname"), rs.getDouble("Total")));

            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }

        return ArrayList;
    }

    /**
     * Show revenue by Room Reservation table
     *
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<Reservation> totalOfRoom() throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        ArrayList<Reservation> ArrayList = new ArrayList<>();
        String sql = "select r.RoomID,r.Roomname,SUM(re.Total) as Total from Reservation re full outer join  Room r on re.RoomID = r.RoomID\n"
                + "group by r.RoomID,r.Roomname\n"
                + "order by r.RoomID asc";

        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {

                ArrayList.add(new Reservation(rs.getInt("RoomID"), rs.getString("Roomname"), rs.getDouble("Total")));

            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }

        return ArrayList;
    }

    /**
     * search and display how much each Room earns from Reservation table
     *
     * @param month
     * @param year
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<Reservation> totalOfRoomByMonth(int month, int year) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        ArrayList<Reservation> ArrayList = new ArrayList<>();
        String sql = "";
        if (month == 0 && year == 0) {

            sql = "select  MONTH(Checkin)as Status, YEAR(Checkin) as NumberOfPerson, SUM(Total) as Total  from Reservation       \n"
                    + "group by MONTH(Checkin),YEAR(Checkin)\n"
                    + "order by MONTH(Checkin),YEAR(Checkin)";
        }
        if (month != 0 && year != 0) {
            sql = "select  MONTH(Checkin) as Status, YEAR(Checkin) as NumberOfPerson, SUM(Total) as Total  from Reservation       \n"
                    + "where MONTH(Checkin) =" + month + " and  YEAR(Checkin) = " + year + "\n"
                    + "group by MONTH(Checkin),YEAR(Checkin)\n"
                    + "order by MONTH(Checkin),YEAR(Checkin)";
        }
        if (month == 0 && year != 0) {
            sql = "select  MONTH(Checkin)as Status, YEAR(Checkin) as NumberOfPerson, SUM(Total) as Total  from Reservation       \n"
                    + "where YEAR(Checkin) = " + year + "\n"
                    + "group by MONTH(Checkin),YEAR(Checkin)\n"
                    + "order by MONTH(Checkin),YEAR(Checkin)";
        }
        if (month != 0 & year == 0) {
            sql = "select  MONTH(Checkin)as Status, YEAR(Checkin) as NumberOfPerson, SUM(Total) as Total  from Reservation      \n"
                    + "                    where  MONTH(Checkin)=" + month + "\n"
                    + "                   group by MONTH(Checkin),YEAR(Checkin)\n"
                    + "                   order by MONTH(Checkin),YEAR(Checkin)";
        }
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {
                ArrayList.add(new Reservation(rs.getInt("Status"), rs.getInt("NumberOfPerson"), rs.getDouble("Total")));

            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return ArrayList;
    }

    /**
     * show year from Reservation table
     *
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<Integer> selectAllYear() throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        ArrayList<Integer> ArrayList = new ArrayList<>();
        String sql = "select  YEAR(Checkin) as Year from Reservation       \n"
                + "group by YEAR(Checkin)\n"
                + "order by YEAR(Checkin)";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {

                ArrayList.add(rs.getInt("Year"));

            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return ArrayList;
    }

    /**
     * Show the service that the customer has used from Reservation table
     *
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<Reservation> sumService() throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        ArrayList<Reservation> ArrayList = new ArrayList<>();
        String sql = "select ServiceName, COUNT( ServiceName) as Total from [Reservation]\n"
                + "group by ServiceName";

        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {
                ArrayList.add(new Reservation(rs.getString("ServiceName"), rs.getInt("Total")));

            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }

        return ArrayList;

    }

    /**
     * Count Reservation in Reservation table in database
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
        String sql = "select Count(*) from Reservation";
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
     * Show Reservation by page in Reservation table in database
     *
     * @param n
     * @return
     * @throws Exception
     */
    @Override
    public Vector<Reservation> getReservationByPage(int n) throws Exception {
        Vector<Reservation> vector = new Vector<Reservation>();
        int begin = 1;
        int end = 6;
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        for (int i = 2; i <= n; i++) {
            begin += 6;
            end += 6;
        }
        String sql = "with t as(select r.Roomname,i.image1,re.Name,re.Email,re.[Address],re.Phone,re.NumberOfPerson,re.Checkin,re.Checkout,re.Total,re.[Status],re.[Date],re.RoomID,re.BillID,re.UserID,ROW_NUMBER() OVER (order by re.BillID) \n"
                + "AS RowNum FROM Reservation re join Room r on r.RoomID=re.RoomID\n"
                + "          join [Image] i on r.RoomimgaeID=i.RoomimgaeID \n"
                + ")\n"
                + "select * from t Where RowNum between " + begin + " AND " + end;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                String Roomname = rs.getString(1);
                String image1 = rs.getString(2);
                String Name = rs.getString(3);
                String Email = rs.getString(4);
                String Address = rs.getString(5);
                String Phone = rs.getString(6);
                int NumberOfPerson = rs.getInt(7);
                Date Checkin = rs.getDate(8);
                Date Checkout = rs.getDate(9);
                double Total = rs.getDouble(10);
                int Status = rs.getInt(11);
                Date dDate = rs.getDate(12);
                int RoomID = rs.getInt(13);
                int BillID = rs.getInt(14);
                int UserID = rs.getInt(15);
                Reservation im = new Reservation(BillID, UserID, RoomID, Roomname, image1, Name, Email, Address, Phone, NumberOfPerson, Checkin, Checkout, Total, Status, dDate);
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
     * search Reservation by date in , date out from Reservation table
     *
     * @param a
     * @param b
     * @return
     * @throws Exception
     */
    @Override
    public Vector<Reservation> searchRoom(String a, String b) throws Exception {
        Vector<Reservation> vector = new Vector<Reservation>();
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        String sql = "select r.Roomname,i.image1,re.Name,re.Email,re.[Address],re.Phone,re.NumberOfPerson,re.Checkin,re.Checkout,re.Total,re.[Status],re.[Date],re.RoomID,re.BillID,re.UserID \n"
                + "  FROM Reservation re join Room r on r.RoomID=re.RoomID\n"
                + " join [Image] i on r.RoomimgaeID=i.RoomimgaeID \n"
                + " where re.Checkout <='" + b + "'and re.Checkin >='" + a + "'";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                String Roomname = rs.getString(1);
                String image1 = rs.getString(2);
                String Name = rs.getString(3);
                String Email = rs.getString(4);
                String Address = rs.getString(5);
                String Phone = rs.getString(6);
                int NumberOfPerson = rs.getInt(7);
                Date Checkin = rs.getDate(8);
                Date Checkout = rs.getDate(9);
                double Total = rs.getDouble(10);
                int Status = rs.getInt(11);
                Date dDate = rs.getDate(12);
                int RoomID = rs.getInt(13);
                int BillID = rs.getInt(14);
                int UserID = rs.getInt(15);
                Reservation im = new Reservation(BillID, UserID, RoomID, Roomname, image1, Name, Email, Address, Phone, NumberOfPerson, Checkin, Checkout, Total, Status, dDate);
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
     * show month from Reservation table
     *
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<Integer> selectAllMotnh() throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        ArrayList<Integer> ArrayList = new ArrayList<>();
        String sql = "  select  MONTH(Checkin) as Month  from Reservation      \n"
                + "                group by MONTH(Checkin)\n"
                + "                order by MONTH(Checkin)";

        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();

            while (rs.next()) {
                ArrayList.add(rs.getInt("Month"));

            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }

        return ArrayList;
    }

    /**
     * show booking information from Reservation table
     *
     * @param uID
     * @return
     * @throws Exception
     */
    @Override
    public Reservation viewOrderDetails(int uID) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        String sql = "select r.BillID,r.UserID,r.Name,ro.Roomname,r.Address,r.Email,r.Phone,r.Checkin,r.Checkout,ro.RoomPrice,r.Total,r.[Status] from [Reservation] r inner join [User] u on r.UserID= u.UserID\n"
                + "              inner join Room ro on r.RoomID = ro.RoomID  \n"
                + "              where u.UserID=" + uID;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);

            rs = pre.executeQuery();

            if (rs.next()) {
                return new Reservation(rs.getInt("BillID"), uID, rs.getString("Name"), rs.getString("Roomname"), rs.getString("Address"), rs.getString("Email"), rs.getString("Phone"),
                        rs.getDate("Checkin"), rs.getDate("Checkout"), rs.getDouble("Roomprice"), rs.getDouble("Total"), rs.getInt("Status"));

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
     * show booking information from Reservation table
     *
     * @param uID
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<Reservation> OrderDetails(int uID) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        ArrayList<Reservation> ArrayList = new ArrayList<>();
        String sql = "select r.BillID,r.UserID,r.Name,ro.Roomname,r.Address,r.Email,r.Phone,r.Checkin,r.Checkout,ro.RoomPrice,r.Total,r.[Status] from [Reservation] r inner join [User] u on r.UserID= u.UserID\n"
                + "              inner join Room ro on r.RoomID = ro.RoomID  \n"
                + "              where u.UserID=" + uID;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);

            rs = pre.executeQuery();

            while (rs.next()) {
                Reservation r = new Reservation(rs.getInt("BillID"), uID, rs.getString("Name"), rs.getString("Roomname"), rs.getString("Address"), rs.getString("Email"), rs.getString("Phone"),
                        rs.getDate("Checkin"), rs.getDate("Checkout"), rs.getDouble("Roomprice"), rs.getDouble("Total"), rs.getInt("Status"));
                ArrayList.add(r);

            }

        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return ArrayList;
    }

}
