<%-- 
    Document   : indexadmin
    Created on : Jun 8, 2022, 11:36:23 PM
    Author     : NTD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
        <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
        <!--
        Product Admin CSS Template
        https://templatemo.com/tm-524-product-admin
        -->
</head>

<body id="reportsPage">
    <div class="" id="home">
        <%@include file="headerAdmin.jsp" %>
        <div class="container" >
            <div class="row col-md-14 grid-margin ">
                <div class="col-sm-12 col-md-12  tm-block-col">
                    <div class="tm-bg-primary-dark tm-block ">
                        <div class="row ">
                            <div class="col-md-3 ">
                                <div class="card card-tale  media tm-notification-item">
                                    <div class="card-body">
                                        <p class="mb-4 tm-block-title">Phòng: <b class="tm-notification-link ">${listRoom.size()}</b> </p>


                                    </div>
                                </div>
                            </div>  
                            <div class="col-md-3 ">
                                <div class="card card-tale  media tm-notification-item">
                                    <div class="card-body">
                                        <p class="mb-4 tm-block-title"> Khách hàng: <b class="tm-notification-link ">${listUser.size()}</b> </p>


                                    </div>
                                </div>
                            </div>  
                            <div class="col-md-3 ">
                                <div class="card card-tale  media tm-notification-item">
                                    <div class="card-body">
                                        <p class="mb-4 tm-block-title">Nhân viên: <b class="tm-notification-link ">${listReceptionis.size()} </b></p>


                                    </div>
                                </div>
                            </div>   
                            <div class="col-md-3 ">
                                <div class="card card-tale  media tm-notification-item">
                                    <div class="card-body">
                                        <p class="mb-4 tm-block-title">Đánh giá: <b class="tm-notification-link ">${listMessage.size()}</b> </p>


                                    </div>
                                </div>
                            </div>  
                            <div class="col-md-3 ">
                                <div class="card card-tale  media tm-notification-item">
                                    <div class="card-body">
                                        <p class="mb-4 tm-block-title">Yêu cầu: <b class="tm-notification-link ">${listRequest.size()}</b> </p>


                                    </div>
                                </div>
                            </div>  
                            <div class="col-md-3 ">
                                <div class="card card-tale  media tm-notification-item">
                                    <div class="card-body">
                                        <p class="mb-4 tm-block-title">Tiền: <b class="tm-notification-link ">${sumReservation} đ</b> </p>


                                    </div>
                                </div>
                            </div>  
                            <div class="col-md-auto ">
                                <div class="card card-tale  media tm-notification-item">
                                    <div class="card-body">
                                        <p class="mb-4 tm-block-title">Lượt truy cập: <b class="tm-notification-link ">${totalView}</b> </p>
                                    </div>
                                </div>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container" >
        <div class="row tm-content-row">
            <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                <div class="tm-bg-primary-dark tm-block">
                    <h2 class="tm-block-title">Thống kê loại phòng</h2>
                    <canvas id="myOk"></canvas>
                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                <div class="tm-bg-primary-dark tm-block">
                    <h2 class="tm-block-title">Thống kê phòng</h2>
                    <canvas id="RoomChart"></canvas>
                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">

                <div class="tm-bg-primary-dark tm-block">
                    <h2 class="tm-block-title">Thống kê thiết bị</h2>
                    <canvas id="barChart"></canvas>

                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">

                <div class="tm-bg-primary-dark tm-block">
                    <h2 class="tm-block-title">Thống kê dịch vụ</h2>
                    <canvas id="ServiceChart"></canvas>

                </div>
            </div>


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
        <script src="https://code.iconify.design/2/2.2.1/iconify.min.js"></script>
        <script>

            let cateName = [], cateCOunt = []
            <c:forEach items="${listroomCategory}" var="v">

            cateName.push('${v.catename}')
            cateCOunt.push(${v.count})


            </c:forEach>
            window.onload = function () {
                cateChart("myOk", cateName, cateCOunt, );
            }
            function cateChart(id, cateName, cateCOunt) {
                let color1 = []
                const data = {
                    labels: cateName,
                    datasets: [{
                            label: 'My First Dataset',
                            data: cateCOunt,
                            backgroundColor: [
                                'rgb(255, 99, 132)',
                                'rgb(54, 162, 235)',
                                'rgb(255, 205, 86)',
                                'rgb(201, 203, 207)',
                                'rgb(60, 100, 25)'
                            ],
                            hoverOffset: 4
                        }]
                };
                const config = {
                    type: 'doughnut',
                    data: data,
                };
                let c = document.getElementById(id).getContext("2d")
                new Chart(c, config)
            }



        </script>

        <script>
            let status = [], nameStatus = [], device = [], nameDevice = [], service = [], nameService = []
            <c:forEach items="${listStatus}" var="sr">

            if (${sr.status} == 0) {
                status.push('Phòng trống')

                nameStatus.push(${sr.sumstatus})
            } else {
                status.push('Phòng đã thuê')

                nameStatus.push(${sr.sumstatus})
            }

            </c:forEach>
            <c:forEach items="${listDevice}" var="vd">
            device.push(${vd.quantity})
            nameDevice.push('${vd.deviceName}')
            </c:forEach>

            <c:forEach items="${listReservationOfService}" var="Rf">
            service.push(${Rf.total})
            nameService.push('${Rf.serviceName}')
            </c:forEach>
            Chart.defaults.global.defaultFontColor = 'white';

            let ctxLine,
                    Utils,
                    ctxBar,
                    ctxPie,
                    optionsLine,
                    optionsBar,
                    optionsPie,
                    configLine,
                    configBar,
                    configPie,
                    RoomChart,
                    DeviceChart,
                    Hieu,
                    barChart,
                    ServiceChart,
                    lineChart;

            $(function () {
                RoomChart1(status, nameStatus); // Line Chart
                drawBarChart(device, nameDevice); // Bar Chart
                ServiceChart1(service, nameService);

                $(window).resize(function () {
                    updateLineChart();
                    updateBarChart();
                });
            })
        </script>

</body>
</html>
