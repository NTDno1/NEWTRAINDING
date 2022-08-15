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

import entity.RoomCategory;
import java.util.ArrayList;
import java.util.Vector;

/**
 * Lớp này chứa các interface của RoomCategoryDAOImpl
 *
 * @author
 */
public interface RoomCategoryDAO {

    /**
     * get list RoomCategory
     *
     * @return <code>Vector<RoomCategory></code> object.
     * @throws java.lang.Exception
     */
    public Vector<RoomCategory> getRoomCategoryList(String sql) throws Exception;
    /**
     * get RoomCategory
     *
     * @return <code>Object<RoomCategory></code> object.
     * @throws java.lang.Exception
     */ 
    public RoomCategory getRoomCategori(String sql) throws Exception;
    /**
     * Insert RoomCategory
     */ 
    public void insertRoomCategory(String roomcatename, String roomcatedes) throws Exception;
    /**
     * Update RoomCategory
     */ 
    public void updateRoomCategory(String RoomCategoryid, String roomcatename, String roomcatedes) throws Exception;
    /**
     * Delete RoomCategory
     */ 
    public void deleteRoomCategory(String roomcate) throws Exception;

    /**
     * get count RoomcateID from RoomCategory table
     *
     * @return <code>ArrayList<RoomCategory></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<RoomCategory> numberOfRoomsByCategory() throws Exception;

    /**
     * get count RoomcateID from RoomCategory table
     *
     * @param cateID is an <code>RoomCategory</code> object.
     * @return <code>ArrayList<RoomCategory></code> object.
     * @throws java.lang.Exception
     */

    public RoomCategory getRoomCate(int cateID) throws Exception;
}
