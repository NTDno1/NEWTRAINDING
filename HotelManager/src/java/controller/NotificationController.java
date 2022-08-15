/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 18/07/2022    1.0        HuyTQ            Comment
 *               1.1       
 */
package controller;

import dao.impl.AccountDAOImpl;
import dao.impl.NotificationDAOImpl;
import entity.Account;
import entity.Notification;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * Tran Quang Huy
 */
@WebServlet(name = "NotificationController", urlPatterns = {"/NotificationController"})
/**
 * This class Receptionist
 *
 * @author HuyTQ
 */
public class NotificationController extends HttpServlet {
 /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods. Get list notification, delete and sent notification
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            NotificationDAOImpl daoN =new NotificationDAOImpl();
            AccountDAOImpl daoA =new AccountDAOImpl();
            String service = request.getParameter("do");
            if (service == null) {
                service = "HomeNotification";

            }
             /**
             * Service HomeNotification: get all notification to load the page 
             * Notification.jsp
             */
            if (service.equals("HomeNotification")) { // Print out all notices
                 /*get list notification*/
                ArrayList<Notification> list =daoN.getAllNotification();
                ArrayList<Account> listA =daoA.getAccountList();
                request.setAttribute("list", list);
                request.setAttribute("listA", listA);
                request.getRequestDispatcher("Notification.jsp").forward(request, response);
            } 
             /**
             * Service Delete: remove notification and reload the page 
             * page NotificationController
             */
            if (service.equals("Delete")) { // Remove notifications
                int nID=Integer.parseInt(request.getParameter("nID").toString());
                daoN.deleteNotification(nID);
                response.sendRedirect("NotificationController");
            }             
            /**
             * Service SentMessage: sent message to receptionist and reload the page 
             * page NotificationController
             */
            if (service.equals("SentMessage")) {// send a message to the front desk
                LocalDateTime current = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
                String formatted = current.format(formatter);
                String nameuser =request.getParameter("NameRe");
                String title =request.getParameter("title");
                String content =request.getParameter("content").trim();
                if (!title.equals("") && !content.equals("")) {
                daoN.insertMessageadmin(new Notification(title, nameuser, content, formatted));
                response.sendRedirect("NotificationController");
                }else{
                    response.sendRedirect("NotificationController");
                }
            } 
        }catch(Exception ex){
            Logger.getLogger(NotificationController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMess", ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
