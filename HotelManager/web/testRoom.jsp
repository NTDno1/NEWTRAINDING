<%@page import="java.sql.ResultSet"%>
<%@page import="context.DBContext"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Room"%>
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

        <!-- load stylesheets -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">  
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">              
        <link rel="stylesheet" href="css/bootstrap.min.css">                               
        <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
        <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
        <link rel="stylesheet" type="text/css" href="css/datepicker.css"/>
        <link rel="stylesheet" href="css/tooplate-style.css"> 
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="csss/font-awesome.min.css">
        <link rel="stylesheet" href="csss/style.css">
        <link rel="stylesheet" href="csss/responsive.css">

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
        <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/csss/datepicker.css" />
        <link rel="stylesheet" href="css/tooplate-style.css">
    </head>
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
            }

            input.star { display: none; }

            label.star {
                float: right;
                padding: 10px;
                font-size: 20px;
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

            input.star-1:checked ~ label.star:before { color: #F62; }

            label.star:hover { transform: rotate(-15deg) scale(1.3); }

            label.star:before {
                content: '\f006';
                font-family: FontAwesome;
            }
        </style>
        <body>
            <div class="site-wrap">

                <div class="site-mobile-menu">
                    <div class="site-mobile-menu-header">
                        <div class="site-mobile-menu-close mt-3">
                            <span class="icon-close2 js-menu-toggle"></span>
                        </div>
                    </div>
                    <div class="site-mobile-menu-body"></div>
                </div> <!-- .site-mobile-menu -->


                <jsp:include page="header.jsp"></jsp:include>
                    <div class="card" id="team">
                        <div class="card_img">
                            <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="">
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
                        <a href="UserController"><button>Edit Profile</button></a>                       
                    </div>

                </div>  

                <div class="slide-one-item home-slider owl-carousel">
                    <div class="site-blocks-cover overlay" style="background-image: url(images/hero_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
                        <div class="container">
                            <div class="row align-items-center justify-content-center">
                                <div class="col-xs-12 ml-auto mr-auto ie-container-width-fix">
                                    <form action="RoomController" method="get" class="tm-search-form tm-section-pad-2" onsubmit="return Validate()">
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
            </div>
            <div style="font-size: 20px;margin-left: 20%; padding-top: 50px;padding-bottom: 30px;" class="col-md-6">
                <h2 style="color: red"class="display-4" data-aos="fade-up">Tận hưởng chỗ ở của bạn</h2>
                    <p data-aos="fade-up" data-aos-delay="100" ><span style="color: blue;">Giá cả</span> và <span style="color: blue;">chất lượng</span> ngang bằng nhau chỉ giúp bạn bước chân vào cuộc chơi. <span style="color: blue;">Dịch vụ </span> sẽ giúp bạn chiến thắng cuộc chơi. </p>
            </div>
            <!-- End of /#Topic-header -->

            <!-- PRODUCTS Start
            ================================================== -->
            <%Vector<Room> vector = (Vector<Room>) request.getAttribute("vector"); %>
            <section style="background-color: #f6f6f6" id="shop">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-10">
                                <div class="products" style="padding-top: 50px;">
                                <h2 style="font-family: Orbitron;">Danh sách các phòng</h2>
                            </div>
                            <!-- End of /.Products-heading -->
                            <div class="product-grid">
                                <ul>
                                    <%for (Room v : vector) {%>
                                    <li style="position: relative">
                                        <div class="products">
                                            <a href="RoomController?do=roomdetail&roomid=<%=v.getRoomID()%>">
                                                <img src="images/anhphong/<%=v.getImage()%>" alt="" style="margin-top: 30px">
                                            </a>
                                            <div class="h" style="font-size: 20px">
                                                    <c:forEach begin="1" end="<%=v.getRate()%>">
                                                        <span class="fa fa-star checked"></span>
                                                    </c:forEach>

                                                </div>
                                                <h4 style="font-size: 25px; text-align: center; padding-top: 20px; font-weight: bold;  font-family: Orbitron;"><i class='fas fa-user-alt' style="font-size:25px;padding-right: 15px">:</i><%=v.getNumberPerson()%></p></h4>
                                                <a href="RoomController?do=roomdetail&roomid=<%=v.getRoomID()%>">
                                                    <h4 style="color: #b09700;font-size: 25px; text-align: center;font-weight: bold;  font-family: Times New Roman;"><%=v.getCateroom()%>-<%=v.getRoomname()%></h4>
                                            </a>
                                            <h1 style="color: red;font-size: 18px" class="price"><fmt:formatNumber value="<%=v.getRoomprice()%>"/> đ/ một đêm</h1>
                                              <div class="hotel-room-body">
                                                        <div class="add-to-cart">
                                                            <form action="RoomController">
                                                                <input type="hidden" name="do" value="roomdetail">
                                                                <input type="hidden" name="roomid" value="<%=v.getRoomID()%>">
                                                                <button  style="margin-top: 10px;position: fixed;top:29px;left:-47px" class="add-to-cart-btn" type="submit"><i class="fa fa-shopping-cart"></i>Đặt phòng</a></button>
                                                            </form>
                                                            <form action="CompareRoomController">
                                                                <input type="hidden" name="do" value="ViewCompare">
                                                                <input type="hidden" name="roomid" value="<%=v.getRoomID()%>">
                                                                <input type="hidden" name="cateroom" value="<%=v.getRoomcateID()%>">
                                                                <button style="margin-left: 150px;position: fixed;left: -28px;top: 39px;" class="add-to-cart-btn" ><i class="fa fa-compress"></i><a>So sánh</a></button>
                                                        </form>
                                                    </div>
                                                </div>
                                        </div>
                                        <!-- End of /.products -->
                                    </li>
                                    <%}%>
                                </ul>
                            </div>
                            <div class="hieu">
                                <div class="col-md-12 text-center">
                                    <div class="site-block-27" >
                                        <ul>
                                            <c:if test="${!empty n}">
                                                <c:forEach begin="1" end="${n}" var="c" >
                                                    <li><a href="RoomController?page=${c}">${c}</a></li>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${!empty n1}">
                                                    <c:forEach begin="1" end="${n1}" var="c" >
                                                    <li><a href="RoomController?do=sortByPriceMax&page=${c}">${c}</a></li>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${!empty n2}">
                                                    <c:forEach begin="1" end="${n2}" var="c" >
                                                    <li><a href="RoomController?do=sortByPriceMin&page=${c}">${c}</a></li>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${!empty n3}">
                                                    <c:forEach begin="1" end="${n3}" var="c" >
                                                    <li><a href="RoomController?do=sortByRate&page=${c}">${c}</a></li>
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${!empty n4}">
                                                    <c:forEach begin="1" end="${n4}" var="c" >
                                                    <li><a href="RoomController?do=sortByPriceBetween&page=${c}&price1=${pri1}&price2=${pri2}">${c}</a></li>
                                                    </c:forEach>
                                                </c:if>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End of /.col-md-9 -->
                        <div style="padding-top: 80px;" class="col-md-2">
                            <div class="blog-sidebar">
                                <div class="block">
                                    <h4>Loại phòng</h4>
                                    <% DBContext db= new DBContext();
                                                    ResultSet rs=db.getData("select * from CateRoom");
                                                    while(rs.next()){
                                                %>
                                    <div class="list-group" style="width: 250px">
                                            <a href="RoomController?do=CateRoom&cate=<%=rs.getInt(1) %>" class="list-group-item" style="font-size: 15px">
                                                <i class="fa  fa-dot-circle-o"></i> <%=rs.getString(2) %>
                                            </a>
                                        </div>
                                    <%}%>
                                    </div>
                                    <div class="block">
                                        <h4>Sắp xếp :</h4>
                                        <form action="RoomController" method="get">
                                            <input type="hidden" name="do" value="sortByPriceBetween"  >
                                            <input type="hidden" name="page" value="1">
                                            <table>
                                                <tr>
                                                    <td>Từ</td><td><input style="width: 100px;"type="number" name="price1" min="0" max="10000" value=""/></td>
                                            </tr>
                                            <tr>
                                                <td>Đến</td><td><input style="width: 100px;" type="number" name="price2" min="0" max="100000" value=""/></td>
                                            </tr>
                                            <tr>
                                                <td></td><td><input type="submit" value="Tìm kiếm"/></td>
                                            </tr>
                                        </table>
                                    </form>
                                    <div class="list-group" style="width: 250px; padding-top: 20px" >
                                            <a href="RoomController?do=sortByPriceMax&page=1" class="list-group-item"> Giá cao nhất </a>
                                            <a href="RoomController?do=sortByPriceMin&page=1" class="list-group-item"> Giá thấp nhất </a>
                                            <a href="RoomController?do=sortByRate&page=1" class="list-group-item"> Đánh giá </a>
                                        </div>
                                    </div>

                                </div>
                                <!-- End of /.col-md-3 -->

                            </div>
                            <!-- End of /.row -->
                        </div>
                        <!-- End of /.container -->
                </section>

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
            <jsp:include page="footer.jsp"></jsp:include>
        </body>
    </html>
