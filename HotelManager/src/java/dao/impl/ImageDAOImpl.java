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

import dao.ImageDAO;
import entity.Image;
import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

/**
 * The class has methods needed for initialize connection with database and
 * execute queries with Image and associate tables
 *
 * @author
 */
public class ImageDAOImpl extends DBContext implements ImageDAO {

    @Override
    public Vector<Image> getImageByid(String Roomid) {
        String sql = "select i.RoomimgaeID, i.image1 , i.image2 ,i.image3 ,i.image4  from Image i join Room r on r.RoomimgaeID = i.RoomimgaeID where r.RoomimgaeID = ?";
        Vector<Image> vector = new Vector<Image>();
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, Roomid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String image1 = rs.getString(2);
                String image2 = rs.getString(3);
                String image3 = rs.getString(4);
                String image4 = rs.getString(5);

                Image im = new Image(id, image1, image2, image3, image4);
                vector.add(im);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;

    }

    public static void main(String[] args) {
        ImageDAOImpl dao = new ImageDAOImpl();
//        Vector<Image> vector = dao.getImageByid("1");
        Image img = dao.imageByID("select * from [image] join Room on [Image].RoomimgaeID = Room.RoomcateID where RoomID = 1");
//        dao.crudImage("UPDATE [dbo].[Image]\n"
//                + " SET [image1] = 'abc'\n"
//                + "      ,[image2] = 'abc'\n"
//                + "      ,[image3] = 'abc'\n"
//                + "      ,[image4] = 'abc'\n"
//                + " WHERE RoomimgaeID= 33");
//        for (Image image : vector) {
        System.out.println(img);
//        }
    }

    @Override
    public void insertImage(int riID, Image insertImage) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void updateImage(int riID, Image updateImage) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void deleteImage(int riID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Vector<Image> selectImage(String sql) {
        Vector<Image> vector = new Vector<Image>();
        try {
            ResultSet rs = getData(sql);
            while (rs.next()) {
                int roomid = rs.getInt(1);
                String image1 = rs.getString(2);
                String image2 = rs.getString(2);
                String image3 = rs.getString(2);
                String image4 = rs.getString(2);
                Image im = new Image(roomid, image1, image2, image3, image4);
                vector.add(im);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return vector;
    }

    @Override
    public Image imageByID(String sql) {
        try {
            ResultSet rs = getData(sql);
            while (rs.next()) {
                int roomid = rs.getInt(1);
                String image1 = rs.getString(2);
                String image2 = rs.getString(3);
                String image3 = rs.getString(4);
                String image4 = rs.getString(5);
                return new Image(roomid, image1, image2, image3, image4);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    /**
     * Insert Room from Image Room
     *
     * @param des,Notes
     * @throws Exception
     */
    @Override
    public void crudRoom(String sql, String des, String Notes) throws Exception {
        PreparedStatement pre = null;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, des);
            pre.setString(2, Notes);
            pre.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closePreparedStatement(pre);
            closeConnection(conn);

        }
    }

    public void crudImage1(String sql, String title, String BlogDescription, String BlogAuthor) {
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, title);
            pre.setString(2, BlogDescription);
            pre.setString(3, BlogAuthor);
            pre.executeUpdate();
            System.out.println("done");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * get list a image from Image table
     *
     * @param RoomID
     * @throws Exception
     */
    @Override
    public Image searchRoomidAndImage(int RoomID) throws Exception {
        Connection conn = null;
        /* Prepared statement for executing sql queries */
        PreparedStatement pre = null;
        /* Result set returned by the sqlserver */
        ResultSet rs = null;

        String sql = "select i.image1,i.image2,i.image3,i.image4 from [Image] i inner join [Room] r on i.RoomimgaeID = r.RoomimgaeID\n"
                + "where r.RoomID=" + RoomID;
        try {
            conn = getConnection();
            pre = conn.prepareStatement(sql);
            rs = pre.executeQuery();
            if (rs.next()) {
                return new Image(rs.getString("image1"), rs.getString("image2"), rs.getString("image3"), rs.getString("image4"));
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
