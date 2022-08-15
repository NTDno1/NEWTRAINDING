<%-- 
    Document   : compareFinal
    Created on : Jun 30, 2022, 9:26:58 PM
    Author     : Minh Hiếu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hoang Hon &mdash; Hotel</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700|Work+Sans:300,400,700" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/tooplate-style.css">
        <link rel="stylesheet" href="css/styleCompare.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <!--fontawesome css-->
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!--bootstrap css-->
        <link rel="stylesheet" href="css/bootstrap.min_1.css">
        <!--animate css-->
        <link rel="stylesheet" href="css/animate-wow.css">
        <!--main css-->
        <link rel="stylesheet" href="css/style_1.css">
        <link rel="stylesheet" href="css/bootstrap-select.min.css">
        <link rel="stylesheet" href="css/slick.min.css">
        <link rel="stylesheet" href="css/select2.min.css">
        <!--responsive css-->
        <link rel="stylesheet" href="css/responsive.css">
        <style>
            .manufactury{
                height: 400px;
                overflow-y: scroll;
                table {
                    font-family: arial, sans-serif;
                    border-collapse: collapse;
                    width: 100%;

                }
                th{
                    text-align: center;
                    padding: 10px;
                }



            }

        </style>
    </head>
    <body>
           <fmt:setLocale value="vi"/>
        <%@include file="header.jsp" %>
        <div class="slide-one-item home-slider owl-carousel">

            <div class="site-blocks-cover overlay" style="background-image: url(images/hero_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-7 text-center" data-aos="fade">


                        </div>
                    </div>
                </div>
            </div>  

            <div class="site-blocks-cover overlay" style="background-image: url(images/hero_2.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-7 text-center" data-aos="fade">

                        </div>
                    </div>
                </div>
            </div> 

            <div class="site-blocks-cover overlay" style="background-image: url(images/hero_3.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-7 text-center" data-aos="fade">

                        </div>
                    </div>
                </div>
            </div> 

        </div>

        <h2 style="margin-top: 20px">SO SÁNH PHÒNG</h2>
        <div class="d-flex " style="margin-top: 100px;margin-left: 60px">

            <div class="" id="table1" >
                <table border="1">
                    <tr>
                        <th> <span>Số phòng:${Rooom.getRoomname()} <b>&</b> <span>${Rooom1.getRoomname()}</span><br></span></th>
                        <th>
                            <div class="display-container" style="position: relative">
                                <button class="image-button button-left" onclick="plusDivs(-1)">&#10094;</button>
                                <button class="image-button button-right" onclick="plusDivs(1)">&#10095;</button>


                                <img class="mySlides"src="images/anhphong/${img.image1}" style="height: 440px;width: 630px">
                                <img class="mySlides" src="images/anhphong/${img.image2}" style="height: 440px;width: 630px">
                                <img class="mySlides" src="images/anhphong/${img.image3}" style="height: 440px;width: 630px">

                            </div>


                        </th>

                    </tr>

                    <tr >
                        <th style="font-size:15px;padding: 10px">
                            <span> Thông tin phòng </span>
                        </th>
                    </tr>
                    <tr >
                        <th style="text-align: center;padding: 10px;">Diện tích</th>
                        <td style="text-align: center;padding: 10px;">${Rooom.getSquare()} m2</td>
                        </th>
                    </tr>
                    <tr>
                        <th style="text-align: center;padding: 10px;">Số người</th>
                        <td style="text-align: center;padding: 10px;">${Rooom.getNumberPerson()}</td>
                    </tr>
                    <tr>
                        <th style="text-align: center;padding: 10px;">Đánh giá</th>
                        <td>
                            <div class="d-flex justify-content-center" >
                                <c:forEach begin="1" end="${Rooom.getRate()}">
                                    <span style="padding: 10px; color: red" class="fas fa-star"></span><br>
                                </c:forEach>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th style="text-align: center;padding: 10px;">Giá tiền</th>
                        <td style="text-align: center;padding: 10px;"><fmt:formatNumber value="${Rooom.roomprice}"/> đ</td>
                    </tr>
                    <tr >
                        <th style="color: white; padding: 20px">.</th>
                        <td>
                            <div class="hotel-room-body">

                                <div class="add-to-cart">
                                    <form action="RoomController">
                                        <input type="hidden" name="do" value="roomdetail">
                                        <input type="hidden" name="roomid" value="${Rooom.roomID}">
                                        <input type="hidden" name="cateroom" value="${cateid}">
                                        <button style="position: fixed;top: 895px; right: -45px" 
                                                class="add-to-cart-btn" ><i class="fas fa-eye"></i><a>Chi tiết phòng</a></button>
                                    </form>
                                    <c:if test="${sessionScope.login!=null}" >
                                        <form>
                                            <div class="add-to-cart">
                                                <button style="position: fixed;top: 895px; right:-239px" 
                                                        class="add-to-cart-btn" ><i class="fas fa-shopping-cart"></i>  <a href="OrderController?do=user&id=${Rooom.roomID}&userid=${sessionScope.login.getAccountID()}" style="color: white">Đặt phòng </a></button>
                                            </div>
                                        </form>

                                    </c:if>
                                    <c:if test="${sessionScope.login==null}" >

                                        <form>
                                            <div class="add-to-cart">
                                                <button style="position: fixed;top: 895px; right:-239px" 
                                                        class="add-to-cart-btn" ><i class="fas fa-shopping-cart"></i> <a href="LoginController" style="color: white">Đặt phòng</a></button>
                                            </div>
                                        </form>
                                    </c:if>
                                    <form action="CompareRoomController" method="post">
                                        <input type="hidden" name="do" value="ViewCompare">
                                        <input type="hidden" name="roomid" value="${Rooom.getRoomID()}">
                                        <input type="hidden" name="cateroom" value="${cateid}">
                                        <div class="add-to-cart">
                                            <button  style="position: fixed;top: 895px; right:-444px" 
                                                     class="add-to-cart-btn" ><i class="fas fa-compress"></i><a>So sánh</a></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </td>
                    </tr>

                </table>
            </div>
            <div>
                <table border="1" style="margin-bottom: 100px" >
                    <tr>
                        <th >
                            <div class="display-container" style="position: relative">
                                <button class="image-button button-left" onclick="plusDivs1(-1)">&#10094;</button>
                                <button class="image-button button-right" onclick="plusDivs1(1)">&#10095;</button>

                                <img class="mySlides1" src="images/anhphong/${img1.image1}" style="height: 440px;width: 630px;z-index: -1">
                                <img class="mySlides1" src="images/anhphong/${img1.image2}" style="height: 440px;width: 630px;z-index: -1">
                                <img class="mySlides1" src="images/anhphong/${img1.image3}" style="height: 440px;width: 630px;z-index: -1">
                            </div>
                        </th>
                    </tr>
                    <tr >
                        <th style="font-size:15px;padding: 10px"> <span style="color: white"> .</span>
                        </th>
                    </tr>
                    <tr>
                        <td style="text-align: center;   padding: 10px;">${Rooom1.getSquare()} m2</td>
                    </tr>
                    <tr>
                        <td style="text-align: center; padding: 10px;">${Rooom1.getNumberPerson()}</td>
                    </tr>
                    <tr>
                        <td> 
                            <div class="d-flex justify-content-center" >
                                <c:forEach begin="1" end="${Rooom1.getRate()}">
                                    <span style=" padding: 13px; color: red" class="fas fa-star"></span><br>
                                </c:forEach>
                            </div>
                    </tr>
                    <tr>
                        <td style="text-align: center; padding: 10px;"><fmt:formatNumber value="${Rooom1.getRoomprice()}"/> đ</td>
                    </tr>

                    <tr>
                        <th style="color: white; padding: 20px">.</th>
                        <td>
                            <div class="hotel-room-body">

                                <div class="add-to-cart">
                                  <form action="RoomController">
                                        <input type="hidden" name="do" value="roomdetail">
                                        <input type="hidden" name="roomid" value="${Rooom1.roomID}">
                                        <input type="hidden" name="cateroom" value="${cateid}"> 
                                        <button style="position: fixed;top: 895px;right: -684px" 
                                                class="add-to-cart-btn" ><i class="fas fa-eye"></i><a>Chi tiết phòng</a></button>
                                    </form>
                                    <c:if test="${sessionScope.login!=null}" >
                                        <form>
                                            <div class="add-to-cart">
                                                <button style="position: fixed;top: 895px; right:-884px" 
                                                        class="add-to-cart-btn" ><i class="fas fa-shopping-cart"></i> <a href="OrderController?do=user&id=${Rooom1.roomID}&userid=${sessionScope.login.getAccountID()}" style="color: white">Đặt phòng </a></button>
                                            </div>
                                        </form>

                                    </c:if>
                                    <c:if test="${sessionScope.login==null}" >

                                        <form>
                                            <div class="add-to-cart">
                                                <button style="position: fixed;top: 895px; right:-884px" 
                                                        class="add-to-cart-btn" ><i class="fas fa-shopping-cart"></i><a href="LoginController" style="color: white">Đặt phòng</a></button>
                                            </div>
                                        </form>
                                    </c:if>
                                    <form action="CompareRoomController" method="post">
                                        <input type="hidden" name="do" value="ViewCompare">
                                        <input type="hidden" name="roomid" value="${Rooom1.getRoomID()}">
                                        <input type="hidden" name="cateroom" value="${cateid}">
                                        <div class="add-to-cart">
                                            <button style="position: fixed;top: 895px; right:-1072px" 
                                                    class="add-to-cart-btn" ><i class="fas fa-compress"></i><a>So Sánh</a></button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>



        <%@include file="footer.jsp" %>
        <!--main js--> 
        <script src="js/jquery-1.12.4.min.js"></script> 
        <!--bootstrap js--> 
        <script src="js/bootstrap.min_1.js"></script> 
        <script src="js/bootstrap-select.min.js"></script>
        <script src="js/slick.min_1.js"></script> 
        <script src="js/select2.full.min.js"></script> 
        <script src="js/wow.min.js"></script> 
        <!--custom js--> 
        <script src="js/custom.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>

        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/jquery.countdown.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/bootstrap-datepicker.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>

        <script src="js/mediaelement-and-player.min.js"></script>

        <script src="js/main.js"></script>
        <script>
                                    var slideIndex = 1;
                                    showDivs(slideIndex);
                                    function plusDivs(n) {
                                        showDivs(slideIndex += n);
                                    }

                                    function showDivs(n) {
                                        var i;
                                        var x = document.getElementsByClassName("mySlides");
                                        if (n > x.length) {
                                            slideIndex = 1
                                        }
                                        if (n < 1) {
                                            slideIndex = x.length
                                        }
                                        for (i = 0; i < x.length; i++) {
                                            x[i].style.display = "none";
                                        }
                                        x[slideIndex - 1].style.display = "block";
                                    }

                                    function deleteTable() {
                                        var k = document.getElementById("table1");
                                        k.style.display = 'none';

                                    }



        </script>
        <script>
            var slideIndex = 1;
            showDivs1(slideIndex);
            function plusDivs1(n) {
                showDivs1(slideIndex += n);
            }

            function showDivs1(n) {
                var i;
                var x = document.getElementsByClassName("mySlides1");
                if (n > x.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = x.length
                }
                for (i = 0; i < x.length; i++) {
                    x[i].style.display = "none";
                }
                x[slideIndex - 1].style.display = "block";
            }



        </script>
    </body>
</html>
