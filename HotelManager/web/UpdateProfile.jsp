
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
        
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    </head>

    <style>
        body{
            background: #f7f7ff;
            margin-top:20px;
        }
        .card {
            position: relative;
            display: flex;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-color: #fff;
            background-clip: border-box;
            border: 0 solid transparent;
            border-radius: .25rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
        }
        .me-2 {
            margin-right: .5rem!important;
        }
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
        <%
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            ResultSet rs = (ResultSet) request.getAttribute("viewupdateprofile");
            String er = (String) request.getAttribute("error").toString();
            String s = "";
            if (er.equals("")) {
                s = "";
            } else s=er;
        %>
        <div class="container">
            <div class="main-body">
                <nav aria-label="breadcrumb" class="main-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="UserController?do=Profile">Thông tin cá nhân</a></li>
                </ol>
            </nav>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="Admin" class="rounded-circle p-1 bg-primary" width="110">
                                    <div class="mt-3">
                                        <%while (rs.next()) {
                                        %>
                                        <h4><%=rs.getString(3)%></h4>
                                        <p class="text-secondary mb-1">Ngôn ngữ:Java</p>
                                        <p class="text-muted font-size-sm">22 tuổi</p>
                                        <a href="LoginController?do=ChangePassword1"><button class="btn btn-primary">Đổi mật khẩu</button></a>

                                    </div>
                                </div>
                                <hr class="my-4">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe me-2 icon-inline"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>Website</h6>
                                        <span class="text-secondary">https://bootdey.com</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-github me-2 icon-inline"><path d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22"></path></svg>Github</h6>
                                        <span class="text-secondary">bootdey</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-twitter me-2 icon-inline text-info"><path d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z"></path></svg>Twitter</h6>
                                        <span class="text-secondary">@bootdey</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-instagram me-2 icon-inline text-danger"><rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect><path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path><line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line></svg>Instagram</h6>
                                        <span class="text-secondary">bootdey</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-facebook me-2 icon-inline text-primary"><path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path></svg>Facebook</h6>
                                        <span class="text-secondary">bootdey</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card">
                            <form action="UserController?do=Updateprofile" method="post">
                                <input type="hidden" name="uid" value="<%=rs.getInt(5)%>">
                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Tên của bạn</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <%if(request.getAttribute("messerror")==null){%>
                                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="text" name="name" class="form-control" value="<%=rs.getString(7)%>">
                                            <% }else{%>
                                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="text" name="name" class="form-control" value="<%=session.getAttribute("name")%>">
                                            <% }%>
                                        </div>
                                    </div>
                                    <div class="row mb-3 form-group">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <%if(request.getAttribute("messerror")==null){%>
                                             <%if(rs.getString(9)==null){%>
                                             <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required=""  type="email" name="email" class="form-control" placeholder="Email rỗng">
                                            <% }else {%>
                                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required=""  type="email" name="email" class="form-control" placeholder="Nhập email" value="<%=rs.getString(9)%>">
                                            <%} } else{%>
                                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required=""  type="email" name="email" class="form-control" placeholder="Nhập email" value="<%=session.getAttribute("email")%>">
                                            <% }%>
                                        </div>
                                    </div>
                                    <div class="row mb-3 form-group">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Số điện thoại</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <%if(request.getAttribute("messerror")==null){%>
                                            <%if(rs.getString(8)==null){%>
                                             <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="text" name="phone" class="form-control" placeholder="Số điện thoại rỗng">
                                            <% }else {%>
                                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="text" name="phone" class="form-control" placeholder="Nhập số điện thoại" value="<%=rs.getString(8)%>">
                                            <%} }else{%>
                                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required=""  type="text" name="phone" class="form-control" placeholder="Nhập số điện thoại" value="<%=session.getAttribute("phone")%>">
                                            <% }%>
                                        </div>
                                    </div>
                                    <div class="row mb-3 form-group">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">CMND</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <%if(request.getAttribute("messerror")==null){%>
                                            <%if(rs.getString(13)==null){%>
                                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="text" name="cmt" class="form-control" placeholder="Số CMND rỗng">
                                            <% }else {%>
                                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="text" name="cmt" class="form-control" placeholder="Nhập số CMND" value="<%=rs.getString(13)%>">
                                            <%} }else{%>
                                            <i class='bx bxs-star style' style="color:red;"></i><input maxlength="30" required="" type="text" name="cmt" class="form-control" placeholder="Nhập số CMND" value="<%=session.getAttribute("cmt")%>">
                                            <% }%>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Địa chỉ</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <%if(request.getAttribute("messerror")==null){%>
                                            <%if(rs.getString(12)==null){%>
                                             <input maxlength="30" type="text" name="address" class="form-control" placeholder="Địa chỉ rỗng">
                                            <% }else {%>
                                            <input maxlength="30" type="text" name="address" class="form-control" placeholder="Nhập địa chỉ" value="<%=rs.getString(12)%>">
                                            <%} }else{%> 
                                            <input maxlength="30"  type="text" name="address" class="form-control" placeholder="Nhập địa chỉ" value="<%=session.getAttribute("address")%>">
                                            <% }%>
                                        </div>
                                    </div>
                                    <div class="row mb-3 form-group">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Giới tính</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <%if(request.getAttribute("messerror")==null){%>
                                            <%if (rs.getInt(10) == 0) {%>
                                            <i class='bx bxs-star style' style="color:red;"></i><input type="radio" name="gender" value="0" checked>Nữ    
                                            <input type="radio" name="gender" value="1">Nam
                                            <%} else if(rs.getInt(10) == 1) {%>
                                           <i class='bx bxs-star style' style="color:red;"></i> <input type="radio" name="gender" value="0" >Nữ    
                                            <input type="radio" name="gender" value="1" checked>Nam
                                            <%} else{%>
                                           <i class='bx bxs-star style' style="color:red;"></i><input type="radio" name="gender" value="0">Nữ    
                                            <input type="radio" name="gender" value="1">Nam
                                            <% } }else{%>
                                            <%if (Integer.parseInt(session.getAttribute("gender").toString()) == 0) {%>
                                            <i class='bx bxs-star style' style="color:red;"></i><input type="radio" name="gender" value="0" checked>Nữ    
                                            <input type="radio" name="gender" value="1">Nam
                                            <%} else if(Integer.parseInt(session.getAttribute("gender").toString()) == 1) {%>
                                           <i class='bx bxs-star style' style="color:red;"></i><input type="radio" name="gender" value="0" >Nữ    
                                            <input type="radio" name="gender" value="1" checked>Nam
                                            <%} else{%>
                                           <i class='bx bxs-star style' style="color:red;"></i><input type="radio" name="gender" value="0">Nữ    
                                            <input type="radio" name="gender" value="1">Nam
                                      
                                            <% }}%>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Ngày sinh</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <%if(request.getAttribute("messerror")==null){%>
                                            <input type="date" name="bod" class="form-control" value="<%=rs.getString(11)%>">
                                            <% }else{%>
                                            <input type="date" name="bod" class="form-control" value="<%=session.getAttribute("bod")%>">
                                            <% }%>
                                        </div>
                                    </div>

                                    <h4 id="er" style="color: red;font-size: 15px; position: fixed;"><%=s%></h4>
                                    <br>
                                    <div class="row">
                                        <div class="col-sm-3"></div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="submit" class="btn btn-primary px-4" value="Lưu">
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
