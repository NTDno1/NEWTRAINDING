/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 
 */
package dao;

import entity.FeedBackService;
import entity.Service;
import java.util.Vector;

public interface ServiceDAO {
    /**
     * Get all Service from database
     *
     * @return list service <code>Service</code> objects
     * <code>java.util.Vector</code> object
     * @throws java.lang.Exception
     */
    public Vector<Service> getServiceList() throws Exception;
    /**
     * Get Service from database
     *
     * @return a list of <code>Service</code> objects
     * <code>java.util.Vector</code> object
     * @throws java.lang.Exception
     */
    public Vector<Service> getServiceListbyran() throws Exception;
    /**
     * Get Service from database
     * @throws java.lang.Exception
     */
    public Service getServicedetail(String sid) throws Exception;
    /**
     * Get Service detail from database
     * @throws java.lang.Exception
     */
    public void insertService(String ServiceName, String ServiceImage, String ServiceDes, String ServicePrice) throws Exception;
    /**
     * Insert Service from database
     * @throws java.lang.Exception
     */
    public void updateService(String ServiceName, String ServiceImage, String ServiceDes, String ServicePrice, String ServiceID) throws  Exception;
    /**
     * Update Service from database
     * @throws java.lang.Exception
     */
    public void deleteService(String sql) throws Exception;
    /**
     * Delete Service from database
     * @throws java.lang.Exception
     */
    public Vector<FeedBackService> getFeedBackBySeviceID(String Sql) throws Exception;
    /**
     * Get all Blog from database
     * @return a list of <code>FeedBackService</code> objects
     * <code>java.util.FeedBackService</code> object
     * @throws java.lang.Exception
     */
    public void insertCommentService(String ServiceID, String AccountID, String Comment) throws Exception;
        /**
     * InsertCommnet from database
     * @throws java.lang.Exception
     */
    public void BlockComnent(String CommentID) throws Exception;
        /**
     * block comment from database
     * @throws java.lang.Exception
     */
    public void UnblockComment(String CommentID) throws Exception;
        /**
     * Unblock comment from database
     *
     * @return a list of <code>Service</code> objects
     * @throws java.lang.Exception
     */
    public Service getLastService()  throws Exception;
}
