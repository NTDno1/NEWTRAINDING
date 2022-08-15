<%-- 
    Document   : viewFeedBack
    Created on : Jun 15, 2022, 9:53:41 AM
    Author     : MInh Hiếu
--%>

<%@page import="entity.RequestMessage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Request</title>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">   
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" 
        href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
    <script type="text/javascript" 
    src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" 
    src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/templatemo-style.css">

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
</head>

<body id="reportsPage">
    <nav class="navbar navbar-expand-xl" style="margin-bottom: 15px">
        <div class="container h-100">
            <a class="navbar-brand" href="AdminController">
                <h1 class="tm-site-title mb-0">Admin</h1>
            </a>
            <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars tm-nav-icon"></i>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mx-auto h-100">
                    <li class="nav-item">
                        <a class="nav-link" href="AdminController">
                            <i class="fas fa-tachometer-alt"></i>
                            Bảng điều khiển
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item dropdown">

                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            <i class="far fa-file-alt"></i>
                            <span>
                                Báo cáo <i class="fas fa-angle-down"></i>
                            </span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="AdminController?do=ReportDay">Báo cáo doanh số theo phòng</a>
                            <a class="dropdown-item" href="AdminController?do=ReportMonth">Báo cáo tháng</a>
                            <a class="dropdown-item" href="#">Báo cáo năm</a>
                        </div>
                    </li>
                       <li class="nav-item dropdown">
                            <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="navbarDropdown"
                                role="button"
                                data-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false">
                                <i class="fas fa-door-open"></i>
                                <span> Phòng <i class="fas fa-angle-down"></i> </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="RoomsController?do=listroom">Dann Sách Phòng</a>
                                <a class="dropdown-item" href="DeviceController?do=listalldevice">Danh Sách Thiết Bị</a>
                                <a class="dropdown-item" href="RoomcategoryController?do=getroombycategori">Loại Phòng</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ServiceController?do=ListService">
                                <i class="fa fa-bars"></i> Dịch Vụ
                            </a>
                        </li>

                     <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                <i class="fab fa-blogger"></i>
                                <span>
                                    Tin tức <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="BlogManagerController?do=editblog&page=1">Chỉnh sửa tin tức</a>
                                <a class="dropdown-item" href="addblog.jsp">Thêm tin tức</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ManagerAccount">
                                <i class="fas fa-address-card"></i></i> Phân quyền
                            </a>
                        </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="RequestController?do=listRequest">
                            <i class="fas fa-newspaper "></i></i> Yêu cầu
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="NotificationController">
                            <i class="fas fa-bell"></i> Thông báo
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-cog"></i>
                            <span>
                                Cài đặt <i class="fas fa-angle-down"></i>
                            </span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="AdminController?do=viewProfileAdmin">Thông tin</a>
                             <a class="dropdown-item" href="OrderController?do=showCartAdmin">Hóa đơn</a>
                        </div>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link d-block" href="LoginController?do=logout">
                            Admin, <b>Đăng xuất</b>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </nav>
    <%
        RequestMessage requestMessage = (RequestMessage) request.getAttribute("seen");
    %>
    <div class="container">
        <div class="row">
            <div class="col">
                <h2 style="color:wheat;margin-bottom: 20px;text-align: center">Nội dung yêu cầu</h2>
                <p class="text-white mt-5 mb-5"></p>
            </div>
        </div>
        <div class="row tm-content-row">




            <div class="col-12 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                    <h2 class="tm-block-title">Nội dung</h2>


                    <table class="table">

                        <thead>
                            <tr>
                                <th scope="col"> Email</th>
                                <th scope="col">Tiêu đề</th>
                                <th  scope="col">Nội dung</th>
                                <th  scope="col"></th>


                            </tr>
                        </thead>

                        <tbody>
                            <tr>
                                <td>  <%=requestMessage.getEmail()%> </td>
                                <td><p style="width: 150px; word-break: break-all"><%=requestMessage.getTitle()%></p></td>
                                <td ><p style="width: 200px; word-break: break-all"><%=requestMessage.getContent()%></p></td>
                                <td >   <a href="RequestController?do=viewReply&mID=<%=requestMessage.getmId()%>&email=<%=requestMessage.getEmail()%> "> <button  style=""  class="btn btn-primary">  Trả lời </button></a></td>


                            </tr>

                        </tbody>

                    </table>
                    <button  style="margin-top: 20px" onclick="deleteId('<%=requestMessage.getmId()%>')" class="btn btn-primary">  Xoá </a></button>
                    <a style="float: right; margin-top: 20px" class="btn btn-danger" href="RequestController?do=listRequest&index=${index}">Trang trước</a>

                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/moment.min.js"></script>
    <!-- https://momentjs.com/ -->
    <script src="js/Chart.min.js"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="js/tooplate-scripts.js"></script>
    <script>
                        function deleteId(id) {
                            if (confirm("Bạn có muốn xoá yêu cầu này không?")) {
                                window.location = "RequestController?do=deleteRequest&mId=" + id;
                            }

                        }

    </script>
</body>
</html>
