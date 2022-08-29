package com.root.emr.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		
		return "home";
	}
	
	
	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping(value="/mail")
	public String mailSender(HttpServletRequest request) throws AddressException, MessagingException{
	     
	    String subject = (String) request.getParameter("subject");
	    String message = (String) request.getParameter("message");
	     
	    final String host = "smtp.naver.com";
	    final String accountId = "witchbloom";
	    final String accountPwd = "fnfnfn112";
	    final int port = 465;
	     
	    String receiver = "witchbloom@naver.com";
	    String sender = "witchbloom@naver.com";
	     
	    Properties props = System.getProperties();
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.port", port);
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.ssl.enable", "true");
	    props.put("mail.smtp.ssl.trust", host);
	    props.put("mail.smtp.ssl.protocols", "TLSv1.2");
	     
	    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
	        protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
	            return new javax.mail.PasswordAuthentication(accountId, accountPwd);
	        }
	    });
	    session.setDebug(true);
	     
	    Message mimeMessage = new MimeMessage(session);
	    mimeMessage.setFrom(new InternetAddress(sender));
	    mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver)); 
	     
	    mimeMessage.setSubject(subject);
	    mimeMessage.setText(message);
	    Transport.send(mimeMessage);
	    return "redirect:/";
	}

}
