<!doctype html>
<html lang="en">
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <head>
        <title>Login</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css/style_1_1.css">

    </head>
    <style>
        body{
            overflow: hidden;
        }
        .alert {
            position: absolute;
            padding: 20px;
            background-color: #f44336;
            color: white;
            opacity: 1;
            transition: opacity 0.6s;
            margin-bottom: 15px;
            width: 400px;
            z-index: 30;
            right: 5px;
            top: 20px;
            animation: down_mess 5s ease forwards;

        }

        .alert.success {background-color: #04AA6D;}

        @keyframes down_mess{
            70%{
                transform: translateX(0%);
            }
            80%{
                transform: translateX(10%);
            }
            94%{
                transform: translateX(-10%);
            }
            100%{
                transform: translateX(110%);
            }
        }

    </style>
    <%
        String user = "";
        if (request.getAttribute("user") != null) {
            user = (String) request.getAttribute("user");
        }
        String pass = "";
        if (request.getAttribute("user") != null) {
            pass = (String) request.getAttribute("pass");
        }
        String mess = (String) request.getAttribute("mess").toString();
    %>
    <body class="img js-fullheight" style="background-image: url(images/bg.jpg);">
        <section class="ftco-section">
            <div class="container">
                <%if (request.getAttribute("mess").equals("change")) {%>
                <div class="alert success">
                    <strong>Thành công!</strong> Đổi mật khẩu thành công
                </div>
                <% } else if (request.getAttribute("mess").equals("register")) {%>
                <div class="alert success">
                    <strong>Thành công!</strong> Bạn đã đăng ký thành công
                </div>
                <% }%>
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section"Đăng nhập</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h3 class="mb-4 text-center">Bạn đã có tài khoản?</h3>
                            <form action="LoginController?do=CheckLogin" class="signin-form" method="post">
                                <div class="form-group">
                                    <%if (request.getAttribute("username") == null) {%>
                                    <input maxlength="30" required="" name="username" type="text" class="form-control" placeholder="Tên đăng nhập" value="<%=user%>" required>
                                    <% } else {%>
                                    <input maxlength="30" required="" name="username" type="text" class="form-control" placeholder="Tên đăng nhập" value="<%=request.getAttribute("username")%>" required>
                                    <% }%>
                                </div>
                                <div class="form-group">
                                    <%if (request.getAttribute("username") == null) {%>
                                    <input id="password-field" maxlength="30" required="" name="password" type="password" class="form-control" placeholder="Mật khẩu" value="<%=pass%>" required>
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                    <% } else {%>
                                    <input id="password-field" maxlength="30" required="" name="password" type="password" class="form-control" placeholder="Mật khẩu" value="<%=request.getAttribute("password")%>" required>
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                    <% }%>
                                </div>
                                <h4 id="er" style="color: pink;font-size: 15px; position: fixed;">${requestScope.error}</h4>
                                <br>

                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Đăng nhập</button>
                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-50">
                                        <label class="checkbox-wrap checkbox-primary">Nhớ mật khẩu
                                            <input name="remember" type="checkbox" value="Remember me">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                    <div class="w-50 text-md-right">
                                        <a href="LoginController?do=ForgetPassword1" style="color: #fff">Quên mật khẩu</a>
                                    </div>

                                </div>
                                <div class="form-group d-md-flex">
                                    <div class="w-50">
                                        <label class="checkbox-wrap checkbox-primary">																	 
                                        </label>
                                    </div>

                                </div>
                            </form>
                            <!--<p class="w-100 text-center">&mdash; Or Sign In With &mdash;</p>-->
                            <!--	          <div class="social d-flex text-center">
                                                    <a href="#" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Facebook</a>
                                                    <a href="#" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-twitter mr-2"></span> Twitter</a>
                                              </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="js/jquery.min_1.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min_1_1.js"></script>
        <script src="js/main_1.js"></script>
        <script>
        </script>
    </body>
</html>

