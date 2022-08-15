<%-- 
    Document   : viewRoom.jsp
    Created on : Jun 5, 2022, 12:56:50 AM
    Author     : NTD
--%>

<%@page import="entity.Account"%>
<%@page import="entity.Service"%>
<%@page import="entity.Room"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.impl.MessageDAOImpl"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Hoang Hon</title>
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

        <!--fontawesome css-->
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
        <link rel="stylesheet" href="css/viewcomment.css">                      
    </head>
    <body>
        <div class="site-wrap">
            <jsp:include page="header.jsp"></jsp:include>

                <div class="slide-one-item home-slider owl-carousel">

                    <div class="site-blocks-cover overlay" style="background-image: url(images/hero_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
                        <div class="container">
                            <div class="row align-items-center justify-content-center">
                                <div class="col-md-7 text-center" data-aos="fade">

                                    <h1 class="mb-2"></h1>
                                    <h2 class="caption"></h2>
                                </div>
                            </div>
                        </div>
                    </div>  

                    <div class="site-blocks-cover overlay" style="background-image: url(images/hero_2.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
                        <div class="container">
                            <div class="row align-items-center justify-content-center">
                                <div class="col-md-7 text-center" data-aos="fade">
                                    <h1 class="mb-2">Trải nghiệm</h1>
                                    <h2 class="caption">và bạn sẽ thích</h2>
                                </div>
                            </div>
                        </div>
                    </div> 

                    <div class="site-blocks-cover overlay" style="background-image: url(images/hero_3.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
                        <div class="container">
                            <div class="row align-items-center justify-content-center">
                                <div class="col-md-7 text-center" data-aos="fade">
                                    <h1 class="mb-2">Relaxing Room</h1>
                                    <h2 class="caption">Your Room, Your Stay</h2>
                                </div>
                            </div>
                        </div>
                    </div> 

                </div>
                <div class="product-page-main">
                    <div class="container">

                        <div class="row">

                            <div class="col-md-2 col-sm-4">
                            <c:if test="${sessionScope.isroomde!=null}">
                                <c:forEach items="${vector3}" var="c">
                                    <form>
                                        <div class="left-profile-box-m prod-page">
                                            <!--<div class="pro-img">-->
                                            <img src="images/anhdevice/${c.serviceImage}" alt="#" style="height: 80px;width: 150px; margin-top: 10px" />
                                            <!--</div>-->
                                            <div class="pof-text">
                                                <h4 style="text-align: center">${c.serviceName}</h4>
                                                <!--                                <div class="check-box"></div>-->
                                            </div>
                                            <a href="ServiceController?do=servicedetail&ServiceID=${c.serviceID}">Chi Tiết</a>
                                        </div>
                                    </form>
                                </c:forEach>
                            </c:if>
                            <c:if test="${sessionScope.isroomde==null}">
                                <c:forEach items="${vector}" var="c">
                                    <form>
                                        <div class="left-profile-box-m prod-page">
                                            <!--<div class="pro-img">-->
                                            <img src="images/anhphong/${c.image}" alt="#"style="height: 80px;width: 150px;margin-top: 10px" />
                                            <!--</div>-->
                                            <div class="pof-text">
                                                <h4 style="text-align: center">${c.cateroom}</h4>
                                                <!--                                <div class="check-box"></div>-->
                                            </div>
                                            <a href="RoomController?do=roomdetail&roomid=${c.roomID}">Chi Tiết</a>
                                        </div>
                                    </form>
                                </c:forEach>
                            </c:if>
                        </div>

                        <div class="col-md-7 col-sm-8">
                            <div class="md-prod-page">
                                <div class="md-prod-page-in">
                                    <div class="display-container">
                                        <c:if test="${sessionScope.isroomde!=null}">
                                            <button class="image-button button-left" onclick="plusDivs(-1)">&#10094;</button>
                                            <button class="image-button button-right" onclick="plusDivs(1)">&#10095;</button>
                                            <c:forEach items="${img}" var="c">
                                                <img class="mySlides" src="images/anhphong/${c.image1}" style="height: 440px;width: 630px">
                                                <img class="mySlides" src="images/anhphong/${c.image2}" style="height: 440px;width: 630px">
                                                <img class="mySlides" src="images/anhphong/${c.image3}" style="height: 440px;width: 630px">
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${sessionScope.isroomde==null}">
                                            <img class="mySlides" src="images/anhdevice/${se.serviceImage}"style="height: 440px;width: 630px">
                                        </c:if>
                                    </div>
                                    <div class="btn-dit-list clearfix">
                                        <div class="left-dit-p" style="text-align: center">
                                            <!--<div class="dex-a">-->
                                            <c:if test="${sessionScope.isroomde!=null}">
                                                <h4 style="text-align: center">Loại Phòng: ${Room.cateroom}</h4>
                                            </c:if>
                                            <c:if test="${sessionScope.isroomde==null}">
                                                <h4>Dịch Vụ Đi Kèm: ${se.serviceName}</h4>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                <div class="description-box">
                                    <div class="dex-a">
                                        <h4 style="text-align: center">Mô TẢ</h4>
                                        <c:if test="${sessionScope.isroomde==null}">
                                            <p>${se.serviceDes}</p>
                                        </c:if>
                                        <c:if test="${sessionScope.isroomde!=null}">
                                            <p>${Room.roomdesc}</p>
                                            <br>
                                            <p>DIỆN TÍCH: ${Room.square}m2</p>

                                            <div class="spe-a">
                                                <h4>Tiện Ích Phòng</h4>
                                                <ul>
                                                    <li class="clearfix">
                                                        <div class="col-md-4">
                                                            <h5 style="color: red">Đồ dùng</h5>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <h5 style="color: red">Số Lượng</h5>
                                                        </div>
                                                    </li>
                                                    <c:forEach items="${de}" var="de">
                                                        <li class="clearfix">
                                                            <div class="col-md-4">
                                                                <h5><p>${de.deviceName}</p></h5>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <p>${de.quantity}</p>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${sessionScope.login!=null && sessionScope.isroomde==null}">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm-5 col-md-6 col-12 pb-4">
                                            <h1 style="text-align: center">Đánh Giá</h1> <br>
                                            <form action="ServiceController?do=CommentService" method="post">
                                                <input class="form-control" type="text" value="" name="comment"> <br>
                                                <input class="form-control" type="text" hidden="" value="${se.serviceID}" name="ServiceID"> <br>
                                                <input class="form-control" type="text" hidden="" value="${sessionScope.login.accountID}" name="AccountID"> <br>
                                                <button class="btn btn-primary" type="submit">Gửi</button>
                                            </form> <br>
                                            <c:forEach items="${listFeedBack}" var="c">
                                                <div class="article-loop">
                                                    <h3>Tên: ${c.note}</h3>
                                                    <c:if test="${c.status==1}">
                                                        <p>Nội Dung: Bình Luận Đã Bị Xóa Do Vi Phạm Chính Sách</p>
                                                    </c:if>
                                                    <c:if test="${c.status==0}">
                                                        <p>Nội Dung: ${c.comment}</p>
                                                    </c:if>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.isroomde!=null}">
                                <h2 style="text-align: center">Các Phòng Tương Tự</h2>
                                <div class="row cat-pd">
                                    <c:forEach items="${getroomlist}" var="c">
                                        <div class="col-md-6" style="margin-top: 30px">
                                            <div class="small-box-c">
                                                <div class="small-img-b">
                                                    <a href="RoomController?do=roomdetails&roomid=${c.roomID}&cateroom=${c.roomcateID}"><img class="img-responsive" src="images/anhphong/${c.image}" alt="#" style="height: 160px; width: 280px"/></a>
                                                </div>
                                                <div class="dit-t clearfix">
                                                    <div class="left-ti">
                                                        <h4>${c.cateroom}</h4>
                                                        <p>Diện Tích Phòng: <span>${c.square}m2</span></p>
                                                    </div>
                                                    <a href="RoomController?do=roomdetails&roomid=${c.roomID}&cateroom=${c.roomcateID}" tabindex="0"><fmt:formatNumber value="${c.roomprice}" /> đ</a>
                                                </div>
                                                <div class="prod-btn">
                                                    <a href="RoomController?do=roomdetails&roomid=${c.roomID}&cateroom=${c.roomcateID}"><i aria-hidden="true"></i>Chi Tiết</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.isroomde==null}">
                                <h2 style="text-align: center">Phòng Dành Cho Bạn</h2>
                                <div class="row cat-pd">
                                    <c:forEach items="${getroomlist2}" var="c">
                                        <div class="col-md-6" style="margin-top: 30px">
                                            <div class="small-box-c">
                                                <div class="small-img-b">
                                                    <a href="RoomController?do=roomdetails&roomid=${c.roomID}&cateroom=${c.roomcateID}"><img class="img-responsive" src="images/anhphong/${c.image}" alt="#" style="height: 160px; width: 280px"/></a>
                                                </div>
                                                <div class="dit-t clearfix">
                                                    <div class="left-ti">
                                                        <h4>${c.cateroom}</h4>
                                                        <p>Diện Tích Phòng: <span>${c.square}m2</span></p>
                                                    </div>
                                                    <a href="RoomController?do=roomdetails&roomid=${c.roomID}&cateroom=${c.roomcateID}" tabindex="0"><fmt:formatNumber value="${c.roomprice}" /> đ/đêm</a>
                                                </div>
                                                <div class="prod-btn">
                                                    <a href="RoomController?do=roomdetails&roomid=${c.roomID}&cateroom=${c.roomcateID}"><i aria-hidden="true"></i>Chi Tiết</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:if>

                        </div>

                        <c:if test="${sessionScope.isroomde!=null}" >
                            <div class="col-md-3 col-sm-12">
                                <div class="price-box-right">
                                    <h4 style="font-size: 24px">Giá tiền</h4>
                                    <h3><fmt:formatNumber value="${Room.roomprice}" /><span style="font-weight: bold"> đ/1 đêm</span></h3>
                                    <c:if test="${sessionScope.login!=null && sessionScope.isroomde!=null}" >
                                        <c:choose>
                                            <c:when test="${sessionScope.login.getRoleID()==1}">
                                                <a href="OrderController?do=user&id=${Room.roomID}&userid=${sessionScope.login.getAccountID()}">Đặt phòng </a>

                                            </c:when>
                                            <c:otherwise>
                                                <a onclick="showMess(${sessionScope.login.getRoleID()})">Đặt phòng </a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                    <c:if test="${sessionScope.login==null}" >
                                        <a href="LoginController">Đặt phòng</a>
                                    </c:if>
                                </div>
                            </div>
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


            <script src="js/mediaelement-and-player.min.js"></script>

            <script src="js/main.js"></script>
            <script>

                                                    function showMess(id) {
                                                        if (id == 2) {
                                                            alert('Bạn không thể đặt phòng với vai trò là Lễ Tân.');
                                                        } else if (id == 3) {
                                                            alert('Bạn không thể đặt phòng với vai trò là Admin.');
                                                        }
                                                    }
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

                                                    (function ($) {

                                                        var paginate = {
                                                            startPos: function (pageNumber, perPage) {
                                                                // determine what array position to start from
                                                                // based on current page and # per page
                                                                return pageNumber * perPage;
                                                            },

                                                            getPage: function (items, startPos, perPage) {
                                                                // declare an empty array to hold our page items
                                                                var page = [];

                                                                // only get items after the starting position
                                                                items = items.slice(startPos, items.length);

                                                                // loop remaining items until max per page
                                                                for (var i = 0; i < perPage; i++) {
                                                                    page.push(items[i]);
                                                                }

                                                                return page;
                                                            },

                                                            totalPages: function (items, perPage) {
                                                                // determine total number of pages
                                                                return Math.ceil(items.length / perPage);
                                                            },

                                                            createBtns: function (totalPages, currentPage) {
                                                                // create buttons to manipulate current page
                                                                var pagination = $('<div class="pagination" />');

                                                                // add a "first" button
                                                                pagination.append('<span class="pagination-button">&laquo;</span>');

                                                                // add pages inbetween
                                                                for (var i = 1; i <= totalPages; i++) {
                                                                    // truncate list when too large
                                                                    if (totalPages > 5 && currentPage !== i) {
                                                                        // if on first two pages
                                                                        if (currentPage === 1 || currentPage === 2) {
                                                                            // show first 5 pages
                                                                            if (i > 5)
                                                                                continue;
                                                                            // if on last two pages
                                                                        } else if (currentPage === totalPages || currentPage === totalPages - 1) {
                                                                            // show last 5 pages
                                                                            if (i < totalPages - 4)
                                                                                continue;
                                                                            // otherwise show 5 pages w/ current in middle
                                                                        } else {
                                                                            if (i < currentPage - 2 || i > currentPage + 2) {
                                                                                continue;
                                                                            }
                                                                        }
                                                                    }

                                                                    // markup for page button
                                                                    var pageBtn = $('<span class="pagination-button page-num" />');

                                                                    // add active class for current page
                                                                    if (i == currentPage) {
                                                                        pageBtn.addClass('active');
                                                                    }

                                                                    // set text to the page number
                                                                    pageBtn.text(i);

                                                                    // add button to the container
                                                                    pagination.append(pageBtn);
                                                                }

                                                                // add a "last" button
                                                                pagination.append($('<span class="pagination-button">&raquo;</span>'));

                                                                return pagination;
                                                            },

                                                            createPage: function (items, currentPage, perPage) {
                                                                // remove pagination from the page
                                                                $('.pagination').remove();

                                                                // set context for the items
                                                                var container = items.parent(),
                                                                        // detach items from the page and cast as array
                                                                        items = items.detach().toArray(),
                                                                        // get start position and select items for page
                                                                        startPos = this.startPos(currentPage - 1, perPage),
                                                                        page = this.getPage(items, startPos, perPage);

                                                                // loop items and readd to page
                                                                $.each(page, function () {
                                                                    // prevent empty items that return as Window
                                                                    if (this.window === undefined) {
                                                                        container.append($(this));
                                                                    }
                                                                });

                                                                // prep pagination buttons and add to page
                                                                var totalPages = this.totalPages(items, perPage),
                                                                        pageButtons = this.createBtns(totalPages, currentPage);

                                                                container.after(pageButtons);
                                                            }
                                                        };

                                                        // stuff it all into a jQuery method!
                                                        $.fn.paginate = function (perPage) {
                                                            var items = $(this);

                                                            // default perPage to 5
                                                            if (isNaN(perPage) || perPage === undefined) {
                                                                perPage = 5;
                                                            }

                                                            // don't fire if fewer items than perPage
                                                            if (items.length <= perPage) {
                                                                return true;
                                                            }

                                                            // ensure items stay in the same DOM position
                                                            if (items.length !== items.parent()[0].children.length) {
                                                                items.wrapAll('<div class="pagination-items" />');
                                                            }

                                                            // paginate the items starting at page 1
                                                            paginate.createPage(items, 1, perPage);

                                                            // handle click events on the buttons
                                                            $(document).on('click', '.pagination-button', function (e) {
                                                                // get current page from active button
                                                                var currentPage = parseInt($('.pagination-button.active').text(), 10),
                                                                        newPage = currentPage,
                                                                        totalPages = paginate.totalPages(items, perPage),
                                                                        target = $(e.target);

                                                                // get numbered page
                                                                newPage = parseInt(target.text(), 10);
                                                                if (target.text() == '«')
                                                                    newPage = 1;
                                                                if (target.text() == '»')
                                                                    newPage = totalPages;

                                                                // ensure newPage is in available range
                                                                if (newPage > 0 && newPage <= totalPages) {
                                                                    paginate.createPage(items, newPage, perPage);
                                                                }
                                                            });
                                                        };

                                                    })(jQuery);

                                                    /* This part is just for the demo,
                                                     not actually part of the plugin */
                                                    $('.article-loop').paginate(2);
            </script>
            <style>
                .pagination {
                    display: block;
                    width: 75%;
                    margin: 1em auto;
                    text-align: center;

                    &:after {
                        content: '';
                        clear: both;
                    }
                }

                .pagination-button {
                    display: inline-block;
                    padding: 5px 10px;
                    border: 1px solid #e0e0e0;
                    background-color: #eee;
                    color: #333;
                    cursor: pointer;
                    transition: background 0.1s, color 0.1s;

                    &.active {
                        background-color: red;
                        border-color: #bbb;
                        color: #3366cc;
                    }
                }

                /* arbitrary styles */
                .heading {
                    text-align: center;
                    max-width: 500px;
                    margin: 20px auto;
                }
            </style>

    </body>
</html>
