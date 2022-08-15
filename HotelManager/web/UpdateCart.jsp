<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">   
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" 
href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" 
src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" 
src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Cập nhật hóa đơn</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <!-- http://api.jqueryui.com/datepicker/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
        <script type="text/javascript">
            function Delete() {
                let checkin = document.forms["myForm"]["cin"].value;
                let checkout = document.forms["myForm"]["cout"].value;
                let e = document.forms["myForm"]["email"].value;
                let p = document.forms["myForm"]["phone"].value;
                let a = document.forms["myForm"]["cname"].value;
                let b = document.forms["myForm"]["address"].value;
                var regexEmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
                var regexPhone = /0[0-9]{9,10}/;
                if (!(checkout >= checkin)) {
                    alert('Ngày check out phải lớn hơn Checkin');
                    document.myForm.cin.focus();
                    return false;
                }
                if (a.trim() == "" || b.trim() == "") {
                    alert('Vui lòng điền vào chỗ trống');
                    return false;
                }if (!regexEmail.test(e)) {
                    alert('Địa chỉ Email không hợp lệ');
                    document.myForm.email.focus();
                    return false;
                }else {
                    alert("Cập nhật thành công!");
                }
            }
        </script>
    </head>

    <body>
        <%@include file="headerAdmin.jsp" %>
        <h1 style="text-align: center; color: wheat; padding-top: 10px">Thông tin hóa đơn </h1>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-6 col-lg-6 col-md-12">
                                <% ResultSet rs = (ResultSet) request.getAttribute("rs");
                                    if (rs.next()) {
                                        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                                        Date date1 = (Date) format.parse(rs.getString(8));
                                        Date date2 = (Date) format.parse(rs.getString(9));
                                        Date date3 = (Date) format.parse(rs.getString(12));
                                        java.sql.Date cDate = new java.sql.Date(date1.getTime());
                                        java.sql.Date sDate = new java.sql.Date(date2.getTime());
                                        java.sql.Date dDate = new java.sql.Date(date3.getTime());
                                %>
                                <form action="OrderController" method="get" name="myForm" onsubmit="return Delete()" >
                                    <input type="hidden" name="do" value="UpdateCartAdmin">
                                    <input type="hidden" name="cid" value="<%=rs.getInt(15)%>">
                                    <input type="hidden" name="ID" value="<%=rs.getString(13)%>">
                                    <input type="hidden" name="BID" value="<%=rs.getInt(14)%>">
                                    <div class="form-group mb-3">
                                        <label for="name">Số phòng </label>
                                        <input name="rname" value="<%=rs.getString(1)%>" style="background-color: #435c70;"type="number" min="1" max="30"  class="form-control validate" readonly />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name" style="padding-right: 10px">Hình ảnh </label>
                                        <img style="width: 150px; height: 100px" src="images/anhphong/<%=rs.getString(2)%>" class="img-thumbnail">
                                    </div>

                                    <div class="form-group mb-3">
                                        <label for="name">Tên khách hàng </label>
                                        <input name="cname" value="<%=rs.getString(3)%>"type="text"class="form-control validate" style="background-color: #435c70;" required maxlength="50" readonly/>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label for="name">Email </label>
                                        <input name="email" value="<%=rs.getString(4)%>"type="text"class="form-control validate" style="background-color: #435c70;" required maxlength="50" readonly />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Địa chỉ </label>
                                        <input name="address" value="<%=rs.getString(5)%>"type="text" maxlength="70" style="background-color: #435c70;" class="form-control validate"required  maxlength="50" readonly/>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Số điện thoại </label>
                                        <input name="phone" value="<%=rs.getString(6)%>"type="text" style="background-color: #435c70;" class="form-control validate"readonly />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Số người đến </label>
                                        <input name="number" value="<%=rs.getInt(7)%>"type="number" max="12" style="background-color: #435c70;" class="form-control validate"readonly />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Ngày đến </label>
                                        <input name="cin" value="<%=cDate%>" type="date" style="background-color: #435c70;" class="form-control validate"readonly />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Ngày đi </label>
                                        <input name="cout" value="<%=sDate%>" type="date" style="background-color: #435c70;" class="form-control validate"readonly />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Tổng giá </label>
                                        <input name="total" value="<%=rs.getString(10)%>" style="background-color: #435c70;" type="number" min="100" max="5000000" class="form-control validate"readonly />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name" style="padding-right: 10px">Trạng thái </label>
                                        <select name="status" style="font-size: 18px; " class="custom-select tm-select-accounts">
                                            <option value="0" <%=rs.getInt(11) == 0 ? "selected" : ""%>>Đang xử lí</option>
                                            <option value="1" <%=rs.getInt(11) == 1 ? "selected" : ""%>>Hoàn thành</option>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="date">Ngày đặt hóa đơn </label>
                                        <input name="date" value="<%=dDate%>"type="date" class="form-control validate"required />
                                    </div>

                            </div>
                            <div class="col-12">
                                <!--                            <input type="hidden" value="updatebloggg" name="do">
                                                            <input type="hidden" value="" name="BlogID">-->
                                <button type="submit" class="btn btn-primary btn-block text-uppercase">Cập nhật</button>
                            </div>
                            </form>
                            <%}%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
        <!-- https://jqueryui.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script>
                                    $(function () {
                                        $("#expire_date").datepicker();
                                    });
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    </body>
</html>
