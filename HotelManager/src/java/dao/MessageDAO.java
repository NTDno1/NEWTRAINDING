/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 13/07/2022    1.0        HuyTQ            Comment
 */
package dao;

import entity.Message;
import java.util.ArrayList;

/**
 * Lớp này chứa các interface của MessageDAOImpl
 *
 * @author HuyTQ
 */
public interface MessageDAO {
    
    /**
     * Get list all message from database
     *
     * @return a list of <code>Account</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    public ArrayList<Message> getAllComment() throws Exception;
    
    /**
     * Get list message by name from database
     *
     * @param mName is an String
     * @return a list of <code>Message</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    public ArrayList<Message> getCommentByName(String mName) throws Exception;
    
    /**
     * Get all Account sent message from database
     *
     * @return a list of <code>Integer</code> objects. It is a
     * <code>java.util.ArrayList</code> object
     * @throws java.lang.Exception
     */
    public ArrayList<Integer> getAllAcccountMessage() throws Exception;
    
    /**
     * add message of customer in Message table of database
     *
     * @param mess is a Message abject
     * @return Integer
     * @throws java.lang.Exception
     */
    public int insertMessageCus(Message mess) throws Exception;
    
    /**
     * add new message if receptionist not yet seen in Message table of database
     *
     * @param mess is a Message abject
     * @return Integer
     * @throws java.lang.Exception
     */
    public int insertNewmessagecus(Message mess) throws Exception;
    
    /**
     * add feedback in Message table of database
     *
     * @param mess is a Message abject
     * @return Integer
     * @throws java.lang.Exception
     */
    public int insertFeedback(Message mess) throws Exception;
    
    /**
     * add message of receptionist in Message table of database
     *
     * @param mess is a Message abject
     * @return Integer
     * @throws java.lang.Exception
     */
    public int insertMessageRe(Message mess) throws Exception;
    
    /**
     * get roleID by userID from database
     *
     * @param userID is Integer
     * @return Integer
     * @throws java.lang.Exception
     */
    public int getRoleIDByUserId(int userID) throws Exception;
    
    /**
     * delete a message from the Message table
     *
     * @param mID is an Integer
     * @throws java.lang.Exception
     */
    public void deleteMessage(int mID) throws Exception;
    
    /**
     * Check message seen is a new message
     *
     * @param AccountID is Integer
     * @return true/false.
     * @throws java.lang.Exception
     */
    public boolean checkNewmessage(int AccountID) throws Exception;
    
    /**
     * Change status new message become old message
     *
     * @param AccountID is Integer
     * @throws java.lang.Exception
     */
    public void resetNewmessage(int AccountID) throws Exception;
}
