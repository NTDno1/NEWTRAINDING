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
         <%@include file="headerAdmin.jsp" %>
        <h1 style="text-align: center; color: wheat">Danh Sách Dịch Vụ</h1>
        <a style="border-radius: 10px; float: right; margin-bottom: 10px" href="InsertService.jsp" class="btn btn-danger">Thêm Mới</a>
        <table id="myTable" class="display table" width="90%">  
            <thead>  
                <tr>  
                    <th style="text-align: center">Tên Dịch Vụ</th>  
                    <th style="text-align: center">Ảnh</th>  
                    <th style="text-align: center">Mô Tả</th>  
                    <th style="text-align: center">Giá</th>  
                    <th style="text-align: center">Cập Nhật</th>  
                    <th style="text-align: center">Đánh Giá</th>  
                    <th style="text-align: center">Xóa</th> 
                </tr>  
            </thead>  

            <tbody>  
                <c:forEach items="${ListService}" var="r">
                    <tr style="background-color: 435C70" >  
                        <td style="background-color: 435C70 ; width: 10%;text-align: center"><span class="d-inline-block text-truncate" style="max-width: 300px;">${r.serviceName}</span></td>  
                        <td style="background-color: 435C70 ; width: 10%" ><img style="width: 150px; height: 100px" src="images/anhdevice/${r.serviceImage}" class="img-thumbnail"></td>  
                        <td style="background-color: 435C70 ; width: 30%; font-style: inherit;text-align: center">${r.serviceDes}</td>  
                        <td style="background-color: 435C70 ; color: red ; width: 10%; font-family: fantasy;text-align: center"><fmt:formatNumber value="${r.servicePrice} "/> đ</td> 
                        <td style="background-color: 435C70 ;width: 20%" >
                            <a style="border-radius: 10px; margin-left: 32%" href="ServiceController?do=UpDateService&ServiceId=${r.serviceID}" class="btn btn-info" role="button">
                                Chỉnh Sửa</a></td>   
                        <td style="background-color: 435C70 ;width: 20%" >
                            <a style="border-radius: 10px; margin-left: 32%" href="ServiceController?do=ListComment&ServiceID=${r.serviceID}"  class="btn btn-info" role="button">
                                Hiển Thị</a></td>   
                        <td style="background-color: 435C70">
                            <a onclick="alert('Xóa Thành Công: ${r.serviceName}');" style="margin-left: 45%" href="ServiceController?do=DeleteService&ServiceId=${r.serviceID}" class="tm-product-delete-link">
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
                                "infoFiltered": "(Không Tìm Thấy Dịch Vụ Nào/_MAX_ Dịch Vụ)",
                                "paginate": {
                                    "next": "Tiếp",
                                    "previous": "Trước"
                                },
                            }
                        });
                $(row).find('td:eq(2)').css('color', 'red');
            });


            <c:if test = "${delete!= null}">
            alert("Delete Successfully RoomID=${RoomID}");
            </c:if>
            <c:if test = "${insert!= null}">
            alert("Insert Successfully");
            </c:if>
        </script>

    </body>
</html>
