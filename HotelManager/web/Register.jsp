<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html lang="en">
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>
    <link rel="stylesheet" href="css/style_2_1.css">
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    
</head>
<style>
.form-group{
        position: relative;
    }
    .style{
        position: absolute;
        left: 0px;
        top:0px;
        font-size: 10px;
    }
</style>
<body>
<script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>


<script src="js/notify.js"></script>
<script src="js/notify.min.js"></script>

    <div class="main">

        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <form action="LoginController?do=CheckRegister" method="post" id="signup-form" class="signup-form">
                        <h2 class="form-title">Đăng ký tài khoản</h2>
                        <div class="form-group">
                            <%if(request.getAttribute("name")==null){%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="text" class="form-input" name="name" placeholder="Tên của bạn"/>
                            <% }else {%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="text" class="form-input" name="name" placeholder="Tên của bạn" value="<%=request.getAttribute("name")%>"/>
                            <%}%>
                        </div>
                        <div class="form-group">
                            <%if(request.getAttribute("username")==null){%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="text" class="form-input" name="username" placeholder="Tên đăng nhập"/>
                            <% }else {%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="text" class="form-input" name="username" placeholder="Tên đăng nhập"s value="<%=request.getAttribute("username")%>"/>
                            <%}%>
                        </div>
                        <div class="form-group">
                            <%if(request.getAttribute("email")==null){%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="email" class="form-input" name="email" placeholder="Email"/>
                            <% }else {%>
                            <i class='bx bxs-star style' style="color:red;"></i><input  maxlength="30" required="" type="email" class="form-input" name="email" placeholder="Email" value="<%=request.getAttribute("email")%>"/>
                            <%}%>
                        </div>
                        <div class="form-group">
                            <%if(request.getAttribute("password")==null){%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="password" class="form-input" name="password" id="password" placeholder="Mật khẩu"/>
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                            <% }else {%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="password" class="form-input" name="password" id="password" placeholder="Mật khẩu" value="<%=request.getAttribute("password")%>"/>
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                            <%}%>
                        </div>
                        <div class="form-group lastt">
                            <%if(request.getAttribute("re_password")==null){%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="password" class="form-input" name="re_password" id="re_password" placeholder="Nhập lại mật khẩu"/>
                            <div>
                                <h4 id="er" class="er" style="color: red;font-size: 13px;">${requestScope.errorpass}</h4>
                                <h4 id="er" class="er" style="color: red;font-size: 13px;">${requestScope.error}</h4>
                            </div>
                            <% }else {%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="password" class="form-input" name="re_password" id="re_password" placeholder="Nhập lại mật khẩu" value="<%=request.getAttribute("re_password")%>"/>
                            <div>
                                <h4 id="er" class="er" style="color: red;font-size: 13px;">${requestScope.errorpass}</h4>
                                <h4 id="er" class="er" style="color: red;font-size: 13px;">${requestScope.error}</h4>
                            </div>
                            <%}%>
                        </div>
                        <div class="form-group">
                            <input onclick="mess()" type="submit" name="submit" id="submit" class="form-submit button large round success" value="Đăng ký"/>
                        </div>                       
                    </form>
                    <p class="loginhere">
                        bạn đã có tài khoản ? <a href="LoginController?do=ForgetPassword" class="loginhere-link">Quên mật khẩu</a>
                    </p>
                </div>
            </div>
        </section>

    </div>
                        <script>
                            $.notify("Hello World");
                        </script>
</body>
</html>