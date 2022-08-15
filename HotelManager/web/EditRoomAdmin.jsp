<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <meta charset="UTF-8" />
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
        </script>
    </head>

    <body>
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="index.html">
                    <h1 class="tm-site-title mb-0">Product Admin</h1>
                </a>
                <button
                    class="navbar-toggler ml-auto mr-0"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link" href="index.html">
                                <i class="fas fa-tachometer-alt"></i> Dashboard
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="navbarDropdown"
                                role="button"
                                data-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false">
                                <i class="far fa-file-alt"></i>
                                <span> Reports <i class="fas fa-angle-down"></i> </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Daily Report</a>
                                <a class="dropdown-item" href="#">Weekly Report</a>
                                <a class="dropdown-item" href="#">Yearly Report</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="navbarDropdown"
                                role="button"
                                data-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false">
                                <i class="fas fa-door-open"></i>
                                <span> Room <i class="fas fa-angle-down"></i> </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="RoomsController?do=listroom">ListRoom</a>
                                <a class="dropdown-item" href="#">Weekly Report</a>
                                <a class="dropdown-item" href="#">Yearly Report</a>
                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="accounts.html">
                                <i class="far fa-user"></i> Accounts
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                               aria-haspopup="true" aria-expanded="false">
                                <i class="fab fa-blogger"></i>
                                <span>
                                    Blog <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="BlogManagerController?do=insertblog">Update Blog</a>
                                <a class="dropdown-item" href="BlogManagerController">Insert Blog</a>
                                <a class="dropdown-item" href="BlogManagerController">Delete Blog</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="navbarDropdown"
                                role="button"
                                data-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false">
                                <i class="fas fa-cog"></i>
                                <span> Settings <i class="fas fa-angle-down"></i> </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Profile</a>
                                <a class="dropdown-item" href="#">Billing</a>
                                <a class="dropdown-item" href="#">Customize</a>
                            </div>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href="login.html">
                                Admin, <b>Logout</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12" style="text-align: center">
                                <h2 class="tm-block-title d-inline-block">Edit Product</h2>
                            </div>
                        </div>
                        <div class="row" style="width: 70%; margin: 0 auto; margin-bottom: 20px">
                            <div class="col-xl-3 col-lg-3 col-md-6 mb-2">
                                <form action="ImageController?do=changeImgae1" method="post" enctype="multipart/form-data">
                                    <div class="tm-product-img-edit mx-auto">
                                        <img id="image" style="width: 150px;height: 100px" src="images/anhphong/${img.image1}" alt="Product image" class="img-fluid d-block mx-auto">
                                        <i
                                            class="fas fa-cloud-upload-alt tm-upload-icon"
                                            onclick="document.getElementById('fileInput').click();"
                                            ></i>
                                    </div>
                                    <div class="custom-file mt-1 mb-1">
                                        <input type="hidden"  value="${img.roomimgaeID}"
                                               class="form-control" name="RoomID" placeholder="Enter name">
                                        <input type="file" id="imageFile" onchange="chooseFile(this)" accept="image/gif,image/jpeg,image/png"
                                               class="form-control" name="photo" placeholder="Enter photo">
                                        <!--<input type="hidden" name="do" value="changeImgae" style="width: 200px; margin-top: 10px">-->
                                        <button style="border-radius: 20px;margin-left:20%" type="submit" class="btn btn-primary">Save</button>
                                    </div>
                                </form> 
                            </div>
                            <div class="col-xl-3 col-lg-3 col-md-6 mb-2">
                                <form action="ImageController?do=changeImgae2" method="post" enctype="multipart/form-data">
                                    <div class="tm-product-img-edit mx-auto">
                                        <img style="width: 150px;height: 100px" src="images/anhphong/${img.image2}" alt="Product image" class="img-fluid d-block mx-auto">
                                        <i
                                            class="fas fa-cloud-upload-alt tm-upload-icon"
                                            onclick="document.getElementById('fileInput').click();"
                                            ></i>
                                    </div>
                                    <div class="custom-file mt-1 mb-1">
                                        <input type="hidden"  value="${img.roomimgaeID}"
                                               class="form-control" name="RoomID" placeholder="Enter name">
                                        <input type="file" 
                                               class="form-control" name="photo" placeholder="Enter photo">
                                        <!--<input type="hidden" name="do" value="changeImgae" style="width: 200px; margin-top: 10px">-->
                                        <button style="border-radius: 20px;margin-left:20%" type="submit" class="btn btn-primary">Save</button>
                                    </div>
                                </form>  
                            </div>
                            <div class="col-xl-3 col-lg-3 col-md-6 mb-2">
                                <div class="tm-product-img-edit mx-auto">
                                    <img style="width: 150px;height: 100px" src="images/anhphong/${img.image3}" alt="Product image" class="img-fluid d-block mx-auto">
                                    <i
                                        class="fas fa-cloud-upload-alt tm-upload-icon"
                                        onclick="document.getElementById('fileInput').click();"
                                        ></i>
                                </div>
                                <div class="custom-file mt-1 mb-1">
                                    <input type="hidden"  value="${img.roomimgaeID}"
                                           class="form-control" name="RoomID" placeholder="Enter name">
                                    <input type="file" 
                                           class="form-control" name="photo" placeholder="Enter photo">
                                    <!--<input type="hidden" name="do" value="changeImgae" style="width: 200px; margin-top: 10px">-->
                                    <button style="border-radius: 20px;margin-left:20%" type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-3 col-md-6 mb-2">
                                <div class="tm-product-img-edit mx-auto">
                                    <img style="width: 150px;height: 100px" src="images/anhphong/img1.0.jpg" alt="Product image" class="img-fluid d-block mx-auto">
                                    <i
                                        class="fas fa-cloud-upload-alt tm-upload-icon"
                                        onclick="document.getElementById('fileInput').click();"
                                        ></i>
                                </div>
                                <div class="custom-file mt-1 mb-1">
                                    <input type="hidden"  value="${img.roomimgaeID}"
                                           class="form-control" name="RoomID" placeholder="Enter name">
                                    <input type="file" 
                                           class="form-control" name="photo" placeholder="Enter photo">
                                    <button style="border-radius: 20px;margin-left:20%" type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-12 col-lg-12 col-md-12">
                                <form action="RoomsController" method="post" class="tm-edit-product-form">
                                    <div class="form-group mb-3" style="text-align: center">
                                        <label
                                            for="name"
                                            >RoomID 
                                        </label>
                                        <input type="hidden" name="RoomID" value="${listroom.roomID}"> 
                                        <input type="hidden" name="image" value="${listroom.image}"> 
                                        <br>
                                        <span style="color: red">${listroom.roomID}</span>
                                    </div>
                                    <div class="form-group mb-3" style="text-align: center">
                                        <label
                                            for="name"
                                            >Room Number
                                        </label>
                                        <input style="text-align: center"
                                               id="expire_date"
                                               name="RoomNumber"
                                               type="number"
                                               min="0" max="20"
                                               value="${listroom.roomname}"
                                               class="form-control validate"
                                               data-large-mode="true"
                                               />
                                    </div>
                                    <div class="form-group mb-3" style="text-align: center">
                                        <label
                                            for="description"
                                            >Description</label>
                                        <textarea style="text-align: center"               
                                                  class="form-control validate tm-small"
                                                  rows="5"
                                                  required
                                                  name="Description"
                                                  >${listroom.roomdesc}</textarea>
                                    </div>
                                    <div class="form-group mb-3" style="text-align: center">
                                        <label 
                                            for="category"
                                            >RoomCategory</label
                                        >
                                        <select style="text-align: center"
                                                class="custom-select tm-select-accounts"
                                                id="category" 
                                                name="RoomCategory"
                                                >
                                            <c:forEach items="${romcate}" var="rs">
                                                <option value="${rs.roomcateID}" ${rs.roomcateID==listroom.roomcateID?"selected":""}>${rs.catename}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="row" style="text-align: center">
                                        <div class="form-group mb-3 col-xs-6 col-sm-4">
                                            <label
                                                for="expire_date"
                                                >Price
                                            </label>
                                            <input style="text-align: center"
                                                   id="expire_date"
                                                   name="Price"
                                                   type="number"
                                                   min="10" max="9999"
                                                   value="${listroom.roomprice}"
                                                   class="form-control validate"
                                                   data-large-mode="true"
                                                   />
                                        </div>
                                        <div class="form-group mb-3 col-xs-6 col-sm-4">
                                            <label
                                                for="stock"
                                                >Note
                                            </label>
                                            <input style="text-align: center"
                                                   id="stock"
                                                   name="Note"
                                                   type="text"
                                                   value="${listroom.note}"
                                                   class="form-control validate"
                                                   />
                                        </div>
                                        <div class="form-group mb-3 col-xs-6 col-sm-4">
                                            <label
                                                for="stock"
                                                >Status
                                            </label>
                                            <input name="do" value="updateroom" hidden="" style="text-align: center">
                                            <select name="Status" style="text-align: center"
                                                    class="custom-select tm-select-accounts"
                                                    id="category"
                                                    >
                                                <option value="0"${listroom.status==0?"selected":""}>Available</option>
                                                <option value="1"${listroom.status==1?"selected":""}>Unavailable</option>
                                                <option value="2"${listroom.status==2?"selected":""}>Other</option>
                                            </select>
                                        </div>
                                    </div>
                            </div>
                            <div class="row" style="margin: 0 auto  ">
                                <div class="form-group mb-3 col-xs-6 col-sm-4" style="text-align: center;color: white">
                                    <span>Square</span>
                                    <span>${listroom.square}m2</span>
                                    <input type="hidden" name="Square" value="${listroom.square}"> 
                                </div>
                                <div class="form-group mb-3 col-xs-6 col-sm-4" style="text-align: center;color: white">
                                    <span>Comment</span>
                                    <span>${listroom.comment}</span>
                                    <input type="hidden" name="Comment" value="${listroom.comment}"> 
                                </div>
                                <div class="form-group mb-3 col-xs-6 col-sm-4" style="text-align: center;color: white">
                                    <span>Rate</span> <br>
                                    <span>${listroom.rate}/5</span>
                                    <input type="hidden" name="Rate" value="${listroom.rate}"> 
                                </div>
                            </div>
                            <div class="col-12">
                                <button onclick="myFunction()" type="submit" class="btn btn-primary btn-block text-uppercase">Update Now</button>
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
                    Copyright &copy; <b>2018</b> All rights reserved. 

                    Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
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
