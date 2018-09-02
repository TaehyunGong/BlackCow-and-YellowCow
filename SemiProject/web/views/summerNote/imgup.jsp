
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*"%>
<%@ page import="java.sql.*"%>

<%
 request.setCharacterEncoding("UTF-8");
 String realFolder = "";
 String filename1 = "";
 int maxSize = 1024*1024*5;
 String encType = "UTF-8";
 String savefile = "img";
 ServletContext scontext = getServletContext();
 realFolder = scontext.getRealPath(savefile);
 
 try{
  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

  Enumeration<?> files = multi.getFileNames();
     String file1 = (String)files.nextElement();
     filename1 = multi.getFilesystemName(file1);
 } catch(Exception e) {
  e.printStackTrace();
 }
 
 String fullpath = realFolder + "\\" + filename1;

 System.out.println("경로 : " +fullpath);
 System.out.println("경로2 : " + request.getContextPath()+"/img/" + filename1);
 String path2 = request.getContextPath()+"/img/" + filename1;

 
/*  File f = new File(fullpath);
 
 System.out.println("파일경로 : " + fullpath);
 
 System.out.println("파일존재 : " + f.exists());
 
 if(f.exists()){
	 System.out.println("파일삭제 ");
	 f.delete();
 } */
 
 
%>

<title>Insert title here</title>
</head>
<%-- <form method="post" enctype="multipart/form-data" action="delete.jsp">
	<input type="hidden" name="fileUrl" value="<%= %>">
	<input type="submit" value="삭제"><br><br>
</form> --%>
<body>
	<img src=<%=path2 %> width=512 height=384></img>
	<form name="form1"method="post" accept-charset="UTF-8" action="delete.jsp">
		<input type="hidden" name="fileUrl" value="<%=fullpath %>"/>
		<p><%=fullpath %></p>
		<input type="button" value="삭제" onclick="incoding();">삭제</input>
	</form>
	<script>
		function incoding(){
			
			var frm =document.form1;
			frm.acceptCharset = 'utf-8';
	        if(document.all)document.charset = 'utf-8'; // 익스플로러에서는 이렇게 해줘야 됩니다. (버그성 이라고 하네여)
	        frm.submit();
			
	        // 폼 전송을 새창으로 했을경우 기존 문자셋으로 되돌려 놓기 위한 처리입니다.
	        frm.acceptCharset = 'euc-kr';
	        if(document.all)document.charset = 'euc-kr';
		}
	
	
	</script>

</body>
</html>





