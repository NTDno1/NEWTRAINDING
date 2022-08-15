<%-- 
    Document   : editroomdevice
    Created on : Jun 8, 2022, 10:24:44 PM
    Author     : NTD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Tin tức</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <link rel="stylesheet" href="css/style.css">
        

        
</head>
<script type="text/javascript">
    function Delete() {
        alert("Xóa thành công");
    }
</script>
    <%@include file="headerAdmin.jsp" %>
    <link href="css/navdropdown.css" rel="stylesheet">   
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" 
    src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <h2 style="color:wheat;margin-bottom: 20px;text-align: center;margin-top:20px;font-size:35px;">Thông tin bài viết</h2>
<body id="reportsPage">

    <div class="">
        <div class="row tm-content-row">
            <div class="col-sm-12 col-md-12 col-lg-8 col-xl-12 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-products">
                    <div class="tm-product-table-container">
                        <table class="table table-hover tm-table-small tm-product-table">
                            <thead>      
                                <tr>

                                    <th scope="col">Tác giả</th>
                                    <th scope="col">Nội dung</th>
                                    <th scope="col">Hình ảnh</th>
                                    <th scope="col">Tiêu đề</th>                                      
                                    <th scope="col">Xóa</th>

                                    <th scope="col">Cập nhật</th>
                                </tr>
                            </thead>
                            <c:forEach items="${b}" var="c">
                                <!--<form action="BlogManagerController?do=updateblog"method="get">-->
                                <tr>
                                    <td>${c.blogAuthor}</td>

                                    <td>${c.blogDescription}</td>
                                    <td><img style="width: 350px; height: 250px;" src="images/anhblog/${c.blogImage}" alt=""></td>
                                    <td>${c.blogTitleString}</td>
                                <input name="blogauthor" value="${c.blogAuthor}" type="hidden">
                                <input name="blogDescription" value="${c.blogDescription}" type="hidden">
                                <input name="blogImage" value="${c.blogImage}" type="hidden">
                                <input name="blogTitleString" value="${c.blogTitleString}" type="hidden">
                                <input name="date" value="${c.blogDate}" type="hidden">
                                <input name="blogid" value="${c.blogID}" type="hidden">
                                <td>
                                    <a href="BlogManagerController?do=deleteblog&blogid=${c.blogID}&page=${page}" class="tm-product-delete-link" onclick="Delete()"/>
                                    <i class="far fa-trash-alt tm-product-delete-icon" onclick="delete()"></i>
                                    </a>
                                </td>

                                <td>
                                     <!--<input name="BlogID" value="${c.blogID}" type="hidden">-->
                                    <a href="BlogManagerController?do=updateblog&blogid=${c.blogID}" class="tm-product-delete-link"/>
                                    <i class="fas fa-arrow-alt-circle-up tm-product-delete-icon"></i>
                                    </a>
                                    <!--                                            <button type="submit" name="do" value="updateblog" class="tm-product-delete-link">
                                                                                    <i class="fas fa-arrow-alt-circle-up tm-product-delete-icon"></i>
                                                                                </button>-->
                                </td>
                                </tr>
                                <!--                                    </form>   -->
                            </c:forEach>
                        </table>
                    </div>
                    <div style="padding-left: 40%;"class="site-block-27">

                        <ul>
                            <c:forEach begin="1" end="${n}" var="c">
                                <li><a href="BlogManagerController?do=editblog&page=${c}">${c}</a></li>
                                </c:forEach>
                        </ul>

                    </div>

                    <!-- table container -->

                </div>
            </div>

        </div>
    </div>
    <footer class="tm-footer row tm-mt-small">
        <div class="col-12 font-weight-light">
            <p class="text-center text-white mb-0 px-4 small">
               
            </p>
        </div>
    </footer>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script>
                                                $(function () {
                                                    $(".tm-product-name").on("click", function () {
                                                        window.location.href = "edit-product.html";
                                                    });
                                                });
    </script>
</body>
</html>
