<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Forget Password</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css/style_2_1.css">

        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>
    </head>

    <style>
        .form-group{
            position: relative;
        }
        .style{
            position: absolute;
            left: 0px;
            top:3px;
            font-size: 10px;
        }

    </style>
    <body>

        <div class="main">

            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <form action="LoginController?do=ForgetPassword" method="post" id="signup-form" class="signup-form">
                            <h2 class="form-title">Quên mật khẩu</h2>
                            <h4 id="er" style="color: red;font-size: 15px;">${requestScope.error}</h4>
                            <h4 id="er" style="color: red;font-size: 15px;">${requestScope.errorMess}</h4>
                            <h4 id="er" style="color: red;font-size: 15px;">${requestScope.mess}</h4>
                            <h4 id="er" style="color: red;font-size: 15px;">${requestScope.eEmail}</h4>
                            <h4 id="er" style="color: red;font-size: 15px;">${requestScope.exampleEmail}</h4>
                            <%

                                String email = (String) request.getAttribute("email1");
                            %>
                            <div class="form-group">
                                <%if (email != null) {%>
                                <i class='bx bxs-star style' style="color:red;"></i> <input type="email" class="form-input " name="email" value="<%=email%>" placeholder="Email" maxlength="100" required/>
                                <%} else {%>
                                <i class='bx bxs-star style' style="color:red;"></i>  <input type="email" class="form-input" name="email" value="" placeholder="Email" required/>
                                <%}%>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" id="submit" class="form-submit" value="Gửi"/>
                            </div>                       
                        </form>
                        <p class="loginhere">
                            Đã có tài khoản ? <a href="LoginController" class="loginhere-link">Đăng nhập tại đây</a>
                        </p>
                    </div>
                </div>
            </section>

        </div>

        <!-- JS -->
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>