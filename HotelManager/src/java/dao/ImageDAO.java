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
package dao;

import entity.Image;
import java.util.Vector;

/**
 * Lớp này chứa các interface của ImageDAOImpl
 *
 * @author
 */
public interface ImageDAO {

    public Vector<Image> getImageByid(String Roomid);

    public void insertImage(int riID, Image insertImage);

    public void updateImage(int riID, Image updateImage);

    public void deleteImage(int riID);

    public Vector<Image> selectImage(String sql);

    public Image imageByID(String sql);
    
      /**
     * get list a image from Image table
     *
     * @param RoomID is a <code>Image</code> object
     * @throws java.lang.Exception
     */

    public Image searchRoomidAndImage(int RoomID) throws Exception;
          /**
     * get list a image from Image table
     *
     * @param des,Notes is a <code>Image</code> object
     * @throws java.lang.Exception
     */
    public void crudRoom(String sql, String des, String Notes) throws Exception;
}
