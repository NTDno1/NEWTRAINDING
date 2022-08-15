<%-- 
    Document   : reportMonth
    Created on : Jul 8, 2022, 9:57:51 PM
    Author     : Minh Hieu
--%>

<%@page import="entity.Reservation"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<body id="reportsPage">
    <div class="" id="home">
        <%@include file="headerAdmin.jsp" %>

    </div>
    <h2 style="color:wheat;margin-bottom: 20px;text-align: center">Báo cáo doanh số theo tháng/năm</h2>
    <h4 style="font-size: 20px ; color: red">${errr}</h4>
    <h4 style="font-size: 20px ; color: red">${err1}</h4>
    <label style=" margin-left: 15px;color: white;">Tìm kiếm tháng/năm</label>
    <form action="AdminController?do=ReportMonth1" method="post" >
        <div class="form-group col-lg-4 d-flex">
            <select name="month" style="border-radius:8px"  >
                <option value="0"  >---------</option>
                <c:forEach items="${listReservationAllMonth}" var="lm">
                    <option >${lm}</option>
                </c:forEach>
            </select>  
            <select name="year" style="border-radius:8px"  >
                <option value="0"  >---------</option>
                <c:forEach items="${listReservationAllYear}" var="vY">
                    <option>${vY}</option>
                </c:forEach>
            </select>  
            <input type="submit"  value="Báo cáo" class="btn btn-success" style="border-radius:8px; margin-left: 15px;padding: 5px">
        </div> 
    </form>
    <c:if test="${!empty listReservationTotalOfMotnh}">
        <c:if test="${year!=0 && year!=null && month==0}">

            <div style="position: relative">
                <div class="col-sm-12 col-md-12 col-lg-6 col-xl-10 tm-block-col ok" style="   position: absolute;
                     top:-44px;
                     left: 1106px;">
                    <div class="col-md-4">
                        <div class="card card-tale">
                            <div class="card-body">
                                <a href="#" style=" text-decoration: none"><p class="mb-4" style="color: black">Tổng tiền trong năm ${year} </p>
                                    <p class="fs-30 mb-2">${sum}  đ</p>
                                </a> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </c:if>
        <div class="container" >
            <canvas  id="MonthAllTotal"></canvas>
        </div>

    </c:if>
    <c:if test="${empty listReservationTotalOfMotnh}">
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
    <%       DecimalFormat formatter = new DecimalFormat("###,###,###");%>


        let month = [], totalMotnh = [];
    <fmt:setLocale value="vi"/>
    <fmt:formatNumber value="${v.total}"/>

    <c:forEach items="${listReservationTotalOfMotnh}" var="v">

        month.push('${v.status}/${v.numberOfPerson}');
            totalMotnh.push(${v.total});
    </c:forEach>


            Chart.defaults.global.defaultFontColor = 'white';
            window.onload = function () {
                MonthAllTotal1("MonthAllTotal", month, totalMotnh);
            }
            function MonthAllTotal1(id, month, totalMotnh) {

                const data = {
                    labels: month,
                    datasets: [{
                            label: 'Thống kê doanh thu theo tháng',
                            data: totalMotnh,
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
                                'rgb(84 255 159)'
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
