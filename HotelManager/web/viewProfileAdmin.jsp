<%-- 
    Document   : viewProfileAdmin
    Created on : Jun 9, 2022, 10:48:02 PM
    Author     : Minh Hieu
--%>

<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thông tin</title>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">   
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" 
        href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
        <script type="text/javascript" 
        src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" 
        src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css">
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">

    </head>
    <style>

    </style>

    <body id="reportsPage">
        <div class="" id="home">
            <%@include file="headerAdmin.jsp" %>
            <%
                User user = (User) request.getAttribute("u");
            %>
            <h2 style="color:wheat;margin-bottom: 20px;text-align: center">Thông tin cá nhân</h2>
            <div class="container mt-5">

                <!-- row -->
                <div class="row tm-content-row">
                    <div class="tm-block-col tm-col-avatar">
                        <div class="tm-bg-primary-dark tm-block tm-block-avatar">
                            <h2 class="tm-block-title">Ảnh</h2>
                            <div class="tm-avatar-container">
                                <img 
                                    src="images/anhdaidien/admin.jpg"
                                    alt="Avatar"
                                    class="tm-avatar img-fluid mb-4"
                                    />

                            </div>

                        </div>
                    </div>

                    <div class="tm-block-col tm-col-account-settings">
                        <div class="tm-bg-primary-dark tm-block tm-block-settings">
                            
                            <form action="" class="tm-signup-form row">
                                <div class="form-group col-lg-6">
                                    <label for="inputYourname">Tên</label>
                                    <input style="background-color: white; color: #54657D;"
                                           id="name"
                                           name="name"
                                           type="text"
                                           readonly
                                           value="<%=user.getUserName()%>"
                                           class="form-control validate"
                                           />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="email">Email</label>
                                    <input style="background-color: white; color: #54657D;"
                                           id="email"
                                           name="inputEmailAddress"
                                           type="email"
                                           readonly
                                           value="<%=user.getUserEmail()%>"
                                           class="form-control validate"
                                           />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="inputCMT">CMT</label>
                                    <input style="background-color: white; color: #54657D;"
                                           id="email"
                                           name="inputCMT"
                                           type="text"
                                           readonly
                                           value="<%=user.getCMT()%>"

                                           class="form-control validate"
                                           />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="inputAdress">Địa chỉ</label>
                                    <input style="background-color: white; color: #54657D;"
                                           id="email"
                                           name="inputAdress"
                                           type="text"
                                           readonly
                                           value="<%=user.getUserAdress()%>"
                                           class="form-control validate"
                                           />
                                </div>


                                <div class="form-group col-lg-6">
                                    <label for="phone">Số điện thoại</label>
                                    <input style="background-color: white; color: #54657D;"
                                           id="phone"
                                           name="inputPhone"
                                           type="tel"
                                           readonly
                                           value="<%=user.getUserPhone()%>"
                                           class="form-control validate"
                                           />
                                </div>
                                <div class="form-group col-lg-6">
                                    <label for="inputBirthday">Ngày sinh</label>
                                    <input style="background-color: white; color: #54657D;"
                                           id="phone"
                                           name="inputBirthday"
                                           type="text"
                                           readonly
                                           value="<%=user.getBirthday()%>"
                                           class="form-control validate"
                                           />
                                </div>

                                <div class="col-12">
                                    <a href="AdminController?do=ViewupdateAdmin"

                                       class="btn btn-primary btn-block text-uppercase"
                                       >
                                        Chỉnh sửa
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script>
            function changeImage() {
                var path = document.getElementById("avatarURL").value;
                document.getElementById("image").src = "img//" + path.replace(/^.*\\/, "");
            }

        </script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
    </body>
</html>
