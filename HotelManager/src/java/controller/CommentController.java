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
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CommentController", urlPatterns = {"/CommentController"})
public class CommentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String dos = request.getParameter("do");
           /**
             * Service display: Displaycomment from comment table
             * ManageComment.jsp
           */
        if(dos.equals("display")){
        try (PrintWriter out = response.getWriter()) {
            BlogDAOImpl dao = new BlogDAOImpl();
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
             String BlogID = request.getParameter("blogid");
             request.setAttribute("blogid", BlogID);
            int n = dao.getComment(BlogID);            
              String page = request.getParameter("page");
              List<Comment> list1 = null;
              if (page == null) {
                  /*display comment base on blogid */
                    list1 = dao.getCommentByPage(1, BlogID);
                } else {
                        // display comment base on blogid
                    list1 = dao.getCommentByPage(Integer.parseInt(page),BlogID);
                }           
          request.setAttribute("listcomment", list1);
          request.setAttribute("n", n);
          request.getRequestDispatcher("ManageComment.jsp"). forward(request, response);               
        }catch(Exception e){
            e.printStackTrace();
        }
        }
        /**
             * Service:remove: Delete comment from comment table
             * ManageComment.jsp
           */
        if(dos.equals("remove")){
           try (PrintWriter out = response.getWriter()) {
            BlogDAOImpl dao = new BlogDAOImpl();
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("utf-8");
                String commentid = request.getParameter("commentid");
                String ParentID = request.getParameter("commentid");
                  /*delete comment base on commentid */
                 dao.deleteCommentParent(commentid,ParentID);
                   String BlogID = request.getParameter("blogid");
                    /*display comment base on commentid */
             List<Comment> list2 = dao.DisplayAllComment(BlogID); 
              // out.println("<h1>Servlet RoomcategoryController at " + BlogID+ "</h1>"); 
             request.setAttribute("listcomment", list2);
           request.getRequestDispatcher("CommentController?do=display&blogid="+BlogID+""). forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
        } 

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
        HttpSession session = request.getSession();
        if (dos.equals("displaycomment")) {
            if (request.getCharacterEncoding() != null) {
                request.setCharacterEncoding("UTF-8");
            }
            try (PrintWriter out = response.getWriter()) {
                Account ac = new Account();
                ac = (Account) session.getAttribute("login");
                if (ac == null) {

                } else {
                    String content = request.getParameter("content").trim();
                    String username = request.getParameter("username");
                    String BlogID = request.getParameter("blogid");
                    String ParentID = "0";
                    String ParentIDD = request.getParameter("commentid");
                    if (content.trim() == "" || username.trim() == "") {

                    } else {
                        Comment cmt = new Comment();
                        cmt.setContent(content);
                        cmt.setUsername(username);
                        cmt.setParentId(ParentID);
                        cmt.setBlogid(BlogID);
                        dao.InsertComment(content, username, BlogID, ParentID);
                        List<Comment> list = dao.DisplayComment(BlogID);
                        request.setAttribute("listcomment", list);
                        List<Comment> list1 = dao.DisplayCommenttt(ParentIDD);
                        request.setAttribute("listcomment1", list1);
//                    List<Comment> list1 = dao.DisplayCommenttt(ParentIDD);
//                     request.setAttribute("listcomment1", list1);
                        RequestDispatcher rd = request.getRequestDispatcher("Comment.jsp");
                        rd.forward(request, response);
//            out.println("<h1>Servlet RoomcategoryController at " + list+ "</h1>"); 
                    }
                }
//         out.println("<h1>Servlet RoomcategoryController at " + BlogID+ "</h1>"); 
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (dos.equals("RemoveComment")) {
            try (PrintWriter out = response.getWriter()) {
                String commentid = request.getParameter("commentid");
                String parentid = request.getParameter("commentid");
                dao.deleteCommentParent(commentid, parentid);
                String BlogID = request.getParameter("blogid");
                List<Comment> list = dao.DisplayComment(BlogID);

                request.setAttribute("listcomment", list);
                RequestDispatcher rd = request.getRequestDispatcher("Comment.jsp");
//                out.println("<h1>Servlet RoomcategoryController at " + commentid+ "</h1>"); 
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (dos.equals("UpdateComment")) {
            try (PrintWriter out = response.getWriter()) {
                String commentid = request.getParameter("commentid");
                String BlogID = request.getParameter("blogid");
                String content = request.getParameter("content");
//              request.setAttribute("Ok", "Ok");   
                dao.updateContent(commentid, content);
                List<Comment> list1 = dao.DisplayComment(BlogID);
                request.setAttribute("listcomment", list1);
                RequestDispatcher rd = request.getRequestDispatcher("Comment.jsp");
//              out.println("<h1>Servlet RoomcategoryController at "+ list1+" </h1>"); 
            } catch (Exception e) {
                e.printStackTrace();
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
