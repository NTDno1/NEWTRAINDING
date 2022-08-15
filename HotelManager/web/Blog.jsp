<%-- 
    Document   : Blog.jsp
    Created on : Jun 5, 2022, 11:40:31 PM
    Author     : Thai Quan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="context.DBContext"%>
<%@page import="entity.Blog"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
        <link href="css/main_1.css" rel="stylesheet" />
        <link href="css/main_3.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style_2.css" type="text/css">
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
        ::placeholder { 
        color: deeppink;
        font-weight: 2px;
       
}
    </style>
    <body>
        <%
            Vector<Blog> vector4 = (Vector<Blog>) request.getAttribute("vector4");
        %>
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


                <div class="site-blocks-cover overlay" style="background-image: url(images/hero_1.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
                    <div class="container">
                        <div class="row align-items-center justify-content-center">
                            <div class="col-md-7 text-center" data-aos="fade">
                                <span class="caption mb-3">Khách sạn &amp; Khu nghỉ dưỡng</span>
                                <h1 class="mb-4">Tin tức</h1>
                            </div>
                        </div>
                    </div>
                </div>  
                <section class="blog spad">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-5">
                                <div class="blog__sidebar">

                                    <div class="blog__sidebar__item">
                                         <h4 >Thể loại</h4>
                                        <ul>

                                        <% DBContext db = new DBContext();
                                            ResultSet rs = db.getData("select * from CateRoom");
                                            while (rs.next()) {
                                        %>
                                        <li><a style="font-family: PlayFair Display" href="RoomController?do=CateRoom&cate=<%=rs.getInt(1)%>"><%=rs.getString(2)%></a></li>
                                            <%}%>

                                    </ul>
                                    </div>
                                    <div class="blog__sidebar__item">
                                        <h4>Tin tức nổi bật</h4>
                                    <c:forEach items="${b}" var="c">
                                         <div class="blog__sidebar__recent">
                                            <div style="width: 290px;" href="#" class="blog__sidebar__recent__item">
                                                <div class="blog__sidebar__recent__item__pic">
                                                    <img style="width: 50px; height: 50px;display: inline-block; float: left;"src="images/anhblog/${c.blogImage}" alt="">
                                                </div>
                                                <div style="width: 220px;"class="blog__sidebar__recent__item__text">
                                                    <h6> <a style="display: inline-block; color:black;" href="BlogController?do=detailBlog&blogID=${c.blogID}">${c.blogTitleString}</a> </h6> 
                                                    <span>${c.blogDate}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                            </div>
                        </div>

                        <div class="col-lg-8 col-md-7">
                            <div class="label">
                                <label style="width: 90px;">
                                    <a href="BlogController?do=sortnew">Mới nhất</a>
                                </label>
                                <label style="width: 80px;">
                                    <a href="BlogController?do=sortold">Cũ nhất</a>
                                </label>
                                <label style="padding-left:300px;">
                                    <div style="border-style:solid ;height:40px;" class="s006">
                                         <form action="BlogController" method="get">
                                            <div class="inner-form">
                                                <div class="input-field">
                                                    <input type="hidden" name="do" value="search">
                                                    <button style="float: left; width: 30px;" type="submit" class="btn-search" type="button">
                                                        <svg style="padding-left: 2px;" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                                        <path d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path>
                                                        </svg>
                                                    </button>
                                                    
                                                    <input style="height:35px;" id="search" type="text" placeholder="" name="search" />
                                                </div>
                                            </div>
                                        </form>
                                    </div>
<!--                                    <div class="topnav"> 
                                        <div class="search-container">
                                            <form action="BlogController" method="get">
                                                <input type="hidden" name="do" value="search">
                                                <input type="text" placeholder="Tìm kiếm.." name="search">
                                                <button type="submit">Submit</button>
                                            </form>
                                        </div>
                                    </div>-->
                                </label>
                            </div>                          




                            <div class="row">
                                <c:forEach items="${b}" var="c">
                                    <div class="col-lg-6 col-md-6 col-sm-6">                                  
                                        <div class="blog__item">
                                            <div class="blog__item__pic">
                                                <img style="width: 350px; height: 250px;" src="images/anhblog/${c.blogImage}" alt="">
                                            </div>
                                            <div class="blog__item__text">
                                                <ul>
                                                    <li><i class="fa fa-calendar-o"></i>${c.blogDate} bởi <label style="color: red">${c.blogAuthor}</label></li>                                               
                                                </ul>
                                                <h5><a style="font-family: Roboto;" href="#">${c.blogTitleString}</a></h5>
<!--                                                <p>${c.blogDescription}</p>-->
                                                <a href="BlogController?do=detailBlog&blogID=${c.blogID}" class="blog__btn">Đọc thêm <span class="arrow_right"></span></a>
                                            </div>
                                        </div>                                 
                                    </div>
                                </c:forEach>

                                <div class="col-lg-12">

                                    <div class="col-md-12 text-center">
                                        <c:if test="${a==1}">
                                            <div class="site-block-27">
                                                <ul>
                                                    <c:forEach begin="1" end="${n}" var="c">
                                                        <li><a href="BlogController?page=${c}">${c}</a></li>
                                                        </c:forEach>
                                                </ul>
                                            </div>    
                                        </c:if>
                                        <c:if test="${a==2}">
                                            <div class="site-block-27">
                                                <ul>
                                                    <c:forEach begin="1" end="${n}" var="c">
                                                        <li><a href="BlogController?do=sortnew&page=${c}">${c}</a></li>
                                                        </c:forEach>
                                                </ul>
                                            </div>    
                                        </c:if>
                                        <c:if test="${a==3}">
                                            <div class="site-block-27">
                                                <ul>
                                                    <c:forEach begin="1" end="${n}" var="c">
                                                        <li><a href="BlogController?do=sortold&page=${c}">${c}</a></li>
                                                        </c:forEach>
                                                </ul>
                                            </div>    
                                        </c:if>
                                        <c:if test="${a==4}">
                                            <div class="site-block-27">
                                                <ul>
                                                    <c:forEach begin="1" end="${n}" var="c">
                                                        <li><a href="BlogController?do=search&page=${c}">${c}</a></li>
                                                        </c:forEach>
                                                </ul>
                                            </div>    
                                        </c:if>
                                    </div>                              
                                </div>                                          
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <jsp:include page="footer.jsp"></jsp:include>
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
