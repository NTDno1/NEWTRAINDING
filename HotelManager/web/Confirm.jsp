<%-- 
    Document   : BillHotel
    Created on : Jun 11, 2022, 12:05:17 AM
    Author     : Trong Hieu
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="entity.Reservation"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/hotelbill.css">
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Thông tin đặt phòng</title>
        <style>
            body {
                font-family: Arial;
                font-size: 17px;
                padding: 8px;
                /*                    background-color: #f2f3f3;*/
            }

            * {
                box-sizing: border-box;
            }

            .row {
                display: -ms-flexbox; /* IE10 */
                display: flex;
                -ms-flex-wrap: wrap; /* IE10 */
                flex-wrap: wrap;
                margin: 0 -16px;
            }

            .col-25 {
                -ms-flex: 25%; /* IE10 */
                flex: 25%;
            }

            .col-50 {
                -ms-flex: 50%; /* IE10 */
                flex: 50%;
            }

            .col-75 {
                -ms-flex: 75%; /* IE10 */
                flex: 75%;
            }

            .col-25,
            .col-50,
            .col-75 {
                padding: 0 16px;
            }

            .container {
                background-color: #f2f2f2;
                padding: 5px 20px 15px 20px;
                border: 1px solid lightgrey;
                border-radius: 3px;
            }

            input[type=text] {
                width: 100%;
                margin-bottom: 20px;
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }

            label {
                margin-bottom: 10px;
                display: block;
            }

            .icon-container {
                margin-bottom: 20px;
                padding: 7px 0;
                font-size: 24px;
            }

            .btn {
                background-color: #04AA6D;
                color: white;
                padding: 12px;
                margin: 10px 0;
                border: none;
                width: 100%;
                border-radius: 3px;
                cursor: pointer;
                font-size: 17px;
            }

            .btn:hover {
                background-color: #45a049;
            }

            a {
                color: #2196F3;
            }

            hr {
                border: 1px solid lightgrey;
            }

            span.price {
                float: right;
                color: grey;
            }

            /* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
            @media (max-width: 800px) {
                .row {
                    flex-direction: column-reverse;
                }
                .col-25 {
                    margin-bottom: 20px;
                }
            }
        </style>
    </head>
    <body>
        <h2>Đặt phòng khách sạn</h2>
        <p>Điền thông tin người liên lạc và khách bên dưới</p>
        <div class="row">
            <div class="col-75">
                <div class="container">
                    <form action="OrderController" method="post" name="myForm" onsubmit="return ok()" >
                        <input type="hidden" name="do" value="Bill">
                        <input type="hidden" name="id" value="${id}">
                        <input type="hidden" name="total" value="${total}">
                        <div class="row">
                            <div class="col-50">
                                <% Vector<Reservation> vector = (Vector<Reservation>) request.getAttribute("vector");
                                    long millis = System.currentTimeMillis();
                                    java.sql.Date date = new java.sql.Date(millis);

                                    String da = "";
                                    da += date.toString();
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                    Calendar c = Calendar.getInstance();
                                    c.setTime(sdf.parse(da));
                                    c.add(Calendar.DATE, 1);  // number of days to add
                                    da = sdf.format(c.getTime());  // dt is now the new date
                                    for (Reservation r : vector) {
                                %>
                                <h3>Đơn đặt phòng</h3>
                                <label for="firstname"><i class="fa fa-user"></i> Tên đầy đủ</label>
                                <p style="font-weight: bold; color: black"><%=r.getName()%></p>
                                <label for="email"><i class="fa fa-envelope"></i> Email</label>
                                <p style="font-weight: bold; color: black"><%=r.getEmail()%></p>
                                <label for="adr"><i class="fa fa-address-card-o"></i> Địa chỉ </label>
                                <p style="font-weight: bold; color: black"><%=r.getAddress()%></p>
                                <label for="city"><i class="fa fa-institution"></i> Số điện thoại</label>
                                <p style="font-weight: bold; color: black"><%=r.getPhone()%></p>

                                <input type="hidden" name="firstname" value="<%=r.getName()%>">
                                <input type="hidden" name="email" value="<%=r.getEmail()%>">
                                <input type="hidden" name="address" value="<%=r.getAddress()%>">
                                <input type="hidden" name="phone" value="<%=r.getPhone()%>">
                                <input type="hidden" name="phone" value="<%=r.getPhone()%>">
                                <input type="hidden" name="checkin" value="<%=r.getCheckin()%>">
                                <input type="hidden" name="checkout" value="<%=r.getCheckout()%>">
                                <input type="hidden" name="number" value="<%=r.getNumberOfPerson()%>">

                                <div class="row">
                                    <div class="col-100">
                                        <label style="display: inline-block; padding-top: 20px; padding-left: 15px;font-size: 20px;" for="state">Số người</label>
                                        <p style="padding-left: 20px;font-weight: bold; color: black"><%=r.getNumberOfPerson()%></p>
                                    </div>
                                </div>
                            </div>

                            <div class="col-50">
                                <h3>Thanh toán</h3>
                                <div class="icon-container">
                                    <i class="fa fa-cc-visa" style="color:navy;"></i>
                                    <i class="fa fa-cc-amex" style="color:blue;"></i>
                                    <i class="fa fa-cc-mastercard" style="color:red;"></i>
                                    <i class="fa fa-cc-discover" style="color:orange;"></i>
                                </div>
                                <label for="cname">Dịch vụ</label>
                                <label style="display:inline-block;"for="vehicle1"></label><br>
                                <% if(request.getAttribute("ser")!=null){%>
                                <% String a= (String)request.getAttribute("ser"); 
                                %>
                                <p style="font-weight: bold; color: black"><%=a%></p>
                                <%}%>
                                <label style="padding-top: 30px;"for="ccnum">Ngày đến</label>
                                <p style="font-weight: bold; color: black"><%=r.getCheckin()%></p>
                                <label for="expmonth" style="padding-top: 10px">Ngày đi</label>
                                <p style="font-weight: bold; color: black"><%=r.getCheckout()%></p>
                            </div>

                        </div>
                        <label>
                            <input type="checkbox" name="sameadr" id="oke" > Bạn xác nhận thông tin
                        </label>

                </div>
            </div>
            <div class="col-25">
                <div style="padding-bottom: 70px;height:  400px;"  class="container1">
                    <div>
                        <h4 style="margin-top: 5px; font-size: 30px;; font-weight: bold; color: red"> Hoang Hon </h4>                       
                    </div>
                    <div style="background-color: #f7f9fa; height: 100px;padding-top: 5px;" class="nhanphong">
                        <p style="margin-left: 20px;"> Ngày nhận phòng: <%=r.getCheckin()%>, Từ 11:00 <p>                         
                        <p style="margin-left: 20px;"> Ngày trả phòng:  <%=r.getCheckout()%>, Trước 13:00</p>            
                    </div>
                    <div>
                        <p style="font-size: 20px; font-weight: bold"> </p>
                        <p style="color: #0b9af4; font-size: 20px;font-weight: bold">Thanh toán khi nhận phòng</p>
                    </div>
                    <div >
                        <img style="width: 200px;height: 110px; margin-left: 20px;"src="images/anhphong/${img}" alt="">
                    </div>
                    <hr>
                    <p style="color: green;">Miễn phí huỷ phòng đến trước <%=da%> </p>

                </div>
                    <div style="padding-top: 20px">
                    <div class="container">
                        <hr>
                        <p style="font-weight: bold; color: red">Tổng giá <span class="price" style="color:black"><p style="font-weight: bold; color: black;font-size: 30px"><fmt:formatNumber value="${total}"/>đ</p></span></p>
                    </div>
                </div>
            </div>
        </div>
        <input type="submit" value="Hoàn tất" class="btn">
    </form>
    <%}%>
</body>
</html>
<script>
    function ok() {
        if (!document.getElementById("oke").checked) {
            alert("Bạn chưa điền đầy đủ");
            document.myForm.oke.focus();
            return false;
        } else {
            alert("Bạn đã đặt chỗ thành công");
        }
    }
</script>

