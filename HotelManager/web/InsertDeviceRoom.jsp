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
        <form action="DeviceController?do=InsertDeviceRooms" method="post" enctype="multipart/form-data">

            <div class="container tm-mt-big tm-mb-big">
                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 mx-auto">
                        <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                            <div class="row">
                                <div class="col-12" style="text-align: center">
                                    <h2 class="tm-block-title d-inline-block">Thêm Mới Thiết Bị</h2> <br>
                                    <h4 style="color: orange" class="tm-block-title d-inline-block">Phòng: ${getroom.roomname} </h4>
                                </div>
                            </div>
                            <div class="row tm-edit-product-row">
                                <div class="col-xl-12 col-lg-12 col-md-12">
                                    <input style="text-align: center;color: orange"
                                           id="stock"
                                           name="RoomID"
                                           type="number"
                                           hidden=""
                                           value="${Roomid}"
                                           class="form-control validate"
                                           />
                                    <div  class="form-group  mb-3" style="text-align: center">
                                        <label
                                            for="name"
                                            >Loại Thiết Bị
                                        </label>
                                        <select style="text-align: center;color: orange" required name="DeviceNames" id="selects" placeholder="Chọn 1 Loại..."
                                                class="custom-select tm-select-accounts"
                                                id="category" 
                                                >
                                            <c:forEach items="${listdevices}" var="r">
                                                <option value="${r.deviceID}">${r.deviceName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3" style="text-align: center">
                                        <label
                                            for="name"
                                            >Trạng Thái
                                        </label>
                                        <select required name="Status" style="text-align: center;color: orange"
                                                class="custom-select tm-select-accounts"
                                                id="category"
                                                >
                                            <option selected="" value="0">Hoạt Động</option>
                                            <option value="1">Không Hoạt Động</option>
                                            <option value="2">Khác</option>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3" style="text-align: center">
                                        <label
                                            for="name"
                                            >Số Lượng 
                                        </label>
                                        <select required name="Status" style="text-align: center;color: orange"
                                                class="custom-select tm-select-accounts"
                                                id="category"
                                                >
                                            <option selected="" value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                        </select>
                                    </div>
                                    <div class="form-group mb-3" style="text-align: center">
                                        <label
                                            for="description"
                                            >Ghi Chú</label>
                                        <textarea style="text-align: center;color: orange"               
                                                  class="form-control validate tm-small"
                                                  rows="5"
                                                  name="Description"
                                                  >${device.note}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style=" margin: 0 auto; margin-bottom: 20px">
                                <div class="col-xl-12 col-lg-12 col-md-12 mb-2">
                                    <div class="tm-product-img-edit mx-auto">
                                        <img id="image" style="width: 300px;height: 200px" src="images/anhphong/${device.imagedevice}" alt="Product image" class="img-fluid d-block mx-auto">
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
                                <button type="submit" class="btn btn-primary btn-block text-uppercase" onclick="alert('Thêm Mới Thiết Bị Thành Công');" >Save</button>
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
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/js/standalone/selectize.min.js" integrity="sha256-+C0A5Ilqmu4QcSPxrlGpaZxJ04VjsRjKu+G82kl5UJk=" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/selectize.js/0.12.6/css/selectize.bootstrap3.min.css" integrity="sha256-ze/OEYGcFbPRmvCnrSeKbRTtjG4vGLHXgOqsyLFTRjg=" crossorigin="anonymous" />
    </body>
</html>
