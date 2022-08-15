<%-- 
    Document   : editroomdevice
    Created on : Jun 8, 2022, 10:24:44 PM
    Author     : NTD
--%>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">   
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" 
      href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css">
<script type="text/javascript" 
src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" 
src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <h1 style="text-align: center; color: wheat">Danh Sách Thiết Bị</h1>
        <table id="myTable" class="display table" width="90%">  
            <thead>  
                <tr>  
                    <th style="text-align: center">Tên Người Dùng</th>  
                    <th style="text-align: center">Ngày Giờ</th>  
                    <th style="text-align: center">Đánh giá</th>  
                    <th style="text-align: center">Trạng Thái</th>  
                    <th style="text-align: center">Bỏ Chặn</th>  
                    <th style="text-align: center">Chặn</th>  
                </tr>  
            </thead>  
            <tbody>  
                <c:forEach items="${listFeedBack}" var="r">
                    <tr style="background-color: 435C70">
                        <td style="background-color: 435C70; text-align: center"><span class="d-inline-block text-truncate" style="max-width: 300px;">${r.note}</span></td>
                        <td style="background-color: 435C70; text-align: center"><span class="d-inline-block text-truncate" style="max-width: 300px;">${r.date}</span></td>
                        <td style="background-color: 435C70; text-align: center"><span class="d-inline-block text-truncate" style="max-width: 300px;">${r.comment}</span></td>
                            <c:if test="${r.status==0}"> 
                            <td style="background-color: 435C70 ; width: 10%;text-align: center">Hiển Thị</td>  
                        </c:if>
                        <c:if test="${r.status==1}">
                            <td style="background-color: 435C70 ; width: 10% ;text-align: center">Chặn</td>  
                        </c:if>
                        <c:if test="${r.status==2}">
                            <td style="background-color: 435C70 ; width: 10%;text-align: center">Khác</td>  
                        </c:if>
                        
                        <td style="background-color: 435C70; text-align: center">
                            <a onclick="alert('Bình Luận Được Hiển Thị');" href="ServiceController?do=UnblockComment&ServiceId=${r.serviceId}&CommentID=${r.commentID}" class="tm-product-delete-link">
                                <i class="fas fa-check tm-product-delete-icon" >
                                </i></a>
                        </td>  
                        <td style="background-color: 435C70; text-align: center">
                            <a onclick="alert('Bình Luận Đã Bị Ẩn');" href="ServiceController?do=DeleteComment&ServiceId=${r.serviceId}&CommentID=${r.commentID}" class="tm-product-delete-link">
                                <i class="far fa-trash-alt tm-product-delete-icon" >
                                </i></a>
                        </td>  
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
                            "aLengthMenu": [[5, 10, 15, 30, -1], [5, 10, 15, 30, "All"]],
                            "iDisplayLength": 5,
                            "language": {
                                "lengthMenu": "Hiển Thị _MENU_ Trên Trang",
                                "search": "Tìm Kiếm",
                                "zeroRecords": "Không Có Bản Ghi Nào Phù Hợp",
                                "info": "Hiển Thị Trang _PAGE_ Trên _PAGES_",
                                "infoEmpty": "Danh Sách Trống",
                                "infoFiltered": "(Không Tìm Thấy Phòng Phù Hợp/_MAX_Phòng)",
                                "paginate": {
                                    "next": "Tiếp",
                                    "previous": "Trước"
                                },
                            }
                        });
            });
            <c:if test = "${update!=null}">
            alert("Update Successfully");
            </c:if>
        </script>

    </body>
</html>
