<%-- 
    Document   : Filter
    Created on : Jun 7, 2022, 11:37:37 AM
    Author     : Minh Hieu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
        	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,700" rel="stylesheet">
    </head>
    <style>
        * {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        body {
            padding: 0;
            margin: 0;
        }

        #notfound {
            position: relative;
            height: 100vh;
        }

        #notfound .notfound {
            position: absolute;
            left: 50%;
            top: 50%;
            -webkit-transform: translate(-50%, -50%);
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
        }

        .notfound {
            max-width: 520px;
            width: 100%;
            text-align: center;
            line-height: 1.4;
        }

        .notfound .notfound-404 {
            height: 190px;
        }

        .notfound .notfound-404 h1 {
            font-family: 'Montserrat', sans-serif;
            font-size: 146px;
            font-weight: 700;
            margin: 0px;
            color: #232323;
        }

        .notfound .notfound-404 h1>span {
            display: inline-block;
            width: 120px;
            height: 120px;
            background-image: url('images/emoji.png');
            background-size: cover;
            -webkit-transform: scale(1.4);
            -ms-transform: scale(1.4);
            transform: scale(1.4);
            z-index: -1;
        }

        .notfound h2 {
            font-family: 'Montserrat', sans-serif;
            font-size: 22px;
            font-weight: 700;
            margin: 0;
            text-transform: uppercase;
            color: #232323;
        }

        .notfound p {
            font-family: 'Montserrat', sans-serif;
            color: #787878;
            font-weight: 300;
        }

        .notfound a {
            font-family: 'Montserrat', sans-serif;
            display: inline-block;
            padding: 12px 30px;
            font-weight: 700;
            background-color: #f99827;
            color: #fff;
            border-radius: 40px;
            text-decoration: none;
            -webkit-transition: 0.2s all;
            transition: 0.2s all;
        }

        .notfound a:hover {
            opacity: 0.8;
        }

        @media only screen and (max-width: 767px) {
            .notfound .notfound-404 {
                height: 115px;
            }
            .notfound .notfound-404 h1 {
                font-size: 86px;
            }
            .notfound .notfound-404 h1>span {
                width: 86px;
                height: 86px;
            }
        }

    </style>

    <body>
        <div id="notfound">
		<div class="notfound">
			<div class="notfound-404">
                            <h1>4<span></span>3</h1>
			</div>
                    <h2 style="color: red">Ối! Quyền truy cập bị Từ chối</h2>
                    <p style="font-size: 20px">Bạn không được phép đi qua trang web này !!!</p>
			<a href="HomeController">Quay trở về trang chủ.</a>
		</div>
	</div>
  

    </body>
</html>
