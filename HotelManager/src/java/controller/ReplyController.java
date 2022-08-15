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

import dao.impl.BlogDAOImpl;
import entity.Comment;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Thai Quan
 */
@WebServlet(name = "ReplyController", urlPatterns = {"/ReplyController"})
public class ReplyController extends HttpServlet {

  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             out.println("<h1>Servlet RoomcategoryController at </h1>");
           
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
       BlogDAOImpl dao = new BlogDAOImpl();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
          String dos = request.getParameter("do");
        if (request.getCharacterEncoding() != null) {
            request.setCharacterEncoding("UTF-8");
        }
          /**
             * Service insertreply: insert and display reply
             * Reply.jsp
             */
        if(dos.equals("insertreply")){
        try (PrintWriter out = response.getWriter()) {
            String content = request.getParameter("content1").trim();
            String username = request.getParameter("username");;
            String BlogID = request.getParameter("blogid");;
            String ParentID = request.getParameter("commentid");
          String CommentID = request.getParameter("commentid");
                Comment cmt = new Comment();
                cmt.setContent(content);
                cmt.setUsername(username);
                cmt.setParentId(ParentID);
                cmt.setBlogid(BlogID);
                cmt.setCommentId(CommentID);
                 /*insert comment */
               dao.InsertComment(content, username, BlogID, ParentID);
                /* display comment base on parentid */
                List<Comment> list1 = dao.DisplayCommenttt(ParentID);
                request.setAttribute("listcomment1", list1);
                RequestDispatcher rd = request.getRequestDispatcher("Reply.jsp");
                rd.forward(request, response);
             
//      out.println("<h1>Servlet RoomcategoryController at " + username+ "</h1>"); 
            
    
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
        /**
             * Service insertreply: insert and display reply is comment children
             * Reply.jsp
             */
        if(dos.equals("displayreply")){
           try {
               String content = request.getParameter("content1").trim();
               String username = request.getParameter("username");;
               String BlogID = request.getParameter("blogid");;
               String ParentID = request.getParameter("commentid");
               String CommentID = request.getParameter("commentid");
               Comment cmt = new Comment();
               cmt.setContent(content);
               cmt.setUsername(username);
               cmt.setParentId(ParentID);
               cmt.setBlogid(BlogID);
               cmt.setCommentId(CommentID);
               List<Comment> list1 = dao.DisplayCommenttt(ParentID);
               request.setAttribute("listcomment1", list1);
               RequestDispatcher rd = request.getRequestDispatcher("Reply.jsp");
               rd.forward(request, response);
           } catch (Exception ex) {
               Logger.getLogger(ReplyController.class.getName()).log(Level.SEVERE, null, ex);
           }
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
