<%-- 
Document   : index
Created on : May 30, 2022, 2:50:07 PM
Author     : admin
--%>

<%@page import="entity.Account"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Service"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="entity.Room"%>
<%@page import="entity.Image"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Hoang Hon &mdash; Hotel</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700|Work+Sans:300,400,700" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="css/bootstrap.min_1_1.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/datepicker.css" />
        <link rel="stylesheet" href="css/tooplate-style.css">
    </head>
    <script>
        function Validate() {
            var x = document.getElementById("adult");
            var y = document.getElementById("room");
            console.log(x);
            if (y > x) {
                alert("Phòng không thể nhiều hơn số người lớn");
                return false;
            }
        }
    </script>
    <style>

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
            top: 75px;
            right: 40px;
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

        .login{
            position: fixed;
            right: 110px;
        }
        .register{
            position: fixed;
            right: 40px;
        }
        .user{
            position: fixed;
            right: 90px;
        }
        div.stars {
            width: 270px;
            display: inline-block;
            position: absolute;
            top: 244px;
            right: 100px;
        }

        input.star {
            display: none;
        }

        label.star {
            float: right;
            padding: 10px;
            font-size: 16px;
            color: #444;
            transition: all .2s;
        }

        input.star:checked ~ label.star:before {
            content: '\f005';
            color: #FD4;
            transition: all .25s;
        }

        input.star-5:checked ~ label.star:before {
            color: #FE7;
            text-shadow: 0 0 20px #952;
        }
        .checked {
            color: orange;
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
            input.star-1:checked ~ label.star:before {
                color: #F62;
            }

            label.star:hover {
                transform: rotate(-15deg) scale(1.3);
            }

            label.star:before {
                content: '\f006';
                font-family: FontAwesome;
            }
            .feedback{
                color:#1E90FF;
                font-size: 50px;
                position: fixed;
                right: 25px;
                bottom: 25px;
                z-index: 10;
                cursor: pointer;
            }
            .iconfb{
                position: fixed;
                z-index: 10;
                top: 10px;
                right: 10px;
            }
            .location{
                position: fixed;
                left: -80px;
                bottom: 100px;
            }
            .text-center

        </style>
        <body>
            <% Vector<Room> vector = (Vector<Room>) request.getAttribute("vector");
                Vector<Room> vector2 = (Vector<Room>) request.getAttribute("vector2");
                Vector<Service> vector3 = (Vector<Service>) request.getAttribute("vector3");
                Vector<Room> vector4 = (Vector<Room>) request.getAttribute("vector4");
                Account a = (Account) session.getAttribute("login");
            %>
            <div class="site-wrap">
                <jsp:include page="header.jsp"></jsp:include>
                    <div class="site-mobile-menu">
                        <div class="site-mobile-menu-header">
                            <div class="site-mobile-menu-close mt-3">
                                <span class="icon-close2 js-menu-toggle"></span>


                            </div>
                            <div class="site-mobile-menu-body"></div>
                        </div> <!-- .site-mobile-menu -->


                    </div>
                    <div class="card" id="team">
                        <div class="card_img">
                            <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="">
                        </div>
                    <c:if test="${sessionScope.login!=null}">
                        <div class="card_name">
                            <p style="color:white;">${sessionScope.login.getUser()}</p>                        
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
                        <a href="UserController"><button>Thôn tin</button></a>                       
                    </div>
                </div>
                <%
                    Account ac = (Account) session.getAttribute("login");
                    if (ac != null) {
                %>
                <a href="MessageController">          
                    <span style="color:#1E90FF;
                    font-size: 50px;
                    position: fixed;
                    right: 25px;
                    bottom: 25px;
                    z-index: 10;
                    cursor: pointer" class="iconify" data-icon="bx:message-rounded"></span>                
                    </a> 
                    <% }%>
                    <div class="slide-one-item home-slider owl-carousel">
                        <div class="site-blocks-cover overlay" style="background-image: url(images/hero_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
                        <div class="container">
                            <div class="row align-items-center justify-content-center">
                                <div class="col-xs-12 ml-auto mr-auto ie-container-width-fix">
                                    <form action="RoomController" method="post" class="tm-search-form tm-section-pad-2" onsubmit="return Validate()">
                                        <input type="hidden" name="do" value="searchRoom">
                                         <div class="form-row tm-search-form-row">
                                            <div class="form-group tm-form-element tm-form-element-50">
                                                <i class="fa fa-calendar fa-2x tm-form-element-icon"></i>
                                                <input name="check-in" type="text"  class="form-control" id="inputCheckIn" placeholder="Ngày đến" required>
                                            </div>
                                            <div class="form-group tm-form-element tm-form-element-50">
                                                <i class="fa fa-calendar fa-2x tm-form-element-icon"></i>
                                                <input name="check-out" type="text" class="form-control" id="inputCheckOut" placeholder="Ngày đi" required>
                                            </div>
                                        </div>
                                        <div class="form-row tm-search-form-row">
                                            <div class="form-group tm-form-element tm-form-element-2">
                                                <select name="adult" class="form-control tm-select" id="adult">
                                                    <option value="">Người lớn</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                </select>
                                                <i class="fa fa-2x fa-user tm-form-element-icon"></i>
                                            </div>
                                            <div class="form-group tm-form-element tm-form-element-2">
                                                <select name="children" class="form-control tm-select" id="children">
                                                    <option value="">Trẻ em</option>
                                                    <option value="0">0</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                </select>
                                                <i class="fa fa-user tm-form-element-icon tm-form-element-icon-small"></i>
                                            </div>
                                            <div class="form-group tm-form-element tm-form-element-2">
                                                <select name="room" class="form-control tm-select" id="room">
                                                    <option value="">Phòng</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                </select>
                                                <i class="fa fa-2x fa-bed tm-form-element-icon"></i>
                                            </div>
                                            <div class="form-group tm-form-element tm-form-element-2">
                                                <button type="submit" class="btn btn-primary tm-btn-search">Tìm kiếm phòng</button>
                                            </div>
                                        </div>                         
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>       
                </div>                               

                <div class="site-section bg-light">                
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 mx-auto text-center mb-5 section-heading">
                                <h2 class="mb-5">Danh sách phòng</h2>
                            </div>
                        </div>
                        <div class="row">
                            <%for (Room v : vector) {%>
                            <div class="col-md-6 col-lg-4 mb-5">
                                <div class="hotel-room text-center">
                                    <a  href="RoomController?do=roomdetails&roomid=<%=v.getRoomID()%>&cateroom=<%=v.getRoomcateID()%>" class="d-block mb-0 thumbnail"><img style="width: 350px;
                                                                                                                                                                          height: 250px;" src="images/anhphong/<%= v.getImage()%>" 
                                                                                                                                                                          alt="Image" class="img-fluid"></a>
                                    <div class="stars">
                                        <form action="">
                                            <div class="h" style="font-size: 20px;
                                                padding-left: 35%;
                                                padding-top: 5px">
                                                    <c:forEach begin="1" end="<%=v.getRate()%>">
                                                        <span style="padding-right: 6px"class="fa fa-star checked"></span>
                                                    </c:forEach>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="hotel-room-body">

                                            <h3 class="heading mb-0"><a style="font-size: 20px;
                                            text-align: center;
                                            margin: 0 auto;
                                            font-weight: bold;
                                            color: #b09700;
                                            font-family: Times New Roman;" href="#"><%=v.getCateroom()%></a></h3>
                                        <strong class="price" style="font-weight: bold;
                                        font-size: 14px"><fmt:formatNumber value="<%=v.getRoomprice()%>" />đ/ một đêm</strong>
                                            <div class="add-to-cart">
                                                <form action="RoomController">
                                                    <input type="hidden" name="do" value="roomdetails">
                                                    <input type="hidden" name="roomid" value="<%=v.getRoomID()%>">
                                                    <input type="hidden" name="cateroom" value="<%=v.getRoomcateID()%>">
                                                    <button  style="margin-top: 10px;
                                                position: fixed;
                                                left: 10px;" class="add-to-cart-btn" type="submit"><i class="fa fa-shopping-cart"></i>Đặt phòng</a></button>
                                            </form>

                                            <form action="CompareRoomController">
                                                <input type="hidden" name="do" value="ViewCompare">
                                                <input type="hidden" name="roomid" value="<%=v.getRoomID()%>">
                                                <input type="hidden" name="cateroom" value="<%=v.getRoomcateID()%>">
                                                <button style="margin-left: 150px;
                                                        position: fixed;
                                                        left: 40px;
                                                        top: 29px;" class="add-to-cart-btn" ><i class="fa fa-compress"></i><a>So sánh</a></button>
                                            </form>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                            <%}%> 
                        </div>
                    </div>
                </div>
                <div class="site-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 mx-auto text-center mb-5 section-heading">
                                <h2 class="mb-5">TÍNH NĂNG HIỆN CÓ</h2>
                            </div>
                        </div>
                        <div class="row">
                            <%for (Service s : vector3) {%>
                            <div class="col-sm-6 col-md-4 col-lg-3">
                                <div class="text-center p-4 item">
                                    <a href="ServiceController?do=servicedetail&ServiceID=<%=s.getServiceID()%>">
                                        <img style="width:250px;
                                        height: 200px" src="images/anhdevice/<%=s.getServiceImage()%>">
                                            <h2 style="font-weight: bold;
                                        padding-top: 20px;
                                        font-family: 'Times New Roman';
                                        font-size: 22px;
                                        color: orangered;
                                        padding-left: 28px; "class="h5"><%=s.getServiceName()%></h2>
                                    </a>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div>
                <div class="site-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 mx-auto text-center mb-5 section-heading">
                                <h2 class="mb-5">Phòng còn trống</h2>
                            </div>
                        </div>
                        <div class="row no-gutters">
                            <%for (Room r : vector4) {%>
                            <div class="col-md-6 col-lg-4">
                                <a href="RoomController?do=roomdetails&roomid=<%=r.getRoomID()%>&cateroom=<%=r.getRoomcateID()%>" class="img-opacity"><img style="width: 400px;
                                    height: 250px;" src="images/anhphong/<%=r.getImage()%>" alt="Image" class="img-fluid"></a>                        
                            </div>
                            <%}%>
                        </div>
                        <div class="row mt-5">
                            <div class="col-md-12 text-center">
                                <div class="site-block-27">
                                    <ul>
                                        <c:forEach begin="1" end="${n}" var="c">
                                            <li><a href="HomeController?page=${c}">${c}</a></li>
                                            </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="site-section block-15">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 mx-auto text-center mb-5 section-heading">
                                <h2>Thông tin phòng</h2>
                            </div>
                        </div>
                        <div class="nonloop-block-15 owl-carousel">
                            <%for (Room e : vector2) {%>
                            <div class="media-with-text p-md-5">
                                <div class="img-border-sm mb-4">

                                    <a href="RoomController?do=roomdetails&roomid=<%=e.getRoomID()%>" class="popup-vimeo image-play">
                                        <img style="width: 250px;
                                        height: 200px;" src="images/anhphong/<%=e.getImage()%>" alt="Image" class="img-fluid">
                                    </a>
                                </div>
                                <div>
                                    <a href="RoomController?do=roomdetails&roomid=<%=e.getRoomID()%>" style="font-weight: bold;
                                    font-size: 25px;
                                    color: black;
                                    font-family: Didot"><%=e.getCateroom()%></a>
                                        <span class="mb-3 d-block post-date">Tháng 12, 2018 &bullet; Bởi <a href="#">Admin</a></span>
                                        <p><%=e.getRoomdesc().substring(0, 100)%>...</p>
                                    </div>
                                </div>         
                                <%}%>
                            </div>
                        </div>
                    </div>
                    <div class="site-section block-14 bg-light">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-6 mx-auto text-center mb-5 section-heading">
                                    <h2>Phản hồi khách hàng</h2>
                                </div>
                            </div>
                            <div class="nonloop-block-14 owl-carousel">

                                <div class="p-4">
                                    <div class="d-flex block-testimony">
                                        <div class="person mr-3">
                                            <img src="images/person_1.jpg" alt="Image" class="img-fluid rounded">
                                        </div>
                                        <div>
                                            <h2 class="h5">Katie Johnson</h2>
                                            <blockquote>&ldquo;Mọi người hãy ghé qua nơi tuyệt vời này. Let go!&rdquo;</blockquote>
                                        </div>
                                    </div>
                                </div>
                                <div class="p-4">
                                    <div class="d-flex block-testimony">
                                        <div class="person mr-3">
                                            <img src="images/person_2.jpg" alt="Image" class="img-fluid rounded">
                                        </div>
                                        <div>
                                            <h2 class="h5">Jane Mars</h2>
                                            <blockquote>&ldquo;Căn phòng này thật hoàn hảo !&rdquo;</blockquote>
                                        </div>
                                    </div>
                                </div>
                                <div class="p-4">
                                    <div class="d-flex block-testimony">
                                        <div class="person mr-3">
                                            <img src="images/person_3.jpg" alt="Image" class="img-fluid rounded">
                                        </div>
                                        <div>
                                            <h2 class="h5">Shane Holmes</h2>
                                            <blockquote>&ldquo;Khách sạn này xứng đánh 5 sao với sự đầu tư đầy đủ và đẹp đẽ này!&rdquo;</blockquote>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="py-5 quick-contact-info">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4 text-center">
                                    <div>
                                        <span class="icon-room text-white h2 d-block"></span>
                                        <h2>Địa điểm:</h2>
                                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d6403.40234353664!2d107.08224774036356!3d20.95655790979934!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314a5816439d4427%3A0x199156ac489da67d!2zNDIgVHLhuqduIEjGsG5nIMSQ4bqhbywgQ2FvIFRo4bqvbmcsIFRow6BuaCBwaOG7kSBI4bqhIExvbmcsIFF14bqjbmcgTmluaCwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1656520360741!5m2!1svi!2s" width="400" height="320" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                </div>
                            </div>
                            <div class="col-md-4 text-center">
                                <div>
                                    <span class="icon-clock-o text-white h2 d-block"></span>
                                    <h2>Thời gian làm việc:</h2>
                                    <p class="mb-0">Thứ hai:6:30PM - 7:30PM <br>
                                        Thứ bảy: 7:30PM <br>
                                       Chủ nhật:8:00AM</p>
                                </div>
                            </div>
                            <div class="col-md-4 text-center">
                                <div>
                                    <span class="icon-comments text-white h2 d-block"></span>
                                    <h2>Liên hệ</h2>
                                    <p class="mb-0">Email: info@yoursite.com <br>
                                       Số điện thoại: (123) 3240-345-9348 </p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <jsp:include page="footer.jsp"></jsp:include>
            </div>
        </div>
             <script src="js/jquery-1.11.3.min.js"></script>    
            <script src="js/jquery-3.3.1.min.js"></script>
            <script src="js/jquery-migrate-3.0.1.min.js"></script>
            <script src="js/jquery-ui.js"></script>
            <script src="js/popper.min.js"></script>
            <script src="js/bootstrap.min.js"></script>
            <script src="js/owl.carousel.min.js"></script>
            <script src="js/jquery.stellar.min.js"></script>
            <script src="js/jquery.countdown.min.js"></script>
            <script src="js/jquery.magnific-popup.min.js"></script>
            <script src="js/bootstrap-datepicker.min.js"></script>
            <script src="js/aos.js"></script>
            <script src="js/mediaelement-and-player.min.js"></script>
            <script src="js/main.js"></script>
            <!-- load JS files -->
            <script src="js/jquery-1.11.3.min.js"></script>
            <!-- jQuery (https://jquery.com/download/) -->
            <script src="js/popper.min.js"></script>
            <!-- https://popper.js.org/ -->
            <script src="js/bootstrap.min.js"></script>
            <!-- https://getbootstrap.com/ -->
            <script src="js/datepicker.min.js"></script> 
            <!-- https://github.com/qodesmith/datepicker -->
            <script src="js/jquery.singlePageNav.min.js"></script>
            <!-- Single Page Nav (https://github.com/ChrisWojcik/single-page-nav) -->
            <script src="slick/slick.min.js"></script>
            <!-- http://kenwheeler.github.io/slick/ -->
            <script>
                document.addEventListener('DOMContentLoaded', function () {
                    var mediaElements = document.querySelectorAll('video, audio'),
                            total = mediaElements.length;
                    for (var i = 0; i < total; i++) {
                        new MediaElementPlayer(mediaElements[i], {
                            pluginPath: 'https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/',
                            shimScriptAccess: 'always',
                            success: function () {
                                var target = document.body.querySelectorAll('.player'),
                                        targetTotal = target.length;
                                for (var j = 0; j < targetTotal; j++) {
                                    target[j].style.visibility = 'visible';
                                }
                            }
                        });
                    }
                });
                /* Google map
                 ------------------------------------------------*/
                var map = '';
                var center;
                function initialize() {
                    var mapOptions = {
                        zoom: 16,
                        center: new google.maps.LatLng(13.7567928, 100.5653741),
                        scrollwheel: false
                    };
                    map = new google.maps.Map(document.getElementById('google-map'), mapOptions);
                    google.maps.event.addDomListener(map, 'idle', function () {
                        calculateCenter();
                    });
                    google.maps.event.addDomListener(window, 'resize', function () {
                        map.setCenter(center);
                    });
                }
                function calculateCenter() {
                    center = map.getCenter();
                }
                function loadGoogleMap() {
                    var script = document.createElement('script');
                    script.type = 'text/javascript';
                    script.src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyDVWt4rJfibfsEDvcuaChUaZRS5NXey1Cs&v=3.exp&sensor=false&' + 'callback=initialize';
                    document.body.appendChild(script);
                }
                function setCarousel() {
                    if ($('.tm-article-carousel').hasClass('slick-initialized')) {
                        $('.tm-article-carousel').slick('destroy');
                    }
                    if ($(window).width() < 438) {
                        // Slick carousel
                        $('.tm-article-carousel').slick({
                            infinite: false,
                            dots: true,
                            slidesToShow: 1,
                            slidesToScroll: 1
                        });
                    } else {
                        $('.tm-article-carousel').slick({
                            infinite: false,
                            dots: true,
                            slidesToShow: 2,
                            slidesToScroll: 1
                        });
                    }
                }
                function setPageNav() {
                    if ($(window).width() > 991) {
                        $('#tm-top-bar').singlePageNav({
                            currentClass: 'active',
                            offset: 79
                        });
                    } else {
                        $('#tm-top-bar').singlePageNav({
                            currentClass: 'active',
                            offset: 65
                        });
                    }
                }
                function togglePlayPause() {
                    vid = $('.tmVideo').get(0);
                    if (vid.paused) {
                        vid.play();
                        $('.tm-btn-play').hide();
                        $('.tm-btn-pause').show();
                    } else {
                        vid.pause();
                        $('.tm-btn-play').show();
                        $('.tm-btn-pause').hide();
                    }
                }
                $(document).ready(function () {
                    $(window).on("scroll", function () {
                        if ($(window).scrollTop() > 100) {
                            $(".tm-top-bar").addClass("active");
                        } else {
                            //remove the background property so it comes transparent again (defined in your css)
                            $(".tm-top-bar").removeClass("active");
                        }
                    });
                    // Google Map
                    loadGoogleMap();
                    // Date Picker
                    const pickerCheckIn = datepicker('#inputCheckIn');
                    const pickerCheckOut = datepicker('#inputCheckOut');
                    // Slick carousel
                    setCarousel();
                    setPageNav();
                    $(window).resize(function () {
                        setCarousel();
                        setPageNav();
                    });
                    // Close navbar after clicked
                    $('.nav-link').click(function () {
                        $('#mainNav').removeClass('show');
                    });
                    // Control video
                    $('.tm-btn-play').click(function () {
                        togglePlayPause();
                    });
                    $('.tm-btn-pause').click(function () {
                        togglePlayPause();
                    });
                    // Update the current year in copyright
                    $('.tm-current-year').text(new Date().getFullYear());
                });
                function show() {
                    if (document.getElementById("team").style.display == "none") {
                        document.getElementById("team").style.display = "block";
                    } else {
                        document.getElementById("team").style.display = "none";
                    }
                }
            </script>
            <script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>

    </body>
</html>
