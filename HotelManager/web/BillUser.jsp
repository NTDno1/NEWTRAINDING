<%-- 
    Document   : BillHotel
    Created on : Jun 11, 2022, 12:05:17 AM
    Author     : Trong Hieu
--%>

<%@page import="context.DBContext"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Service"%>
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

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/css/select2.css" />
        <title>Thông tin đăng nhập</title>
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
                    <form name="myForm"  action="OrderController" method="post" id="form" onsubmit="return Validate()">
                        <input type="hidden" name="do" value="infor"> 
                        <% int id = (Integer) request.getAttribute("id");%>
                        <input type="hidden" name="id" value="<%=id%>">
                        <input type="hidden" name="user" value="${sessionScope.login.getAccountID()}"> 
                        <div class="row">
                            <div class="col-50">
                                <h3 style="padding-bottom: 30px">Đơn đặt phòng</h3>
                                <% ResultSet rs1 = (ResultSet) request.getAttribute("rs1");
                                    if (rs1.next()) {
                                %>
                                <label for="fname" style=""><i class="fa fa-user"></i> Tên đầy đủ</label>
                                <input type="hidden" name="firstname" placeholder="<%=rs1.getString(7)%>" value="<%=rs1.getString(7)%>" readonly>
                                <p style="font-weight: bold;"><%=rs1.getString(7)%></p>
                                <label for="email"><i class="fa fa-envelope"></i> Email</label>
                                <p style="font-weight: bold;"><%=rs1.getString(9)%></p>
                                <input type="hidden" id="email" name="email" placeholder="<%=rs1.getString(9)%>" value="<%=rs1.getString(9)%>" readonly>
                                <label for="address"><i class="fa fa-address-card-o"></i> Địa chỉ</label>
                                <p style="font-weight: bold;"><%=rs1.getString(12)%></p>
                                <input type="hidden" id="adr" name="address" placeholder="<%=rs1.getString(12)%>" value="<%=rs1.getString(12)%>" readonly>
                                <label for="city"><i class="fa fa-institution"></i> Số điện thoại</label>
                                <p style="font-weight: bold;"><%=rs1.getString(8)%></p>
                                <input type="hidden" id="city" name="phone" placeholder="<%=rs1.getString(8)%>"  value="<%=rs1.getString(8)%>" readonly>
                                <%}%>
                                <div class="row">
                                    <div class="col-50">
                                        <label style="display: inline-block; padding-top: 30px;font-size: 20px;" for="state">Người lớn</label>
                                        <select style="font-size: 20px;width: 180px;" name="Adult" selected id="Adult">
                                            <option value="1" selected> 1 </option>
                                            <option value="2"> 2 </option>
                                            <option value="3"> 3 </option>
                                            <option value="4"> 4 </option>
                                            <option value="5"> 5 </option>
                                            <option value="6"> 6 </option>
                                            <option value="7"> 7 </option>
                                            <option value="8"> 8 </option>
                                        </select>
                                    </div>
                                    <div class="col-50">
                                        <label style="display: inline-block; padding-top: 30px;font-size: 20px;margin-left: 0px;" for="state">Trẻ nhỏ</label>
                                        <select style="font-size: 20px;width: 180px;"  name="Child" id="Child" selected>
                                            <option value="1"> 1 </option>
                                            <option value="2"> 2 </option>
                                            <option value="3"> 3 </option>
                                            <option value="4"> 4 </option>
                                            <option value="5"> 5</option>
                                        </select>
                                    </div>
                                    <% ResultSet rs2 = (ResultSet) request.getAttribute("rs2"); %>
                                    <div class="col-50">
                                        <label style="display: inline-block; padding-top: 30px;padding-right: 12px;font-size: 20px;" for="state">Giảm giá:</label>
                                        <select style="font-size: 18px;" name="event" selected>
                                            <option value="0">Selected</option>
                                            <% while (rs2.next()) {%>
                                            <option value="<%=rs2.getInt(9)%>"><%=rs2.getString(2)%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <div id="mess"></div>
                                </div>
                            </div>

                            <div class="col-50">
                                <h3>Thanh toán</h3>
                                <h4>Chấp nhận thanh toán bằng thẻ</h4>
                                <div class="icon-container">
                                    <i class="fa fa-cc-visa" style="color:navy;"></i>
                                    <i class="fa fa-cc-amex" style="color:blue;"></i>
                                    <i class="fa fa-cc-mastercard" style="color:red;"></i>
                                    <i class="fa fa-cc-discover" style="color:orange;"></i>
                                </div>
                                <label for="cname">Dịch vụ</label>
                                <% Vector<Service> vector = (Vector<Service>) request.getAttribute("vector");
                                    long millis = System.currentTimeMillis();
                                    java.sql.Date date = new java.sql.Date(millis);

                                    String da = "";
                                    da += date.toString();
                                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                                    Calendar c = Calendar.getInstance();
                                    c.setTime(sdf.parse(da));
                                    c.add(Calendar.DATE, 1);  // number of days to add
                                    da = sdf.format(c.getTime());  // dt is now the new date

                                    for (Service e : vector) {
                                %>
                                <input  type="checkbox" name="service" value="<%=e.getServiceID()%>">
                                <label style="display:inline-block;"for="vehicle1"><%=e.getServiceName()%> </label><br>
                                <%}%>
                                <label style="padding-top: 30px;">Ngày đến</label>
                                <input name="checkin" type="date" class="form-control" id="inputCheckIn" style="font-size: 20px" min="<%=date%>" required>
                                <label for="expmonth" style="padding-top: 10px">Ngày đi</label>
                                <input name="checkout" type="date" class="form-control" id="inputCheckOut" style="font-size: 20px" min="<%=date%>" required>

                            </div>

                        </div>
                </div>
            </div>
            <div style="padding-top:0px;"class="col-25">
                <% ResultSet rs = (ResultSet) request.getAttribute("rs");
                    if (rs.next()) {
                %>
                <div style="padding-bottom: 50px;height:  400px;"  class="container1">
                    <div>
                        <h4 style="margin-top: 5px; font-size: 30px;; font-weight: bold; color: red"> Hoang Hon </h4>                       
                    </div>
                    <div>
                        <p style="font-size: 20px; font-weight: bold"><%=rs.getString(19)%>- <%=rs.getInt(2)%> </p>
                        <p style="color: #0b9af4; font-size: 20px">Thanh toán khi nhận phòng</p>
                        <p>Số người<span style="padding-left: 100px; font-weight: bold;" ><%=rs.getInt(7)%> </span> </p>
                        <input type="hidden" id="person" value="<%=rs.getInt(7)%>">
                        <p>Kiểu phòng<span style="padding-left: 85px;font-weight: bold;"><%=rs.getString(19)%></span> </p>
                    </div>
                    <div class="row">
                        <div class="col-md-5">
                            <img style="width: 100px;height: 80px; margin-left: 20px;"src="images/anhphong/<%=rs.getString(14)%>" alt="">
                            <input type="hidden" name="imga" value="<%=rs.getString(14)%>">
                        </div>
                        <div class="col-md-7">
                            <i style="padding-left: 65px;color: green"class='fas fa-utensils'> Miễn phí wifi </i>
                        </div>
                    </div>
                    <hr>
                    <p style="color: green;">Miễn phí huỷ phòng đến trước <%=da%> </p>

                </div>
                <div style="margin-top:0px;"class="container">
                    <h4>Phòng <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i></span></h4>
                    <p><a href="RoomController?do=roomdetail&roomid=<%=id%>"><%=rs.getString(19)%>- <%=rs.getInt(2)%></a> <span class="price" style="color:black;font-weight: bold" ><fmt:formatNumber value="<%=rs.getInt(6)%>"/>,000đ/ 1 đêm</span></p>
                    <input type="hidden" name="price" value="<%=rs.getInt(6)%>000">
                    <hr>
                    <p>Tổng giá <span class="price" style="color:black"><fmt:formatNumber value="<%=rs.getInt(6)%>"/>,000</h1></p>
                </div>
            </div>
            <input style="margin-top: 38px;height: 50px;" type="submit" value="Tiếp tục để xác nhận" class="btn" >
            </form>
        </div>
        <%}%>

    </body>
</html>
<script>
    function Validate() {
        let e = document.forms["myForm"]["email"].value;
        let p = document.forms["myForm"]["phone"].value;
        let checkin = document.forms["myForm"]["checkin"].value;
        let checkout = document.forms["myForm"]["checkout"].value;
        let number = document.forms["myForm"]["checkout"].value;
        var person=document.getElementById("person").value;
        var Adult=document.getElementById("Adult").value;
        var regexPhone = /0[0-9]{9,10}/;
        var regexEmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
        var today = new Date();
        var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
        if (!(checkout > checkin)) {
            alert('Ngày check out phải lớn hơn Checkin');
            document.myForm.checkin.focus();
            return false;
        }if (Adult > person) {
                alert("Quá số người qui định");
                document.myForm.Adult.focus();
                return false;
        }else {
            return true;
        }
    }
    function Service() {
        let service = document.forms["myForm"]["service"];

    }
//        var mess=document.getElementById("mess");
//        var form=document.getElementById("form");
//        var mail =document.getElementById("email").value;
//        var regexEmail = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
//       form.addEventListener('submit',(e) => {
//           let message=[];
//            if(regexEmail.test(mail)){
//            message.push('Your Email Address is Valid.');
//        }if(!regexEmail.test(mail)){
//            message.push('Your Email Address is not Valid.');
//            alert(message);
//            document.form.mail.focus();
//        }if(message.length>0){
//            e.preventDefault();
//            mess.= message.join(', ');
//        }
//    });


</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.js"></script>
<script type="text/javascript">
    function custom_template(obj) {
        var data = $(obj.element).data();
        var text = $(obj.element).text();
        if (data && data['img_src']) {
            img_src = data['img_src'];
            template = $("<div><img src=\"" + img_src + "\" style=\"width:100%;height:150px;\"/><p style=\"font-weight: 700;font-size:14pt;text-align:center;\">" + text + "</p></div>");
            return template;
        }
    }
    var options = {
        'templateSelection': custom_template,
        'templateResult': custom_template,
    }
    $('#id_select2_example').select2(options);
    $('.select2-container--default .select2-selection--single').css({'height': '220px'});

</script>