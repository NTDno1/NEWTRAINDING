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
import dao.impl.ImageDAOImpl;
import dao.impl.RoomCategoryDAOImpl;
import dao.impl.RoomDAOImpl;
import entity.Blog;
import entity.Image;
import entity.Room;
import entity.RoomCategory;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Admin
 */
//@MultipartConfig
@WebServlet(name = "ImageController", urlPatterns = {"/ImageController"})
public class ImageController extends HttpServlet {

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
            throws ServletException, IOException, FileUploadException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            /* TODO output your page here. You may use following sample code. */
            ImageDAOImpl dao = new ImageDAOImpl();
            RoomDAOImpl daor = new RoomDAOImpl();
            RoomCategoryDAOImpl roomcate = new RoomCategoryDAOImpl();
            String service = request.getParameter("do");
            String roomid = request.getParameter("RoomID");
            String filename = null;
            if (service == null) {
                Vector<Image> vector = dao.getImageByid("1");
                request.setAttribute("vector", vector);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            if (service.equals("listImage")) {
                Vector<RoomCategory> romcate = roomcate.getRoomCategoryList("select * from CateRoom");
                Room listroom = daor.getRoom1("select * from Room join CateRoom on Room.RoomcateID = CateRoom.RoomcateID where RoomID = " + roomid + "");
                Image img = dao.imageByID("select * from [image] join Room on [Image].RoomimgaeID = Room.RoomimgaeID where RoomID = " + roomid + "");
                request.setAttribute("img", img);
                request.setAttribute("listroom", listroom);
                request.setAttribute("romcate", romcate);
//                out.println("<h1>Servlet RoomcategoryController at " + listroom + "</h1>");
//                request.getRequestDispatcher("importimg.jsp").forward(request, response);
                request.getRequestDispatcher("newjsp.jsp").forward(request, response);
            }
            String value = "";
            String id = request.getParameter("roomIDs");
            // Create a factory for disk-based file items
            DiskFileItemFactory factory = new DiskFileItemFactory();
            // Configure a repository (to ensure a secure temp location is used)
            ServletContext servletContext = this.getServletConfig().getServletContext();
            File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
            factory.setRepository(repository);

            // Create a new file upload handler 
            ServletFileUpload upload = new ServletFileUpload(factory);

            // Parse the request
            List<FileItem> items = upload.parseRequest(request);
            // Process the uploaded items
            Iterator<FileItem> iter = items.iterator();
            if (service.equals("changeImgae1")) {
                //                out.println("<h1>Servlet RoomcategoryController at</h1>");
                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    HashMap<String, String> fileds = new HashMap<>();
                    if (item.isFormField()) {
                        fileds.put(item.getFieldName(), item.getString());
                        String name = item.getFieldName();
                        value = item.getString();
                    } else {
                        Random rand = new Random();
                        int n = rand.nextInt(50);
                        String s = String.valueOf(n);
                        filename = item.getName();
                        filename += s;
                        if (filename == null || filename.equals("")) {
                            break;
                        } else {
                            Path path = Paths.get(filename);
                            String storePath = servletContext.getRealPath("/images/anhphong");
                            File uploadFile = new File(storePath + "/" + path.getFileName());
                            item.write(uploadFile);
//                            dao.crudImage("UPDATE [dbo].[Image]\n"
//                                    + "   SET [image1] = '" + filename + "'\n"
//                                    + " WHERE RoomimgaeID = " + value + "");
                            //   out.println("<h1>Servlet RoomcategoryController at " + filename + "</h1>");
//                            out.println("<h1>Servlet RoomcategoryController at " + storePath + "/" + path.getFileName() + "</h1>");
                            request.setAttribute("update", "update");
                            request.getRequestDispatcher("ImageController?do=listImage&RoomID=" + value + "").forward(request, response);
                        }
                    }
                }
            }
            if (service.equals("changeImgae2")) {
                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    HashMap<String, String> fileds = new HashMap<>();
                    if (item.isFormField()) {
                        fileds.put(item.getFieldName(), item.getString());
                        String name = item.getFieldName();
                        value = item.getString();
//                        out.println("<h1>Servlet RoomcategoryController at " + name + value + "</h1>");
                    } else {
                        Random rand = new Random();
                        int n = rand.nextInt(50);
                        String s = String.valueOf(n);
                        filename = item.getName();
                        filename += s;
                        if (filename == null || filename.equals("")) {
                            break;
                        } else {
                            Path path = Paths.get(filename);
                            String storePath = servletContext.getRealPath("/images/anhphong");
                            File uploadFile = new File(storePath + "/" + path.getFileName());
                            item.write(uploadFile);
                            out.println("<h1>Servlet RoomcategoryController at " + filename + "</h1>");
//                            dao.crudImage("UPDATE [dbo].[Image]\n"
//                                    + "   SET [image2] = '" + filename + "'\n"
//                                    + " WHERE RoomimgaeID = " + value + "");
//                            out.println("<h1>Servlet RoomcategoryController at " + storePath + "/" + path.getFileName() + "</h1>");
                            request.setAttribute("update", "update");
                            request.getRequestDispatcher("ImageController?do=listImage&RoomID=" + value + "").forward(request, response);

                        }
                    }
                }
            }
            if (service.equals("changeImgae3")) {
                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    HashMap<String, String> fileds = new HashMap<>();
                    if (item.isFormField()) {
                        fileds.put(item.getFieldName(), item.getString());
                        String name = item.getFieldName();
                        value = item.getString();
//                        out.println("<h1>Servlet RoomcategoryController at " + name + value + "</h1>");
                    } else {
                        filename = item.getName();
                        Random rand = new Random();
                        int n = rand.nextInt(50);
                        String s = String.valueOf(n);
                        filename = item.getName();
                        filename += s;
                        if (filename == null || filename.equals("")) {
                            break;
                        } else {
                            Path path = Paths.get(filename);
                            String storePath = servletContext.getRealPath("/images/anhphong");
                            File uploadFile = new File(storePath + "/" + path.getFileName());
                            item.write(uploadFile);
//                            out.println("<h1>Servlet RoomcategoryController at " + filename + "</h1>");
//                            dao.crudImage("UPDATE [dbo].[Image]\n"
//                                    + "   SET [image3] = '" + filename + "'\n"
//                                    + " WHERE RoomimgaeID = " + value + "");
                            request.setAttribute("update", "update");
//                            out.println("<h1>Servlet RoomcategoryController at " + storePath + "/" + path.getFileName() + "</h1>");
                            request.getRequestDispatcher("ImageController?do=listImage&RoomID=" + value + "").forward(request, response);
                        }
                    }
                }
            }
            ArrayList<String> room = new ArrayList<String>();
            if (service.equals("changeImgae4")) {
                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    HashMap<String, String> fileds = new HashMap<>();
                    if (item.isFormField()) {
                        fileds.put(item.getFieldName(), item.getString());
                        String name = item.getFieldName();
                        value = item.getString();
                        String values = new String(value.getBytes("ISO-8859-1"), "UTF-8");
                        room.add(values);
                    } else {
                        Random rand = new Random();
                        int n = rand.nextInt(99);
                        String s = String.valueOf(n);
                        filename = item.getName();
                        filename += s;
//                        String filenames = s.concat(filename);
                        if (filename == null || filename.equals("")) {
                            break;
                        } else {
                            Path path = Paths.get(filename);
                            String storePath = servletContext.getRealPath("/images/anhphong");
                            File uploadFile = new File(storePath + "/" + path.getFileName());
                            item.write(uploadFile);
                            room.add(filename);
                        }
                    }
                }
                String des = room.get(2);
                String Note = room.get(5);
                String Notes = new String(Note.getBytes("ISO-8859-1"), "UTF-8");
                String RoomID = room.get(0);
                Image img = dao.imageByID("select * from [image] join Room on [Image].RoomimgaeID = Room.RoomimgaeID where RoomID = " + RoomID + "");
                String RoomNumber = room.get(1);
                String RoomCategory = room.get(3);
                String Price = room.get(4);
                String Status = room.get(6);
                String Square = room.get(7);
                String Comment = room.get(8);
                String Rate = room.get(9);
                String image1 = room.get(10);
                String image2 = room.get(11);
                String image3 = room.get(12);
                String image4 = room.get(13);
                if (image1.length() <= 2 || image1.equals("")) {
                    image1 = img.getImage1();
                }
                if (image2.length() <= 2 || image2.equals("")) {
                    image2 = img.getImage2();
                }
                if (image3.length() <= 2 || image3.equals("")) {
                    image3 = img.getImage3();
                }
                if (image4.length() <= 2 || image4.equals("")) {
                    image4 = img.getImage4();
                }
                dao.crudRoom("UPDATE [dbo].[Image]\n"
                        + "   SET [image1] = '" + image1 + "'\n"
                        + "      ,[image2] = '" + image3 + "'\n"
                        + "      ,[image3] = '" + image2 + "'\n"
                        + "      ,[image4] = '" + image4 + "'\n"
                        + " WHERE RoomimgaeID = " + RoomID + "\n"
                        + "\n"
                        + " UPDATE [dbo].[Room]\n"
                        + "   SET [Roomname] ='" + RoomNumber + "'\n"
                        + "      ,[Roomdesc] = ?\n"
                        + "      ,[RoomcateID] = " + RoomCategory + "\n"
                        + "      ,[RoomimgaeID] = " + img.getRoomimgaeID() + "\n"
                        + "      ,[Roomprice] = " + Price + "\n"
                        + "      ,[NumberPerson] = 1\n"
                        + "      ,[Square] = " + Square + "\n"
                        + "      ,[Comment] = '" + Comment + "'\n"
                        + "      ,[Rate] = " + Rate + "\n"
                        + "      ,[Note] = ?\n"
                        + "      ,[Status] = " + Status + "\n"
                        + " WHERE RoomID = " + RoomID + "", des.replaceAll("\\s\\s+", " ").trim(), Notes.replaceAll("\\s\\s+", " ").trim());

