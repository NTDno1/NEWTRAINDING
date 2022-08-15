/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 14/07/2022    1.0        HieuLBM          Comment
 */
package entity;

/**
 * @author This class represents the RoleName table in database
 */
public class RoleName {

    /* Role Id */
    private int RoleID;
    /*Role name*/
    private String RoleName;

    /**
     * Blank Constructor
     */
    public RoleName() {
    }

    /**
     * Complete Constructor
     *
     * @param RoleID
     * @param RoleName
     */
    public RoleName(int RoleID, String RoleName) {
        this.RoleID = RoleID;
        this.RoleName = RoleName;
    }
}
