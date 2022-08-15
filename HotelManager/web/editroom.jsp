<%-- 
    Document   : editroomdevice
    Created on : Jun 8, 2022, 10:24:44 PM
    Author     : NTD
--%>

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
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
    </head>

    <body id="reportsPage">
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
        <div class="">
            <div class="row tm-content-row">
                <div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-products">
                        <div class="tm-product-table-container">
                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead>
                                    <tr>
                                        <th scope="col">&nbsp;</th>
                                        <th scope="col">RoomID</th>
                                        <th scope="col">RoomCate</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Note</th>
                                        <th scope="col">EditImage</th>
                                        <th scope="col">Delete</th>
                                        <th scope="col">Update</th>
                                        <th scope="col">&nbsp;</th>
                                    </tr>
                                </thead>


                                <c:forEach items="${listroom}" var="r">
                                    <form action="RoomsController" method="get">
                                        <tbody>
                                            <tr>
                                                <th scope="row"><input type="hidden" /></th>
                                                <td ><input class="form-control validate" type="text" name="RoomID" value="${r.roomID}"></td>
                                                <td ><select id="cars">
                                                        <c:forEach items="${romcate}" var="rs">
                                                            <option value="RoomCate"${rs.roomcateID==r.roomcateID?"selected":""}>${rs.catename}</option>
                                                        </c:forEach>
                                                    </select></td>
                                                <td ><select id="cars">
                                                        <option value="RoomCate"${r.status==0?"selected":""}>valid</option>
                                                        <option value="RoomCate"${r.status==1?"selected":""}>invalid</option>
                                                        <option value="RoomCate"${r.status==2?"selected":""}>other</option>
                                                    </select></td>
                                                <td ><input class="form-control validate" type="number" name="Price" value="" min="1" max="9999"></td>
                                                <td ><textarea name="Description" rows="4" cols="30" style="height: 45px">${r.roomdesc}</textarea></td>
                                                <td ><textarea name="Note" rows="3" cols="10" style="height: 45px">${r.note}</textarea></td>
                                                <td > <a href="ImageController?do=listImage&RoomID=${r.roomID}" style="border-radius: 10px" class="btn btn-info" role="button">Link Button</a></td>
                                                <td>
                                                    <a href="#" class="tm-product-delete-link">
                                                        <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                    </a>
                                                </td>
                                                <td>
                                                    <button type="submit" name="do" value="updateroomdevice" class="tm-product-delete-link">
                                                        <i class="fas fa-arrow-alt-circle-up tm-product-delete-icon"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </form>
                                </c:forEach>
                                <form action="RoomsController" method="get">
                                    <input type="hidden" name="cateroom" value="${rooom.roomcateID}">
                                    <input type="hidden" name="do" value="listroom">
                                    <input class="btn btn-primary btn-block text-uppercase mb-3" type="text" placeholder="Tìm kiếm.." name="Mess">
                                </form>
                            </table>
                        </div>
                        <div style="padding-left: 32%;"class="site-block-27">
                            <ul>
                                <li><a href="#">&lt;</a></li>
                                <li class="active"><span>1</span></li>
                                <li><a href="#">2</a></li>
                                <li><a href="#">3</a></li>
                                <li><a href="#">4</a></li>
                                <li><a href="#">5</a></li>
                                <li><a href="#">&gt;</a></li>
                            </ul>
                        </div>

                        <!-- table container -->
                        <form action="ServiceController" method="get">
                            <tbody>
                                <tr>
                                    <th scope="row"><input type="hidden" /></th>
                            <h5 style="display: inline-block; margin-left: 1%; font-family: PlayFair Display; color: white">INSERT ROOM DEVICE</h5> <br> 
                            <span>
                                <td ><a href="importimg.jsp" style="border-radius: 10px" class="btn btn-info" role="button">Link Button</a></td> <br>
                                <td ><select id="cars">
                                        <c:forEach items="${romcate}" var="rs">
                                            <option value="RoomCate"${rs.roomcateID==r.roomcateID?"selected":""}>${rs.catename}</option>
                                        </c:forEach>
                                    </select></td>
                                <td ><input class="form-control validate" readonly type="text" name="Status" value="1"></td>
                                <td ><input class="form-control validate" type="number" name="Quantity" value="" placeholder="Quantity" min="1" max="10"></td>
                            </span>
                            <input type="hidden" name="RoomcateID" value="######">
                            <td>
                                <button type="submit" name="do" value="insertdeviceroom" class="tm-product-delete-link">
                                    <i class="fas fa-arrow-alt-circle-up tm-product-delete-icon"></i>
                                </button>
                            </td>
                            </tr>
                            </tbody>
                        </form>
                    </div>
                </div>
                <div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
                    <div class="tm-bg-primary-dark tm-block tm-block-product-categories">
                        <h2 class="tm-block-title">${rooom.cateroom}</h2>
                        <div class="tm-product-table-container">
                            <table class="table tm-table-small tm-product-table">
                                <tbody>
                                    <c:forEach items="${romcate}" var="r">
                                    <form action="RoomsController" method="get">
                                        <tr>
                                            <td class="text-center"><a href="RoomsController?do=listroom&cateroom=${r.roomcateID}" style="color: red; font-size: 50px">.</a> <input type="text" name="Roomcatename" value="${r.catename}"> </td>
                                            <td>
                                                <a href="RoomsController?do=deletetRoomCategory&cateroom=${r.roomcateID}" class="tm-product-delete-link">
                                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                                </a>
                                            </td>
                                        <input type="hidden" value="${r.roomcateID}" name="cateroom">
                                        <td>
                                            <button type="submit" name="do" value="updatetRoomCategory" class="tm-product-delete-link">
                                                <i class="fas fa-arrow-alt-circle-up tm-product-delete-icon"></i>
                                            </button>
                                        </td>
                                        </tr>
                                    </form>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- table container -->    
                        <form action="RoomsController" method="get">
                            <tr>
                                <td class="text-center"><input class="form-control validate" type="text" name="Roomcatename" value="" style="text-align: center;" placeholder="ADD NEW ROOMCATEGORY"></td>
                            <input type="hidden" name="do" value="insertRoomCategory">
                            </tr>
                            <button class="btn btn-primary btn-block text-uppercase mb-3" type="submit">
                                Add new category
                            </button>
                        </form>
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
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script>
            $(function () {
                $(".tm-product-name").on("click", function () {
                    window.location.href = "edit-product.html";
                });
            });
        </script>
    </body>
</html>