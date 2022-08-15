/*
 * Copyright (C) 2022, FPT University
 * SWP391 - SE1615 - Group3
 * HotelManager
 *
 * Record of change:
 * DATE          Version    Author           DESCRIPTION
 *               1.0        HieuLBM          First Deploy
 * 13/07/2022    1.0        HieuLBM          Comment
 */
package util;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

/**
 * @author HieuLBM
 */
public class SendMail {

    /* email */
    final String fromEmail = "hieulbmhe151429@fpt.edu.vn";
    /* password */
    final String password = "Lebaminhhieu1!";

    /**
     * Blank Constructor
     */
    public SendMail() {
    }

    /**
     * @return email
     */
    public String getFromEmail() {
        return fromEmail;
    }

    /**
     * @return password
     */

    public String getPassword() {
        return password;
    }

    public void send(String to, String sub,
            String message1, final String user, final String pass) {
        //create an instance of Properties Class   
        Properties props = new Properties();

        /* Specifies the IP address of your default mail server
     	   for e.g if you are using gmail server as an email sever
           you will pass smtp.gmail.com as value of mail.smtp host. 
           As shown here in the code. 
           Change accordingly, if your email id is not a gmail id
         */
        props.put("mail.smtp.host", "smtp.gmail.com");//SMTP Host
        //below mentioned mail.smtp.port is optional
        props.put("mail.smtp.port", "587");//TLS Port
        props.put("mail.smtp.auth", "true");//enable authentication
        props.put("mail.smtp.starttls.enable", "true");//enable STARTTLS

        /* Pass Properties object(props) and Authenticator object   
           for authentication to Session instance 
         */
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {

            /* Create an instance of MimeMessage, 
 	      it accept MIME types and headers 
             */
            MimeMessage MMessage = new MimeMessage(session);
            MMessage.setFrom(new InternetAddress(user));
            MMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            MMessage.setSubject(sub);
            MMessage.setContent(MMessage, "text/html");
            MMessage.addHeader("Content-type", "text/HTML; charset=UTF-8");
            MMessage.setSubject(sub, "UTF-8");
            MMessage.setText(message1, "UTF-8");

            /* Transport class is used to deliver the message to the recipients */
            Transport.send(MMessage);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

}
