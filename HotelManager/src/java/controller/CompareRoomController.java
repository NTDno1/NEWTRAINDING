/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 15/07/2022    1.0        HieuLBM          Comment
 */
package controller;

import dao.ImageDAO;
import dao.RoomCategoryDAO;
import dao.RoomDAO;
import dao.impl.ImageDAOImpl;
import dao.impl.RoomCategoryDAOImpl;
import dao.impl.RoomDAOImpl;
import entity.Image;
import entity.Room;
import entity.RoomCategory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "CompareRoomController", urlPatterns = {"/CompareRoomController"})
public class CompareRoomController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *Search name room
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
            RoomCategoryDAO roomCategoryDAO = new RoomCategoryDAOImpl();
            String service = request.getParameter("do");
             /**
             * Service viewCompare: get a information room
             * compare.jsp
             */
            if (service.equalsIgnoreCase("viewCompare")) { 

                String RoomID = request.getParameter("roomid").trim();
                String cateroom = request.getParameter("cateroom").trim();
                int roomid = Integer.parseInt(RoomID);
                int cateid = Integer.parseInt(cateroom);
                  /*Get image by roomid*/
                Image img = imageDAO.searchRoomidAndImage(roomid);
                  /*Get room by roomid*/
                Room rooom = roomDAO.getOneRoom(roomid);
                /*Get roomCategory  by cateid*/
                RoomCategory roomCategory = roomCategoryDAO.getRoomCate(cateid);
                              
                request.setAttribute("Rooom", rooom);
                request.setAttribute("img", img);
                request.setAttribute("roomid", RoomID);
                request.setAttribute("cateid", cateid);
                request.setAttribute("roomCategory", roomCategory);
              
                request.getRequestDispatcher("compare.jsp").forward(request, response);

            }
            /**
             * Service searchRoomName: get list name of room
             * compare.jsp
             */
            if (service.equalsIgnoreCase("searchRoomName")) { 
                String name = request.getParameter("txt").trim();
                int RoomID = Integer.parseInt(request.getParameter("RoomID").trim());
                int cateID = Integer.parseInt(request.getParameter("cateID").trim());
                 /*Get search name by name room and cateID*/
               ArrayList<Room> listRoom = roomDAO.searchRoomNamebyAjax(name, cateID);

                PrintWriter out = response.getWriter();

                if (name.isEmpty()) {
                    out.print("");
                } else if (listRoom.isEmpty()) {
                    out.print("<p style=\"padding:20px\">Không tìm thấy kết quả cho từ khoá: <span style=\"color:red\">" + name + "</span><p>");
                } else {
                    out.print(" <div class=\"manufactury\">");
                    for (Room room : listRoom) {
                        Image image = imageDAO.searchRoomidAndImage(room.getRoomID());
                        if (room.getRoomID() != RoomID) {

                            out.print("  <li style=\"list-style: none\">\n"
                                    + "                                    <a href=\"CompareTwoController?do=CompareTwoRoom&Roomid=" + RoomID + "&Roomid1=" + room.getRoomID() + "&cateID=" + cateID + "\">  <span style=\"margin-left: 120px\">Tên Phòng:" + room.getRoomname() + "</span> </a><br>\n"
                                    + "                                    <a href=\"CompareTwoController?do=CompareTwoRoom&Roomid=" + RoomID + "&Roomid1=" + room.getRoomID() + "&cateID=" + cateID + "\"> <img src=\"images/anhphong/" + image.getImage1() + "\" style=\"width: 100px; height: 100px\"></a>   <a href=\"CompareTwoController?do=CompareTwoRoom&Roomid=" + RoomID + "&Roomid1=" + room.getRoomID() + "&cateID=" + cateID + "\"><span style=\"margin-left: 15px\" >Tiền:" + room.getRoomprice() + "</span></a> <br>\n"
                                    + "\n"
                                    + "                                    <a href=\"CompareTwoController?do=CompareTwoRoom&Roomid=" + RoomID + "&Roomid1=" + room.getRoomID() + "&cateID=" + cateID + "\"><span style=\"margin-left: 240px\">Thêm vào so sánh</span></a> <br>  \n"
                                    + "        \n"
                                    + "                                </li> ");
                        } else {
                            out.print("  <li style=\"list-style: none\">\n"
                                    + "                                      <span style=\"margin-left: 120px\">Tên Phòng:" + room.getRoomname() + "</span> <br>\n"
                                    + "                                     <img src=\"images/anhphong/" + image.getImage1() + "\" style=\"width: 100px; height: 100px\">  <span style=\"margin-left: 15px\" >Tiền:" + room.getRoomprice() + "</span> <br>\n"
                                    + "\n"
                                    + "                                    <span style=\"margin-left: 240px\">Không thể so sánh</span><br>  \n"
                                    + "          \n"
                                    + "                                </li> ");
                        }
                    }

                    out.print(" </div >");
                }

            }

        } catch (Exception ex) {
            Logger.getLogger(CompareRoomController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CompareRoomController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(CompareRoomController.class.getName()).log(Level.SEVERE, null, ex);
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