//                out.println("<h1>UPDATE [dbo].[Image]\n"
//                        + "   SET [image1] = '" + room + "'\n"
//                        + "      ,[image2] = '" + image2 + "'\n"
//                        + "      ,[image3] = '" + image3 + "'\n"
//                        + "      ,[image4] = '" + image3 + "'\n"
//                        + " WHERE RoomimgaeID = " + RoomID + "\n"
//                        + "\n"
//                        + " UPDATE [dbo].[Room]\n"
//                        + "   SET [Roomname] ='" + RoomNumber + "'\n"
//                        + "      ,[Roomdesc] = '" + des + "'\n"
//                        + "      ,[RoomcateID] = " + RoomCategory + "\n"
//                        + "      ,[RoomimgaeID] = " + img.getRoomimgaeID() + "\n"
//                        + "      ,[Roomprice] = " + Price + "\n"
//                        + "      ,[NumberPerson] = 1\n"
//                        + "      ,[Square] = " + Square + "\n"
//                        + "      ,[Comment] = '" + Comment + "'\n"
//                        + "      ,[Rate] = " + Rate + "\n"
//                        + "      ,[Note] = '" + Note + "'\n"
//                        + "      ,[Status] = " + Status + "\n"  
//                        + " WHERE RoomID = " + RoomID + "</h1>");
                request.setAttribute("insert", "insert");
                request.getRequestDispatcher("ImageController?do=listImage&RoomID=" + RoomID + "").forward(request, response);
            }
            String values = "";
            ArrayList<String> blog = new ArrayList<String>();
            BlogDAOImpl dao1 = new BlogDAOImpl();
            if (service.equals("changeImgae5")) {

                while (iter.hasNext()) {
                    FileItem item = iter.next();
                    HashMap<String, String> fileds = new HashMap<>();
                    if (item.isFormField()) {
                        fileds.put(item.getFieldName(), item.getString());
                        String name = item.getFieldName();
                        values = item.getString();
                        String valuess = new String(values.getBytes("ISO-8859-1"), "UTF-8");
                        blog.add(valuess);
                    } else {

                        Random rand = new Random();
                        int n = rand.nextInt(50);
                        String s = String.valueOf(n);
                        filename = item.getName();
                        filename += s;
                        if (filename == null || filename.equals("")) {
                            break;
                        } else {

                            Path path = Paths.get(filename);
                            String storePath = servletContext.getRealPath("/images/anhblog");
                            File uploadFile = new File(storePath + "/" + path.getFileName());
                            item.write(uploadFile);
                            blog.add(filename);

                        }
                    }
                }
                String BlogID = blog.get(4);
                String author = blog.get(3);
                String BlogDescription = blog.get(2);
                String BlogTitle = blog.get(0);
                String image = blog.get(5);
                Blog blogss = dao1.selectBlog1("select * from Blog where BlogID = " + BlogID + "");
                if (image.length() <= 2) {
                    image = blogss.getBlogImage();
                }
//                out.println("<h1>Servlet RoomcategoryController at "+ author+"</h1>");
                if (BlogDescription.trim().equals("") || author.trim().equals("") || BlogTitle.trim().equals("")) {
                    request.getRequestDispatcher("BlogManagerController?do=updateblog&blogid=" + BlogID + "").forward(request, response);
                } else {
                    dao.crudImage1("UPDATE [dbo].[Blog]\n"
                            + "   SET   [BlogAuthor] = ?\n"
                            + "      ,[BlogDescription] = ?\n"
                            + "      ,[BlogImage] = '" + image + "'\n"
                            + "      ,[BlogTitle] = ?\n"
                            + " WHERE [BlogID] = " + BlogID + "", author.replaceAll("\\s\\s+", " ").trim(), BlogDescription.replaceAll("\\s\\s+", " ").trim(), BlogTitle.replaceAll("\\s\\s+", " ").trim());
                    request.setAttribute("update", "update");
                    response.sendRedirect("BlogManagerController?do=editblog&page=1");
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
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
        } catch (FileUploadException ex) {
            Logger.getLogger(ImageController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (FileUploadException ex) {
            Logger.getLogger(ImageController.class.getName()).log(Level.SEVERE, null, ex);
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
