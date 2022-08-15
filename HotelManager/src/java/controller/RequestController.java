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

import dao.RequestMessageDAO;
import dao.impl.RequestMessageDAOIpml;
import entity.RequestMessage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.SendMail;

/**
 * This class request
 *
 * @author Minh Hiếu
 */
@WebServlet(name = "RequestController", urlPatterns = {"/RequestController"})
public class RequestController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods. Get list request Search and update status Delete request Reply
     * request
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
            RequestMessageDAO requestMessageDAO = new RequestMessageDAOIpml();
            HttpSession session = request.getSession();
            String service = request.getParameter("do");

            /**
             * Service listRequest: get list request requestMessage.jsp
             */
            if (service.equalsIgnoreCase("listRequest")) {
                String indexPage = request.getParameter("index");

                if (indexPage == null) {
                    indexPage = "1";
                }
                int index = Integer.parseInt(indexPage);

                int count = requestMessageDAO.getMessage().size();

                int endPage = count / 3;
                if (count % 3 != 0) {
                    endPage++;
                }
                /*Pagination by index*/
                ArrayList<RequestMessage> listRequest = requestMessageDAO.pagingMessage(index);
                /*Get count unread request*/
                ArrayList<RequestMessage> listRequest1 = requestMessageDAO.getMessageUnread();
                String href = "RequestController?do=listRequest&";
                request.setAttribute("endPage", endPage);
                request.setAttribute("count", count);
                request.setAttribute("href", href);
                request.setAttribute("index", index);
                request.setAttribute("listRequest", listRequest);
                request.setAttribute("listRequest1", listRequest1);
                session.setAttribute("index", index);
                request.getRequestDispatcher("requestMessage.jsp").forward(request, response);

            }
            /**
             * Service seenRequest: get a request requestMessage.jsp
             */
            if (service.equalsIgnoreCase("seenRequest")) {
                int id = Integer.parseInt(request.getParameter("mid").trim());
                /*Get seen request by id*/
                RequestMessage seenRequest = requestMessageDAO.getMessageById(id);
                int n = requestMessageDAO.updateRead(id, seenRequest.getIsRead());
                request.setAttribute("seen", seenRequest);
                request.getRequestDispatcher("viewRequest.jsp").forward(request, response);

            }
            /**
             * Service deleteRequest: delete request
             * RequestController?do=listRequest
             */
            if (service.equalsIgnoreCase("deleteRequest")) {

                int id = Integer.parseInt(request.getParameter("mId").trim());
                /*delete request by id*/
                requestMessageDAO.delete(id);
                String Mess = "Xoá thành công.";
                request.setAttribute("Mess", Mess);
                request.getRequestDispatcher("RequestController?do=listRequest").forward(request, response);

            }
            /**
             * Service seenRequest: update status request
             * RequestController?do=listRequest
             */
            if (service.equalsIgnoreCase("updateIsRead")) {
                int id = Integer.parseInt(request.getParameter("mID").trim());
                String isRead = request.getParameter("isRead");
                /* update read status by id*/
                requestMessageDAO.updateRead(id, isRead);
                request.getRequestDispatcher("RequestController?do=listRequest").forward(request, response);

            }
            /**
             * Service searchName: search title and pagination
             * requestMessage.jsp
             */
            if (service.equalsIgnoreCase("searchName")) {
                String nameTitle = request.getParameter("nameTitle").trim();
                String indexPage = request.getParameter("index");
                /* index page always start at 1*/
                if (indexPage == null) {
                    indexPage = "1";
                }
                int index = Integer.parseInt(indexPage);

                int count = requestMessageDAO.getMessageOfTitle(nameTitle).size();

                int endPage = count / 3;

                if (count % 3 != 0) {
                    endPage++;
                }
                /* Get search title and pagination */
                ArrayList<RequestMessage> listRequest = requestMessageDAO.searchName(index, nameTitle);
                /*Get count unread request*/
                ArrayList<RequestMessage> listRequest1 = requestMessageDAO.getMessageUnread();
                String href = "RequestController?do=searchName&";
                request.setAttribute("endPage", endPage);
                request.setAttribute("count", count);
                request.setAttribute("href", href);
                request.setAttribute("index", index);
                request.setAttribute("listRequest", listRequest);
                request.setAttribute("listRequest1", listRequest1);
                request.setAttribute("nameTitle", nameTitle);
                session.setAttribute("index", index);
                request.getRequestDispatcher("requestMessage.jsp").forward(request, response);
            }
            /**
             * Service viewReply: get view reply replyRequest.jsp
             */
            if (service.equalsIgnoreCase("viewReply")) {
                int id = Integer.parseInt(request.getParameter("mID").trim());
                String email = request.getParameter("email").trim();
                request.setAttribute("email", email);
                request.setAttribute("mID", id);
                session.setAttribute("mID", id);
                request.getRequestDispatcher("replyRequest.jsp").forward(request, response);
            }
            /**
             * Service sendReply: Import into all fields replyRequest.jsp
             */
            if (service.equals("sendReply")) {
                SendMail sm = new SendMail();
                int id = Integer.parseInt(request.getParameter("mID").trim());
                String email = request.getParameter("inputEmail").trim();
                String name = request.getParameter("name").trim();
                String title = request.getParameter("inputTitle").trim();
                String content = request.getParameter("inputContent").trim();
                /* Get message */
                String mess = "   Giải đáp thắc mắc!\n"
                        + "Tiêu đề:" + title + "\n"
                        + "  Nội dung:" + content + "\n"
                        + "" + name + " đã trả lời yêu cầu. Cảm ơn vì đã gửi yêu cầu tới chúng tôi!!!\n"
                        + "Có câu hỏi gì liên quan tới khách sạn vui lòng liên hệ qua đường link này:http://localhost:8080/HotelManager/contact.jsp";
                /*Send email*/
                sm.send(email, "Phản hồi yêu cầu.", mess, sm.getFromEmail(), sm.getPassword());
                session.setAttribute("email", email);
                String mess1 = "Gửi thành công.";
                request.setAttribute("mess1", mess1);
                request.setAttribute("mID", id);
                request.getRequestDispatcher("replyRequest.jsp").forward(request, response);

            }
        } catch (Exception ex) {
            Logger.getLogger(RequestController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RequestController.class
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
            Logger.getLogger(RequestController.class
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
