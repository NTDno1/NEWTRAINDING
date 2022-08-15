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

import entity.RoleName;
import java.util.Vector;

public interface RoleNameDAO {
      public Vector<RoleName> getAllRoleName();
}
