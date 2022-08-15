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
package dao;

import entity.Events;
import java.util.ArrayList;
import java.util.Vector;

/**
 *
 * @author admin
 */
public interface EventsDAO {

    /**
     * Get list events from database
     *
     * @return a list of <code>Events</code> objects. It is a
     * <code>Vector</code> object
     * @throws java.lang.Exception
     */
    public Vector<Events> getEventsList() throws Exception;

    /**
     * add new event in Events table of database
     *
     * @param event is a Events abject
     * @throws java.lang.Exception
     */
    public void insertEvents(Events event) throws Exception;

    /**
     * add update event in Events table of database
     * @param  id is a int
     * @return int
     * @throws java.lang.Exception
     */
    public int updateEvents(int id) throws Exception;

    /**
     * delete event in Events table of database
     *
     * @param id is a Events abject
     * @throws java.lang.Exception
     */
    public void deleteEvents(int id) throws Exception;

}
