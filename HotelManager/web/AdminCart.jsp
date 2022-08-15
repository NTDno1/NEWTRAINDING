<%-- 
    Document   : editroomdevice
    Created on : Jun 8, 2022, 10:24:44 PM
    Author     : NTD
--%>
<%@page import="context.DBContext"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="entity.Reservation"%>
<%@page import="java.util.Vector"%>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">   
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" 
href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" 
src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" 
src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Đơn đặt phòng</title>
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
    <body id="reportsPage">
        <jsp:include page="headerAdmin.jsp"></jsp:include>
            <h1 style="text-align: center; color: wheat">Quản lí đặt phòng </h1>
            <a style="border-radius: 10px; float: right; margin-bottom: 10px" href="AddCart.jsp" class="btn btn-danger">Thêm mới đặt phòng </a>
            <form action="OrderController" method="get" style="margin-left: 20px" name="myForm" onsubmit="return ValiDate()" >
                <input type="hidden" name="do" value="sortByDate">
                <input type="date" name="date1" id="date1" value="${date1}"> 
                <span style="color: yellow; font-size: 20px"> Đến</span>
                <input type="date" name="date2" id="date2" value="${date2}"> 
                <input type="submit" name="Search" style="color: blue;" value="Tìm kiếm">

            </form>
            <table id="myTable" class="display table" width="90%">  
                <thead>  
                    <tr>  
                        <th style="text-align: center">Tên</th>  
                        <th style="text-align: center">Hình ảnh</th>  
                        <th style="text-align: center">Tên khách hàng</th>  
                        <th style="text-align: center">Email</th>  
                        <th style="text-align: center">Địa chỉ</th>  
                        <th style="text-align: center">Số điện thoại</th>  
                        <th style="text-align: center">Số người đến</th>  
                        <th style="text-align: center">Ngày đến </th>  
                        <th style="text-align: center">Ngày đi</th>  
                        <th style="text-align: center">Tổng giá</th>  
                        <th style="text-align: center">Trạng thái</th>  
                        <th style="text-align: center">Ngày đặt hóa đơn</th>  
                        <th style="text-align: center">Cập nhật</th>  
                        <th style="text-align: center">Xóa</th>  
                    </tr>  
                </thead>  

                <tbody>  
                <%
                    Vector<Reservation> rs1 = (Vector<Reservation>) request.getAttribute("rs");
                    for (Reservation rs : rs1) {
                %>
                <tr style="background-color: 435C70" >  
                    <td style="background-color: 435C70 ;"><span class="badge badge-primary badge-pill"><%=rs.getRoomname()%></span></td>  
                    <td style="background-color: 435C70 ; " ><img style="width: 150px; height: 100px" src="images/anhphong/<%=rs.getImg()%>" class="img-thumbnail"></td>  
                    <td style="background-color: 435C70 ; padding-left: 20px;"><span class="d-inline-block text-truncate" style="max-width: 300px;"><%=rs.getName()%> </span></td>  
                    <td style="background-color: 435C70 ; font-style: inherit;text-align: center"><%=rs.getEmail()%></td>  
                    <td style="background-color: 435C70 ; text-align: center"><%=rs.getAddress()%></td> 
                    <td style="background-color: 435C70 ;text-align: center"><%=rs.getPhone()%></td>  
                    <td style="background-color: 435C70 ; text-align: center"><%=rs.getNumberOfPerson()%></td>  
                    <td style="background-color: 435C70 ; text-align: center"><%=rs.getCheckin()%></td>  
                    <td style="background-color: 435C70 ; text-align: center"><%=rs.getCheckout()%></td>  
                    <td style="background-color: 435C70 ; text-align: center"><fmt:formatNumber value="<%=rs.getTotal()%>" /> đ</td>  
                    <%if (rs.getStatus() == 0) {%>
                    <td style="background-color: 435C70 ; text-align: center">Đang xử lí</td>  
                    <%} else if (rs.getStatus() == 1) {%>
                    <td style="background-color: 435C70 ; text-align: center">Hoàn thành</td>  
                    <%}%>
                     <%if (rs.getStatus() == 3) {%>
                    <td style="background-color: 435C70 ; text-align: center">Đã hủy</td>  
                    <%}%>
                    <td style="background-color: 435C70 ; text-align: center"><%=rs.getDate()%></td> 
                    <td style="background-color: 435C70 " ><a style="border-radius: 10px;" href="OrderController?do=ShowUpdateCartAdmin&id=<%=rs.getBillID()%>" class="btn btn-info" role="button">Cập nhật hoá đơn</a></td>  
                    <td style="background-color: 435C70">
                        <a style="margin-left: 20px" href="OrderController?do=delete&id=<%=rs.getBillID()%>" onclick="Delete()" class="tm-product-delete-link">
                            <i class="far fa-trash-alt tm-product-delete-icon">
                            </i></a></td>  
                </tr>  

                <%}%>
            </tbody>  
        </table> 
        <% DBContext db = new DBContext();

            ResultSet rs3 = db.getData("select SUM(Total) from Reservation ");
            int a = 0;
            if (rs3.next()) {
                a += rs3.getDouble(1);
            }
            if (request.getAttribute("date1") != null && request.getAttribute("date2") != null) {
                String x = (String) request.getAttribute("date1");
                String y = (String) request.getAttribute("date2");
                rs3 = db.getData("select SUM(Total) from Reservation where Checkout <='" + y+ "'and Checkin >='" + x + "'");
                if (rs3.next()) {
                    a=0;
                a += rs3.getDouble(1);
            }
            }
        %>
        <p style="text-align: right; font-size: 30px;color: red">Tổng giá: <fmt:formatNumber value="<%=a%>" />  đ</p>
        <div class="row mt-5">
            <div class="col-md-12 text-center">
                <div class="site-block-27">
                    <ul>
                        <%if (request.getAttribute("n") != null) { %>
                        <c:forEach begin="1" end="${n}" var="c">
                            <li><a href="OrderController?do=showCartAdmin&page=${c}">${c}</a></li>
                            </c:forEach>
                            <%}%>
                    </ul>
                </div>
            </div>
        </div>

        <footer class="tm-footer row tm-mt-small">
            <div class="col-12 font-weight-light">
            </div>
        </footer>
        <script>
            function Delete() {
                alert("Đã hủy đơn đặt phòng!");
            }
            function ValiDate() {
                let checkin = document.forms["myForm"]["date1"].value;
                let checkout = document.forms["myForm"]["date2"].value;
                if (!(checkout >= checkin)) {
                    alert('Ngày check out phải lớn hơn Checkin');
                    document.myForm.date1.focus();
                    return false;
                }
            }
        </script>
    </body>
</html>

