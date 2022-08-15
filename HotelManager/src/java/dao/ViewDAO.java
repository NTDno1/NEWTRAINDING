/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 * 16/07/2022    1.0        HieuLBM          First Deploy         
 * 16/07/2022    1.0        HieuLBM          Comment
 */
package dao;

/**
 * Lớp này chứa các interface của ViewDAOImpl
 *
 * @author HieuLBM
 */
public interface ViewDAO {
    
    /**
     * update View when a session is created
     *
     * @return number of lines changed. It is a <code>int</code>
     * @throws java.lang.Exception
     */
    public int updateView() throws Exception;
    
      /**
     * check if current date view exist
     *
     * @return <code>boolean</code>
     * @throws java.lang.Exception
     */
    public boolean checkCurrentDateViewExist() throws Exception;
    
     /**
     * get total view count
     *
     * @return <code>int</code>
     * @throws java.lang.Exception
     */
    public int getTotalView() throws Exception;
    
    
}
