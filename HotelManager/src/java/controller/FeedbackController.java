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
import dao.impl.MessageDAOImpl;
import dao.impl.NotificationDAOImpl;
import dao.impl.UserDAOImpl;
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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "FeedbackController", urlPatterns = {"/FeedbackController"})
/**
 * This class Feedback, Message
 *
 * @author HuyTQ
 */
public class FeedbackController extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods. Get list message and list message by name customer
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
            NotificationDAOImpl daoN=new NotificationDAOImpl();
            MessageDAOImpl dao =new MessageDAOImpl();
            UserDAOImpl dao1 =new UserDAOImpl();
            AccountDAOImpl dao2 =new AccountDAOImpl();
            String service = request.getParameter("do");
            HttpSession session = request.getSession();
            if (service == null) {
                service = "Viewfeedback";
            }
             /**
             * Service Viewfeedback: get the feedback to load the page 
             * managerFeedback.jsp
             */
            if (service.equals("Viewfeedback")) { //Print out all comments
                ArrayList vector =dao.getAllComment();
                ArrayList listAccount =dao2.getAccountList(); 
                request.setAttribute("vector", vector);
                request.setAttribute("listAccount", listAccount);
                request.getRequestDispatcher("managerFeedback.jsp").forward(request, response);
            }
            /**
             * Service Deletefeedback: remove the feedback and reload the page
             * page FeedbackController
             */
            if (service.equals("SearchName")) { //Report the account with bad comments
                String name=request.getParameter("Name");
                ArrayList vector =dao.getCommentByName(name);
                ArrayList listAccount =dao2.getAccountList(); 
                request.setAttribute("vector", vector);
                request.setAttribute("listAccount", listAccount);
                request.getRequestDispatcher("managerFeedback.jsp").forward(request, response);
            }
            /**
             * Service Deletefeedback: remove the feedback and reload the page
             * page FeedbackController
             */
            if (service.equals("Deletefeedback")) { //Delete comment
                Account a=(Account)session.getAttribute("login");
                String content = request.getParameter("content").trim();
                String aid = request.getParameter("aID");
                LocalDateTime current = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
                String formatted = current.format(formatter);
                daoN.insertNotification(new Notification("Xóa feedback của Account", a.getUser(), aid, content, formatted));
                int mid =Integer.parseInt(request.getParameter("mID").toString());
                dao.deleteMessage(mid);
                response.sendRedirect("FeedbackController");
            }
            /**
             * Service ReportAccount: report account have feedback bad and reload the page
             * page FeedbackController
             */
            if (service.equals("ReportAccount")) { //Report the account with bad comments
                Account a=(Account)session.getAttribute("login");
                String aId = request.getParameter("aID").toString();
                String mId = request.getParameter("mID").toString();
                String content = request.getParameter("content").trim();
                LocalDateTime current = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
                String formatted = current.format(formatter);
                daoN.insertNotification(new Notification("Report tài khoản", a.getUser(), aId, content, formatted));
                int mid =Integer.parseInt(aId);
                int aid =Integer.parseInt(mId);                
                Cookie aID = new Cookie(request.getParameter("aID"), request.getParameter("mID"));
                aID.setMaxAge(60 * 60 * 24 * 7);
                response.addCookie(aID);
                response.sendRedirect("FeedbackController");
            }
            /**
             * Service ExitReport: remove report account
             * page FeedbackController
             */
            if (service.equals("ExitReport")) {//Remove account report
               Account a=(Account)session.getAttribute("login");
                String aId = request.getParameter("aID").toString();
                String mId = request.getParameter("mID").toString();
                String content = "Tài khoản đã được gỡ report và bạn có thể feedback trở lại trong thời gian tới";
                LocalDateTime current = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
                String formatted = current.format(formatter);
                daoN.insertNotification(new Notification("Gỡ report của Account", a.getUser(), aId, content, formatted));
                int mid =Integer.parseInt(request.getParameter("mID").toString());
                int aid =Integer.parseInt(request.getParameter("aID").toString());    
                Cookie aID = new Cookie(request.getParameter("aID"), request.getParameter("mID"));
                aID.setMaxAge(0);
                response.addCookie(aID);
                response.sendRedirect("FeedbackController");
            }
             /**
             * Service Admin Notification: get message of admin to load the page
             * NotificationofAdmin.jsp
             */
            if (service.equals("Admin")) {// Print out the admin's messages to the front desk
                Account a =(Account)session.getAttribute("login");
                ArrayList<Notification> list =daoN.getMessagedmin(a.getUser());
                request.setAttribute("list", list);
                request.getRequestDispatcher("NotificationofAdmin.jsp").forward(request, response);
            } 
            /**
             * Service Sent Admin Notification: sent message to admin and reload the page
             * page FeedbackController?do=Admin
             */
            if (service.equals("SentAdmin")) {// Send a message from reception to admin
                Account a=(Account)session.getAttribute("login");
                 LocalDateTime current = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
                String formatted = current.format(formatter);
                String title =request.getParameter("title");
                String content =request.getParameter("content").trim();
                if (!title.equals("") && !content.equals("")) {
                    daoN.insertNotification(new Notification("Gửi tin nhắn đến Admin", a.getUser(), "Với", content, formatted));
                    response.sendRedirect("FeedbackController?do=Admin");
                }else{
                    response.sendRedirect("FeedbackController?do=Admin");
                }
            }
        }catch (Exception ex) {
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
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
