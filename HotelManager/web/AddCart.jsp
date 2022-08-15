<%@page import="context.DBContext"%>
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
        <title>Thêm Đặt Phòng</title>
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
    </head>
    <style>
        .select-css {
            display: block;
            font-size: 16px;
            font-family: sans-serif;
            font-weight: 700;
            color: #444;
            line-height: 1.3;
            padding: .6em 1.4em .5em .8em;
            width: 100%;
            max-width: 100%; 
            box-sizing: border-box;
            margin: 0;
            border: 1px solid #aaa;
            box-shadow: 0 1px 0 1px rgba(0,0,0,.04);
            border-radius: .5em;
            -moz-appearance: none;
            -webkit-appearance: none;
            appearance: none;
            background-color: #fff;
            background-image: url('data:image/svg+xml;charset=US-ASCII,%3Csvg%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20width%3D%22292.4%22%20height%3D%22292.4%22%3E%3Cpath%20fill%3D%22%23007CB2%22%20d%3D%22M287%2069.4a17.6%2017.6%200%200%200-13-5.4H18.4c-5%200-9.3%201.8-12.9%205.4A17.6%2017.6%200%200%200%200%2082.2c0%205%201.8%209.3%205.4%2012.9l128%20127.9c3.6%203.6%207.8%205.4%2012.8%205.4s9.2-1.8%2012.8-5.4L287%2095c3.5-3.5%205.4-7.8%205.4-12.8%200-5-1.9-9.2-5.5-12.8z%22%2F%3E%3C%2Fsvg%3E'),
                linear-gradient(to bottom, #ffffff 0%,#e5e5e5 100%);
            background-repeat: no-repeat, repeat;
            background-position: right .7em top 50%, 0 0;
            background-size: .65em auto, 100%;
        }
        .select-css::-ms-expand {
            display: none;
        }
        .select-css:hover {
            border-color: #888;
        }
        .select-css:focus {
            border-color: #aaa;
            box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
            box-shadow: 0 0 0 3px -moz-mac-focusring;
            color: #222; 
            outline: none;
        }
        .select-css option {
            font-weight:normal;
        }
    </style>
    <script>
        function Reload() {
            let checkin = document.forms["myForm"]["cin"].value;
            let checkout = document.forms["myForm"]["cout"].value;
            if (!(checkout >= checkin)) {
                alert('Ngày check out phải lớn hơn Checkin');
                document.myForm.cin.focus();
                return false;
            } else {
                alert('Thêm thành công!');
            }
        }
    </script>
    <body>
        <%
            DBContext db = new DBContext();
            ResultSet rs = db.getData("select * from Room");
            ResultSet rs1 = db.getData("select * from [User]");
            ResultSet rs2 = db.getData("select * from [User] where UserID=1");
            String a = "1";
            String b = "1";
            String c = "null";
            if (request.getAttribute("name") != null) {
                System.out.println("ok");
                a = (String) request.getAttribute("name");
                rs2 = db.getData("select * from [User] where UserID=" + a);
            }
            if (request.getAttribute("name") != null) {
                b = (String) request.getAttribute("cid");
            }
            if (request.getAttribute("total") != null) {
                String d = (String) request.getAttribute("total");
                c = c + d;
            }
        %>
        <%@include file="headerAdmin.jsp" %>
        <h1 style="text-align: center; color: wheat; padding-top: 10px">Thêm đặt phòng </h1>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-6 col-lg-6 col-md-12">
                                <form action="OrderController" method="get" class="tm-edit-product-form" name="myForm" onsubmit="return Reload()">
                                    <input type="hidden" name="do" value="del">
                                    <div class="form-group mb-3">
                                        <label for="name">Tên khách hàng </label>
                                        <select style="text-align: center"
                                                class="custom-select tm-select-accounts"
                                                id="cus" 
                                                name="cus"
                                                onchange="this.form.submit()"
                                                >
                                            <%
                                                while (rs1.next()) {
                                            %>
                                            <option value="<%=rs1.getInt(1)%>" <%=rs1.getInt(1) == Integer.parseInt(a) ? "selected" : ""%>><%=rs1.getString(3)%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Email </label>
                                        <% if (rs2.next()) {
                                        %>
                                        <input name="email" style="background-color: #435c70;" value="<%=rs2.getString(5)%>" type="text"class="form-control validate"  readonly/>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Địa chỉ </label>
                                        <input name="address" style="background-color: #435c70;" value="<%=rs2.getString(8)%>"  type="text"class="form-control validate" readonly/>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Số điện thoại </label>
                                        <input name="phone"  style="background-color: #435c70;" value="<%=rs2.getString(4)%>" type="text"class="form-control validate"  readonly/>
                                    </div>
                                    <%}%>
                                    <div class="form-group mb-3">
                                        <label for="name">Tên phòng </label>
                                        <select style="text-align: center"
                                                class="custom-select tm-select-accounts"
                                                id="cid" 
                                                name="rname" >
                                            <% while (rs.next()) {%>
                                            <option value="<%=rs.getInt(1)%>"  <%=rs.getInt(1) == Integer.parseInt(b) ? "selected" : ""%>><%=rs.getString(2)%></option>

                                            <%}%>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Số người đến </label>
                                        <input name="number" id="number" type="number" min="1" max="12" class="form-control validate"required />
                                    </div>
                                    <%long millis = System.currentTimeMillis();
                                             java.sql.Date date = new java.sql.Date(millis);%>
                                    <div class="form-group mb-3" >
                                        <label for="name">Ngày đi </label>
                                        <input name="cin" min="<%=date%>"  type="date"class="form-control validate"required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Ngày đến </label>
                                        <input name="cout" min="<%=date%>" type="date"class="form-control validate"required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name">Tổng giá </label>
                                        <input name="total" id="total" type="number" min="100" max="1000000" class="form-control validate"required />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label for="name" style="padding-right: 10px">Trạng thái </label>
                                        <select name="status" style="font-size: 18px;  " class="custom-select tm-select-accounts">
                                            <option value="0">Đang xử lí</option>
                                            <option value="1">Hoàn thành</option>
                                        </select>
                                    </div>
                            </div>
                            <div class="col-12">
                                <button type="submit"  class="btn btn-primary btn-block text-uppercase">Thêm đặt phòng</button>
                            </div>
                            </form>
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
    </body>
</html>