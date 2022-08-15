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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Edit Product - Dashboard Admin Template</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <!-- http://api.jqueryui.com/datepicker/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            function chooseFile(fileInput) {
                if (fileInput.files && fileInput.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#image').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(fileInput.files[0]);
                }
            }
            function chooseFile2(fileInput) {
                if (fileInput.files && fileInput.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#image2').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(fileInput.files[0]);
                }
            }
            function chooseFile3(fileInput) {
                if (fileInput.files && fileInput.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#image3').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(fileInput.files[0]);
                }
            }
            function chooseFile4(fileInput) {
                if (fileInput.files && fileInput.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#image4').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(fileInput.files[0]);
                }
            }
        </script>
    </head>

    <body>
         <%@include file="headerAdmin.jsp" %>
        <form action="RoomcategoryController?do=insetroomcate" method="post">
            <div class="container tm-mt-big tm-mb-big">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 mx-auto">
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <div class="row">
                                <div class="col-12" style="text-align: center">
                                    <h2 class="tm-block-title d-inline-block">Chỉnh Sửa Loại Phòng</h2>
                                </div>
                            </div>
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <div class="form-group mb-3" style="text-align: center">
                                        <label
                                            for="name"
                                            >Room Number 
                                        </label>
                                        <input style="text-align: center"
                                               id="stock"
                                               name="RoomNumber"
                                               type="number"
                                               min="0"
                                               max="20"
                                               value=""
                                               class="form-control validate"
                                               />
                                    </div>
                                    <div class="form-group mb-3" style="text-align: center">
                                        <label
                                            for="description"
                                            >Mô Tả</label>
                                        <textarea style="text-align: center"               
                                                  class="form-control validate tm-small"
                                                  rows="5"
                                                  required
                                                  name="Description"
                                                  ></textarea>
                                    </div>
                                    <div class="col-12">
                                        <a  data-toggle="modal" data-target="#exampleModal" class="btn btn-primary btn-block text-uppercase">
                                            Thêm Mới
                                        </a>
                                    </div>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 style="text-align: center" class="modal-title" id="exampleModalLabel">Thêm Mới Loại Phòng</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body" style="font-size: 30px;color: red">
                                                    Xác Nhận Thêm Mới
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">HỦY</button>
                                                    <button type="submit" class="btn btn-primary btn-block text-uppercase">Save</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="tm-footer row tm-mt-small">
                    <div class="col-12 font-weight-light">
                        <p class="text-center text-white mb-0 px-4 small">
                        </p>
                    </div>
                </footer> 

                <script src="js/jquery-3.3.1.min.js"></script>
                <!-- https://jquery.com/download/ -->
                <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
                <!-- https://jqueryui.com/download/ -->
                <script src="js/bootstrap.min.js"></script>
                <!-- https://getbootstrap.com/ -->
                <script>
            $(function () {
                $("#expire_date").datepicker({
                    defaultDate: "10/22/2020"
                });
            });
                    <c:if test = "${update!= null}">
            alert("Update Successfully");
                    </c:if>

                </script>
                </body>
                </html>
