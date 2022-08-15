<%-- 
    Document   : requestMessage
    Created on : Jun 14, 2022, 9:37:31 AM
    Author     : Minh Hieu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.RequestMessage"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Message</title>  
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
    <style>
        .member {
            height: 380px;
        }

        .statistic img{
            max-width:100%;
            max-height:100%;
        }

        .statistic{
            width:500px;
            height:500px;
        }

        .skill {
            font-size: 30px;
        }

        .choose {
            text-decoration: underline;
            color:green;
        }

        .paging {
            padding-top:50px;
            font-size: 20px;
            text-align: center;
        }

        a.disabled {
            pointer-events: none;
            cursor: default;
        }

        .previous {
            padding-right:20px;
            font-weight: bold;
        }

        .next {
            padding-left: 20px;
            font-weight: bold;
        }

        .title1 {
            margin-top: 15px;
            margin-bottom: 15px;
        }

        .view-button{
            position: absolute;
            bottom:10px;
            left:110px;
        }

        .img-display {
            display: block;
            width: 100%;
            height: auto;
        }

        .no-req {
            text-align: center;
            height: 380px;
        }

        .title-1 {
            margin-top: 20px;
            padding-bottom: 0;
        }

        .content-req {
            min-height: 200px;
            background-color: white;
            border: 2px solid;
            border-radius: 10px;
        }

        .mess {
            color:red;
            font-weight: bold;
            font-size: 25px;
        }

        .content-req p{
            margin: 5px 5px 5px 5px;
        }

        .vl {
            border-left: 3px solid lightblue;
        }

        .displayy {
            padding-bottom: 20px;
        }

        .last {
            padding-bottom: 50px;
            height:200px;
        }

        .status {
            font-weight: bold;
        }

        .search {
            height: 31px;
            width: 100px;
            margin-top: 20px;
            background:rgb(84, 142, 228);
            border-radius: 0;
            color: #fff;
            cursor: pointer;
            display: inline-block;
            font-weight: bold;
            border: solid black;
            border-width: 2px 2px 2px 2px;
        }

        .form {
            padding-bottom: 50px;
            border: 2px solid black;
            padding: 10px 10px 10px 10px;
        }

        label.label {
            padding-right: 10px;
            font-weight: 600;
            font-size: 18px;
            color: #222222;
        }

        .status-filter1 {
            font-weight: bold;
            text-align: right;
        }

        .status-filter {
            margin-left: 69px;
            font-weight: bold;
            text-align: right;
        }

        .red-text {
            color: red;
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
    <%
        ArrayList<RequestMessage> listRequest = (ArrayList<RequestMessage>) request.getAttribute("listRequest");
        ArrayList<RequestMessage> listRequest1 = (ArrayList<RequestMessage>) request.getAttribute("listRequest1");
        int count = 1;
    %>
    <div class="container">
        <div class="row">
            <div class="col">
                 <h2 style="color:wheat;margin-bottom: 20px;text-align: center">Danh sách yêu cầu</h2>
                <p class="text-white mt-5 mb-5"></p>
            </div>
        </div>
        <div class="row tm-content-row">
            <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                <div class="tm-bg-primary-dark tm-block" >
                    <form action="RequestController?do=searchName" method="post">
                        <input style="
                               margin-left: 100px;
                               " name="nameTitle" type="text" maxlength="40"  placeholder="Tìm kiếm tiêu đề">
                        <button   type="submit" name="submit" class="search " style=" border-radius:8px;border: none"><span class="fa fa-search " ></span></button>

                    </form>
                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                <div class="tm-bg-primary-dark tm-block">
                    <div class="row">
                        <div class="col-md-6 mb-4 stretch-card transparent">
                            <div class="card card-tale">
                                <div class="card-body">
                                    <a href="" style="; text-decoration: none"><p class="mb-4" style="color: black">Số yêu cầu </p>
                                        <p class="fs-30 mb-2"><%=listRequest.size()%></p>
                                    </a> 
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 mb-4 stretch-card transparent">
                            <div class="card card-dark-blue">
                                <div class="card-body">
                                    <a href="" style=" text-decoration: none" ><p class="mb-4" style="color: black">Chưa đọc</p>
                                        <p class="fs-30 mb-2" ><%=listRequest1.size()%></p>
                                    </a> 
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </div>



            <div class="col-12 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                    <h2 class="tm-block-title">Danh sách yêu cầu</h2>
                    <p class="text-success">${Mess}</p> 
                    <%
                        if (listRequest.isEmpty()) {

                    %>
                    <div class="no-req" style="text-align: center;font-size: 30px;color: white">Không có dữ liệu, vui lòng thử lại.</div>
                    <%} else {%>
                    <table class="table">

                        <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col"> Email</th>
                                <th scope="col">Tiêu đề</th>
                                <th scope="col">Đã đọc</th>
                                <th scope="col">Xoá</th>

                            </tr>
                        </thead>
                        <%

                            for (RequestMessage s : listRequest) {


                        %>
                        <tbody>
                            <tr>
                                <th scope="row"><b><%=count%></b></th>
                                <td>
                                    <div class="tm-status-circle ">
                                    </div><%=s.getEmail()%>
                                </td>
                                <td><a class="btn-primary"  href="RequestController?do=seenRequest&mid=<%=s.getmId()%>" ><%=s.getTitle()%></a></td>
                                    <% if (s.getIsRead().equals("0")) {%>
                                <td>

                                </td>

                                <% }%>
                                <%
                                    if (s.getIsRead().equals("1")) {
                                %>


                                <td>
                                    <img class="" style="width: 26px;
                                         height: 20px; " src="images/iconmonstr-eye-9.svg">
                                </td>
                                <%}%>

                                <td><button style="border-radius: 5px; padding: 3px" onclick="deleteId('<%=s.getmId()%>')" class="btn btn-primary">  Xoá </a></button></td>

                            </tr>
                            <%count = count + 1;%>
                        </tbody>
                        <%}%>
                    </table>
                    <%}%>

                    <%-- Paging --%>
                    <c:if test="${!empty listRequest}">
                        <div class="row">  
                            <div class="paging">
                                <%-- Previous --%>
                                <%-- Previous --%>
                                <c:choose>
                                    <c:when test="${index>1}">
                                        <a class="previous" href="${href}nameTitle=${nameTitle}&index=${index-1}"><</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="previous disabled" href="${href}nameTitle=${nameTitle}&index=${index-1}"><</a>
                                    </c:otherwise>
                                </c:choose>
                                <%-- Page index --%>
                                <c:forEach begin="1" end="${endPage}" var="i">
                                    <a class="${i == index?" choose":""}" href="${href}nameTitle=${nameTitle}&index=${i}"> ${i}</a> 
                                </c:forEach>
                                <%-- Next --%>
                                <c:choose>
                                    <c:when test="${index!=endPage}">
                                        <a class="next" href="${href}nameTitle=${nameTitle}&index=${index+1}">  ></a>
                                    </c:when>
                                    <c:otherwise>
                                        <a class="next disabled" href="${href}nameTitle=${nameTitle}&index=${index+1}">  ></a>
                                    </c:otherwise>
                                </c:choose>
                            </div> 
                        </div>
                    </c:if>

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
