<%@page import="java.util.ArrayList"%>
<%@page import="entity.Account"%>
<%@page import="dao.impl.UserDAOImpl"%>
<%@page import="entity.Message"%>
<%@page import="entity.User"%>
<%@page import="java.util.Vector"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Danh sách Feedback</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style_3.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Roboto', sans-serif;
                position: relative;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 10px;
                margin: 0 0 10px;
                min-width: 100%;
            }
            .table-title h2 {
                margin: 8px 0 0;
                font-size: 22px;
            }
            .search-box {
                position: relative;        
                float: right;
            }
            .search-box input {
                height: 34px;
                border-radius: 20px;
                padding-left: 35px;
                border-color: #ddd;
                box-shadow: none;
            }
            .search-box input:focus {
                border-color: #3FBAE4;
            }
            .search-box i {
                color: #a0a5b1;
                position: absolute;
                font-size: 19px;
                top: 8px;
                left: 10px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child {
                width: 130px;
            }
            table.table td a {
                color: #a0a5b1;
                display: inline-block;
                margin: 0 5px;
            }
            table.table td a.view {
                color: #03A9F4;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #E34724;
            }
            table.table td i {
                font-size: 19px;
            }    
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 95%;
                width: 30px;
                height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 30px !important;
                text-align: center;
                padding: 0;
            }
            .pagination li a:hover {
                color: #666;
            }	
            .pagination li.active a {
                background: #03A9F4;
            }
            .pagination li.active a:hover {        
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 6px;
                font-size: 95%;
            }
            .selectStatus{
                position: absolute;
                top:20px;
                right: 20px;
            }
            .managerPro{
                position: absolute;
                top:10px;
                left:10px;
                color: black;
                text-decoration: underline;
                list-style: circle inside;
            }
            .managerCus{
                position: absolute;
                top:45px;
                left:10px;
                color: black;
                text-decoration: underline;
                list-style: circle inside;
            }
            .title{
                font-size: 13px;
            }
            .name{
                font-size: 13px;
            }
            /*            .table-wrapper{
                            margin-left: 50px;
                        }*/
            .log-out{
                position: fixed;
                right: 100px;
                top:20px;
                border-radius: 5px;
                background-color: #F1BC31;
                margin-right: 20px;
            }
            .log-out:hover{
                transform: scale(0.98);
            }
            .oke{
                color: #F1BC31;
                position: fixed;
                right: 85px;
            }
            .oke:hover{
                color: white;
            }
            .card{
                display: none;
                opacity: 0.9;
                z-index: 3;
                width: 150px;
                height: 250px;
                text-align: center;
                background-color: #1F2123;
                color: white;
                position: relative;
                position: fixed;
                top: 45px;
                right: 30px;
                border-radius: 10px;
                overflow: hidden;
                transition: 0.5s;
            }
            .card_img img{
                width: 70px;
                height: 70px;
                border-radius: 50%;
                border: 5px solid #A53E3E;
                background-size: cover;
                margin-top: 30px;
                cursor: pointer;
                transition: 0.4s;
                transition-delay: 0.1s;
                transform: rotate(20deg);
            }
            .card_name{
                margin-top: 10px;
                color: #A53E3E;
                font-size: 15px;
                margin-bottom: 5px;
            }
            .card_logo a{
                color: white;
                margin: 0px 10px;
                font-size: 15px;
                cursor: pointer;
                transition: 0.4s;
                text-decoration: none;
            }
            .card_button button{
                margin-top: 10px;
                width: 50%;
                height: 30px;
                border-radius: 3px;
                border: 2px solid #A53E3E;
                color: white;
                background-color: #A53E3E;
                cursor: pointer;
                transition: 0.4s;
                font-size: 10px;
            }
            .card_button button:hover{
                background-color:#913939;
                font-size: 11px;
            }
            .card_logo a:hover{
                color: #A53E3E;
            }
            .card_img img:hover{
                width: 75px;
                height: 75px;
                border-radius: 50%;
                border: 5px solid #A53E3E;
                background-size: cover;
                margin-top: 30px;
                cursor: pointer;
                transition: 0.4s;
                transition-delay: 0.1s;
                transform: rotate(0deg);
            }
            .notif{
                position: fixed;
                right: 910px;
                color: #F1BC31;
                font-size: 25px;
            }
            .notif a:hover{
                color: white;
            }
            .feedbackM{
                position: fixed;
                top: 100px;
                left: 10px;
                font-size: 30px;
                color: black;
            }
        </style>
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>
    </head>
    <body>
        <%
            ArrayList<Message> vector = (ArrayList<Message>) request.getAttribute("vector");
            ArrayList<Account> listAccount = (ArrayList<Account>) request.getAttribute("listAccount");
            UserDAOImpl dao = new UserDAOImpl();
        %>
        <section class="ftco-section">
            <div class="card" id="team">
                <div class="card_img">
                    <img src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                </div>
                <c:if test="${sessionScope.login!=null}">
                    <div class="card_name">
                        <p>${sessionScope.login.getUser()}</p>                        
                    </div>
                </c:if>

                <div class="card_logo">
                    <a href="https://www.youtube.com/">
                        <i class='bx bxl-facebook-circle'></i>
                    </a>
                    <a href="https://www.youtube.com/">
                        <i class='bx bxl-youtube' ></i>
                    </a>
                    <a href="https://www.youtube.com/">
                        <i class='bx bxl-github' ></i>
                    </a>
                </div>

                <div class="card_button">
                    <a href="ReceptionistController?do=profile"><button>Thông tin</button></a>                          
                </div>

            </div>
            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container">
                      <span class="admin"><a href="HomeController">Lễ Tân</a></span>
                    <form action="LoginController?do=logout" method="post">
                        <button type="submit" name="log-out" class="log-out">Đăng xuất</button>
                    </form>
                    <form action="FeedbackController?do=SearchName" class="searchform order-lg-last" method="post"  style="
                          margin-right: 100px;
                          margin-top: 10px;
                          ">
                        <div class="form-group d-flex" >
                            <input required="" maxlength="30" name="Name" type="text" class="form-control pl-3" placeholder="Tìm kiếm tên" style="order-radius:8px">
                            <button type="submit" placeholder="" class="form-control search"><span class="fa fa-search"></span></button>
                        </div>
                    </form>
                    <div class="collapse navbar-collapse" id="ftco-nav">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item "><a href="ReceptionistController" class="nav-link">Quản lí<br>phòng </a></li>
                            <!--                            <li class="nav-item"><a href="ControllerOrder" class="nav-link">Manager<br>ListOrders</a></li>-->
                            <li class="nav-item"><a href="ReceptionistController?do=customer" class="nav-link">Quản lí<br>khách hàng</a></li>
                            <li class="nav-item active"><a href="FeedbackController" class="nav-link">Quản lí<br>feedback</a></li>
                        </ul>
                    </div>

                </div>
                <div class="oke" onclick="show()"><span style=" font-size: 30px;" class="iconify" data-icon="bxs:user-circle"></span></div>
                <div class="notif"><a href="FeedbackController?do=Admin"><span class="iconify" data-icon="clarity:notification-solid"></a></span><h10 style="font-size:12px;">Admin</h10></div>
            </nav>

        </section>
                    <div class="feedbackM">
                        <span>Quản lý Feedback</span>
                    </div>          
        <div class="table-wrapper">
            <table class="table table-striped table-hover table-bordered" style="Margin-left:10px;"> 
                <thead>
                    <tr class="title" >
                        <th></th>
                        <th>Tên</th>
                        <th>Điện thoại</th>
                        <th>Email</th>
                        <th>Địa chỉ</th>
                        <th>Ngày gửi feedback</th>
                        <th>Nội dung</th>
                        <th style="width:30px">Mã phòng</th>
                        <th style="width:30px; color:Black">Xóa feedback</th>
                        <th style="width:30px">Report tài khoản</th>                        
                        <th style="width:30px">Gỡ Report tài khoản</th>                        
                    </tr>
                </thead>
                <tbody>      
                    <%for (Message m : vector) {
                            User u = dao.getUserByaID(m.getAccountID());
                    %>
                    <tr class="name">
                        <td><img src="https://ptetutorials.com/images/user-profile.png" style="width: 25px;height:25px"></td>
                        <td><%= u.getUserName()%></td>
                        <td><%=u.getUserPhone()%></td>
                        <td><%=u.getUserEmail()%></td>
                        <td><%=u.getUserAdress()%></td>
                        <td><%=m.getDate()%></td>
                        <td><%=m.getContent()%></td>
                        <td style="width:30px"><%=m.getRoomID()%></td>
                            <form action="FeedbackController?do=Deletefeedback" method="post">
                    <input type="hidden" value="<%=m.getAccountID()%>" name="aID"> 
                    <input type="hidden" value="<%=m.getMessageID()%>" name="mID"> 
                    <input type="hidden" value="<%=m.getContent()%>" name="content"> 
                    <td style="width:30px"><button  onclick="deleteN()" type="submit"><i class="material-icons" style="color:Black">&#xE872;</i></button></td>
                </form>
                        </td>
                        <% boolean check = false;
                            Cookie c[] = request.getCookies();
                            for (Account a : listAccount) {
                                for (Cookie o : c) {
                                    if ((o.getName().equals(String.valueOf(a.getAccountID()))) && (Integer.parseInt(o.getValue()) == m.getMessageID())) {
                                        check = true;
                                    }
                                }
                            }
                            if (!check) {
                        %>

                <form action="FeedbackController?do=ReportAccount" method="post">
                    <input type="hidden" value="<%=m.getAccountID()%>" name="aID"> 
                    <input type="hidden" value="<%=m.getMessageID()%>" name="mID"> 
                    <input type="hidden" value="<%=m.getContent()%>" name="content"> 
                    <td style="width:30px"><button  onclick="report()" type="submit"><i class="material-icons" style="color:red">assistant_photo</i></button></td>
                    <td style="width:30px"></td>
                </form>

                <% } else {%>
                <form action="FeedbackController?do=ExitReport" method="post">
                    <input type="hidden" value="<%=m.getAccountID()%>" name="aID"> 
                    <input type="hidden" value="<%=m.getMessageID()%>" name="mID"> 
                    <td style="width:30px"></td>
                    <td style="width:30px"><button onclick="exitreport()" type="submit"><i class="material-icons" style="color:red">assistant_photo</i></button></td>                      
                </form>       
                <% }%>
                </tr> 
                <% }%>
                </tbody>
            </table>
        </div>
                 <script>
            function show() {
                if (document.getElementById("team").style.display == "none") {
                    document.getElementById("team").style.display = "block";
                } else {
                    document.getElementById("team").style.display = "none";
                }
            }
            function exitreport(){
                        alert("Gỡ tố cáo tài khoản thành công!");
                }
                function report(){
                        alert("Tố cáo tài khoản thành công!");
                }
                function deleteN(){
                        alert("Xóa phản hồi thành công!");
                }
        </script>
    </body>
</html>