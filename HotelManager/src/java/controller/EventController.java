/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 24/07/2022    1.0        HieuHT           Comment
 */
package controller;

import context.DBContext;
import dao.impl.EventsDAOImpl;
import entity.Events;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.Vector;
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
 * @author admin
 */
@WebServlet(name = "EventController", urlPatterns = {"/EventController"})
public class EventController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
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
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("do");
            HttpSession session = request.getSession();
            DBContext db = new DBContext();
            EventsDAOImpl dao = new EventsDAOImpl();
            if (service == null) {
                Vector<Events> vector = dao.getEventsList();
                request.setAttribute("vector", vector);
                request.getRequestDispatcher("events.jsp").forward(request, response);
            }
            if (service.equals("getEvent")) {
                String id = request.getParameter("id");
                String userid = request.getParameter("userid");
                int n = dao.updateEvents(Integer.parseInt(id));
                int a = 0;
                ResultSet rs = db.getData("select * from [Events] where EventID=" + id);
                if (rs.next()) {
                    a = rs.getInt(7);
                }
                if (a <= 0) {
                    rs = db.getData("delete [Events] where EventID=" + id);
                }
                rs = db.getData("INSERT INTO [SWPgroup3].[dbo].[EventsDetails]\n"
                        + "           ([EventID],[UserID])VALUES("+id+","+userid+")");
                Vector<Events> vector = dao.getEventsList();
                request.setAttribute("vector", vector);
                request.getRequestDispatcher("events.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(EventController.class.getName()).log(Level.SEVERE, null, ex);
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
