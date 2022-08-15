<%-- 
    Document   : profileReceptionist
    Created on : Jun 8, 2022, 8:26:16 PM
    Author     : Minh Hieu
--%>

<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <style>
            body{margin-top:20px;
                 background-color:#f2f6fc;
                 color:#69707a;
            }
            .img-account-profile {
                height: 10rem;
            }
            .rounded-circle {
                border-radius: 50% !important;
            }
            .card {
                box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%);
            }
            .card .card-header {
                font-weight: 500;
            }
            .card-header:first-child {
                border-radius: 0.35rem 0.35rem 0 0;
            }
            .card-header {
                padding: 1rem 1.35rem;
                margin-bottom: 0;
                background-color: rgba(33, 40, 50, 0.03);
                border-bottom: 1px solid rgba(33, 40, 50, 0.125);
            }
            .form-control, .dataTable-input {
                display: block;
                width: 100%;
                padding: 0.875rem 1.125rem;
                font-size: 0.875rem;
                font-weight: 400;
                line-height: 1;
                color: #69707a;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #c5ccd6;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                border-radius: 0.35rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            .nav-borders .nav-link.active {
                color: #0061f2;
                border-bottom-color: #0061f2;
            }
            .nav-borders .nav-link {
                color: #69707a;
                border-bottom-width: 0.125rem;
                border-bottom-style: solid;
                border-bottom-color: transparent;
                padding-top: 0.5rem;
                padding-bottom: 0.5rem;
                padding-left: 0;
                padding-right: 0;
                margin-left: 1rem;
                margin-right: 1rem;
            }
            .form-group{
                position: relative;
            }
            .style{
                position: absolute;
                left: 20px;
                top:200px;
                font-size: 10px;
            }
            .style1{
                position: absolute;
                left: 20px;
                top:290px;
                font-size: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container-xl px-4 mt-4">
            <!-- Account page navigation-->
            <h2>   <a class="nav-link" href="ReceptionistController?do=profile"  target="__blank">Thông tin cá nhân</a></h2>
            <nav class="nav nav-borders">

                <a class="nav-link" href="ReceptionistController"  target="__blank">Trang chủ</a>
            </nav>
            <hr class="mt-0 mb-4">
            <div class="row">
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Thông tin ảnh</div>
                        <div class="card-body text-center">
                            <!-- Profile picture image-->
                            <img class="img-account-profile rounded-circle mb-2" src="http://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                        </div>
                    </div>
                </div>
                <%
                    User user = (User) request.getAttribute("u");
                %>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">

                        <div class="card-body">
                            <form>
                                <!-- Form Group (username)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputYourname"  >Tên</label>
                                    <input class="form-control" id="inputUsername" readonly type="text"  value="<%=user.getUserName()%>">
                                </div>
                                <!-- Form Row-->
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (CMT)-->
                                    <div class="small mb-1">
                                        <label class="small mb-1" for="inputEmailAddress">Email</label>
                                        <input class="form-control" id="inputEmailAddress" readonly type="email" placeholder="Enter your email address" value="<%=user.getUserEmail()%>">
                                    </div>

                                </div>
                                <!-- Form Group (email address)-->
                                <div class="row gx-3 mb-3">
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputCMT">CMT</label>
                                        <input class="form-control" id="inputLastName" readonly type="text" placeholder="Enter your last name" value="<%=user.getCMT()%>">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputAdress">Địa chỉ</label>
                                        <input class="form-control" id="inputLocation" readonly type="tel" placeholder="Enter your Location" value="<%=user.getUserAdress()%>">
                                    </div>
                                </div>
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (phone number)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputPhone">Số điện thoại</label>
                                        <input class="form-control" id="inputPhone" type="tel" readonly value="<%=user.getUserPhone()%>">
                                    </div>
                                    <!-- Form Group (birthday)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputBirthday">Ngày sinh</label>
                                        <input class="form-control" id="inputBirthday" type="text" readonly name="birthday"  value="<%=user.getBirthday()%>">
                                    </div>
                                </div>
                                <!-- Save changes button-->


                                <a href="ReceptionistController?do=ViewupdateRecept"  class="btn btn-primary" >Chỉnh sửa thông tin </a> 
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
