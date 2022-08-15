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
package controller;

import dao.ImageDAO;
import dao.RoomDAO;
import dao.impl.ImageDAOImpl;
import dao.impl.RoomDAOImpl;
import entity.Image;
import entity.Room;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Minh Hiếu
 */
@WebServlet(name = "CompareTwoController", urlPatterns = {"/CompareTwoController"})
public class CompareTwoController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods. Compare two room
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try {
            RoomDAO roomDAO = new RoomDAOImpl();
            ImageDAO imageDAO = new ImageDAOImpl();
            String service = request.getParameter("do");
            /**
             * Service compareTwoRoom: get two room compareFinal.jsp
             */
            if (service.equalsIgnoreCase("compareTwoRoom")) {
                int RoomID = Integer.parseInt(request.getParameter("Roomid").trim());
                int RoomID1 = Integer.parseInt(request.getParameter("Roomid1").trim());
                int cateID = Integer.parseInt(request.getParameter("cateID").trim());
                /*Get image by RoomID*/
                Image img = imageDAO.searchRoomidAndImage(RoomID);
                /*Get image by RoomID1*/
                Image img1 = imageDAO.searchRoomidAndImage(RoomID1);
                /*Get room by RoomID*/
                Room rooom = roomDAO.getOneRoom(RoomID);
                /*Get room by RoomID1*/
                Room rooom1 = roomDAO.getOneRoom(RoomID1);

                request.setAttribute("Rooom", rooom);
                request.setAttribute("Rooom1", rooom1);
                request.setAttribute("img", img);
                request.setAttribute("img1", img1);
                request.setAttribute("cateid", cateID);

                request.getRequestDispatcher("compareFinal.jsp").forward(request, response);

            }

        } catch (Exception ex) {
            Logger.getLogger(CompareTwoController.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CompareTwoController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CompareTwoController.class.getName()).log(Level.SEVERE, null, ex);
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
    }// </editor-fold>

}
