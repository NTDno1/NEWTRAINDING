
<%@page import="entity.Account"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.impl.MessageDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<html>
    <head>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"s
    </head>
    <style>
        body{
            background-image: url("images/chat.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }

        .container{max-width:1170px; margin:auto;}
        img{ max-width:100%;}
        .inbox_people {
            background: #f8f8f8 none repeat scroll 0 0;
            float: left;
            overflow: hidden;
            width: 40%; border-right:1px solid #c4c4c4;
        }
        .inbox_msg {
            background-color: white;
            position: fixed;
            right: 30px;
            bottom: 40px;
            border: 1px solid #c4c4c4;
            clear: both;
            overflow: hidden;
            width: 550px;
            height: 600px;
        }
        .top_spac{ margin: 20px 0 0;}


        .recent_heading {float: left; width:30%;}
        .srch_bar {
            display: inline-block;
            text-align: left;
            width: 100%;
        }
        .headind_srch{ padding:10px 10px 10px 10px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

        .recent_heading h4 {
            color: #05728f;
            font-size: 21px;
            margin: auto;
        }
        .srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:100%; padding:2px 0 4px 6px; background:none;}
        .srch_bar .input-group-addon button {
            background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
            border: medium none;
            padding: 0;
            color: #707070;
            font-size: 18px;
        }
        .srch_bar .input-group-addon { margin: 0 0 0 -27px;}

        .chat_ib h5{ 
            font-size:12px; 
            color:#464646; 
            margin:0 0 8px 0;
            position: absolute;
            left: 40px;
            top: 12px;
        }
        .chat_ib h5 span{ font-size:11px; float:right;}
        .chat_ib p{ font-size:12px; color:#989898; margin:auto}
        .chat_img {    
            float: left;
            width: 10%;
        }
        .chat_ib {
            float: left;
            padding: 0 0 0 15px;
            width: 88%;
        }

        .chat_people{overflow:hidden; clear:both;}
        .chat_list {
            position: relative;
            border-bottom: 1px solid #c4c4c4;
            margin: 0;
            padding: 10px 10px 10px;
        }
        .chat_list:hover{
            background:#ebebeb;
        }
        .inbox_people{
            width: 185px;
        }
        .inbox_chat { height: 550px; overflow-y: scroll;}

        .active_chat{ background:#ebebeb;}
        .chat_img{
            width: 25px;
            height: 25x;
        }
        .chat_img img{
            width: 25px;
            height: 25px;
        }
        .incoming_msg{
            display: inline-block;
            width: 100%;
        }
        .incoming_msg_img{
            display: inline-block;
            width: 6%;
        }
        .received_msg {
            display: inline-block;
            padding: 0 0 0 10px;
            vertical-align: top;
            width: 92%;
        }
        .received_withd_msg p {
            background: #ebebeb none repeat scroll 0 0;
            border-radius: 8px;
            color: #646464;
            font-size: 15px;
            margin: 0;
            padding: 5px 10px 5px 12px;
            width: 140%;
        }
        .time_date {
            color: #747474;
            display: block;
            font-size: 12px;
            margin: 8px 0 0;
        }
        .received_withd_msg { width: 57%; margin-top: 7px;margin-bottom: 7px;}
        .mesgs {
            float: left;
            padding: 30px 15px 0 25px;
            width: 60%;
            background-color: white;
        }

        .sent_msg p {
            background: #05728f none repeat scroll 0 0;
            border-radius: 8px;
            font-size: 15px;
            margin: 0; color:#fff;
            padding: 5px 10px 5px 12px;
            width:100%;
        }
        .outgoing_msg{ overflow:hidden; margin:10px 0 10px;}
        .sent_msg { 
            margin-bottom: 1px;
            margin-right: 25px;
            float: right;
            width: 60%;
        }
        .input_msg_write input {
            background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
            border: medium none;
            color: #4c4c4c;
            font-size: 15px;
            min-height: 48px;
            width: 120%;
        }

        .type_msg {
            position: fixed; 
            bottom: 45px;
            right: 90px;
            width: 300px;

        }
        .msg_send_btn {
            background: #05728f none repeat scroll 0 0;
            border: medium none;
            border-radius: 50%;
            color: #fff;
            cursor: pointer;
            font-size: 17px;
            height: 33px;
            position: absolute;
            right: -47px;
            bottom: 5px;
            width: 33px;
        }
        .butonmess{
            position: fixed;
            right: 53px;
            bottom: 58px;
        }
        .messaging { padding: 0 0 50px 0;}
        .msg_history {
            height: 516px;
            overflow-y: auto;
            width: 122%;
        }
        .chat_list:hover{
            cursor: pointer;
        }

        .slogan{
            position: fixed;
            top:30px;
            right: 150px;
            color: white;
        }
        .hh{
            position: fixed;
            top:10px;
            left: 120px;
            color: white;
        }
    </style>
    <body>
        <%
            MessageDAOImpl dao = new MessageDAOImpl();
            Account a = (Account) session.getAttribute("login");
            int userID = (int)a.getAccountID();
            ResultSet rs1 = (ResultSet) dao.getData("select distinct AccountID from Message where RoomID=0");
            int aid = (int) Integer.parseInt(request.getAttribute("accountid").toString());
            ResultSet rs = (ResultSet) dao.getData("select * from Message where AccountID=" + aid);
        %>
        <script>
            var messageBody = document.querySelector('#messageBody');
            messageBody.scrollTop = messageBody.scrollHeight - messageBody.clientHeight;
        </script>
        <h2 class="slogan">Tư vấn khách hàng</h2>

        <h2 class="mb-0 site-logo hh"><a href="HomeController">Hoang Hon</a></h2>
        <div class="container">
            <div class="messaging">
                <% if (a.getRoleID() == 1) {%>
                <div class="inbox_msg">
                    <div class="inbox_people">
                        <div class="headind_srch">
                            <div class="srch_bar">
                                <div class="stylish-input-group">
                                    <input type="text" class="search-bar"  placeholder="Search" >
                                    <span class="input-group-addon">
                                        <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                                    </span> </div>
                            </div>
                        </div>
                        <div class="inbox_chat">
                            <div class="chat_list active_chat">
                                <div class="chat_people">
                                    <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                    <div class="chat_ib">
                                        <h5>Nhan vien tu van</h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mesgs">
                        <div class="msg_history">
                            <div id="boxchat">
                            <%while (rs.next()) {
                            %>
                            <%if (rs.getString(7).equals("outgoing_msg")) {%>
                            <div class="incoming_msg">             
                                <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>              
                                <div class="received_msg">
                                    <div class="received_withd_msg">
                                        <p><%=rs.getString(6)%></p>
                                        <span style="font-size: 12px;" class="time_date"><%=rs.getString(5)%></span>
                                    </div>                         
                                </div>
                            </div>
                            <% } else if (rs.getString(7).equals("incoming_msg")) {%>
                            <div class="outgoing_msg">
                                <div class="sent_msg">
                                    <p><%=rs.getString(6)%></p>
                                    <span style="font-size: 12px;" class="time_date"><%=rs.getString(5)%></span>
                                </div>
                            </div> 
                            <% }
                                }%>
                            </div>
                                <div class="type_msg">
                                    <div class="input_msg_write">
                                         <input id="RepGetUserId" type="hidden" value="<%=aid%>">
                                        <input id="textMessage" type="text" name="message" class="write_msg" placeholder="Type a message" value=""/>
                                        <button class="msg_send_btn" onclick="sendMessage()"><i class="fa fa-paper-plane-o butonmess" aria-hidden="true"></i></button>
                                    </div>
                                </div>                          
                        </div>
                    </div>                        
                </div>
                <% } else {%>
                <div class="inbox_msg">
                    <div class="inbox_people">
                        <div class="headind_srch">
                            <div class="srch_bar">
                                <form action="MessageController?do=SearchChatCustomer" method="post">
                                    <div class="stylish-input-group">
                                        <input type="text" class="search-bar" name="name" placeholder="Search" value="">
                                        <span class="input-group-addon">
                                            <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                                        </span> </div>
                                </form>
                            </div>
                        </div>
                        <div class="inbox_chat" id="MenuCus">
                            <%if (request.getAttribute("found") == null) {%>
                            <% while (rs1.next()) {
                                    ResultSet rs2 = (ResultSet) dao.getData("select u.* from Account a join [User] u on a.AccountID=u.AccountID where a.AccountID=" + rs1.getInt(1));
                                    while (rs2.next()) {
                                        if (rs1.getInt(1) == aid){%>
                            <a href="MessageController?do=Chat_people&accountid=<%=rs1.getInt(1)%>">                               
                                <div class="chat_list active_chat">
                                    <div class="chat_people">
                                        <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                        <div class="chat_ib">
                                            <h5><%=rs2.getString(3)%></h5>
                                            <%boolean check=false;
                                                ResultSet rs5 =dao.getData("select * from Message where AccountID="+rs1.getInt(1)+" and MessageTo='1'");
                                            while (rs5.next()) { 
                                                check=true;
                                            }
                                            if(check){
                                            %>
                                            <span>*</span>
                                            <% }%>
                                        </div>
                                    </div>
                                </div>            
                            </a>
                            <% } else {%>
                            <a href="MessageController?do=Chat_people&accountid=<%=rs1.getInt(1)%>">                               
                                <div class="chat_list">
                                    <div class="chat_people">
                                        <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                        <div id="<%=rs1.getString(1)%>" class="chat_ib">
                                            <!--<h5 style="font-weight: bold;font-size:14px;"></h5>-->
                                            <h5><%=rs2.getString(3)%></h5>
                                            <%boolean check=false;
                                                ResultSet rs5 =dao.getData("select * from Message where AccountID="+rs1.getInt(1)+" and MessageTo='1'");
                                            while (rs5.next()) { 
                                                check=true;
                                            }
                                            if(check){
                                            %>
                                            <span>*</span>
                                            <% }%>
                                        </div>
                                    </div>
                                </div>       
                            </a>
                            <% }
                                    }
                                }
                            } else {
                                ResultSet rs4 = (ResultSet) request.getAttribute("rs");
                                while (rs4.next()) {
                            %>
                            <a href="MessageController?do=Search_Chat_people&accountid=<%=rs4.getInt(2)%>">                               
                                <div class="chat_list">
                                    <div class="chat_people">
                                        <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                        <div class="chat_ib">
                                            <h5><%=rs4.getString(3)%></h5>
                                        </div>
                                    </div>
                                </div>            
                            </a>
                            <% }
                                }%>
                        </div>
                    </div>
                    <div class="mesgs">
                        <div class="msg_history">
                            <div id="boxchat">
                            <% while (rs.next()) {
                                    if (rs.getString(7).equals("incoming_msg")) {%>
                            <div class="incoming_msg">             
                                <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>              
                                <div class="received_msg">
                                    <div class="received_withd_msg">
                                        <p><%=rs.getString(6)%></p>
                                        <span style="font-size: 12px;" class="time_date"><%=rs.getString(5)%></span>
                                    </div>                         
                                </div>
                            </div>
                            <% } else if (rs.getString(7).equals("outgoing_msg")) {%>
                            <div class="outgoing_msg">
                                <div class="sent_msg">
                                    <p><%=rs.getString(6)%></p>
                                    <span style="font-size: 12px;" class="time_date"><%=rs.getString(5)%></span>
                                </div>
                            </div> 
                            <% }
                                } %>
                              </div>
                            <%if (request.getAttribute("found") == null) {%>
                                <div class="type_msg">
                                    <div class="input_msg_write">
                                         <input id="RepGetUserId" type="hidden" value="<%=aid%>">
                                        <input id="textMessage" type="text" name="message" class="write_msg" placeholder="Type a message" value=""/>
                                        <button class="msg_send_btn" onclick="sendMessage()"><i class="fa fa-paper-plane-o butonmess" aria-hidden="true"></i></button>
                                    </div>
                                </div>
                            <% } else {%>
                                <div class="type_msg">
                                    <div class="input_msg_write">
                                        <input id="RepGetUserId" type="hidden" value="<%=aid%>">
                                        <input id="textMessage" type="text" name="message" class="write_msg" placeholder="Type a message" value=""/>
                                        <button class="msg_send_btn" onclick="sendMessage()"><i class="fa fa-paper-plane-o butonmess" aria-hidden="true"></i></button>
                                    </div>
                                </div>
                            <% }%>
                        </div>
                    </div> 
                </div>
                <% }%>
            </div>
        </div>
            <script type="text/javascript">
                var userID = "<%=userID%>";
                var aid = "<%=aid%>";
                var x = location.origin;
                console.log(x);
                loca = x.split("//");
                var websocket = new WebSocket("ws://"+loca[1]+"/HotelManager/ChatSocket");
				websocket.onopen = function(message) {processOpen(userID+" "+aid);};
				websocket.onmessage = function(message) {processMessage(message);};
				websocket.onclose = function(message) {processClose(message);};
				websocket.onerror = function(message) {processError(message);};

			function processOpen(message) {    
                             websocket.send(message);                           
			}
			function processMessage(message) {
                            if(message.data.length<19){
                                myArray = message.data.split(" ");
                                document.getElementById(myArray[0]).insertAdjacentHTML('beforeend', myArray[1]);
                            }else if(message.data.length>805){
                                document.getElementById("MenuCus").insertAdjacentHTML('beforeend', message.data);
                            }else{
                                document.getElementById("boxchat").insertAdjacentHTML('beforeend', message.data);
                            }                           
			}
			function processClose(message) {
			}
			function processError(message) {
			}

			function sendMessage() {
				if (typeof websocket != 'undefined' && websocket.readyState == WebSocket.OPEN) {
					websocket.send(textMessage.value);
					textMessage.value = "";
				}
			}
            </script>
            
            
            
    </body>
</html>