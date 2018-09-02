<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>
<%-- 	<%
	 File f = new File(fullpath);
	 
	 System.out.println("파일경로 : " + fullpath);
	 
	 System.out.println("파일존재 : " + f.exists());
	 
	 if(f.exists()){
		 System.out.println("파일삭제 ");
		 f.delete();
	 }
	
	%> --%>
<%
	String file = request.getParameter("fileUrl");
	File f = new File(file);
	
	System.out.println("파일경로 : " + file);
	
	System.out.println("파일존재 : " + f.exists());
	
	if(f.exists()){
		 System.out.println("파일삭제 ");
		 f.delete();
	}
%>
</head>
<body>
	<h1>delete</h1>

	<p><%= request.getParameter("fileUrl") %></p>
	<p><%= file %></p>
</body>
</html>