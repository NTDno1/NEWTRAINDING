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

import dao.DeviceDAO;
import dao.MessageDAO;
import dao.ReservationDAO;
import dao.RoomDAO;
import dao.RequestMessageDAO;
import dao.RoomCategoryDAO;
import dao.UserDAO;
import dao.ViewDAO;
import dao.impl.DevicesDAOImpl;
import dao.impl.MessageDAOImpl;
import dao.impl.ReservationDAOImpl;
import dao.impl.RoomDAOImpl;
import dao.impl.RequestMessageDAOIpml;
import dao.impl.RoomCategoryDAOImpl;
import dao.impl.UserDAOImpl;
import dao.impl.ViewDAOImpl;
import entity.Account;
import entity.Device;
import entity.Message;
import entity.Reservation;
import entity.Room;
import entity.RoomCategory;
import entity.User;
import entity.RequestMessage;
import java.io.IOException;
import java.sql.Date;
import java.text.DecimalFormat;
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
 * This class Admin
 *
 * @author Minh Hiếu
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods. Get a Dashboard Get a admin information and edit your
     * information Get list report room and report month and year
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

            HttpSession session = request.getSession();
            UserDAO userDAO = new UserDAOImpl();
            RoomDAO roomDAO = new RoomDAOImpl();
            DeviceDAO deviceDAO = new DevicesDAOImpl();
            ViewDAO viewDAO = new ViewDAOImpl();
            RoomCategoryDAO roomCategoryDAO = new RoomCategoryDAOImpl();

            RequestMessageDAO daoRequest = new RequestMessageDAOIpml();
            MessageDAO daoMessage = new MessageDAOImpl();
            ReservationDAO daoReservation = new ReservationDAOImpl();
            DecimalFormat formatter = new DecimalFormat("###,###,###");
            String service = request.getParameter("do");
            /*Service is null,redirect AdminController to index */
            if (service == null) {
                service = "indexAdmin";

            }
            /**
             * Service indexAdmin: get the admin dasboard to load the page
             * indexadmin.jsp
             */
            if (service.equalsIgnoreCase("indexAdmin")) {
                /*Get total room */
                ArrayList<Room> listRoom = roomDAO.getRoomListAll();
                /*Get total customer */
                ArrayList<User> listUser = userDAO.getCustomerListByReceptionist();
                /*Get total receptionist */
                ArrayList<User> listReceptionist = userDAO.getListByReceptionist();
                /*Get total request*/
                ArrayList<RequestMessage> listRequest = daoRequest.getMessage();
                /*Get total feedback */
                ArrayList<Message> listMessage = daoMessage.getAllComment();
                /*Get total bill */
                int sumReservation = daoReservation.sumReservation();
                /*Room type statistics */
                ArrayList<RoomCategory> listroomCategory = roomCategoryDAO.numberOfRoomsByCategory();
                /*Room Statistics */
                ArrayList<Room> listStatus = roomDAO.sumOfRoom();
                /*Device Statistics*/
                ArrayList<Device> listDevice = deviceDAO.numberOfDevice();
                /*Service Statistics*/
                ArrayList<Reservation> listReservationOfService = daoReservation.sumService();
                int totalView = viewDAO.getTotalView();
                String totalViewFormated = String.format("%06d", totalView);
                request.setAttribute("totalView", totalViewFormated);
                request.setAttribute("listroomCategory", listroomCategory);
                request.setAttribute("listRoom", listRoom);
                request.setAttribute("listUser", listUser);
                request.setAttribute("listReceptionis", listReceptionist);
                request.setAttribute("listRequest", listRequest);
                request.setAttribute("listReservationOfService", listReservationOfService);
                request.setAttribute("listMessage", listMessage);
                request.setAttribute("sumReservation", formatter.format(sumReservation));
                request.setAttribute("listStatus", listStatus);
                request.setAttribute("listDevice", listDevice);
                request.getRequestDispatcher("indexadmin.jsp").forward(request, response);
            }
            /**
             * Service viewProfileAdmin: get view profile admin
             * viewProfileAdmin.jsp
             */
            if (service.equalsIgnoreCase("viewProfileAdmin")) {

                Account account = (Account) session.getAttribute("login");
                /*Get id of user(admin)*/
                User user = userDAO.getUser(account.getAccountID());
                request.setAttribute("u", user);
                request.getRequestDispatcher("viewProfileAdmin.jsp").forward(request, response);

            }
            /**
             * Service viewUpdateAdmin: get view update profile admin
             * updateProfileAdmin.jsp
             */
            if (service.equalsIgnoreCase("viewUpdateAdmin")) {
                Account account = (Account) session.getAttribute("login");
                /*Get id of user(admin)*/
                User user = userDAO.getUser(account.getAccountID());
                session.setAttribute("u", user);
                request.getRequestDispatcher("updateProfileAdmin.jsp").forward(request, response);

            }
            /**
             * Service updateAdmin: get update admin
             * updateProfileReceptionist.jsp
             */

            if (service.equalsIgnoreCase("updateAdmin")) {

                String uID = (String) request.getParameter("uid").trim();
                String uName = (String) request.getParameter("name").trim();
                String uEmail = (String) request.getParameter("inputEmailAddress").trim();
                String uCMT = (String) request.getParameter("inputCMT").trim();
                String uAddress = (String) request.getParameter("inputAdress").trim();
                String uPhone = (String) request.getParameter("inputPhone").trim();
                Date birthday = Date.valueOf(request.getParameter("inputBirthday").trim());

                /*Convert*/
                int id = Integer.parseInt(uID);

                User u = new User(id, uName, uPhone, uEmail, birthday, uAddress, uCMT);
                session.setAttribute("u", u);
                /*Enter less than 5 characters*/
                if (uEmail.length() < 5 || uCMT.length() < 5 || uAddress.length() < 5 || uPhone.length() < 5) {
                    String err = "Nhập lớn hơn 5 kí tự.";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("updateProfileAdmin.jsp").forward(request, response);

                } else if (uName.trim().length() > 50) {
                    /*Enter more than 50 characters*/
                    String err = "Nhập nhỏ hơn 50 kí tự.";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("updateProfileAdmin.jsp").forward(request, response);

                } else if (!uName.matches("^[a-zA-Z]+$")) {/*Input is not letter*/
                    String err = "Nhập tên chỉ chứa kí tự là chữ";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("updateProfileAdmin.jsp").forward(request, response);

                } else if (!uEmail.trim().matches("^[a-zA-Z]\\w+@gmail.com$")) {/*Input is not alphanumeric and the extension must not be @gmail.com */
                    String err = "Ví dụ: hieu1@gmail.com";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("updateProfileAdmin.jsp").forward(request, response);
                } else if (!uCMT.trim().matches("^[0-9]{12}$")) {/*Input is not number or input number more than 12 numbers */
                    String err = "Chỉ nhập số và đúng 12 kí tự của CMT ";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("updateProfileAdmin.jsp").forward(request, response);

                } else if (uAddress.trim().length() > 100) {/*Enter more than 100 characters*/
                    String err = "Nhỏ hơn 100 kí tự";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("updateProfileAdmin.jsp").forward(request, response);

                } else if (!uPhone.trim().matches("^(09|03)+[0-9]{8}$")) {/*Input is not number or Phone not starts 09|03 and more than 10 numbers */

                    String err = "Điện thoại bắt đầu 09|03 và có 10 số.";
                    request.setAttribute("err", err);
                    request.getRequestDispatcher("updateProfileAdmin.jsp").forward(request, response);
                } else {
                    /*Update user*/
                    userDAO.updateUserEcept(new User(id, uName, uPhone, uEmail, birthday, uAddress, uCMT));
                    String mess = "Cập nhật thành công.";
                    request.setAttribute("mess", mess);
                    request.getRequestDispatcher("updateProfileAdmin.jsp").forward(request, response);
                }

            }
            /**
             * Service incomeRoom: report gross income per room reportRoom.jsp
             */
            if (service.equalsIgnoreCase("incomeRoom")) {

                ArrayList<Reservation> listReservation = daoReservation.totalOfRoom();
                request.setAttribute("listReservation", listReservation);
                request.getRequestDispatcher("reportRoom.jsp").forward(request, response);
            }
            /**
             * Service incomeRoomAndSearch: report gross income per room and
             * search reportRoom.jsp
             */
            if (service.equalsIgnoreCase("incomeRoomAndSearch")) {
                String name = request.getParameter("name").trim();
                String checkin = request.getParameter("checkin").trim();
                String checkout = request.getParameter("checkout").trim();

                if (checkin.isEmpty() && checkout.isEmpty() && name.isEmpty()) {
                    /*Input is empty*/
                    String err1 = "Vui lòng điền thông tin.";
                    request.setAttribute("err1", err1);
                    request.getRequestDispatcher("reportRoom.jsp").forward(request, response);
                }
                if (checkin.isEmpty() && checkout.isEmpty() && !name.isEmpty()) {

                    if (roomDAO.checkRoom(name) != null) {/*Room checking*/
                        ArrayList<Reservation> listReservation = daoReservation.totalOfRoomSearch(name, null, null);
                        request.setAttribute("listReservation", listReservation);
                        request.getRequestDispatcher("reportRoom.jsp").forward(request, response);
                    } else {
                        String err1 = "Tên phòng không tồn tại.";
                        request.setAttribute("err1", err1);
                        request.setAttribute("name", name);
                        request.getRequestDispatcher("reportRoom.jsp").forward(request, response);
                    }

                }
                if (name.isEmpty() && !checkin.isEmpty() && checkout.isEmpty() || name.isEmpty() && checkin.isEmpty() && !checkout.isEmpty()) {
                    String errr = "Vui lòng nhập vào 2 trường Từ ngày và Đến ngày.";
                    request.setAttribute("errr", errr);
                    request.setAttribute("name", name);
                    request.setAttribute("checkin", checkin);
                    request.setAttribute("checkout", checkout);
                    request.getRequestDispatcher("reportRoom.jsp").forward(request, response);
                }
                if (!name.isEmpty() && !checkin.isEmpty() && checkout.isEmpty() || !name.isEmpty() && checkin.isEmpty() && !checkout.isEmpty()) {/*Check input satisfy required field has 2 fields*/

                    if (roomDAO.checkRoom(name) != null) {
                        String errr = "Vui lòng nhập vào 2 trường Từ ngày và Đến ngày.";
                        request.setAttribute("errr", errr);
                        request.setAttribute("name", name);
                        request.setAttribute("checkin", checkin);
                        request.setAttribute("checkout", checkout);
                        request.getRequestDispatcher("reportRoom.jsp").forward(request, response);
                    } else {
                        String errr = "Vui lòng nhập vào 2 trường Từ ngày và Đến ngày.";
                        request.setAttribute("errr", errr);
                        request.setAttribute("checkin", checkin);
                        request.setAttribute("checkout", checkout);
                        request.getRequestDispatcher("reportRoom.jsp").forward(request, response);
                    }

                } else {

                    Date to = Date.valueOf(checkin);
                    Date from = Date.valueOf(checkout);
                    request.setAttribute("checkin", checkin);
                    request.setAttribute("checkout", checkout);
                    /*Search by fields*/
                    ArrayList<Reservation> listReservation = daoReservation.totalOfRoomSearch(name, to, from);
                    request.setAttribute("listReservation", listReservation);
                    request.getRequestDispatcher("reportRoom.jsp").forward(request, response);

                }
            }
            /**
             * Service reportMonth: report gross income per room by month and
             * year reportMonth.jsp
             */

            if (service.equalsIgnoreCase("reportMonth")) {
                /*Get a list of total money for the whole month*/
                ArrayList<Reservation> listReservationTotalOfMotnh = daoReservation.totalOfRoomByMonth(0, 0);
                /*Get a list of year*/
                ArrayList<Integer> listReservationAllYear = daoReservation.selectAllYear();
                /*Get a list of month*/
                ArrayList<Integer> listReservationAllMonth = daoReservation.selectAllMotnh();
                request.setAttribute("listReservationTotalOfMotnh", listReservationTotalOfMotnh);
                request.setAttribute("listReservationAllYear", listReservationAllYear);
                request.setAttribute("listReservationAllMonth", listReservationAllMonth);
                request.getRequestDispatcher("reportMonth.jsp").forward(request, response);

            }
            /**
             * Service reportMonth: report gross income per room by month and
             * year and search reportMonth.jsp
             */

            if (service.equalsIgnoreCase("reportMonth1")) {
                /*Get a list of year*/
                ArrayList<Integer> listReservationAllYear = daoReservation.selectAllYear();
                /*Get a list of month*/
                ArrayList<Integer> listReservationAllMonth = daoReservation.selectAllMotnh();
                request.setAttribute("listReservationAllMonth", listReservationAllMonth);
                request.setAttribute("listReservationAllYear", listReservationAllYear);
                int month = Integer.parseInt(request.getParameter("month"));
                int sum = 0;
                int year = Integer.parseInt(request.getParameter("year"));

                if (month == 0 && year == 0) {
                    response.sendRedirect("AdminController?do=ReportMonth");
                } else {

                    if (year == 0) {
                        /*Get a list total money of month*/
                        ArrayList<Reservation> listReservationTotalOfMotnh = daoReservation.totalOfRoomByMonth(month, year);
                        request.setAttribute("listReservationTotalOfMotnh", listReservationTotalOfMotnh);
                        request.setAttribute("year", year);
                        request.getRequestDispatcher("reportMonth.jsp").forward(request, response);
                    } else if (year != 0 && month == 0) {
                        /*Get a list total money of year*/
                        ArrayList<Reservation> listReservationTotalOfMotnh = daoReservation.totalOfRoomByMonth(month, year);
                        for (Reservation r : listReservationTotalOfMotnh) {
                            sum += r.getTotal();

                        }
                        request.setAttribute("listReservationTotalOfMotnh", listReservationTotalOfMotnh);
                        request.setAttribute("year", year);
                        request.setAttribute("month", month);
                        request.setAttribute("sum", formatter.format(sum));
                        request.getRequestDispatcher("reportMonth.jsp").forward(request, response);

                    } else {
                        /*Get a list total money of month*/
                        ArrayList<Reservation> listReservationTotalOfMotnh = daoReservation.totalOfRoomByMonth(month, year);
                        request.setAttribute("listReservationTotalOfMotnh", listReservationTotalOfMotnh);
                        request.setAttribute("year", year);
                        request.setAttribute("month", month);
                        request.getRequestDispatcher("reportMonth.jsp").forward(request, response);
                    }
                }

            }

        } catch (Exception ex) {
            Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AdminController.class
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
            Logger.getLogger(AdminController.class
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
    }// </editor-fold>

}
