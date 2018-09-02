<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='com.google.gson.Gson'%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<%-- <%@ include file='views/common/navbar.jsp' %> --%>
	<%-- <%request.getSession().invalidate(); %>  --%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<a href='<%=request.getContextPath() %>/fundingListAll'>펀딩으로가기</a>
	<a href='<%=request.getContextPath() %>/views/funding/foodList_All.jsp'>먹거리로가기</a>
	<a href='<%=request.getContextPath() %>/MainFunding'>메인으로가기</a>
	<br>
	<a href='<%=request.getContextPath() %>/views/payment/payment.jsp'>결제페이지</a>
	<a href='<%=request.getContextPath() %>/views/payment/paymentResult.jsp'>결제완료페이지</a>
	<br>
	<a href='<%=request.getContextPath() %>/views/test.jsp'>테스트</a>
	<br>
	<a href='<%=request.getContextPath() %>/views/payment/paymentOtview.jsp'>결제 OT? 뷰</a><br>
	<a href='<%=request.getContextPath() %>/views/payment/paymentPview.jsp'>결제 뷰</a>
		<br>
	<a href='<%=request.getContextPath() %>/views/basket/basketOtview.jsp'>장바구니</a><br>
	<a href='<%=request.getContextPath() %>/views/basket/basketPview.jsp'>장바구니 o뷰</a>
			<br>
	<a href='<%=request.getContextPath() %>/views/dip/dipOtview.jsp'>찜 O</a><br>
	<a href='<%=request.getContextPath() %>/views/dip/dipPview.jsp'>찜 P뷰</a>
	<br>
	<a href='<%=request.getContextPath() %>/views/myPage/editInformation.jsp'>마이페이지?</a><br>
	<br>

	<jsp:forward page="MainFunding" />
	
	<%
		String[] arr = new String[10];
		for(int i=0; i<10;i++)
			arr[i] = i+"번쨰";
	%>
	<script>
		var arr;
	</script>

	<%
		Gson gson = new Gson();
		String gs = gson.toJson(arr);
	%>
	
	<script>
		console.log(<%=gs%>);
	</script>
	
	<a href='<%=request.getContextPath()%>/paymentCencel?seller=seller2&user_nick=윰윰이'><button type='button'>환불 정상?</button></a>
	
	
	<form id='buyForm' action='<%=request.getContextPath()%>/PaymentBuy' method='POST'>
		<input type='hidden' id='user' name='hid' value='USERSSSS'>		<!-- 유저 아이디 -->
		<input type='hidden' id='seller' name='no' value='seller'> <!-- 판매자 아이디 -->
		
		<input type='text' id='pro_detail_no' name='pro_detail_no' value='23'> <!-- pro_detail_no -->
		<input type='text' id='amount' name='amount' value='0'> <!-- 수량 amount -->
		<input type='text' id='fundList' name='fundList' value='' readonly>			<!-- 구매할 밭 면적 -->
		<input type='text' id='farmSize' name='farmSize' value='' readonly>			<!-- 평당 면적 -->
	</form>

	<br>
	<br>
	<a href='javascript:popupOpen();'>면적 구매하기</a><br>
	<script type="text/javascript">
        function popupOpen()
        {
			var popUrl = "<%=request.getContextPath() %>/ViewFiled?name=seller";	//팝업창에 출력될 페이지 URL
			var popOption = "width=1050, height=600, resizable=no, scrollbars=no, status=no,location=no;";    //팝업창 옵션(optoin)
            window.name = "parentForm";
            window.open(popUrl,"", popOption);    
        }
        
        function paymentPage(){
        	$('#buyForm').submit();
        }
	</script>

</body>
</html>