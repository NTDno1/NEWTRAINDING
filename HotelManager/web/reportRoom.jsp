<%-- 
    Document   : reportRoom
    Created on : Jul 8, 2022, 1:51:45 PM
    Author     : Minh Hiếu
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title> Admin - Dashboard</title>
        <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">   
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <link rel="stylesheet" 
        href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
        <script type="text/javascript" 
        src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" 
        src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css">
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
        <div class="" id="home">
            <%@include file="headerAdmin.jsp" %>

        </div>
            <h2 style="color:wheat;margin-bottom: 20px;text-align: center">Báo cáo doanh số theo phòng</h2>
        <h4 style="font-size: 20px ; color: red">${errr}</h4>
        <h4 style="font-size: 20px ; color: red">${err1}</h4>
        <form action="AdminController?do=incomeRoomAndSearch" method="post" >
            <label style=" color: white;margin-left: -240px">Tìm kiếm số phòng</label>
            <div class="form-group col-lg-2 d-flex">
                <input style="background-color: white; color: #54657D; border-radius: 10px;margin-top: 30px; " type="text" name="name" pattern=".*\S+.*"   title="Không được để khoảng trắng" maxlength="5" class="form-control" value="${name}">
                <input style="margin-left: 20px;border-radius: 10px;padding: 5px;margin-top: 30px" type="submit"  value="Báo cáo" class="btn btn-success">
            </div> 
                <div class="d-flex" style="margin-top: 20px">

                    <div class="form-group col-lg-2" style="margin-top: 44px;margin-left: -256px">
                    <label>Từ ngày</label>
                    <input style="background-color: white; color: #54657D" type="date" name="checkin" class="form-control" value="${checkin}">
                </div> 
                <div class="form-group col-lg-2" style="margin-top: 44px">
                    <label>Đến ngày </label>
                    <input style="background-color: white; color: #54657D" type="date" name="checkout" class="form-control" value="${checkout}">
                </div>
            </div>

        </form>
        <c:if test="${!empty listReservation}">

            <div class="container" >


                <canvas  id="RoomAllChart"></canvas>
            </div>

        </c:if>
        <c:if test="${empty listReservation}">



            <h2 class="tm-block-title text-center" style="font-size: 30px">Không có dữ liệu, vui lòng thử lại.</h2>

        </c:if>


    </div>



    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="js/moment.min.js"></script>
    <!-- https://momentjs.com/ -->
    <script src="js/Chart.min.js"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="js/tooplate-scripts.js"></script>
    <script>

        let roomName = [], totalRoom = []
        <c:forEach items="${listReservation}" var="v">

        roomName.push('${v.roomname}')
        totalRoom.push(${v.total})


        </c:forEach>
        Chart.defaults.global.defaultFontColor = 'white';
        window.onload = function () {
            RoomAllChart1("RoomAllChart", roomName, totalRoom);
        }
        function RoomAllChart1(id, roomName, totalRoom) {

            const data = {
                labels: roomName,
                datasets: [{
                        label: 'Thống kê doanh thu phòng',
                        data: totalRoom,
                        backgroundColor: [
                            'rgb(255, 99, 132)',
                            'rgb(54, 162, 235)',
                            'rgb(255, 205, 86)',
                            'rgb(201, 203, 207)',
                            'rgb(60, 100, 25)',
                            'rgb(119 136 153)',
                            'rgb(198 226 255)',
                            'rgb(47 79 79)',
                            'rgb(151 255 255)',
                            'rgb(82 139 139)',
                            'rgb(139 69 19)',
                            'rgb(255 228 181)',
                            'rgb(205 133 63)',
                            'rgb(139 137 137)',
                            'rgb(240 255 255)',
                            'rgb(205 183 181)',
                            'rgb(65 105 225)',
                            'rgb(0 0 255)',
                            'rgb(70 130 180)',
                            'rgb(84 255 159)',
                            'rgb(255, 99, 132)',
                            'rgb(54, 162, 235)',
                            'rgb(255, 205, 86)',
                            'rgb(201, 203, 207)',
                            'rgb(60, 100, 25)',
                            'rgb(119 136 153)',
                            'rgb(255, 99, 132)',
                            'rgb(54, 162, 235)',
                            'rgb(255, 205, 86)',
                            'rgb(201, 203, 207)',
                            'rgb(60, 100, 25)',
                            'rgb(119 136 153)'
                        ],
                        borderColor: 'rgb(84 255 159)',
                        hoverOffset: 4
                    }]
            };
            const config = {
                type: 'bar',
                data: data,
            };
            let c = document.getElementById(id).getContext("2d")
            new Chart(c, config)
        }




    </script>


</body>
</html>