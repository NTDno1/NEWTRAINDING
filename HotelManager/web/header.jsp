<%-- 
    Document   : heade
    Created on : Jun 4, 2022, 3:47:17 PM
    Author     : Thai Quan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="context.DBContext"%>
<%@page import="entity.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
<header>
    <div class="site-navbar-wrap js-site-navbar bg-white">
        <div class="container">
            <div class="site-navbar bg-light">
                <div class="py-1">
                    <div class="row align-items-center">
                        <div class="col-2">
                            <h2 class="mb-0 site-logo"><a href="HomeController">Hoang Hon</a></h2>
                        </div>
                        <div class="col-10">
                            <nav class="site-navigation text-right" role="navigation">
                                <div class="container">


                                    <div class="d-inline-block d-lg-none  ml-md-0 mr-auto py-3"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu h3"></span></a></div>
                                    <ul class="site-menu js-clone-nav d-none d-lg-block">
                                        <li class="active"> 

                                        </li>
                                        <li class="active">
                                            <a style="font-family: PlayFair Display" href="HomeController">Trang chủ</a>
                                        </li>
                                        <li class="has-children">
                                            <a style="font-family: PlayFair Display" href="RoomController?page=1">Phòng</a>
                                            <ul class="dropdown arrow-top">
                                                <% DBContext db= new DBContext();
                                                    ResultSet rs=db.getData("select * from CateRoom");
                                                    while(rs.next()){
                                                %>
                                                <li><a style="font-family: PlayFair Display" href="RoomController?do=CateRoom&cate=<%=rs.getInt(1) %>"><%=rs.getString(2) %></a></li>
                                                <%}%>
                                            </ul>
                                        </li>

                                        <%
                                            Account ac = (Account) session.getAttribute("login");
                                            if (ac == null) {
                                        %>
                                        <li><a style="font-family: PlayFair Display" href="BlogController?do=getBlog">Thông tin</a></li>
                                        <li><a style="font-family: PlayFair Display" href="EventController">Sự kiện</a></li>
                                        <li><a style="font-family: PlayFair Display" href="contact.jsp">Liên hệ</a></li>
                                        <li class="login"><a style="font-family: PlayFair Display" href="LoginController">Đăng Nhập</a></li>
                                        <li class="register"><a style="font-family: PlayFair Display" href="Register.jsp">Đăng ký</a></li>
                                            <% } else if (ac.getRoleID() == 1) {%>
                                        <li><a style="font-family: PlayFair Display" href="BlogController?do=getBlog">Thông tin</a></li>
                                        <li><a style="font-family: PlayFair Display" href="EventController">Sự kiện</a></li>
                                        <li><a style="font-family: PlayFair Display" href="OrderController?do=yourbill&id=<%=ac.getAccountID()%>">Đơn Hàng</a></li>
                                        <li><a style="font-family: PlayFair Display" href="contact.jsp">Liên hệ</a></li>
                                        <li class="login"><a style="font-family: PlayFair Display" href="LoginController?do=logout">Đăng xuất</a></li>

                                        <li class="user"><a id="showmore" onclick="show()" style="font-family: PlayFair Display; cursor: pointer;"><span style=" font-size: 30px;" class="iconify" data-icon="bxs:user-circle"></span></a>

                                        </li>   
                                        <%} else if (ac.getRoleID() == 2) {%>
                                       <li><a style="font-family: PlayFair Display" href="BlogController?do=getBlog">Thông tin</a></li>
                                       <li><a style="font-family: PlayFair Display" href="EventController">Sự kiện</a></li>
                                        <li><a style="font-family: PlayFair Display" href="contact.jsp">Liên hệ</a></li>
                                        <li class="login"><a style="font-family: PlayFair Display; margin-right: 14px" href="ReceptionistController">Lễ Tân</a></li>
                                        <li class="register"><a style="font-family: PlayFair Display" href="LoginController?do=logout">Đăng xuất</a></li>
                                            <%} else if (ac.getRoleID() == 3) {%>
                                        <li class="login"><a style="font-family: PlayFair Display; margin-right: 14px" href="AdminController">Admin</a></li>
                                        <li class="register"><a style="font-family: PlayFair Display" href="LoginController?do=logout">Đăng xuất</a></li>
                                            <%}%>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

