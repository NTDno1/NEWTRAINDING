<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
	<html>
		<head>
  		  <title>
		    FeedBack</title>
                    
		  <link rel="stylesheet" href="css/bootstrap.min.css">
		  <script src="js/bootstrap.min.js"></script>
		  <script src="js/jquery-3.3.1.min.js"></script>
		  <link rel="stylesheet" href="Stylesheet.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		</head>
	<style>
	body{
		padding: 0px;
                margin: 0px;
                box-sizing: border-box;
                
}
#mail{
	border-radius:50%;
	height:40px;
	width:40px;
	}
#mail:hover{
	box-shadow:0 0 2px #000000;
	}
#phone{
	border-radius:50%;
	height:40px;
	width:40px;
}
#phone:hover{
	box-shadow:0 0 2px #000000;
}
#map{
	border-radius:50%;
	height:40px;
	width:40px;
	}
#map:hover{
	box-shadow:0 0 2px #000000;
	}


.contact-us{
	animation-name:contact-us;
	animation-duration:1s;
	margin-left:x;
	}
@keyframes contact-us{
	0%{ margin-left:-400px;}
	100%{}}
	
/*=========================================================Home page======================================*/	
#paragraph{
	position: absolute;
	opacity:1;
	text-align:center;
	margin-left:-1000px;
	background-color:#000;
	color:#FFF;
	opacity:1;
	transition:1s;
	padding:20px;
	font-family:calibri;
	font-size:20px;
	width:100%;
	height:500px;
	border:2px solid #fff;
	}
#homepics:hover #paragraph{ 
	background-color:#000;
	color:#FFF;
	opacity:.8;
	padding:20px;
	font-family:calibri;
	font-size:20px;
	width:80%;
	height:500px;
	margin-left:-20px;
	}

#last{
	height:300px;
	background-color:#CCC;
}
.ticket-front{
	transform: rotateY(0deg);
	transition:all 0.5s ease-in-out 0s;
	position:absolute;
}
.ticket-front:hover {
	transform: rotateY(90deg);
}
#ticket{
	background-color:#f1f1f1;
	height:500px;
	width:200px;
	position:relative;
	transform: rotateY(0deg);
	transition:all 0.5s ease-in-out 0s;


}
.box2{
	width:240px;
	position:relative;
	perspective:1000px;
	margin-left:20px;
	margin-top:20px;}	

.box2 .box-img{
	transform: rotateY(0deg);
	transition:all 0.5s ease-in-out 0s;
	position:absolute;

	}	
#form:hover .box-img{
	transform: rotateY(90deg);

	opacity:1;
	}	
.box2 .box-img2{
	transform: rotateY(-90deg);
	transition:all 0.5s ease-in-out 0s;
	position:absolute;
	}	
#form:hover .box-img2{
	transform: rotateY(0deg);

	}	
#pic{
	opacity:9.5;
}
.fbimg img{
    position: fixed;
    top: 10px;
    right: 20px;
    width: 730px;
    height: 500px;
}
.mota{
    position: fixed;
    top: 530px;
    right: 30px;
    width: 690px;
    height: 200px;
}
.hh{
                position: fixed;
                top:10px;
                left: 120px;
                color: white;
            }

</style>	
<body>
    <h2 class="mb-0 site-logo hh"><a href="HomeController">Hoang Hon</a></h2>
    <br><br><br>
        <div class="col-md-8" id ="mainform">          
            <div class="col-sm-8">
                <h2  class="contact-us" style="font-size:72px; color:#000;"><strong style="font-size:5cm; color:#555;">P</strong>hản hồi</h2>
            </div>
            <div class="col-sm-8" >
                <form action="UserController?do=Feedback&roomID=${requestScope.roomID}&aid=${requestScope.aid}" method="post">
                    <label><h4>Tên khách hàng:</h4> </label><input readonly="" type="text" size="20"  class=" form-control" value="<%=request.getAttribute("Fname")%>" />
                    <h4>Bình luận:</h4><textarea maxlength="200" id="cm" class="form-control" rows="6" name="commentfb"  placeholder="Bình luận của bạn" value="" required=""></textarea>
                    <br>
                    <input onclick="mess()" value="Gửi" type="submit" class="btn btn-info" id="btn" style="text-shadow:0 0 3px #000000; font-size:24px;">
                </form>
            </div>
        </div>
        <div class="fbimg">
            <img src="images/anhphong/${requestScope.img}">
            <div class="mota">
                <h4 style="text-align: center">Mô tả</h4>
                <p>${requestScope.describe}</p>
            </div>   
        </div>
            <script>
                function mess(){
                    var mess =document.getElementById("cm").value.trim();
                    if(mess!=""){
                        alert("Gửi feedback thành công!")
                    }else{
                        alert("Không để trống feedback!")
                    }
                }
            </script>
        </body>
</html>