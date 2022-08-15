<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Thêm tin tức</title>
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
        <link href="css/navdropdown.css" rel="stylesheet">   
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
        <script type="text/javascript" 
        src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    </head>
    <script type="text/javascript">
        function  Add() {
            var arr = document.getElementsByTagName('input');
            var name = arr[0].value;
            var name1 = arr[2].value;
             var arr1 = document.getElementsByTagName('textarea');
            var content = arr1[0].value;
            if (name.trim() == "" && content.trim() == "" && name1.trim() == "") {
                alert("Vui lòng điền thông tin");
            }else if(name.trim() != "" && content.trim() != "" && name1.trim() != "" ){
                alert("Thêm thành công");
            }
        }
    </script>
      <script>
            function chooseFile(fileInput){
                if(fileInput.files && fileInput.files[0]){
                    var reader = new FileReader();
                    reader.onload = function(e){
                        $('#image').attr('src',e.target.result);
                    }
                    reader.readAsDataURL(fileInput.files[0]);
                }
            }
        </script>
    <body>
        <%@include file="headerAdmin.jsp" %>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                              <h2 style="color:wheat;margin-bottom: 20px;text-align: center;margin-top:20px;font-size:35px;">Thêm tin tức</h2>
                            </div>
                        </div>
                        <div class="row tm-edit-product-row">
                            <div  class="col-xl-6 col-lg-6 col-md-12">
                                <form action="BlogManagerController" method="post" class="tm-edit-product-form">
                                    <input type="hidden" value="" name="blogid"/>
                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Tiêu đề
                                        </label>
                                        <input
                                            id="name"
                                            name="title"
                                            type="text" maxlength="150"
                                            class="form-control validate"
                                            required
                                            />
                                    </div>

                                    <div class="form-group mb-3">
                                        <label
                                            for="description"
                                            >Nội dung</label
                                        >
                                        <textarea
                                            id="description" class="form-control validate"
                                            rows="3" name="description"
                                            required
                                            ></textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Tác giả
                                        </label>
                                        <input
                                            id="author"
                                            name="author"
                                            type="text" maxlength="30"
                                            class="form-control validate"
                                            required
                                            />
                                    </div>
                            </div>
                         
                            
                        <div class="col-12">
                            <input type="hidden" value="insertblog" name="do"> 
                            <button type="submit"  class="btn btn-primary btn-block text-uppercase" onclick="Add()">Thêm tin tức</button>
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
                                    $("#expire_date").datepicker();
                                });
    </script>
</body>
</html>