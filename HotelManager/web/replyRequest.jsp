<%-- 
    Document   : replyRequest
    Created on : Jul 5, 2022, 4:21:09 PM
    Author     : Minh Hiếu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
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
<style>
    .form-group{
        position: relative;
    }
    .style{
        position: absolute;
        left: 20px;
        top:40px;
        font-size: 10px;
    }
    .style1{
        position: absolute;
        left: 20px;
        top:310px;
        font-size: 10px;
    }
</style>
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
                            <a class="dropdown-item" href="AdminController?do=incomeRoom">Báo cáo doanh số theo phòng</a>
                            <a class="dropdown-item" href="AdminController?do=ReportMonth">Báo cáo tháng</a>
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
      <h2 style="color:wheat;margin-bottom: 20px;text-align: center">Trả lời yêu cầu</h2>
    <div class="tm-block-col tm-col-account-settings" style="margin-left: auto; margin-right: auto ">
        <h4 style="color: red;font-size: 25px;">${requestScope.err}</h4>
        <h4 style="color: red;font-size: 25px;">${requestScope.mess1}</h4>

        <div class="tm-bg-primary-dark tm-block tm-block-settings" >
            <form action="RequestController?do=sendReply" method="POST" class="tm-signup-form row">
                <input hidden  name="mID" value="${sessionScope.mID}">
                <div class="form-group col-lg-12">
                    <i class="fas fa-star style" style="color:red;"></i>         <label for="email">Email nhận</label>
                    <input style="background-color: white; color: #54657D;"
                           id="email"
                           name="inputEmail"
                           type="email"
                           maxlength="100" 
                           required
                           value="${email}"
                           readonly
                           class="form-control  validate"
                           />
                </div>
                <div class="form-group col-lg-12">
                    <i class="fas fa-star style" style="color:red;"></i> <label for="inputYourname">Tên người gửi</label>
                    <input pattern=".*\S" title="Không được để khoảng trắng"  style="background-color: white; color: #54657D;"
                           id="name"
                           name="name"
                           type="text"
                           maxlength="50"
                           required
                           value=""
                           class="form-control validate"
                           />
                </div>
                <div class="form-group col-lg-12">
                    <label for="inputCMT">Tiêu đề</label>
                    <i class="fas fa-star style" style="color:red;"></i>     <input pattern=".*\S" title="Không được để khoảng trắng" t style="background-color: white; color: #54657D;"
                                                                                    id=""
                                                                                    name="inputTitle"
                                                                                    type="text"
                                                                                    maxlength="40" required 
                                                                                    value=""

                                                                                    class="form-control validate"
                                                                                    />
                </div>
                <div class="form-group col-lg-12">
                    <label for="inputAdress">Nội dung</label>
                    <i class="fas fa-star style" style="color:red;"></i>     <input style="background-color: white; color: #54657D;"
                                                                                    id="email"
                                                                                    name="inputContent"
                                                                                    type="text"
                                                                                    pattern=".*\S" title="Không được để khoảng trắng" 
                                                                                    required maxlength="100"
                                                                                    value=""
                                                                                    class="form-control validate"
                                                                                    />
                </div>


                <div class="col-12">
                    <button
                        type="submit"
                        name="submit"
                        class="btn btn-primary btn-block text-uppercase"
                        >
                        GỬI
                    </button>
                </div>
        </div>
    </form>
    <div class="col-4">
        <button style="margin-left: 609px; margin-top: 40px"
                class="btn btn-primary btn-block text-uppercase"
                >
            <a href="RequestController?do=seenRequest&mid=${mID}" > <b style="color: white">Trang trước</b></a> 
        </button>
    </div>
</div>
<script src="js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
</body>
</html>
