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
package controller;

import dao.impl.RoomCategoryDAOImpl;
import dao.impl.RoomDAOImpl;
import entity.Room;
import entity.RoomCategory;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Admin
 */
@WebServlet(name = "RoomcategoryController", urlPatterns = {"/RoomcategoryController"})
public class RoomcategoryController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String doo = request.getParameter("do");
            RoomCategoryDAOImpl roomcatedao = new RoomCategoryDAOImpl();
            RoomDAOImpl roomdao = new RoomDAOImpl();
            if (doo.equals(null) || doo.equals("")) {
                response.sendRedirect("Filter.jsp");
            }
            /**
             * RoomCategry get all RoomCategory : response to editroomdevice.jsp
             * editroomdevice.jsp
             */
            if (doo.equals("getroombycategori")) {
                /*Get all RoomCategory*/
                Vector<RoomCategory> romcate = roomcatedao.getRoomCategoryList("select * from CateRoom");
                request.setAttribute("romcate", romcate);
                request.getRequestDispatcher("editroomdevice.jsp").forward(request, response);
            }
            /**
             * RoomCategry Delete RoomCategori : response to editroomdevice.jsp
             * editroomdevice.jsp
             */
            if (doo.equals("DeleteRoomCategori")) {
                String cateroom = request.getParameter("cateroomid");
                int ID = Integer.parseInt(cateroom);
                if (ID == 6) {
                    request.setAttribute("Wrong", 2);
                    request.getRequestDispatcher("RoomcategoryController?do=getroombycategori").forward(request, response);
                } else {
                    request.setAttribute("Wrong", 1);
                    /*Delete RoomCategory*/
                    roomcatedao.deleteRoomCategory(cateroom);
                    request.getRequestDispatcher("RoomcategoryController?do=getroombycategori").forward(request, response);
                }
            }
            /**
             * Get List Room by roomcategory : response to AdListRom.jsp
             * AdListRom.jsp
             */
            if (doo.equals("listroombycate")) {
                String cateroom = request.getParameter("cateroomid");
                String cate;
                if (cateroom == null) {
                    cateroom = "1";
                    cate = "";
                } else {
                    cate = "(Room.RoomcateID=" + cateroom + ") and";
                }
                /*Get list room By RoomCategory*/
                Vector<Room> listroom
                        = roomdao.getRoomList1("select * from room  join CateRoom  on Room.RoomcateID = CateRoom.RoomcateID join [Image] on Room.RoomimgaeID = [Image].RoomimgaeID\n"
                                + "                             	where " + cate + " (Roomdesc like'%" + "" + "%' or Roomprice like'%" + "" + "%') \n"
                                + "                               	order by Room.RoomID asc");
                request.setAttribute("listroom", listroom);
                request.getRequestDispatcher("AdListRom.jsp").forward(request, response);
            }
            /**
             * Update roomcategory : response to updateroomcate.jsp
             * updateroomcate.jsp
             */
            if (doo.equals("updateroomcates")) {
                String cateroom = request.getParameter("cateroomid");
                /*Get Roomcategory By RoomCategoryID*/
                RoomCategory roomcate = roomcatedao.getRoomCategori("select * from CateRoom where RoomcateID = " + cateroom + "");
                request.setAttribute("roomcate", roomcate);
                HttpSession sesson = request.getSession();
                sesson.setMaxInactiveInterval(1 * 1);
                sesson.setAttribute("update", "update");
                request.getRequestDispatcher("updateroomcate.jsp").forward(request, response);
            }
            /**
             * Update roomcategory : response to updateroomcate.jsp
             * updateroomcate.jsp
             */
            if (doo.equals("udroomcate")) {
                String RoomCateName = request.getParameter("RoomCateName");
                String Note = request.getParameter("Note");
                String RoomCateId = request.getParameter("RoomCateId");
                /*Update RoomCategory by roomcateid*/
                roomcatedao.updateRoomCategory(RoomCateId, RoomCateName.replaceAll("\\s\\s+", " ").trim(), Note.replaceAll("\\s\\s+", " ").trim());
                request.setAttribute("insert", "insert");
                request.getRequestDispatcher("RoomcategoryController?do=updateroomcates&cateroomid=" + RoomCateId + "").forward(request, response);
            }
            /**
             * Insert roomcategory : response to updateroomcate.jsp
             * updateroomcate.jsp
             */
            if (doo.equals("insetroomcate")) {
                String RoomCateName = request.getParameter("RoomCateName");
                String Note = request.getParameter("Note");
                /*Insert RoomCategory by roomcateid*/
                roomcatedao.insertRoomCategory(RoomCateName.replaceAll("\\s\\s+", " ").trim(), Note.replaceAll("\\s\\s+", " ").trim());
                RoomCategory roomcate = roomcatedao.getRoomCategori("select top(1)* from CateRoom order by RoomcateID desc");
                request.setAttribute("insert", "insert");
                request.getRequestDispatcher("RoomcategoryController?do=updateroomcates&cateroomid=" + roomcate.getRoomcateID() + "").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(RoomcategoryController.class.getName()).log(Level.SEVERE, null, ex);
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
