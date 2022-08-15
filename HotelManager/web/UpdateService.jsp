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
        <form action="ServiceController?do=UpDate" method="post" enctype="multipart/form-data">
            <div class="container tm-mt-big tm-mb-big">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 mx-auto">
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <c:if test = "${insert!= null}">
                                <a style="margin-left: 83%;border-radius: 20px" class="btn btn-primary" href="ServiceController?do=ListService" role="button">Danh Sách Dịch Vụ</a>
                            </c:if>
                            <div class="row">
                                <div class="col-12" style="text-align: center">
                                    <h2 class="tm-block-title d-inline-block">Chỉnh Sửa Thông Tin Dịch Vụ</h2> <br>
                                    <h2 style="color: orange" class="tm-block-title d-inline-block">Dịch Vụ: ${services.serviceName}</h2> <br>

                                </div>
                            </div>
                            <select hidden="" name="Status" style="text-align: center"
                                    class="custom-select tm-select-accounts"
                                    id="category"
                                    >
                                <option hidden="" value="${services.serviceID}"></option>
                            </select>
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <div class="form-group mb-3" style="text-align: center">
                                        <label
                                            for="name"
                                            >Tên Dịch Vụ
                                        </label>
                                        <input style="text-align: center;color: orange"
                                               id="stock"
                                               name="RoomCateName"
                                               type="text"
                                               required 
                                               maxlength="45"
                                               value="${services.serviceName}"
                                               class="form-control validate"
                                               />
                                    </div>
                                    <div class="form-group mb-3" style="text-align: center">
                                        <label
                                            for="name"
                                            >Giá
                                        </label>
                                        <input style="text-align: center;color: orange"
                                               id="stock"
                                               name="Price"
                                               type="number"
                                               min="0"
                                               required
                                               max="9999999"
                                               value="${services.servicePrice}"
                                               class="form-control validate"
                                               />
                                    </div>
                                    <div class="form-group mb-3" style="text-align: center">
                                        <label
                                            for="description"
                                            >Ghi Chú</label>
                                        <textarea style="text-align: center;color: orange"               
                                                  class="form-control validate tm-small"
                                                  rows="5"
                                                  required
                                                  name="Description"
                                                  >${services.serviceDes}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style=" margin: 0 auto; margin-bottom: 20px">
                                <div class="col-xl-12 col-lg-12 col-md-12 mb-2">
                                    <div class="tm-product-img-edit mx-auto">
                                        <img id="image" style="width: 300px;height: 200px" src="images/anhdevice/${services.serviceImage}" alt="Product image" class="img-fluid d-block mx-auto">
                                        <i
                                            class="fas fa-cloud-upload-alt tm-upload-icon"
                                            onclick="document.getElementById('fileInput').click();"
                                            ></i>
                                    </div>
                                    <div style="width: 20%" class="custom-file mt-1 mb-1">
                                        <input style=" margin-left: 200%" type="file" id="imageFile" onchange="chooseFile(this)" accept="image/gif,image/jpeg,image/png"
                                               class="form-control" name="photo" placeholder="Enter photo"></div>
                                </div>
                            </div>
                            <div class="col-12">
                                <button onclick="Save()" type="submit" class="btn btn-primary btn-block text-uppercase">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
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
        </script>
        <script>
                function Save() {
                     var arr = document.getElementsByTagName('input');
                     var price = arr[2].value;
                     if(price!= "" price>=0 && price<=9999999){
                     alert("Cập Nhật Dịch vụ Thành Công Phòng");
                     }
                }
            </script>
    </body>
</html>
