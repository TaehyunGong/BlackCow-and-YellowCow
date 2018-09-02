<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String imp = request.getParameter("imp_uid");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  	<!-- 환불 페이지 관리자+마이페이지에 적용요망 -->
  	<button onclick='cencel()'>제거!</button>
  	
  	<script>
  		function cencel(){
  			location.href="<%=request.getContextPath()%>/paymentCencel?imp=imp_889495846146";
  		}
  	</script>
  
</body>
</html>