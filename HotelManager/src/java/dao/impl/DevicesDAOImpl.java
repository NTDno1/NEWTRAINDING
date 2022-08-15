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


package dao.impl;

import entity.Device;
import entity.Service;
import context.DBContext;
import dao.DeviceDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

/**
 * The class has methods needed for initialize connection with database and
 * execute queries with Devices and associate tables
 *
 * @author
 */
public class DevicesDAOImpl extends DBContext implements DeviceDAO {

    @Override
    public Vector<Device> getAllDevice(String sql) throws Exception{
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        Vector<Device> vector = new Vector<Device>();
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                Device de = new Device(rs.getInt(1), 0, rs.getString(2), rs.getInt(7), rs.getDouble(4), 0, 0, "", "");
                vector.add(de);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return vector;
    }

    @Override
    public Vector<Device> getAllDevicetoAdd(String sql) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        Vector<Device> vector = new Vector<Device>();
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                Device de = new Device(rs.getInt(1), 0, rs.getString(2), 0, 0, 0, 0, "", "");
                vector.add(de);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return vector;
    }

    @Override
    public void insertDevice(String DeviceName, String Price) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        Vector<Device> vector = getAllDevice("select * from Device");
        String query = "INSERT INTO [dbo].[Device]\n"
                + "           ([DeviceName]\n"
                + "           ,[DeviceCate]\n"
                + "           ,[Price]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?, null, ?, null)";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(query);
            pre.setString(1, DeviceName);
            pre.setString(2, Price);
            pre.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
    }

    @Override
    public void deletetDevice(String RoomID, String DeviceID) throws Exception{
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        String query = "DELETE FROM [dbo].[RoomDevice]\n"
                + "      WHERE RoomID = ? and DeviceID = ?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(query);
            pre.setString(1, RoomID);
            pre.setString(2, DeviceID);
            pre.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
    }

    @Override
    public void insertDeviceRoom(String RoomID, String DeviceID, String Quantity, String Status, String Note, String ImageDevice) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        String query = "INSERT INTO [dbo].[RoomDevice]\n"
                + "           ([RoomID]\n"
                + "           ,[DeviceID]\n"
                + "           ,[Quantity]\n"
                + "           ,[Status]\n"
                + "           ,[Note]\n"
                + "           ,[ImageDevice])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(query);
            pre.setString(1, RoomID);
            pre.setString(2, DeviceID);
            pre.setString(3, Quantity);
            pre.setString(4, Status);
            pre.setString(5, Note);
            pre.setString(6, ImageDevice);
            pre.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
    }

    @Override
    public void updateDeviceQuan(String name, String deviceid, String price) throws Exception{
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        String query = "UPDATE [dbo].[Device]\n"
                + "   SET [DeviceName] = ?\n"
                + "     \n"
                + "      ,[Price] = ?\n"
                + "      \n"
                + " WHERE DeviceID =?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(query);
            pre.setString(1, name);
            pre.setString(2, price);
            pre.setString(3, deviceid);
            pre.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
    }

    @Override
    public void updateDeviceinfor(String roomid, String quantity, String status, String note, String deviceid, String image)throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        String query = "UPDATE [dbo].[RoomDevice]\n"
                + "   SET [Quantity] = ?\n"
                + "      ,[Status] = ?\n"
                + "      ,[Note] = ?\n"
                + "      ,[ImageDevice] = ?\n"
                + " WHERE RoomID = ? and DeviceID = ? ";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(query);
            pre.setString(1, quantity);
            pre.setString(2, status);
            pre.setString(3, note);
            pre.setString(4, image);
            pre.setString(5, roomid);
            pre.setString(6, deviceid);
            pre.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
    }

    @Override
    public void deleteDevice(String Roomcateid) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        String query = "delete from RoomDevice where DeviceID = "+Roomcateid+"\n"
                + "delete from Device where DeviceID = "+Roomcateid+"";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(query);
            pre.executeUpdate();
            System.out.println("done");
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
    }

    public int getPage() {
        int n = 0;
        String sql = "select COUNT(*) from RoomDevice INNER JOIN "
                + "Device on RoomDevice.DeviceID = Device.DeviceID "
                + "where RoomDevice.RoomcateID = 3";
        Vector<Device> vector = new Vector<Device>();
        try {
            int totalPage = 0;
            int countPage = 0;
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = getData(sql);
            while (rs.next()) {
                totalPage = rs.getInt(1);
                countPage = totalPage / 4;
                if (totalPage % 4 != 0) {
                    countPage++;
                }
                return countPage;
            }
            pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    @Override
    public Vector<Device> getDevicebycateroom(String cateRoom) throws Exception{
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        Vector<Device> vector = new Vector<Device>();
        String sql = "select * from Device join RoomDevice on Device.DeviceID = RoomDevice.DeviceID where RoomDevice.RoomID =?";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, cateRoom);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Device de = new Device(rs.getInt(1), rs.getInt(6), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getInt(9), rs.getInt(8), rs.getString(10), rs.getString(11));
                vector.add(de);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return vector;
    }

    @Override
    public Vector<Device> getDevicebyroom(String cateRoom, int n) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        Vector<Device> vector = new Vector<Device>();
        int begin = 1;
        int end = 6;
        for (int i = 2; i <= n; i++) {
            begin += 6;
            end += 6;
        }
        String sql = "	           with t as(SELECT r.DeviceCate,r.DeviceID,r.DeviceName, r.Price,i.Quantity,\n"
                + "	           i.RoomID,i.Note,i.[Status],i.ImageDevice,ROW_NUMBER() OVER (order by r.DeviceID)\n"
                + "                AS RowNum FROM Device r JOIN RoomDevice i on i.DeviceID= r.DeviceID\n"
                + "                where i.RoomID=?)\n"
                + "                select * from t";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, cateRoom);
            rs = pre.executeQuery();
            while (rs.next()) {
                Device de = new Device(rs.getInt(2), rs.getInt(6), rs.getString(3), rs.getInt(1), rs.getDouble(4), rs.getInt(8), rs.getInt(5), rs.getString(7), rs.getString(9));
                vector.add(de);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return vector;
    }

    public Vector<Device> getDevicebycateroom(String cateRoom, int n) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        Vector<Device> vector = new Vector<Device>();
        int begin = 1;
        int end = 6;
        for (int i = 2; i <= n; i++) {
            begin += 6;
            end += 6;
        }
        String sql = "	           with t as(SELECT r.DeviceCate,r.DeviceID,r.DeviceName, r.Price,i.Quantity,\n"
                + "	           i.RoomID,i.Note,i.[Status],i.ImageDevice,ROW_NUMBER() OVER (order by r.DeviceID)\n"
                + "                AS RowNum FROM Device r JOIN RoomDevice i on i.DeviceID= r.DeviceID\n"
                + "                where i.RoomID=?)\n"
                + "                select * from t";
        try {
            conn = getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, cateRoom);
            rs = ps.executeQuery();
            while (rs.next()) {
                Device de = new Device(rs.getInt(2), rs.getInt(6), rs.getString(3), rs.getInt(1), rs.getDouble(4), rs.getInt(8), rs.getInt(5), rs.getString(7), rs.getString(9));
                vector.add(de);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return vector;
    }

    @Override
    public Device Getdevice(String sql) throws Exception {
        Connection conn = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        try {
            conn = getConnection();
            rs = getData(sql);
            while (rs.next()) {
                int DeviceID = rs.getInt(7);
                int RoomID = rs.getInt(1);
                String DeviceName = rs.getString(8);
                int DeviceCate = 0;
                double Price = 0;
                int Status = rs.getInt(4);
                int Quantity = rs.getInt(3);
                String Note = rs.getString(5);
                String Imagedevice = rs.getString(6);
                return new Device(DeviceID, RoomID, DeviceName, DeviceCate, Price, Status, Quantity, Note, Imagedevice);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }finally {
            closeResultSet(rs);
            closeConnection(conn);
        }
        return null;
    }

    @Override
    public Device Getdevices(String sql) throws Exception {
        Connection conn = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        try {
            conn = getConnection();
            rs = getData(sql);
            while (rs.next()) {
                int DeviceID = rs.getInt(1);
                String DeviceName = rs.getString(2);
                int DeviceCate = rs.getInt(3);;
                double Price = rs.getDouble(4);;
                return new Device(DeviceID, 0, DeviceName, DeviceCate, Price, 0, 0, "", "");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }finally {
            closeResultSet(rs);
            closeConnection(conn);
        }
        return null;
    }

    @Override
    public Vector<Device> searchDevicebyname(String mess, String roomcateid) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        Vector<Device> vector = new Vector<Device>();
        String sql = "select * from RoomDevice INNER JOIN Device on RoomDevice.DeviceID = Device.DeviceID\n"
                + "where (RoomDevice.RoomcateID = ?)\n"
                + "and (DeviceName like ? or Price like ? or Quantity like ?)"
                + "order by Device.DeviceID desc";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            pre.setString(1, roomcateid);
            pre.setString(2, "%" + mess + "%");
            pre.setString(3, "%" + mess + "%");
            pre.setString(4, "%" + mess + "%");
            rs = pre.executeQuery();
            while (rs.next()) {
//                Device de = new Device(rs.getInt(2), rs.getInt(1), rs.getString(5), rs.getInt(1), rs.getDouble(7), rs.getInt(8), rs.getInt(3));
//                vector.add(de);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);
        }
        return vector;
    }
//String roomid, String quantity, String status, String note, String deviceid

    public static void main(String[] args) {
        DevicesDAOImpl dao = new DevicesDAOImpl();
//                dao.updateDeviceinfor("1", "3", "1", "hiện đang bảo trì","2");
        //        dao.updateDeviceQuan("2", "12", "1");
        //        dao.insertDevice("test", "9999", "1", "1", "2");
//        dao.insertDevice("Thiết Bị Mới", "9999");
//                for (Device device : de) {
//        System.out.println(de);
//        }
        //        int n = dao.getPage();
//        Vector<Device> de = dao.getAllDevicetoAdd("Select * from Device where DeviceID not in ( Select DeviceID from RoomDevice where RoomID =3)");
//        for (Device device : de) {
//            System.out.println(device);
//        }
//        Device de = dao.Getdevice("select * from Roomdevice join Device on RoomDevice.DeviceID = Device.DeviceID \n"
//                + "				where Roomdevice.DeviceID = 2 and Roomdevice.RoomID =1 ");
    }   
/**
     * get list device and count from Device table
     *
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList<Device> numberOfDevice() throws Exception  {
        
        Connection conn = null;
         /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;
        ArrayList<Device> vector = new ArrayList<>();

        String sql = "select d.DeviceName , SUM(r.Quantity) as Quantity from  RoomDevice r INNER JOIN Device d on \n"
                + "                r.DeviceID = d.DeviceID\n"
                + "                group by d.DeviceName";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                vector.add(new Device(rs.getString("DeviceName"), rs.getInt("Quantity")));
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

}

