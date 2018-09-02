<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.footer-back p{
		text-align:center;
		font-size:20px;
		color:white;
	}
	.footer-back{
	 background-image: url("<%=request.getContextPath()%>/images/common/초원.jpg"); 
    height: 100px; 
    background-attachment: fixed;
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
	}
</style>
</head>
<body>
	
	<div class='footer-back'>
		<p>Copyright. All rights reserved</p>
	</div>

</body>
</html>