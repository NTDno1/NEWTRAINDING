
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

import dao.impl.MessageDAOImpl;
import entity.Account;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MessageController", urlPatterns = {"/MessageController"})
/**
 * This class Message
 *
 * @author HuyTQ
 */
public class MessageController extends HttpServlet {

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
            throws ServletException, IOException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            MessageDAOImpl dao = new MessageDAOImpl();
            String service = request.getParameter("do");
            if (service == null) {
                service = "Viewchatbox";
            }
            /**
             * Service Viewchatbox: get message by account to load the page
             * ViewChatbox.jsp
             */
            if (service.equals("Viewchatbox")) {   //Print out the latest 1 person's messages                
                Account a = (Account) session.getAttribute("login");
                if (a.getRoleID() == 1) {
                    request.setAttribute("accountid", a.getAccountID());
                    request.getRequestDispatcher("ViewChatbox.jsp").forward(request, response);
                } else {
                    ResultSet rs = dao.getData("select distinct top(1) AccountID from Message where RoomID=0");
                    while (rs.next()) {
                        request.setAttribute("accountid", rs.getInt(1));
                    }
                    request.getRequestDispatcher("ViewChatbox.jsp").forward(request, response);
                }
            }
            /**
             * Service SearchChatCustomer: get message first to load the page
             * ViewChatbox.jsp page MessageController
             */
            if (service.equals("SearchChatCustomer")) { // Print out the message by the customer's name
                String name = request.getParameter("name");
                if (!name.isEmpty()) {
                    ResultSet rs = dao.getData("select u.* from Account a join [User] u\n"
                            + "on a.AccountID=u.AccountID\n"
                            + "where u.UserName like '%" + name + "%' and a.RoleID=1");
                    request.setAttribute("accountid", 1);
                    request.setAttribute("found", "");
                    request.setAttribute("rs", rs);
                    request.getRequestDispatcher("ViewChatbox.jsp").forward(request, response);
                } else {
                    response.sendRedirect("MessageController");
                }
            }
            /**
             * Service Search_Chat_people: get Account have message to load the
             * page ViewChatbox.jsp
             */
            if (service.equals("Search_Chat_people")) {// Print out the customers who have texted with the front desk
                request.setAttribute("accountid", Integer.parseInt(request.getParameter("accountid")));
                System.out.println(request.getParameter("accountid"));
                ResultSet rs = dao.getData("select u.* from Account a join [User] u\n"
                        + "on a.AccountID=u.AccountID\n"
                        + "where u.AccountID=" + Integer.parseInt(request.getParameter("accountid")));
                request.setAttribute("accountid", Integer.parseInt(request.getParameter("accountid")));
                request.setAttribute("found", "");
                request.setAttribute("rs", rs);
                request.getRequestDispatcher("ViewChatbox.jsp").forward(request, response);
            }
            /**
             * Service Chat_people: target Account to load message to the page
             * ViewChatbox.jsp
             */
            if (service.equals("Chat_people")) {// Print out the message according to the right customer
                request.setAttribute("accountid", Integer.parseInt(request.getParameter("accountid")));
                dao.resetNewmessage(Integer.parseInt(request.getParameter("accountid")));
                request.setAttribute("showmess", "");
                request.getRequestDispatcher("ViewChatbox.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(MessageController.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("errorMess", ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(MessageController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(MessageController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
