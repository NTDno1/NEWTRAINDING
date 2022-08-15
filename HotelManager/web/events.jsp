<%-- 
    Document   : events
    Created on : Jul 10, 2022, 9:50:03 PM
    Author     : admin
--%>

<%@page import="entity.Events"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Suite &mdash; Colorlib Website Template</title>
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

    </head>
    <style>
        .login{
            position: fixed;
            right: 120px;
        }
        .register{
            position: fixed;
            right: 40px;
        }
        .snip1457 {
            font-family: 'Raleway', Arial, sans-serif;
            border: none;
            background-color: #5666a5;
            border-radius: 5px;
            color: #ffffff;
            cursor: pointer;
            padding: 0px 30px;
            display: inline-block;
            margin: 15px 30px;
            text-transform: uppercase;
            line-height: 46px;
            font-weight: 400;
            font-size: 1em;
            outline: none;
            position: relative;
            overflow: hidden;
            font-size: 16px;
            border-radius: 23px;
            letter-spacing: 2px;
            -webkit-transform: translateZ(0);
            -webkit-transition: all 0.35s ease;
            transition: all 0.35s ease;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }
        .snip1457:before {
            opacity: 0;
            content: "";
            position: absolute;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
            border-radius: inherit;
            background-color: #ffffff;
            -webkit-transition: all 0.3s;
            transition: all 0.3s;
            -webkit-transform: translateY(100%);
            transform: translateY(100%);
        }
        .snip1457:after {
            position: absolute;
            top: 0px;
            bottom: 0px;
            left: 0px;
            right: 0px;
            border: 5px solid #5666a5;
            content: '';
            border-radius: inherit;
        }
        .snip1457:hover,
        .snip1457.hover {
            background-color: #5666a5;
            color: #ffffff;
        }
        .snip1457:hover:before,
        .snip1457.hover:before {
            -webkit-transform: translateY(0%);
            transform: translateY(0%);
            opacity: 0.25;
        }
    </style>
    <body>

        <jsp:include page="header.jsp"></jsp:include>  

            <div class="site-blocks-cover overlay" style="background-image: url(images/hero_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-7 text-center" data-aos="fade">
                            <h1 class="mb-4">Sự kiện</h1>
                        </div>
                    </div>
                </div>
            </div>  


            <div class="site-section">
                <h3 style="margin-left: 100px">${mess}</h3>
               <h2 style="font-family: Orbitron; padding-left: 570px;padding-bottom: 50px;font-weight: bold;font-size: 40px">Danh sách khuyến mãi</h2>
            <div class="container">
                <div class="row">
                    <% Vector<Events> vector = (Vector<Events>) request.getAttribute("vector");
                        for (Events e : vector) {
                    %>

                    <div class="col-md-6 col-lg-4 mb-5">
                        <div class="media-with-text">
                            <div class="img-border-sm mb-4">
                                <a href="#" class="popup-vimeo image-play">
                                    <img style="height: 400px;width: 400px" src="images/anhgiamgia/<%=e.getEventImage()%>" alt="" class="img-fluid">
                                </a>
                            </div>

                            <h2 class="heading mb-0" style="font-weight: bold"><%=e.getEventName()%></h2>
                            <h2 class="heading mb-0" style="font-weight: bold"><%=e.getQuantity()%></h2>
                            <c:if test="${sessionScope.login!=null}" >
                                <c:if test="${sessionScope.login.getRoleID()==1}" >
                                    <a href="EventController?do=getEvent&id=<%=e.getEventID()%>&userid=${sessionScope.login.getAccountID()}" onclick="add()"> <button style="margin-left: 10px" class="snip1457">Lưu</button></a>
                                </c:if>

                                <c:if test="${sessionScope.login.getRoleID()!=1}">
                                    <a  onclick="add1(${sessionScope.login.getRoleID()})"> <button style="margin-left: 10px" class="snip1457">Lưu</button></a>
                                </c:if>


                            </c:if>
                            <c:if test="${sessionScope.login==null}" >
                                <a type="button" href="LoginController"> <button style="margin-left: 10px" class="snip1457">Lưu</button></a>
                            </c:if>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>

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


        <script>
                                        document.addEventListener('DOMContentLoaded', function () {
                                            var mediaElements = document.querySelectorAll('video, audio'), total = mediaElements.length;

                                            for (var i = 0; i < total; i++) {
                                                new MediaElementPlayer(mediaElements[i], {
                                                    pluginPath: 'https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/',
                                                    shimScriptAccess: 'always',
                                                    success: function () {
                                                        var target = document.body.querySelectorAll('.player'), targetTotal = target.length;
                                                        for (var j = 0; j < targetTotal; j++) {
                                                            target[j].style.visibility = 'visible';
                                                        }
                                                    }
                                                });
                                            }
                                        });
                                        function add() {
                                            alert("Lưu thành công!");
                                        }
                                        function add1(id) {
                                            if (id == 2) {
                                                alert("Bạn không thể lưu với vai trò là 'Lễ Tân' ");
                                            } else if (id == 3) {
                                                alert("Bạn không thể lưu với vai trò là 'Admin'");
                                            }

                                        }

        </script>
        <script language="javascript">

            var h = null; // Giờ
            var m = null; // Phút
            var s = null; // Giây

            var timeout = null; // Timeout

            function start()
            {
                // Code
            }

            function stop() {
                clearTimeout(timeout);
            }
        </script>
    </body>
</html>
