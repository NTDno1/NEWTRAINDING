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

import dao.RoomCategoryDAO;
import entity.RoomCategory;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

/**
 * The class has methods needed for initialize connection with database and
 * execute queries with RoomCategory and associate tables
 *
 * @author
 */
public class RoomCategoryDAOImpl extends DBContext implements RoomCategoryDAO {

    /**
     * get count RoomcateID from RoomCategory table
     *
     * @return
     * @throws Exception
     */
    @Override
    public Vector<RoomCategory> getRoomCategoryList(String sql) throws Exception {
        ResultSet rs = null;
        Vector<RoomCategory> vector = new Vector<RoomCategory>();
        try {
            rs = getData(sql);
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String des = rs.getString(3);
                RoomCategory im = new RoomCategory(id, name, des);
                vector.add(im);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
        }
        return vector;
    }

    /**
     * get roomcategory by sql from roomcategory table
     *
     * @param getRoomCategori
     * @return
     * @throws Exception
     */
    @Override
    public RoomCategory getRoomCategori(String sql) throws Exception {
        ResultSet rs = null;
        try {
            rs = getData(sql);
            while (rs.next()) {
                int RoomcateID = rs.getInt(1);
                String Catename = rs.getString(2);
                String Note = rs.getString(3);
                return new RoomCategory(RoomcateID, Catename, Note);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResultSet(rs);
        }
        return null;
    }

    /**
     * get roomcategory by sql from roomcategory table
     *
     * @param getRoomCategori
     * @return
     * @throws Exception
     */
    @Override
    public void insertRoomCategory(String roomcatename, String roomcatedes) throws Exception {
        String query = "insert into CateRoom (Catename, [note]) \n"
                + "                values (?,?);";
        PreparedStatement pre = null;
        try {
            pre = conn.prepareStatement(query);
            pre.setString(1, roomcatename);
            pre.setString(2, roomcatedes);
            pre.execute();
        } catch (Exception e) {
            throw e;
        } finally {
            closePreparedStatement(pre);
        }
    }

    public int getPage(String sql) {
        int n = 0;
        try {
            int totalPage = 0;
            int countPage = 0;
            PreparedStatement pre = conn.prepareStatement(sql);
            ResultSet rs = getData(sql);
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
        }
        return n;
    }

    /**
     * Update update RoomCategory
     *
     * @param updateRoomCategory
     * @return
     * @throws Exception
     */
    @Override
    public void updateRoomCategory(String RoomCategoryid, String roomcatename, String roomcatedes) throws Exception {
        String query = "UPDATE [dbo].[CateRoom]\n"
                + "   SET [Catename] = ?\n"
                + "   ,[Note] = ?\n"
                + "   WHERE RoomcateID = ?";
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        try {
            pre = conn.prepareStatement(query);
            pre.setString(1, roomcatename);
            pre.setString(2, roomcatedes);
            pre.setString(3, RoomCategoryid);
            pre.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
    }

    /**
     * delete RoomCategory RoomCategory table
     *
     * @return
     * @throws Exception
     */
    @Override
    public void deleteRoomCategory(String roomcate) throws Exception {
        String query = "update Room set RoomcateID = replace(RoomcateID,?,6);\n"
                + "update Room set Status = replace(Status,0,1) where RoomcateID =? ; \n"
                + "delete from CateRoom where RoomcateID = ?";
        PreparedStatement pre = null;
        try {
            pre = conn.prepareStatement(query);
            pre.setString(1, roomcate);
            pre.setString(2, roomcate);
            pre.setString(3, roomcate);
            pre.executeUpdate();
            System.out.println("done");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        } finally {
            closePreparedStatement(pre);
            closeConnection(conn);
        }
    }

    /**
     * get count RoomcateID from RoomCategory table
     *
     * @return
     * @throws Exception
     */
    @Override
    public ArrayList< RoomCategory> numberOfRoomsByCategory() throws Exception {
        Connection conn = null;
        PreparedStatement pre = null;
        ResultSet rs = null;
        ArrayList<RoomCategory> listRoomCategory = new ArrayList<>();

        String sql = "select c.RoomcateID,c.Catename ,COUNT(r.RoomcateID) as count from CateRoom c inner join Room r on c.RoomcateID = r.RoomcateID \n"
                + "group by c.RoomcateID,c.Catename";
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {

                listRoomCategory.add(new RoomCategory(rs.getInt("RoomcateID"), rs.getString("Catename"), rs.getInt("count")));

            }
        } catch (Exception e) {
            throw e;
        } finally {
            closeResultSet(rs);
            closePreparedStatement(pre);
            closeConnection(conn);

        }
        return listRoomCategory;
    }

    /**
     * get count RoomcateID from RoomCategory table
     *
     * @param cateID
     * @return
     * @throws Exception
     */
    @Override
    public RoomCategory getRoomCate(int cateID) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        String sql = "select c.* from Room r inner join CateRoom c on r.RoomcateID = c.RoomcateID where r.RoomcateID=" + cateID;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            while (rs.next()) {
                return new RoomCategory(rs.getInt("RoomcateID"), rs.getString("Catename"));
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

}
