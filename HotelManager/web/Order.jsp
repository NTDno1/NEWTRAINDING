
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Bootstrap Simple Data Table</title>
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
                position: absolute;
                top:20px;
                right: 20px;
            }
            .but{
                border-radius: 5px;
            }
            .but:hover{
                transform: scale(0.98);
            }
            .listorder h3{
                font-size: 17px;
            }
        </style>
    </head>
    <body>
        <%
//            DAOCustomers dao = new DAOCustomers();
//            Vector<OrderProduct> vector = (Vector<OrderProduct>) request.getAttribute("list");
//            String status = (String) request.getAttribute("status");
//            String oid = (String) request.getAttribute("oid");
//            int o = Integer.parseInt(oid);
//            ResultSet rs = dao.getData("select p.ProductID,p.ProductName,od.Quantity,p.UnitPrice from [Order Details] od join Products p on od.ProductID=p.ProductID where OrderID=" + o);
//            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
//            int total = 0;
//            for (OrderProduct or : vector) {
//                String strDate = formatter.format(or.getOrderDate());
//                String strDate1 = formatter.format(or.getShippedDate());
        %>
        <section class="ftco-section">
            <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
                <div class="container">
                    <span class="admin"></i>Admin</span>
                    <form action="#" class="searchform order-lg-last">
                        <div class="form-group d-flex">
                            <input type="text" class="form-control pl-3" placeholder="Search">
                            <button type="submit" placeholder="" class="form-control search"><span class="fa fa-search"></span></button>
                        </div>
                    </form>
                    <div class="collapse navbar-collapse" id="ftco-nav">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item "><a href="ControllerProduct" class="nav-link">Manager<br>Products</a></li>
                            <li class="nav-item "><a href="ControllerOrder" class="nav-link">Manager<br>ListOrders</a></li>
                            <li class="nav-item "><a href="ControllerCustomer" class="nav-link">Manager<br>Customers</a></li>
                            <li class="nav-item active"><a href="#" class="nav-link">OrderID<br><%//=o%></a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </section>
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-8" style="font-size:15px;">
                        <h2><a href="ControllerOrder" style="color:black;"><b>Order</b></a></h2>
                        <br>
                        <div class="listorder" style="font-size:15px;">
                            <h3>OrderID: <%//=or.getOrderID()%></h3> 
                            <h3>CustomerName: <%//=or.getFirtName() + " " + or.getLastName()%></h3>
                            <h3>OrderDate: <%//=strDate%></h3>
                            <h3>ShipDate: <%//=strDate1%></h3>
                            <form action="ControllerOrder">
                                <input type="hidden" name="do" value="Orderdetail">
                                <input type="hidden" name="oid" value="<%//=o%>">
                                <h3>Status: <%//=or.getStatus()%>
                                    <select name="status" style="font-size: 17px; font-weight: bold; margin-left: 30px">
                                        <option value="1" <%//if (or.getStatus() == 1) {%>selected<%//}%>>New</option>
                                        <option value="2" <%//if (or.getStatus() == 2) {%>selected<%//}%>>Process</option>
                                        <option value="3" <%//if (or.getStatus() == 3) {%>selected<%//}%>>Done</option>
                                    </select>  
                                    <input value="Update" type="submit" name="submit">
                                </h3>                           
                            </form>                  
                            <h3>OrderStatus: <%//=status%></h3>
                            <%//break;
                                      //  }%>
                        </div>

                    </div>                   
                </div>
            </div>
            <table class="table table-striped table-hover table-bordered">
                <thead>
                    <tr>
                        <th>ProducID</th>
                        <th>ProductName</th>
                        <th>Quantity</th>
                        <th>UnitPrice</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <%//while (rs.next()) {%> 
                    <tr>
                        <td><%//= rs.getInt(1)%></td>
                        <td><%//= rs.getString(2)%></td>
                        <td><%//= rs.getInt(3)%></td>
                        <td><%//= rs.getDouble(4)%></td>
                        <td style='text-align: center'><%//=rs.getInt(3) * rs.getDouble(4)%></td>
                    </tr>
                    <% //total += rs.getInt(3) * rs.getDouble(4);
                        //}
                    %>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>Grand Total </td>
                        <td style='text-align: center'><%//=total%></td>
                    </tr> 
                </tbody>
            </table>
        </div> 
    </body>
</html>