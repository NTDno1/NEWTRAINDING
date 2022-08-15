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
package controller;

import dao.NotificationDAO;
import dao.ReservationDAO;
import dao.RoomDAO;
import dao.UserDAO;
import dao.impl.NotificationDAOImpl;
import dao.impl.ReservationDAOImpl;
import dao.impl.RoomDAOImpl;
import dao.impl.UserDAOImpl;
import entity.Account;
import entity.Notification;
import entity.Reservation;
import entity.Room;
import entity.User;
import java.io.IOException;
import java.sql.Date;
import java.text.DecimalFormat;
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

@WebServlet(name = "ReceptionistController", urlPatterns = {"/ReceptionistController"})
/**
 * This class Receptionist
 *
 * @author HieuLBM
 */

public class ReceptionistController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods. Get list Room and search name and update status Get list
     * customer information and have a search function by name Get list
     * OrderDetails a Customer
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
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            ReservationDAO reservationDAO = new ReservationDAOImpl();
            NotificationDAO notificationDAO = new NotificationDAOImpl();
            RoomDAO roomDAO = new RoomDAOImpl();
            UserDAO userDAO = new UserDAOImpl();
            DecimalFormat formatter1 = new DecimalFormat("###,###,###");
            String service = request.getParameter("do");
            HttpSession session = request.getSession();
            LocalDateTime current = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            String formatted = current.format(formatter);
            Account a = (Account) session.getAttribute("login");
            /*Service is null,redirect Receptionist to index */
            if (service == null) {
                service = "Room";
            }
            /**
             * Service room: get the Room to load the page 
             * managerRoom.jsp
             */
            if (service.equalsIgnoreCase("room")) {
                /*Get list Room*/
                ArrayList<Room> listRoom = roomDAO.getRoomListAll();
                request.setAttribute("listRoom", listRoom);
                request.getRequestDispatcher("managerRoom.jsp").forward(request, response);
            }
            /**
             * Service updateStatus: get the Room to update status to load the
             * page ReceptionistController
             */
            if (service.equalsIgnoreCase("updateStatus")) {

                String rId = request.getParameter("rid");
                String status = request.getParameter("status");
                int status1 = Integer.parseInt(status);
                String content = "";
                if (status1 == 0) {
                    content = "Phòng từ trạng thái đã được đặt sang trạng thái rỗng";
                } else {
                    content = "Phòng từ trạng thái rỗng sang trạng thái đã được đặt";
                }
                notificationDAO.insertNotification(new Notification("Cập nhập trạng thái phòng", a.getUser().toString(), rId.toString(), content.toString(), formatted.toString()));
                int Rid = Integer.parseInt(rId);
                /*Update status room*/
                roomDAO.updateStatus(Rid, status1);
                response.sendRedirect("ReceptionistController");
            }
            /**
             * Service customer: get list Customer to load the page
             * managerCustomer.jsp
             */
            if (service.equalsIgnoreCase("customer")) {
                /*Get list customer*/
                ArrayList<User> listUser = userDAO.getCustomerListByReceptionist();
                request.setAttribute("listUser", listUser);
                request.getRequestDispatcher("managerCustomer.jsp").forward(request, response);
            }
            /**
             * Service profile: get profile receptionist profileReceptionist.jsp
             */
            if (service.equalsIgnoreCase("profile")) {
                Account account = (Account) session.getAttribute("login");
                /*Get id of user(receptionist)*/
                User user = userDAO.getUser(account.getAccountID());
                request.setAttribute("u", user);
                request.getRequestDispatcher("profileReceptionist.jsp").forward(request, response);
            }

            /**
             * Service viewUpdateRecepte: get view update profile receptionist
             * updateProfileReceptionist.jsp
             */
            if (service.equalsIgnoreCase("viewUpdateRecept")) {
                Account account = (Account) session.getAttribute("login");
                /*Get id of user(receptionist)*/
                User user = userDAO.getUser(account.getAccountID());
                session.setAttribute("u", user);
                request.getRequestDispatcher("updateProfileReceptionist.jsp").forward(request, response);
            }
            /**
             * Service updateRecept: get update profile receptionist
             * updateProfileReceptionist.jsp
             */

            if (service.equalsIgnoreCase("updateRecept")) {

                String uID = (String) request.getParameter("uid").trim();
                String uName = (String) request.getParameter("uName");
                String uEmail = (String) request.getParameter("EmailAddress").trim();
                String uCMT = (String) request.getParameter("inputCMT").trim();
                String uAddress = (String) request.getParameter("inputAddress").trim();
                String uPhone = (String) request.getParameter("inputPhone").trim();
                Date birthday = Date.valueOf(request.getParameter("birthday").trim());

                /*Convert*/
                int id = Integer.parseInt(uID);
                User user = new User(id, uName, uPhone, uEmail, birthday, uAddress, uCMT);
                session.setAttribute("u", user);
                /*Enter less than 5 characters*/
                if (uEmail.length() < 5 || uCMT.length() < 5 || uAddress.length() < 5 || uPhone.length() < 5) {
                    String err = "Nhập lớn hơn 5 kí tự.";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("updateProfileReceptionist.jsp").forward(request, response);

                } else if (uName.trim().length() > 50) { /*Enter more than 50 characters*/
                    String err = "Nhập nhỏ hơn 50 kí tự.";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("updateProfileReceptionist.jsp").forward(request, response);

                } else if (!uName.matches("^[a-zA-Z]+$")) {/*Input is not letter*/
                    String err = "Nhập tên chỉ chứa kí tự là chữ";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("updateProfileReceptionist.jsp").forward(request, response);

                } else if (!uEmail.trim().matches("^[a-zA-Z]\\w+@gmail.com$")) {/*Input is not alphanumeric and the extension must not be @gmail.com */
                    String err = "Ví dụ: hieu1@gmail.com";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("updateProfileReceptionist.jsp").forward(request, response);
                } else if (!uCMT.trim().matches("^[0-9]{12}$")) {/*Input is not number or input number more than 12 numbers */
                    String err = "Chỉ nhập số và đúng 12 kí tự của CMT";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("updateProfileReceptionist.jsp").forward(request, response);

                } else if (uAddress.trim().length() > 100) {/*Enter more than 100 characters*/
                    String err = "Nhỏ hơn 100 kí tự";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("updateProfileReceptionist.jsp").forward(request, response);

                } else if (!uPhone.trim().matches("^(09|03)+[0-9]{8}$")) {/*Input is not number or Phone not starts 09|03 and more than 10 numbers */

                    String err = "Điện thoại bắt đầu 09|03 và có 10 số.";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("updateProfileReceptionist.jsp").forward(request, response);
                } else {
                    /*Update user*/
                    userDAO.updateUserEcept(new User(id, uName, uPhone, uEmail, birthday, uAddress, uCMT));
                    String mess = "Cập nhật thành công.";
                    request.setAttribute("mess", mess);
                    request.getRequestDispatcher("updateProfileReceptionist.jsp").forward(request, response);
                }

            }
            /**
             * Service searchRoomAndStatus: search name room and status
             * managerRoom.jsp
             */

            if (service.equalsIgnoreCase("searchRoomAndStatus")) {

                String nameRoom = request.getParameter("nameRoom").trim();
                int status = Integer.parseInt(request.getParameter("status").trim());
                /*Get list room and status*/
                ArrayList<Room> listRoom = roomDAO.selectRoom(nameRoom, status);
                request.setAttribute("listRoom", listRoom);
                request.getRequestDispatcher("managerRoom.jsp").forward(request, response);

            }
            /**
             * Service searchsearchName: search name customer
             * managerCustomer.jsp
             */
            if (service.equalsIgnoreCase("searchName")) {
                String name = request.getParameter("Name").trim();
                /*Search name and then get list customer */
                ArrayList<User> listUser = userDAO.getSearchNameCustomerListByReceptionist(name);
                request.setAttribute("listUser", listUser);
                request.getRequestDispatcher("managerCustomer.jsp").forward(request, response);

            }
            /**
             * Service viewOrder: view order details by customer
             * viewOrderCustomer.jsp
             */
            if (service.equalsIgnoreCase("viewOrder")) {

                long sum = 0;
                int uID = Integer.parseInt(request.getParameter("uID").trim());
                /*Get a  customer*/
                Reservation reservation = reservationDAO.viewOrderDetails(uID);
                /*Get list order details of  customer*/
                ArrayList<Reservation> listReservation = reservationDAO.OrderDetails(uID);
                for (Reservation r1 : listReservation) {
                    sum += r1.getTotal();
                }
                request.setAttribute("listReservation", listReservation);
                request.setAttribute("sum", formatter1.format(sum));
                request.setAttribute("reservation", reservation);
                request.getRequestDispatcher("viewOrderCustomer.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(ReceptionistController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ReceptionistController.class
                    .getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ReceptionistController.class
                    .getName()).log(Level.SEVERE, null, ex);
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
