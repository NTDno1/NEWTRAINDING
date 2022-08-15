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
package listener;

import dao.ViewDAO;
import dao.impl.ViewDAOImpl;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author HieuLBM
 */
public class countViewPage implements HttpSessionListener {

    // chạy ngay sau khi phiên làm việc được tạo
    @Override
    public void sessionCreated(HttpSessionEvent se) {
            ViewDAO viewDAO = new ViewDAOImpl();
        if (se.getSession().isNew()) {

            try {
                viewDAO.updateView();
            } catch (Exception ex) {
                Logger.getLogger(countViewPage.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }
  // chạy ngay sau khi phiên làm việc hết hạn
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println("-1 View");
    }
}
