
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
         <c:forEach items="${listcomment1}" var="list">
             <div style="width:1500px;" onmouseover="mouseOver(${list.commentId})" onmouseout="mouseOut(${list.commentId})" class="be-comment">
                        <div class="be-img-comment">	
                            <a href="blog-detail-2.html">
                                <img  src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="be-ava-comment">
                            </a>
                        </div>
                        <div class="be-comment-content">

                            <span class="be-comment-name">
                                <a href="blog-detail-2.html">${list.username}</a>
                            </span>

                            <input type="hidden" value="${list.commentId}" id="blogid" name="commentid"/>  
                            <form id="myform3${list.commentId}" name="myform3${list.commentId}"> 
                                <input id="myInput${list.commentId}" value="${list.content}"style="width:1300px; display: inline-block;background-color: #DCDCDC;"id="content3" maxlength="50" readonly="" name="content3" class="be-comment-text">

                                <div style="display: inline-block;"class="nav-item dropdown">
                                    <a href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                       aria-haspopup="true" aria-expanded="false">

                                        <div id="edit${list.commentId}">
                                            <c:if test="${list.username eq sessionScope.user}">  
                                                <span>   
                                                    <i class="fa fa-bars"></i>
                                                </span> 
                                            </c:if> 
                                        </div>
                                    </a>


                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">


                                        <input type="hidden" value="${list.commentId}" id="commentidd${list.commentId}" name="commentidd"/>
                                        <input type="hidden" value="${list.blogid}" id="blogidd" name="blogidd"/>  

                                        <a style="margin-bottom: 2px;"class="dropdown-item" onclick="Update1(${list.commentId})">Chỉnh sửa</a>
                                        </form>
                                        <form style="height: 10px;" id="myform2${list.commentId}" name="myform2${list.commentId}"> 
                                            <input type="hidden" value="${list.commentId}" id="blogid" name="commentid"/>
                                            <input type="hidden" value="${list.blogid}" id="blogid1" name="blogid1"/>  

                                            <a style="margin-top: 2px;" class="dropdown-item"  onclick="Delete1(${list.commentId})"  >Xóa</a>
                                        </form>
                                    </div>
                                </div>
                                <div style="float: left;" class="be-comment-time">
                                   
                                        <div style="float: right;text-align: center; ">
                                            <i class="fa fa-clock-o"></i>
                                            ${list.date}
                                        </div>

                                      
                                        <c:if test="${list.username eq sessionScope.user}">  
                                            <input id="myButton${list.commentId}" style="display: inline-block;float: right;border-style: none;font-size:10px;background-color: white;font-family: inherit;font-weight: bold;" class="fa-pencil-square" type="button" value="Sửa" onclick="Readonly(${list.commentId})">
                                            <input id="back${list.commentId}" style="display: none;float: right;border-style: none;font-size:10px;background-color: white;font-family: inherit;font-weight: bold;" class="fa-pencil-square" type="button" value="Quay lại" onclick="Removereadonly(${list.commentId})">
                                        </c:if>
                                    
                                </div>
                                        <br>
                            
                        </div>
                    </div>

            </c:forEach>
                        </body>
                      
                        </html>
