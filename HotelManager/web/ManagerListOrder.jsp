
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Admin</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style_3.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Roboto', sans-serif;
                position: relative;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 10px;
                margin: 0 0 10px;
                min-width: 100%;
            }
            .table-title h2 {
                margin: 8px 0 0;
                font-size: 22px;
            }
            .search-box {
                position: relative;        
                float: right;
            }
            .search-box input {
                height: 34px;
                border-radius: 20px;
                padding-left: 35px;
                border-color: #ddd;
                box-shadow: none;
            }
            .search-box input:focus {
                border-color: #3FBAE4;
            }
            .search-box i {
                color: #a0a5b1;
                position: absolute;
                font-size: 19px;
                top: 8px;
                left: 10px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child {
                width: 130px;
            }
            table.table td a {
                color: #a0a5b1;
                display: inline-block;
                margin: 0 5px;
            }
            table.table td a.view {
                color: #03A9F4;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #E34724;
            }
            table.table td i {
                font-size: 19px;
            }    
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 95%;
                width: 30px;
                height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 30px !important;
                text-align: center;
                padding: 0;
            }
            .pagination li a:hover {
                color: #666;
            }	
            .pagination li.active a {
                background: #03A9F4;
            }
            .pagination li.active a:hover {        
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 6px;
                font-size: 95%;
            }
            .selectStatus{
                position: fixed;
                top:117px;
                right: 20px;

            }
            .managerPro{
                position: absolute;
                top:10px;
                left:10px;
                color: black;
                text-decoration: underline;
                list-style: circle inside;
            }
            .managerCus{
                position: absolute;
                top:45px;
                left:10px;
                color: black;
                text-decoration: underline;
                list-style: circle inside;
            }
            .but{
                border-radius: 5px;
            }
            .but:hover{
                transform: scale(0.98);
            }
            .log-out{
                border-radius: 5px;
                background-color: #F1BC31;
                margin-right: 20px;
            }
            .log-out:hover{
                transform: scale(0.98);
            }
        </style>
    </head>
    <body>
        <%
            /*if(session.getAttribute("admin")==null){
                response.sendRedirect("ControllerLogin_Admin");
            }else{
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
            Vector<OrderList> vector = (Vector<OrderList>) request.getAttribute("list");
            DAOOrders dao = new DAOOrders();
            String status = "";*/
        %>
        <section class="ftco-section">
            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container">
                    <span class="admin"></i>Admin</span>
                    <form action="ControllerLogin_Admin?do=logout" method="post">
                        <button type="submit" name="log-out" class="log-out">Log Out</button>
                    </form>
                    <form action="ControllerOrder?do=search" method="post" class="searchform order-lg-last">
                        <div class="form-group d-flex">
                            <input name="oid" type="text" class="form-control pl-3" placeholder="SearchOrderID">
                            <button type="submit" placeholder="" class="form-control search"><span class="fa fa-search"></span></button>
                        </div>
                    </form>
                    <div class="collapse navbar-collapse" id="ftco-nav">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item "><a href="ControllerProduct" class="nav-link">Manager<br>Products</a></li>
                            <li class="nav-item active"><a href="ControllerOrder" class="nav-link">Manager<br>ListOrders</a></li>
                            <li class="nav-item "><a href="ControllerCustomer" class="nav-link">Manager<br>Customers</a></li>
                        </ul>
                    </div>
                    <form action="ControllerOrder?do=orderdate" method="post" class="searchform order-lg-last">
                        <div class="form-group d-flex">
                            From:<input name="from" type="date" class="form-control pl-3" placeholder="from" value="">
                            To:<input name="to" type="date" class="form-control pl-3" placeholder="to" value="">
                            <button type="submit" placeholder="" class="form-control search"><span class="fa fa-search"></span></button>
                        </div>
                    </form>                    
                </div>
            </nav>                                        
        </section>
        <form class="selectStatus"  action="ControllerOrder" method="post">
            <input type="hidden" name="do" value="SelectStatus">           
            <select name="status" style="font-size: 17px; font-weight: bold; margin-left: 30px">
                <option value="1">New</option>
                <option value="2">Process</option>
                <option value="3">Done</option>
            </select>  
            <input class="but" value="Select" type="submit" name="submit">                                    
        </form> 
        <div class="table-wrapper">
            <table class="table table-striped table-hover table-bordered">
                <thead>
                    <tr>
                        <th>OrderID</th>
                        <th>CustomerName</th>
                        <th>OrderDate</th>
                        <th>EmployeeName</th>
                        <th>ShippedDate</th>
                        <th>Status</th>
                        <th>OrderDetail</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <%
                          /*switch (or.getStatus()) {
                                case 1: {
                                    status = "New";
                                    break;
                                }
                                case 2: {
                                    status = "Process";
                                    break;
                                }
                                case 3: {
                                    status = "Done";
                                    break;
                                }
                            }*/
                        %>
                        <td style="font-weight: boder;font-size: 17px" 
                            style="font-weight: bolder;font-size: 17px"
                            style="font-weight: bold;font-size: 20px">
                        </td>
                        <td style="width:50px;">
                            <a href="ControllerOrder?do=Orderdetail&oid=&status=" class="view" title="Detail" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
                            <!--<a href="#" class="edit" title="Update" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>-->
                            <!--<a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>-->
                        </td>                        
                    </tr> 
                    <%//}%>
                </tbody>
            </table>
        </div> 
        <%//}%>
    </body>
</html>