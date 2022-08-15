/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0                         First Deploy
 * 18/07/2022    1.0        HuyTQ            Comment
 *               1.1       
 */
package controller;

import dao.impl.AccountDAOImpl;
import dao.impl.MessageDAOImpl;
import dao.impl.UserDAOImpl;
import entity.Account;
import entity.Message;
import entity.User;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import jdk.nashorn.internal.ir.RuntimeNode;

@ServerEndpoint(value = "/ChatSocket")
/**
 * This class Message
 *
 * @author HuyTQ
 */
public class Chatbox {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods. Get and push message
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    static Set<Session> users = Collections.synchronizedSet(new HashSet<>());

    @OnOpen
    public void handleOpen(Session session) {
        users.add(session);
    }

    @OnMessage
    public void handleMessage(String message, Session userSession) throws IOException, Exception {
        message = message.trim();
        AccountDAOImpl Adao = new AccountDAOImpl();
        MessageDAOImpl Mdao = new MessageDAOImpl();
        UserDAOImpl Udao = new UserDAOImpl();
        ArrayList<Integer> listAc = Mdao.getAllAcccountMessage();
        LocalDateTime current = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        DateTimeFormatter formatter1 = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        String formatted = current.format(formatter);
        String date = current.format(formatter1);
        String username = (String) userSession.getUserProperties().get("username");
        if (!message.isEmpty()) {
            if (username == null) {
                userSession.getUserProperties().put("username", message);// Any user who sends a message will take it from the user
            } else {
                System.out.println(userSession.getUserProperties().get("username"));
                int aid = 0;
                int userid = 0;
                String s1 = username;
                String[] words = s1.split("\\s");
                /* get the userid and accountid of the user sending the message*/
                for (String w : words) {
                    userid = Integer.parseInt(w);
                    break;
                }
                for (String w : words) {
                    aid = Integer.parseInt(w);
                }
                int Roleid = Mdao.getRoleIDByUserId(userid);
                boolean exitAccount = false;
                for (Integer a : listAc) {
                    if (aid == a) {
                        exitAccount = true;
                        break;
                    }
                }
                User u = Udao.getUserByaID(aid);
                int countSession=0;
                for (Session session : users) {
                    countSession+=1;
                    int SessionAid = 0;
                    int SessionUserid = 0;
                    String ValueSS = "";
                    ValueSS = (String) session.getUserProperties().get("username");
                    String[] words1 = ValueSS.split("\\s");
                    /*get the userid and accountid of the user who is texting*/
                    for (String w : words1) {
                        SessionUserid = Integer.parseInt(w);
                        break;
                    }
                    for (String w : words1) {
                        SessionAid = Integer.parseInt(w);
                    }
                    String sent = "";
                    String revice = "";
                    if (SessionUserid == userid) { // push the message to the messenger
                        sent += "<div class=\"outgoing_msg\">\n"
                                + "                                <div class=\"sent_msg\">\n"
                                + "                                    <p>" + message + "</p>\n"
                                + "                                    <span style=\"font-size: 12px;\" class=\"time_date\">" + formatted + "</span>\n"
                                + "                                </div>\n"
                                + "                            </div>";
                        session.getBasicRemote().sendText(sent);
                    } else if (SessionAid == aid) { // push the message to the recipient
                        revice += "<div class=\"incoming_msg\">             \n"
                                + "                                <div class=\"incoming_msg_img\"> <img src=\"https://ptetutorials.com/images/user-profile.png\" alt=\"sunil\"> </div>              \n"
                                + "                                <div class=\"received_msg\">\n"
                                + "                                    <div class=\"received_withd_msg\">\n"
                                + "                                        <p>" + message + "</p>\n"
                                + "                                        <span style=\"font-size: 12px;\" class=\"time_date\">" + formatted + "</span>\n"
                                + "                                    </div>                         \n"
                                + "                                </div>\n"
                                + "                            </div>";
                        session.getBasicRemote().sendText(revice);
                    }
                    if (exitAccount && Mdao.getRoleIDByUserId(SessionUserid) == 2 && SessionAid != aid) {// Add message to database if the messager is on standby
                        if (Roleid == 1) {
                            Mdao.insertNewmessagecus(new Message(aid, date, message.trim()));
                        } else {
                            Mdao.insertMessageRe(new Message(aid, date, message));
                        }
                        session.getBasicRemote().sendText(aid + " " + "<span>*</span>");
                    }else if(exitAccount && Mdao.getRoleIDByUserId(SessionUserid) == 2 && SessionAid == aid) {// Add message to database if the messager is doing it alone
                        if (Roleid == 1) {
                            Mdao.insertMessageCus(new Message(aid, date, message.trim()));
                        } else {
                            Mdao.insertMessageRe(new Message(aid, date, message.trim()));
                        }
                    }
                    else if (!exitAccount && Mdao.getRoleIDByUserId(SessionUserid) == 2) {// Add message to database if the messager is new
                        if (Roleid == 1) {
                            Mdao.insertNewmessagecus(new Message(aid, date, message.trim()));
                        } else {
                            Mdao.insertMessageRe(new Message(aid, date, message.trim()));
                        }
                        if (Mdao.getRoleIDByUserId(userid) != 2) {
                            session.getBasicRemote().sendText("<a href=\"MessageController?do=Chat_people&accountid=" + aid + "\">                               \n"
                                    + "                                <div class=\"chat_list\">\n"
                                    + "                                    <div class=\"chat_people\">\n"
                                    + "                                        <div class=\"chat_img\"> <img src=\"https://ptetutorials.com/images/user-profile.png\" alt=\"sunil\"> </div>\n"
                                    + "                                        <div id=\"" + aid + "\" class=\"chat_ib\">\n"
                                    + "                                            <!--<h5 style=\"font-weight: bold;font-size:14px;\"></h5>-->\n"
                                    + "                                            <h5>" + u.getUserName() + "</h5>\n"
                                    + "                                            <span>*</span>\n"
                                    + "                                        </div>\n"
                                    + "                                    </div>\n"
                                    + "                                </div>       \n"
                                    + "                            </a>");
                        }
                    }
                }
                 if(countSession==1 && Mdao.getRoleIDByUserId(userid) == 1)Mdao.insertNewmessagecus(new Message(aid, date, message.trim()));
            }
        }
    }

    @OnClose
    public void handleClose(Session session) {
        users.remove(session);
    }

    @OnError
    public void handleError(Throwable t) {
        t.printStackTrace();
    }

}
