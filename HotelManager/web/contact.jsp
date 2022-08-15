<%-- 
    Document   : contact
    Created on : Jun 13, 2022, 9:27:10 PM
    Author     : Minh Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>

        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700|Work+Sans:300,400,700" rel="stylesheet">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
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
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <style>
            .style{

                position: absolute;
                left: 20px;
                top:40px;
                font-size: 10px;
            }
        </style>
    </head>
    <div class="site-wrap">

        <div class="site-mobile-menu">
            <div class="site-mobile-menu-header">
                <div class="site-mobile-menu-close mt-3">
                    <span class="icon-close2 js-menu-toggle"></span>
                </div>
            </div>
            <div class="site-mobile-menu-body"></div>
        </div> <!-- .site-mobile-menu -->


        <%@include file="header.jsp"%>

        <div class="site-blocks-cover overlay" style="background-image: url(images/hero_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-md-7 text-center" data-aos="fade">

                    </div>
                </div>
            </div>
        </div>  


        <div class="site-section site-section-sm">
            <div class="container">
                <div class="row">

                    <div class="col-md-12 col-lg-8 mb-5">


                        <form action="ContactController" method="post" class="p-5 bg-white">
                            <h4 id="er" style="color: red;font-size: 15px;">${requestScope.mEss}</h4>

                            <div class="row form-group ">
                                <div class="col-md-12">
                                    <i class='bx bxs-star style' style="color:red;"></i>    <label class="font-weight-bold " for="email">Email</label>
                                    <input type="email" id="email" class="form-control" name="email"  pattern="[a-zA-Z]\w+@(\w+.)+([a-zA-Z]+)" required  maxlength="40" placeholder="Email*">
                                </div>
                            </div>


                            <div class="row form-group">
                                <div class="col-md-12 mb-3 mb-md-0">
                                    <i class='bx bxs-star style' style="color:red;"></i>   <label class="font-weight-bold" for="">Tiêu đề</label>
                                    <input type="text" id="phone" class="form-control" name="title" pattern=".*\S" title="Không được để khoảng trắng" required maxlength="40" placeholder="Tiêu đề*">
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-12">
                                    <i class='bx bxs-star style' style="color:red;"></i>       <label class="font-weight-bold" for="message">Nội dung</label> 
                                    <textarea name="message" id="message" cols="30" rows="5" name="message" pattern=".*\S"   title="Không được để khoảng trắng" maxlength="100" class="form-control" required placeholder="Nội dung*"></textarea>
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-12">
                                    <input type="submit"  value="Gửi" class="btn btn-primary pill px-4 py-2">

                                </div>
                            </div>


                        </form>
                    </div>

                    <div class="col-lg-4">
                        <div class="p-4 mb-3 bg-white">
                            <h3 class="h5 text-black mb-3">Thông tin liên lạc</h3>
                            <p class="mb-0 font-weight-bold">Địa chỉ</p>
                            <p class="mb-4">Khu GD&ĐT, khu CNC Hoà Lạc, KM29, Đại lộ Thăng Long, huyện Thạch Thất, TP Hà Nội, Hà Nội</p>

                            <p class="mb-0 font-weight-bold">Điện thoại</p>
                            <p class="mb-4"><a href="#">+1 232 3235 324</a></p>

                            <p class="mb-0 font-weight-bold">Email</p>
                            <p class="mb-0"><a href="#">youremail@example.com</a></p>

                        </div>


                    </div>
                </div>
            </div>
        </div>




        <%@include file="footer.jsp" %>
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
