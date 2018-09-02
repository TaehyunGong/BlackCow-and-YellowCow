<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/pushy-buttons.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/payment/paymentResult.css">
<title>결제 완료</title>
</head>
<body>
	<%@ include file='../common/navbar.jsp' %> 
	<div class="topArea col-lg-12 col-md-12 col-sm-12 col-xs-12">
	   <br>
	      <h1 id="topText">결제 완료</h1>
	      <h4 id="subText">감사합니다.</h4>
   </div>
   
   <div class='result-main'>
   		<h1 class='result-title'>
   			구매 완료
   		</h1>
   		<h2>
   			구매해주셔서 감사합니다.
   		</h2>
   </div>
   
   <br><br>
   
   <div class='result-bun'>
   		<a href='<%=request.getContextPath()%>/fundingListAll'><button class='btns btn--xs btn--green fund'>더 많은 펀딩 상품 보기</button></a>
   		<a href='<%=request.getContextPath()%>/foodListAll'><button class='btns btn--xs btn--blue item'>더 많은 먹거리 상품 보기</button></a>
	</div>   		
   		
   <br><br><br><br><br>
   <%@ include file='../common/footer.jsp' %>
</body>
</html>