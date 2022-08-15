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

import entity.RequestMessage;
import java.util.ArrayList;

/**
 * Lớp này chứa các interface của MessageRequestDAOImpl
 *
 * @author HieuLBM
 */
public interface RequestMessageDAO {

    /**
     * get a list request from the MessageRequest table
     *
     * @return <code>ArrayList<RequestMessage></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<RequestMessage> getMessage() throws Exception;

    /**
     * get a list unread request from the MessageRequest table
     *
     * @return <code>ArrayList<RequestMessage></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<RequestMessage> getMessageUnread() throws Exception;

    /**
     * add request from the MessageRequest table
     *
     * @param message is an <code>RequestMessage</code> object
     * @throws java.lang.Exception
     */
    public void insert(RequestMessage message) throws Exception;

    /**
     * update request from the MessageRequest table
     *
     * @param id is an int
     * @param isRead is an int
     * @return int
     * @throws java.lang.Exception
     */
    public int updateRead(int id, String isRead) throws Exception;

    /**
     * get a request from the MessageRequest table
     *
     * @param Id is an <code>RequestMessage</code> object
     * @return <code>RequestMessage</code> object
     * @throws java.lang.Exception
     */
    public RequestMessage getMessageById(int Id) throws Exception;

    /**
     * delete a request from the MessageRequest table
     *
     * @param id is an int
     * @throws java.lang.Exception
     */
    public void delete(int id) throws Exception;

    /**
     * get paging from the MessageRequest table
     *
     * @param index is an <code>RequestMessage</code> object
     * @return <code>ArrayList<RequestMessage></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<RequestMessage> pagingMessage(int index) throws Exception;

    /**
     * get paging and search from the MessageRequest table
     *
     * @param index is an <code>RequestMessage</code> object
     * @param title is an <code>RequestMessage</code> object
     * @return <code>ArrayList<RequestMessage></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<RequestMessage> searchName(int index, String title) throws Exception;

    /**
     * get search from the MessageRequest table
     *
     * @param title is an <code>RequestMessage</code> object
     * @return <code>ArrayList<RequestMessage></code> object.
     * @throws java.lang.Exception
     */
    public ArrayList<RequestMessage> getMessageOfTitle(String title) throws Exception;

}
