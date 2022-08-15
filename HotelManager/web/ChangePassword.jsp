<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<html lang="en">
    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Change Password</title>

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
        top:0px;
        font-size: 10px;
    }
</style>
<body>
    <div class="main">

        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <form action="LoginController?do=ChangePassword" method="post" id="signup-form" class="signup-form">
                        <h2 class="form-title">Đổi mật khẩu</h2>
                        <div class="form-group">
                            <%if(request.getAttribute("oldpassword")==null){%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="password" class="form-input" name="oldpassword" placeholder="Mật khẩu cũ" value=""/>
                            <% }else {%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="password" class="form-input" name="oldpassword" placeholder="Mật khẩu cũ" value="<%=request.getAttribute("oldpassword")%>"/>
                            <%}%>
                        </div>
                        <div class="form-group">
                            <%if(request.getAttribute("newpassword")==null){%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="password" class="form-input" name="password" id="password" placeholder="Mật khẩu mới" value=""/>
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                            <% }else {%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="password" class="form-input" name="password" id="password" placeholder="Mật khẩu mới" value="<%=request.getAttribute("newpassword")%>"/>
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                            <%}%>
                        </div>
                        <div class="form-group lastt">
                            <%if(request.getAttribute("re_password")==null){%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="password" class="form-input" name="re_password" id="re_password" placeholder="Nhập lại mật khẩu mới" value=""/>
                            <% }else {%>
                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="password" class="form-input" name="re_password" id="re_password" placeholder="Nhập lại mật khẩu mới" value="<%=request.getAttribute("re_password")%>"/>
                            <%}%>
                            <div>
                                <h4 id="er" class="er" style="color: red;font-size: 13px;">${requestScope.errorpass}</h4>
                            </div>        
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Submit"/>
                        </div>                       
                    </form>
                    <p class="loginhere">
                        Have already an account ? <a href="LoginController" class="loginhere-link">Login here</a>
                    </p>
                </div>
            </div>
        </section>

    </div>
</body>
</html>