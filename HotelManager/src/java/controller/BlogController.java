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

import dao.impl.BlogDAOImpl;
import entity.Account;
import entity.Blog;
import entity.Comment;
import java.io.IOException;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "BlogController", urlPatterns = {"/BlogController"})
public class BlogController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try {
            /* TODO output your page here. You may use following sample code. */
            BlogDAOImpl dao = new BlogDAOImpl();
            String dos = request.getParameter("do");
            /*Service is null,redirect BlogController to Blog.jsp */
            if (dos == null) {

                int a = 1;
                Vector<Blog> b = null;
                int n = dao.getPage();
                request.setAttribute("n", n);
                String page = request.getParameter("page");
                if (page == null) {
                    b = dao.getBlogByPage(1);
                } else {
                    b = dao.getBlogByPage(Integer.parseInt(page));
                }
                request.setAttribute("a", a);
                request.setAttribute("b", b);
                request.getRequestDispatcher("Blog.jsp").forward(request, response);
            }
            /**
             * Service Blog: get the blog to load the page Blog.jsp.jsp
             */
            if (dos.equals("getBlog")) {

                Vector<Blog> b = null;
                int n = dao.getPage();
                int a = 1;
                request.setAttribute("n", n);
                String page = request.getParameter("page");
                if (page == null) {
                    /*Get blog by page */
                    b = dao.getBlogByPage(1);
                } else {
                    /*Get blog by page */
                    b = dao.getBlogByPage(Integer.parseInt(page));
                }
                request.setAttribute("a", a);
                request.setAttribute("b", b);
                request.getRequestDispatcher("Blog.jsp").forward(request, response);
            }
            HttpSession session = request.getSession();
            /**
             * Service viewBlogdetail: get view detail of blog BlogDetail.jsp
             */
            if (dos.equals("detailBlog")) {
                Account ac = new Account();
                ac = (Account) session.getAttribute("login");
                if (ac != null) {
                    int id = ac.getAccountID();
                    String accountid = Integer.toString(id);
                    String username = dao.selectUsername(accountid);
                    session.setAttribute("user", username);
                    String BlogID = request.getParameter("blogID");
                    /*Get Blog base on ID*/
                    Vector<Blog> c = dao.getBlog("select * from Blog where [BlogID]='" + BlogID + "'");
                    request.setAttribute("c", c);
                    /*Get Blog base on ID except blog's self*/
                    Vector<Blog> b = dao.getBlog("select * from Blog except select * from Blog where [BlogID]='" + BlogID + "'");
                    request.setAttribute("b", b);
                    /*Get  top 3 Blog base on ID except blog's self*/
                    Vector<Blog> b1 = dao.getBlog("select top 3 * from Blog except select * from Blog where [BlogID]='" + BlogID + "'");
                    request.setAttribute("b1", b1);
                    List<Comment> list = dao.DisplayComment(BlogID);
                    request.setAttribute("listcomment", list);
                    request.getRequestDispatcher("BlogDetail.jsp").forward(request, response);
                } else {
                    String BlogID = request.getParameter("blogID");
                    Vector<Blog> c = dao.getBlog("select * from Blog where [BlogID]='" + BlogID + "'");
                    request.setAttribute("c", c);
                    Vector<Blog> b = dao.getBlog("select * from Blog except select * from Blog where [BlogID]='" + BlogID + "'");
                    request.setAttribute("b", b);
                    Vector<Blog> b1 = dao.getBlog("select top 3 * from Blog except select * from Blog where [BlogID]='" + BlogID + "'");
                    request.setAttribute("b1", b1);
                    request.getRequestDispatcher("BlogDetail.jsp").forward(request, response);
                }

            }
            /**
             * Service sortblog: get the blog to load the page order by date asc
             * Blog.jsp
             */
            if (dos.equals("sortnew")) {
                Vector<Blog> b = null;
                int n = dao.getPage();
                request.setAttribute("n", n);
                String page = request.getParameter("page");
                int a = 2;
                if (page == null) {
                    /*Get blog by page order by date asc*/
                    b = dao.getBlogByPagesortnew(1);
                } else {
                    /*Get blog by page order by date asc*/
                    b = dao.getBlogByPagesortnew(Integer.parseInt(page));
                }
                request.setAttribute("b", b);
                request.setAttribute("a", a);
                request.getRequestDispatcher("Blog.jsp").forward(request, response);
            }
            /**
             * Service sortblog: get the blog to load the page order by date
             * desc Blog.jsp
             */
            if (dos.equals("sortold")) {
                Vector<Blog> b = null;
                int n = dao.getPage();
                request.setAttribute("n", n);

                String page = request.getParameter("page");
                int a = 3;
                if (page == null) {
                    /*Get blog by page order by date desc*/
                    b = dao.getBlogByPagesortold(1);
                } else {
                    /*Get blog by page order by date desc*/
                    b = dao.getBlogByPagesortold(Integer.parseInt(page));
                }
                request.setAttribute("b", b);
                request.setAttribute("a", a);
                request.getRequestDispatcher("Blog.jsp").forward(request, response);
            }
            /**
             * Service sortblog: get the blog to load the page find by author
             * name Blog.jsp
             */
            if (dos.equals("search")) {
                String author = request.getParameter("search");
                Vector<Blog> b = null;
                int n = dao.getPage();
                request.setAttribute("n", n);

                String page = request.getParameter("page");
                int a = 4;
                if (page == null) {
                    /*Get blog by page by author name*/
                    b = dao.getBlogByPagesearch(1, author);
                } else {
                    /*Get blog by page by author name*/
                    b = dao.getBlogByPagesearch(Integer.parseInt(page), author);
                }
                request.setAttribute("b", b);
                request.setAttribute("a", a);
                request.getRequestDispatcher("Blog.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            Logger.getLogger(BlogController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(BlogController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(BlogController.class.getName()).log(Level.SEVERE, null, ex);
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
