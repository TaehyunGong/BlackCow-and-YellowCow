package com.kh.Semi.mail.controller;



import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator{
 @Override
 protected PasswordAuthentication getPasswordAuthentication(){

  return new PasswordAuthentication("구글아이디","구글비번");
 }

}
