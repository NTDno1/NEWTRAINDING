<%-- 
    Document   : compare
    Created on : Jun 27, 2022, 2:58:48 PM
    Author     : Minh Hiếu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
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
            }
        </style>
    </head>
    <body>
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
        <h3 style="margin-top: 20px">SO SÁNH PHÒNG</h3>
        <div class="product-page-main">
            <div class="container">

                <div class="row" >
                    <div class="col-md-7 col-sm-8">
                        <div class="md-prod-page">
                            <div class="md-prod-page-in">
                                <div class="display-container">

                                    <button class="image-button button-left" onclick="plusDivs(-1)">&#10094;</button>
                                    <button class="image-button button-right" onclick="plusDivs(1)">&#10095;</button>

                                    <img class="mySlides" src="images/anhphong/${img.image1}" style="height: 440px;width: 630px">
                                    <img class="mySlides" src="images/anhphong/${img.image2}" style="height: 440px;width: 630px">
                                    <img class="mySlides" src="images/anhphong/${img.image3}" style="height: 440px;width: 630px">


                                </div>
                            </div>
                            <div class="description-box">
                                <div class="dex-a">
                                    <p style="margin-bottom: 15px;font-family: sans-serif; font-size: 15px"><span style="font-weight: bold">SỐ PHÒNG:</span>${Rooom.roomname}</p>
                                    <p style="margin-bottom: 15px;font-family: sans-serif;font-size: 15px"><span style="font-weight: bold">LOẠI PHÒNG:</span>${roomCategory.catename}</p>
                                    <h4 style="text-align: center">Mô TẢ</h4>

                                    <p>${Rooom.roomdesc}</p>
                                    <br>
                                    <p style="margin-top: 9px ;font-size: 15px"> <span style="margin-top: 9px ;font-weight: bold" >DIỆN TÍCH:</span> ${Rooom.square}m2</p>
                                    <p style="margin-top: 9px ;font-size: 15px"><span style="margin-top:15px ;font-weight: bold">SỐ NGƯỜI:</span> ${Rooom.numberPerson}</p>

                                    <div class="d-flex">
                                        <p ><span style="margin-top: 9px ;font-weight: bold;font-size: 15px ">ĐÁNH GIÁ:
                                                <c:forEach begin="1" end="${Rooom.rate}">
                                                    <span style="padding: 10px; color: red" class="fas fa-star"></span>
                                                </c:forEach>
                                            </span>
                                        </p>
                                    </div>
                                    <fmt:setLocale value="vi"/>
                                    <p style="margin-top: 9px;font-size: 15px "><span style="margin-top: 9px ;font-weight: bold" >TIỀN: </span><fmt:formatNumber value="${Rooom.roomprice}"/> đ</p>



                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="wrapper col-md-5 ">
                        <div class="search-input" >
                            <input  oninput="searchNameByAjax(this,${roomid},${cateid})" maxlength="20" type="text" placeholder="Tìm kiếm tên phòng...">
                            <div class="icon"><i class="fas fa-search"></i></div>
                            <div class="autocom-box1"  id="hieu">


                            </div>
                        </div>


                    </div>
                    <div class="hotel-room-body">

                        <div class="add-to-cart">
                            <form action="RoomController">
                                <input type="hidden" name="do" value="roomdetail">
                                <input type="hidden" name="roomid" value="${Rooom.roomID}">
                                <input type="hidden" name="cateroom" value="${cateid}">
                                <button style="position: fixed;top: 1050px; right: -45px" 
                                        class="add-to-cart-btn" ><i class="fas fa-eye"></i><a>Chi tiết phòng</a></button>
                            </form>
                            <c:if test="${sessionScope.login!=null}" >
                                <form>
                                    <div class="add-to-cart">
                                        <button style="position: fixed;top:1050px; right:-239px" 
                                                class="add-to-cart-btn" ><i class="fas fa-shopping-cart"></i>  <a href="OrderController?do=user&id=${Rooom.roomID}&userid=${sessionScope.login.getAccountID()}" style="color: white">Đặt phòng </a></button>
                                    </div>
                                </form>

                            </c:if>
                            <c:if test="${sessionScope.login==null}" >

                                <form>
                                    <div class="add-to-cart">
                                        <button style="position: fixed;top: 1050px; right:-239px" 
                                                class="add-to-cart-btn" ><i class="fas fa-shopping-cart"></i> <a href="LoginController" style="color: white">Đặt phòng</a></button>
                                    </div>
                                </form>
                            </c:if>

                        </div>
                    </div>
                </div>


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



                </script>
                <script>

                    function searchNameByAjax(param, param1, param2) {
                        var txtSearch = param.value;
                        var id = param1;
                        var cateID = param2;


                        $.ajax({
                            url: "/HotelManager/CompareRoomController?do=searchRoomname",
                            type: "get", //send it through get method
                            data: {
                                txt: txtSearch,
                                cateID: cateID,
                                RoomID: id
                            },
                            success: function (data) {
                                var row = document.getElementById("hieu");
                                row.innerHTML = data;
                            },
                            error: function (xhr) {
                                //Do Something to handle error
                            }
                        });
                    }

                </script>


                </body>
                </html>
