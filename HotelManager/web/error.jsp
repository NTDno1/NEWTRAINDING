<%-- 
    Document   : error
    Created on : Jun 11, 2022, 10:08:57 AM
    Author     : Minh Hiếu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
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
    <body>
        <%@include file="header.jsp"%>
        <div class="slide-one-item home-slider owl-carousel">
            <div class="site-blocks-cover overlay" style="background-image: url(images/hero_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">

            </div>       
        </div>



        <p style="color: red; font-weight: bold; text-align: center;margin: 20px 50px ; font-size: 50px">
            Error:  ${requestScope.errorMess}
        </p>

    </div>
    <%@include file="footer.jsp" %>


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
