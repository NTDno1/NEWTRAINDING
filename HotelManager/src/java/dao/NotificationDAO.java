/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 14/07/2022    1.0        HuyTQ            Comment
 */
package dao;

import entity.Notification;
import java.util.ArrayList;

/**
 * Lớp này chứa các interface của NotificationDAOImpl
 *
 * @author HuyTQ
 */
public interface NotificationDAO {
    
    /**
     * add notification from the Notification table
     *
     * @param n is an <code>Notification</code> object
     * @throws java.lang.Exception
     */
    public void insertNotification(Notification n) throws Exception;
    
    /**
     * add notification of admin from the Notification table
     *
     * @param n is an <code>Notification</code> object
     * @throws java.lang.Exception
     */
    public void insertMessageadmin(Notification n) throws Exception;
    
    /**
     * delete a notification from the Notification table
     *
     * @param nID is an Integer
     * @throws java.lang.Exception
     */
    public void deleteNotification(int nID) throws Exception;
    
    /**
     * Get list all notification from database
     *
     * @return a list of <code>Notification</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    public ArrayList<Notification> getAllNotification() throws Exception;
    
    /**
     * Get list all notification by name account of receptionist from database
     *
     * * @param Notification is a <code>Notification</code> object
     * @return a list of <code>Notification</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    public ArrayList<Notification> getMessagedmin(String nameAccount) throws Exception;
    
}
