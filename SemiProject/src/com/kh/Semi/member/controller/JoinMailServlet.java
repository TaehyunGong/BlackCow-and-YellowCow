package com.kh.Semi.member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.Semi.member.model.service.MemberService;
import com.kh.Semi.member.model.vo.Member;

@WebServlet("/joinMail.me")
public class JoinMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinMailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		
		Member m = new Member();
		m = new MemberService().checkEmail(email);
		
		//기존 회원 여부 확인
		if(m != null){
			response.getWriter().println(2);
		}else{
			
			String authenticationNum = randomStr();
			String subject = "우리두레이야기 회원가입 인증번호";
			String text = "우리두레이야기에 오신 것을 환영합니다."
	                + "\n회원님의 개인정보보호를 위해 이메일 인증을 거쳐 회원가입이 이뤄집니다."
		            + "\n아래의 인증번호를 회원가입 입력창에 입력하시면 가입이 완료됩니다."
	                //+ "\n인증번호 입력 유효시간이 만료된 경우, 인증번호 재발송을 요청해주세요."
		            + "\n[인증번호 : " + authenticationNum + "]";
			
			String username = "yeonyzzzang@gmail.com";
		    String password = "semiproject1";
		    
		   
		    
			Properties props = new Properties(); 
			
		        props.put("mail.smtp.user",username); 
		        props.put("mail.smtp.password", password);
		        props.put("mail.smtp.host", "smtp.gmail.com"); 
		        props.put("mail.smtp.port", "25"); 
		        props.put("mail.debug", "true"); 
		        props.put("mail.smtp.auth", "true"); 
		        props.put("mail.smtp.starttls.enable","true"); 
		        props.put("mail.smtp.EnableSSL.enable","true");
		        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
		        props.setProperty("mail.smtp.socketFactory.fallback", "false");   
		        props.setProperty("mail.smtp.port", "465");   
		        props.setProperty("mail.smtp.socketFactory.port", "465"); 
		    
		        Session session = Session.getInstance(props, new javax.mail.Authenticator() { 
		        protected PasswordAuthentication getPasswordAuthentication() { 
		        return new PasswordAuthentication(username, password); 
		        }});
		        System.out.println("??");
		        try{
		            Message message = new MimeMessage(session); 
		            message.setFrom(new InternetAddress(username));// 
		            message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(email)); 
		            message.setSubject(subject);
		            message.setText(text);
		            Transport.send(message); 
		            System.out.println("SEND");
		            
		            
		        } catch(Exception e){
		            e.printStackTrace();
		        }
		        
			response.getWriter().println(authenticationNum);
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

	public static String randomStr(){ 
	      char strCollection[] = new char[] { 
	                        '1','2','3','4','5','6','7','8','9','0', 
	                        'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z', 
	                        'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z', 
	                        '!','@','#','$','%','^','&','*','(',')'};

	      String ranStr = ""; 

	      for (int i = 0; i < 10; i++) { 
	        int selectRandomStr = (int)(Math.random()*(strCollection.length));
	        ranStr += strCollection[selectRandomStr]; 
	      } 
	      
	    return ranStr; 
	  } 

}
