<%-- 
    Document   : editroomdevice
    Created on : Jun 8, 2022, 10:24:44 PM
    Author     : NTD
--%>
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
        <title>Product Page - Admin HTML Template</title>
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
        <%@include file="headerAdmin.jsp"%>
        <h1 style="text-align: center; color: wheat">Danh Sách Thiết BỊ</h1>
        <h3 style="text-align: center; color: wheat">Phòng:${room.roomname}</h3>
        <a style="border-radius: 10px; float: right; margin-bottom: 10px" href="DeviceController?do=InsertDeviceRoom&RoomID=${room.roomID}" class="btn btn-danger">Thêm Thiết Bị</a>
        <table id="myTable" class="display table" width="90%">  
            <thead>  
                <tr>  
                    <th style="text-align: center">ID</th> 
                    <th style="text-align: center">Ảnh</th> 
                    <th style="text-align: center">Tên</th>  
                    <th style="text-align: center">Giá</th>  
                    <th style="text-align: center">Trạng Thái</th>  
                    <th style="text-align: center">Ghi Chú</th>  
                    <th style="text-align: center">Số Lượng</th>  
                    <th style="text-align: center">Chỉnh Sửa</th>  
                    <th style="text-align: center">Xóa</th>  
                </tr>  
            </thead>  

            <tbody>  
                <c:forEach items="${listdevice}" var="r">
                    <tr style="background-color: 435C70" >  
                        <td style="background-color: 435C70 ; width: 3%"><span class="badge badge-primary badge-pill">${r.deviceID}</span></td>  
                        <td style="background-color: 435C70 ; width: 10%" ><img style="width: 150px; height: 100px" src="images/anhphong/${r.imagedevice}" class="img-thumbnail"></td>
                        <td style="background-color: 435C70 ; width: 20%; text-align: center "><span class="d-inline-block text-truncate" style="max-width: 300px;">${r.deviceName}</span></td>  
                        <td style="background-color: 435C70 ; width: 10%; color: orangered; font-style: inherit;text-align: center"> <fmt:formatNumber value="${r.price}"/> đ</td>  
                        <c:if test="${r.status==0}"> 
                            <td style="background-color: 435C70 ; width: 10%;text-align: center">Hoạt Động</td>  
                        </c:if>
                        <c:if test="${r.status==1}">
                            <td style="background-color: 435C70 ; width: 10% ;text-align: center">Không Hoạt Động</td>  
                        </c:if>
                        <c:if test="${r.status==2}">
                            <td style="background-color: 435C70 ; width: 10%;text-align: center">Khác</td>  
                        </c:if>
                        <td style="background-color: 435C70 ; color: beige ; width: 10%; font-family: fantasy;text-align: center">${r.note}</td> 
                        <td style="background-color: 435C70 ; color: beige ; width: 10%; font-family: fantasy;text-align: center">${r.quantity}</td> 
                        <td style="background-color: 435C70 ;width: 20%" >
                            <a style="border-radius: 10px; margin-left: 29%" href="DeviceController?do=UpdateDeviceByRoom&DeviceID=${r.deviceID}&RoomID=${r.roomID}" class="btn btn-info" role="button">
                                Cập Nhật</a></td>  
                        <td style="background-color: 435C70">
                            <a onclick="alert('Xóa Thành Công: ${r.deviceName}');" style="margin-left: 43%" href="DeviceController?do=DeleteDeviceRoom&RoomID=${r.roomID}&DeviceID=${r.deviceID}" class="tm-product-delete-link">
                                <i class="far fa-trash-alt tm-product-delete-icon">
                                </i></a></td>  
                    </tr>  
                </c:forEach>
            </tbody>  
        </table>  
        <footer class="tm-footer row tm-mt-small">
            <div class="col-12 font-weight-light">
                <p class="text-center text-white mb-0 px-4 small">
                </p>
            </div>
        </footer>
        <script>
            $(function () {
                $(".tm-product-name").on("click", function () {
                    window.location.href = "edit-product.html";
                });
            });
            $(document).ready(function () {
                $('#myTable').DataTable(
                        {
                            "aLengthMenu": [[3, 6, 15, 30, -1], [3, 6, 15, 30, "All"]],
                            "iDisplayLength": 3,
                            "language": {
                                "lengthMenu": "Hiển Thị _MENU_ Trên Trang",
                                "search": "Tìm Kiếm",
                                "zeroRecords": "Không Có Bản Ghi Nào Phù Hợp",
                                "info": "Hiển Thị Trang _PAGE_ Trên _PAGES_",
                                "infoEmpty": "Danh Sách Trống",
                                "infoFiltered": "(Không Tìm Thấy Thiết Bị/_MAX_ Dịch Vụ)",
                                
                                
                            }
                        });
            });
        </script>
    </body>
</html>
