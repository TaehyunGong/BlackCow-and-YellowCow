<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="javax.mail.Transport"%>

<%@ page import="javax.mail.Message"%>

<%@ page import="javax.mail.Address"%>

<%@ page import="javax.mail.internet.InternetAddress"%>

<%@ page import="javax.mail.internet.MimeMessage"%>

<%@ page import="javax.mail.Session"%>

<%@ page import="com.kh.Semi.mail.controller.SMTPAuthenticator"%>

<%@ page import="javax.mail.Authenticator"%>

<%@ page import="java.util.Properties"%>



<%
	request.setCharacterEncoding("utf-8");






	String from = request.getParameter("from");

	String to = request.getParameter("email");

	String subject = request.getParameter("subject");

	String content = request.getParameter("content");

	//입력값 받음

	Properties p = new Properties(); //정보를 담을 객체

	p.put("mail.smtp.host", "smtp.gmail.com");

	p.put("mail.smtp.starttls.enable", " true");

	p.put("mail.smtp.auth", "true");

	p.put("mail.smtp.debug", "true");

	p.put("mail.smtp.socketFactory.port", "465");

	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

	p.put("mail.smtp.socketFactory.fallback", "false");

	try {

		Authenticator auth = new SMTPAuthenticator();

		Session ses = Session.getInstance(p, auth);

		ses.setDebug(true);

		MimeMessage msg = new MimeMessage(ses);

		msg.setSubject(subject);

		Address fromAddr = new InternetAddress(from);

		msg.setFrom(fromAddr);

		Address toAddr = new InternetAddress(email);

		msg.addRecipient(Message.RecipientType.TO, toAddr);//받는 사람

		msg.setContent(content,"text/html;charset=UTF-8"); 

		Transport.send(msg);//전송

	} catch (Exception e) {

		e.printStackTrace();

		out.println("<script>alert('Send mail Failed..');history.back();</script>");

		return;

	}

	out.println("<script>alert('Send Mail Success!!');location.href='mailForm.html';</script>");
%>