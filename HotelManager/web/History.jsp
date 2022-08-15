
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="context.DBContext"%>
<%@page import="entity.Reservation"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Vector"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Lịch sử đặt phòng</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

        <!-- Fonts -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz:400,700' rel='stylesheet' type='text/css'>

        <!-- Css -->


        <link rel="stylesheet" href="css/bootstrap.min.css">

        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">

        <!-- jS -->
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/jquery.nivo.slider.js" type="text/javascript"></script>
        <script src="js/owl.carousel.min.js" type="text/javascript"></script>
        <script src="js/jquery.nicescroll.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/main.js" type="text/javascript"></script>
        <style>
            .hd button{
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
            }
            .body{
                padding-top: 300px;
                width:50%;
            }
            .hh{
                position: fixed;
                top:10px;
                left: 120px;
                color: white;
            }
        </style>    
    </head>

    <body style="padding-top: 100px; height: 200px;">
        <h2 class="mb-0 site-logo hh"><a href="HomeController">Hoang Hon</a></h2>
        <section id="topic-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-6" style="margin-bottom: 100px">
                        <h1 style="color: orangered">Lịch sử đặt phòng</h1>
                    </div>
                </div>
            </div>
        </section>
        <div class="hd">
            <div style="padding-left: 180px; padding-bottom:100px;margin-right: 150px; margin-bottom: 100px">
                <table class="table table-striped table-hover table-bordered" >
                    <thead class="cart-table-head" style="background-color:gray;">
                        <tr class="table-head-row">
                            <th class="supplier-id" style="padding-right: 30px; padding-left: 30px; color: white;font-weight: bold; ">Phòng</th>
                            <th class="supplier-id" style="padding-right: 30px; padding-left: 30px; color: white;font-weight: bold; ">Hình ảnh</th>
                            <th class="supplier-id" style="padding-right: 30px; padding-left: 30px; color: white;font-weight: bold; ">Từ ngày</th>
                            <th class="category-id" style="padding-right: 30px; padding-left: 30px; color: white;font-weight: bold; ">Đến ngày</th>
                            <th class="product-name" style="padding-right: 60px; padding-left: 60px; color: white;font-weight: bold; ">Tổng tiền</th>
                            <th class="product-year" style="padding-right: 30px; padding-left: 30px; color: white;font-weight: bold; ">Trạng thái</th>
                            <th class="product-year" style="padding-right: 30px; padding-left: 30px; color: white;font-weight: bold; ">Phản hồi</th>
                            <th class="product-year" style="padding-right: 30px; padding-left: 30px; color: white;font-weight: bold; ">Hủy đặt</th>
                        </tr>
                    </thead> 
                    <tbody>
                        <% Vector<Reservation> vector = (Vector<Reservation>) request.getAttribute("vector");
                            DBContext db = new DBContext();
                            ResultSet rs = db.getData("select * from  Room r join Reservation j  on r.RoomID= j.RoomID join CateRoom c on c.RoomcateID=r.RoomcateID ");
                            String a = "";
                            String b = "";
                            int aid = Integer.parseInt(request.getAttribute("aid").toString());
                            if (rs.next()) {
                                a += rs.getInt(2);
                                b += rs.getString(27);
                            }
                            for (Reservation pro : vector) {
                                boolean check = false;
                                Cookie c[] = request.getCookies();
                                for (Cookie o : c) {
                                    if (o.getName().equals(String.valueOf(pro.getUserID()))) {
                                        check = true;
                                    }
                                }

                                ResultSet rs1 = db.getData("select COUNT(*) from Message m join Account a on m.AccountID=a.AccountID where m.RoomID=" + pro.getRoomID() + " and m.AccountID=" + aid);
                        %>
                        <tr class="table-body-row"> 
                            <th class="supplier-id" style="padding-left: 50px;padding-right: 30px;" name=""><%=pro.getRoomID()%> </th>
                            <th class="supplier-id" style="padding-left: 30px;padding-right: 30px;"><a href="RoomController?do=roomdetails&roomid=<%=pro.getRoomID()%>&cateroom=<%=pro.getAddress()%>"><img style="width: 200px; height: 120px" src="images/anhphong/<%=pro.getEmail()%>" class="img-thumbnail"></a></th>
                            <th class="supplier-id" style="padding-left: 50px;padding-right: 30px;" name=""><%=pro.getCheckin()%> </th>
                            <th class="category-id" style="padding-left: 50px;padding-right: 30px;" name=""><%=pro.getCheckout()%></th>
                            <th class="product-name" style="padding-left: 50px;padding-right: 30px;" name=""><fmt:formatNumber value="<%=pro.getTotal()%>" /> đ</th>
                                <% if (pro.getStatus() == 1) {%>
                            <th class="product-year" style="padding-left: 50px;padding-right: 30px;" name="">Đã đặt</th>
                                <%while (rs1.next()) {
                                        if (!check) {
                                %>                         
                            <th class="product-year" style="padding-left: 50px;padding-right: 30px;" name=""><a href="UserController?do=Viewfeedback&roomID=<%=pro.getRoomID()%>"><img style="width: 30px; height: 30px;" src="images/fb.png"><%=rs1.getInt(1)%></a></th>
                                    <% } else {%>
                            <th class="product-year" style="padding-left: 50px;padding-right: 30px;" name="">Tài khoản đang bị report</th>
                                <% }%>

                            <% }
                                }%>

                            <%if (pro.getStatus() == 0) {%>
                            <th class="product-year" style="padding-left: 50px;padding-right: 30px;" name="">Đang xử lí</th>
                                <%}%>
                                <%  long millis = System.currentTimeMillis();
                                    java.sql.Date date = new java.sql.Date(millis);
                                    java.sql.Date sDate = new java.sql.Date(pro.getCheckin().getTime());
                                    java.sql.Date cDate = new java.sql.Date(pro.getCheckout().getTime());
                                    if (date.before(cDate) && pro.getStatus() == 0 ) {
                                %>
                            <th></th>
                            <th class="category-id" style="padding-left: 30px;padding-right: 30px;" name=""><a href="OrderController?do=delete1&rid=<%=pro.getBillID()%>" onclick="ok()"> Hủy đặt</a></th>
                                <%} if (date.before(cDate) && pro.getStatus() == 1 ) {%>  
                             <th class="category-id" style="padding-left: 30px;padding-right: 30px;" name=""><a href="OrderController?do=delete1&rid=<%=pro.getBillID()%>" onclick="ok()"> Hủy đặt</a></th>
                            <%}%>
                                <%}%>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
<script>
    function ok(){
        alert("Bạn đã hủy đơn hàng thành công");
    }
    
    </script>
</html>

