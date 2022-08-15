<%-- 
    Document   : Room
    Created on : Jun 4, 2022, 2:49:47 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Room"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Suite &mdash; Colorlib Website Template</title>
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
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/tooplate-style.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
   <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
     <link rel="stylesheet" type="text/css" href="css/datepicker.css" />
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
    </style>
    <body>

        <jsp:include  page="header.jsp"></jsp:include>

            <div class="site-blocks-cover overlay" style="background-image: url(images/hero_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
                <div class="container">
                    <div class="row align-items-center justify-content-center">
                        <div class="col-md-7 text-center" data-aos="fade">
                            <span class="caption mb-3">Luxurious Rooms</span>
                            <h1 class="mb-4">Hotel Rooms</h1>
                        </div>
                    </div>
                </div>
            </div>  


            <div class="site-section bg-light">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 mx-auto text-center mb-5 section-heading">
                            <h2 class="mb-5">Our Rooms</h2>
                        </div>
                    </div>
                    <div class="row">
                        <%Vector<Room> vector = (Vector<Room>)request.getAttribute("vector"); 
                                for (Room v : vector) {%>
                        <div class="col-md-6 col-lg-4 mb-5">
                            <div class="hotel-room text-center">
                                <a href="RoomController?do=roomdetail&roomid=<%=v.getRoomID()%>" class="d-block mb-0 thumbnail"><img style="width: 350px;height: 250px; "src="images/anhphong/<%=v.getImage() %>" alt="Image" class="img-fluid"></a>
                                <div class="hotel-room-body">
                                    <h3 class="heading mb-0"><a style="font-size: 20px; text-align: center; margin: 0 auto; font-weight: bold; color: #b09700; font-family: Times New Roman;" href="#"><%=v.getCateroom() %></a></h3>
                                    <strong class="price">$<%=v.getRoomprice()%> / per night</strong>
                                    <div class="add-to-cart" style="padding-top: 32px">
                                        <c:if test="${sessionScope.login==null}">
                                        <form action="Login.jsp">
                                            <button class="add-to-cart-btn" type="submit"><i class="fa fa-shopping-cart"></i>BOOK</a></button>
                                        </form>
                                        </c:if>
                                        <c:if test="${sessionScope.login!=null}">
                                        <form action="#">
                                            <button class="add-to-cart-btn" type="submit"><i class="fa fa-shopping-cart"></i>BOOK</a></button>
                                        </form>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>

                    </div>

                    <div class="row mt-5">
                        <div class="col-md-12 text-center">
                            <div class="site-block-27">
                                <ul>
                                    <c:forEach begin="1" end="${n}" var="c" >
                                    <li><a href="RoomController?page=${c}">${c}</a></li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>




            <footer class="site-footer">
                <div class="container">


                    <div class="row">
                        <div class="col-md-4">
                            <h3 class="footer-heading mb-4 text-white">About</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat quos rem ullam, placeat amet.</p>
                            <p><a href="#" class="btn btn-primary pill text-white px-4">Read More</a></p>
                        </div>
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-6">
                                    <h3 class="footer-heading mb-4 text-white">Quick Menu</h3>
                                    <ul class="list-unstyled">
                                        <li><a href="#">About</a></li>
                                        <li><a href="#">Services</a></li>
                                        <li><a href="#">Approach</a></li>
                                        <li><a href="#">Sustainability</a></li>
                                        <li><a href="#">News</a></li>
                                        <li><a href="#">Careers</a></li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <h3 class="footer-heading mb-4 text-white">Ministries</h3>
                                    <ul class="list-unstyled">
                                        <li><a href="#">Children</a></li>
                                        <li><a href="#">Women</a></li>
                                        <li><a href="#">Bible Study</a></li>
                                        <li><a href="#">Church</a></li>
                                        <li><a href="#">Missionaries</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>


                        <div class="col-md-2">
                            <div class="col-md-12"><h3 class="footer-heading mb-4 text-white">Social Icons</h3></div>
                            <div class="col-md-12">
                                <p>
                                    <a href="#" class="pb-2 pr-2 pl-0"><span class="icon-facebook"></span></a>
                                    <a href="#" class="p-2"><span class="icon-twitter"></span></a>
                                    <a href="#" class="p-2"><span class="icon-instagram"></span></a>
                                    <a href="#" class="p-2"><span class="icon-vimeo"></span></a>

                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="row pt-5 mt-5 text-center">
                        <div class="col-md-12">
                            <p>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy; <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All Rights Reserved | This template is made with <i class="icon-heart text-primary" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>

                    </div>
                </div>
            </footer>
        </div>

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
        </script>

    </body>
</html>
