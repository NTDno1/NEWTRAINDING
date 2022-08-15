
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Room"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Receptionist</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style_3.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>
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
            .log-out{
                position: fixed;
                right: 110px;
                top:35px;
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
                top: 60px;
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
            .selectStatus{
                margin-right: 600px;
            }

            .pagination {
                display: inline-block;
            }

            .pagination a {
                color: black;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
            }
            .supprimer {
                /*                background-color: transparent;
                                text-decoration: underline;
                                border: none;*/
                color: blue;
                cursor: pointer;
                border-radius: 5px;
                background-color: #F1BC31;
                padding: 4px 10px;
            }

            supprimer:focus {
                outline: none;
            }
            .but{
                cursor: pointer;
                border-radius: 5px;
                background-color: #F1BC31;
                padding: 2px 15px;
            }
            .form-group{
                position: relative;
            }
            .style{
                position: absolute;
                left: 0px;
                top:0px;
                font-size: 10px;
            }
            .notif{
                position: fixed;
                right: 40px;
                color: #F1BC31;
                font-size: 20px;
            }
            .notif a:hover{
                color: white;
            }
            .managerRoom{
                position: fixed;
                font-size: 40px;
                color: black;
            }
        </style>
    </head>
    <body>
        <%
            ArrayList<Room> list = (ArrayList<Room>) request.getAttribute("listRoom");

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
            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="padding: 15px">
                <div class="container">
                    <span class="admin"><a href="HomeController">Lễ Tân</a></span>

                    <form action="LoginController?do=logout" method="post">
                        <button type="submit" name="log-out" class="log-out">Đăng xuất</button>
                    </form>
                    <!--search RoomName-->
                    <form action="ReceptionistController?do=searchRoomAndStatus" class="searchform order-lg-last" method="post"  style="
                          margin-right: 100px;
                          margin-top: 10px;
                          ">
                        <div class="form-group d-flex"  >                
                            <input name="nameRoom" type="text" class="form-control pl-3" maxlength="5" placeholder="Tìm kiếm phòng" style="order-radius:8px" >

                            <select name="status" style="order-radius:8px"  >


                                <option value="-1">----------------</option>
                                <option value="0" >Phòng trống</option>
                                <option value="1" >Phòng đã được đặt</option>

                            </select>  
                            <button type="submit" name="submit" style=" border-radius:8px"class="form-control search"><span class="fa fa-search"></span></button>
                        </div>
                    </form>

                    <div class="collapse navbar-collapse" id="ftco-nav">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active"><a href="ReceptionistController" class="nav-link">Quản lí<br>Phòng</a></li>

                            <li class="nav-item "><a href="ReceptionistController?do=customer" class="nav-link">Quản lí<br>khách hàng</a></li>
                            <li class="nav-item "><a href="FeedbackController" class="nav-link">Quản lí<br>feedback</a></li>
                        </ul>
                    </div>
                </div>
                <div class="oke" onclick="show()"><span style=" font-size: 30px;" class="iconify" data-icon="bxs:user-circle"></span></div>

            </nav>

        </section>
        <div>
            <span ><h2 style="margin-top: -50px">Quản lý phòng</h2></span>
        </div>

        <div class="table-wrapper" >   

            <table class="table table-striped table-hover table-bordered"> 
                <thead>
                    <tr class="title">
                        <th>STT</th>
                        <th>Số phòng</th>
                        <th>Miêu tả phòng </th>
                        <th>Giá phòng</th>
                        <th>Số người</th>
                        <th>Diện tích</th>
                        <th>Đánh giá</th>
                        <!--<th>Note</th>-->
                        <th>Tình trạng</th>


                    </tr>
                </thead>
                <% for (Room r : list) {%>
                <tbody>
                    <tr class="name">
                        <td><%=r.getRoomID()%></td>
                        <td><%=r.getRoomname()%></td>
                        <td><%=r.getRoomdesc()%></td>
                        <td><%=r.getRoomprice()%></td>
                        <td><%=r.getNumberPerson()%></td>
                        <td><%=r.getSquare()%></td>
                        <td><%=r.getRate()%></td>
                        <td>
                            <form action="ReceptionistController">
                                <input type="hidden" name="do" value="updateStatus">     
                                <input type="hidden" name="rid" value="<%= r.getRoomID()%>"> 

                                <select name="status"  >
                                    <option value="0" <%if (r.getStatus() == 0) {%>selected<%}%>>Phòng trống</option>
                                    <option value="1" <%if (r.getStatus() == 1) {%>selected<%}%>>Phòng đã được đặt</option>
                                </select>   
                                <button class="supprimer" type="submit" name="submit"  onclick="confirmation()">Cập Nhật</button>
                            </form>
                        </td>

                    </tr>
                <script>


                    function confirmation() {
                        alert('Bạn đã cập nhật thành công!');
                    }
                    function show() {
                        if (document.getElementById("team").style.display == "none") {
                            document.getElementById("team").style.display = "block";
                        } else {
                            document.getElementById("team").style.display = "none";
                        }
                    }
                </script>
                </tbody>
                <%}%>
            </table>
        </div> 
        <script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>
    </body>
</html>