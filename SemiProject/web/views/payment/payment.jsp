<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='com.kh.Semi.payment.model.vo.*'%>
<%
	//만약 구매할 제품이 여러개라면 제품명에 ~ 등 몇개 인지 붙혀줘야한다.
	
	String arr = "";								//밭 면적
	String pro_detail_no = "";						//해당 상품 번호
	int amount = 0;									//수량
	int farmSize = 0;								//개당 크기
	PaymentProduct pd = new PaymentProduct();		//해당 상품 정보
	String[] addressList = null;					//해당 유저의 주소들
	
	String productType = "F";						// 결제페이지로온 상품의 종류  F->펀딩 , B->상품, E->먹거리 직구매
	
	if(request.getAttribute("fundList")!= null){			//펀딩이 왔을때
		arr = (String)request.getAttribute("fundList");
		amount = Integer.parseInt((String)request.getAttribute("amount"));
		pro_detail_no = (String)request.getAttribute("pro_detail_no");
		farmSize = Integer.parseInt((String)request.getAttribute("farmSize"));
		pd = (PaymentProduct)request.getAttribute("product_payList");
		addressList = (String[])request.getAttribute("addressList");
		productType= "F";					
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/payment/paymentList.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/funding/ProgressBar.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/pushy-buttons.css">

<title>결제 페이지</title>

</head>
<body>
	<%@ include file='../common/navbar.jsp' %> 
	
	<%
		if(loginUser == null){
	%>
			<script> alert('로그인이 필요한 서비스입니다.'); location.href="<%=request.getContextPath()%>/MainFunding#modal2";</script>
	<%
		}else{
	%>
		<script>
			user_No = '<%=loginUser.getMember_No()%>';
			user_name = '<%=loginUser.getMember_Name()%>';
			user_tel = '<%=loginUser.getTel()%>';
			user_email ='<%=loginUser.getEmail()%>';
		</script>
	<%}%>
	
	<div class="topArea col-lg-12 col-md-12 col-sm-12 col-xs-12">
	   <br>
	      <h1 id="topText">결제</h1>
	      <h4 id="subText">작은 보탬은 나중에 큰 보답으로 돌아옵니다.</h4>
   </div>
   
   	<div id="tabMenu-list">
	</div>
   
   <div class='all-view'>
   		<span class='all-view-title'><h1>결제</h1></span>
   		<div class="clear"></div>
   		<hr class='view-hr'>
   		
   		<div class='pay-box'>
   			<div class='pay-list'>
   			<%for(int i=0;i<1;i++){ %>
   				<div class='item'>
   					<div class='item-img' style='background-image: url(<%=request.getContextPath()%>/images/funding/<%=pd.getOri_fileName()%>);'></div>
   					<div class='item-content'>
   						<label class='item-content-text'>
   							<h4><%=pd.getPro_name() %></h4>
   						</label>
   					</div>
   					<div class='item-QTY'>
   						<label class='item-QTY-text'>
   							<label style='font-weight: bold; padding-top: 36px;'>
   								수량 : <%=amount %>개
   							</label>
   							<label style='color:gray; font-size: 12px;'>
   								한 셀당:<%=farmSize %>평
   							</label>
   						</label>
   					</div>
   					<div class='item-price'>
   						<label style='font-weight: bold; padding-top: 36px;'>
   								<%=pd.getPro_price() * amount %>원
   							</label>
   							<label style='color:gray; font-size: 12px;'>
   								한 셀당:<%=pd.getPro_price() %>원
   						</label>
   					</div>
   				</div>
   			<%} %>
   			</div>
   			<div class='pay-result'>
   				<h3>전체합계</h3>
   				<hr style='background: black;'>
   				<div class='result-sum'>
   					<table class='result-table'>
   						<tr>
   							<td style='color:gray;'>상품 갯수</td>
   							<td><%=amount %>개</td>
   						</tr>
   						<tr>
   							<td style='color:gray;'>상품 금액</td>
   							<td><%=pd.getPro_price()*amount %>원</td>
   						</tr>
   						<tr>
   							<td style='color:gray;'>배송비</td>
   							<td>2500원</td>
   						</tr>
   						<tr>
   							<td colspan='2'><hr style='width:80%;'></td>
   						</tr>
   						<tr>
   							<td class='result-table-address'>배송지 주소</td>
   							<td><a href='#modify-address' class='btn btn-info'>배송지 변경</a></td>
   						</tr>
   						<tr>
   							<td colspan='2'><hr style='width:80%;'></td>
   						</tr>
   						<tr>
   							<td id='address-name' style='text-align:left;'><%=loginUser.getMember_Name() %></td>
   							<td id='address-number' style='text-align:left;'></td>
   						</tr>
   						<tr>
   							<td id='address-address' colspan='2' class='result-table-address2'><%=addressList[0] %></td>
   						</tr>
   						<tr>
   							<td colspan='2'><hr style='width:80%;'></td>
   						</tr>
   						<tr>
   							<td style='color:black;'>전체 주문 금액</td>
   							<td style='color: blue;font-size: 30px;font-weight: bold;'><%=pd.getPro_price()*amount %>원</td>
   						</tr>
   					</table>
   					<div class=result_button>
   						<button onclick='cash()' class='btn btn-primary result-button-size' style='font-size: 30px;'>결제하기</button>
   					</div>
   				</div>
   			</div>
   		</div>
   
   <br><br>
   </div>
      <button onclick='throwPayment("imp", $.trim($("#address-address").text()));'>테스트용 버튼</button>
      
      <script>
      	//테스트용 함수입니다. 발표떈 지워애횽!
	      function throwPayment(imp, addr){
	    		var arr = '<%=arr%>';
	    		var pro_detail_no = '<%=pro_detail_no%>';
	    		var amount = '<%=amount%>';
	    	     
	    	     location.href="<%=request.getContextPath()%>/paymentView?imp="+imp+"&bak="+arr+"&pro_detail_no="+pro_detail_no+"&amount="+amount+"&user_No="+user_No+"&addr="+addr;
	      }
      </script>
      
   <br><br><br><br><br>
   <%@ include file='../common/footer.jsp' %>
<!-- 배송지 변경 모달 -->
<div class="remodal" data-remodal-id="modify-address">
  <button data-remodal-action="close" class="remodal-close"></button>
		<br>
	<label class='login_header' style='color:blue'>주소지 선택</label>

	 <table class='modify-address'>
		<tr>
			<th>이름</th>
			<th></th>
			<th style='width: 390px;'>주소지</th>
			<th>주소 추가 및 변경</th>
		</tr>
		<%for(int i=0; i<3;i++){ %>
			<tr>
				<td><%=loginUser.getMember_Name() %></td>
				<td></td>
				<td id='td<%=i%>'>
					<%if(addressList[i] != null){ %>
						<%=addressList[i] %>
					<%}else{%>
						입력된 주소가 없습니다.
					<%}%>
				</td>
				<td>
					<%if(addressList[i] != null){ %>
						<a id='a<%=i %>' href='#addr-Change'><button type='button' id='addrBtn' class='btn btn-info' value='<%=i%>'>주소 변경하기</button></a>
					<%}else{%>
						<a id='a<%=i %>' href='#addr-add'><button type='button' id='addrBtn' class='btn btn-primary' value='<%=i%>'>주소 추가하기</button></a>
					<%}%>
				</td>
			</tr>
		<%} %>
	</table>
	<br>
	<input type='hidden' data-remodal-action="close" id='completeBtn'></input>
	<br><br>
</div>

	<script>
		 $(function(){
	         $(".modify-address tr").mouseenter(function(){
	            $(this).css({"background":"gainsboro", "cursor":"pointer"});
	         }).mouseout(function(){
	            $(this).css({"background":"white"});
	         }).click(function(){
	        	 $(".result-table tr:eq(6) td:eq(0)").html($(this).children().eq(0).text()+'&nbsp;');
	        	 $(".result-table tr:eq(6) td:eq(1)").html('&nbsp;'+$(this).children().eq(1).text());
	        	 $(".result-table tr:eq(7) td:eq(0)").html($(this).children().eq(2).text());
	        	 $('#completeBtn').click();
	         });
	         $('.modify-address tr th').click(false);
	         
	         $('td a button').click(function(){
	        	var index = this.value;
	        	$('#changeAddr').text(index);
	        	$('#ADDAddr').text(index);
	         });
	         
	         //주소 변경시
	         $('#changeAddrBtn').click(function(){
	        	 $.ajax({
						url:'<%=request.getContextPath()%>/addressChange',
						type:'post',
						data:{
							addr: $('#addressIn').val(),
							num: $('#changeAddr').text()
						},
						success:function(data){
							var number = $('#changeAddr').text();
							if(data != '0'){
								alert('주소 변경에 성공하셨습니다.');
								$('#td'+number).text($('#addressIn').val());
								$(".result-table tr:eq(7) td:eq(0)").text($('#addressIn').val());
								$('#addressIn').val('');
								$('#chageAddrBtnCancel').click();
							}else{
								alert('주소 변경에 실패 하셨습니다 다시 변경해주세요');
							}
						},
						error:function(data){
							console.log('실패');
						}
					});
	         });
	         
	         //주소 추가시
	         $('#ADDAddrBtn').click(function(){
	        	 $.ajax({
						url:'<%=request.getContextPath()%>/addressADD',
						type:'post',
						data:{
							addr: $('#addressADDIn').val(),
							num: $('#ADDAddr').text()
						},
						success:function(data){
							var number = $('#changeAddr').text();
							if(data != '0'){
								alert('주소 추가에 성공하셨습니다.');
								$('#td'+number).text($('#addressADDIn').val());
								$(".result-table tr:eq(7) td:eq(0)").text($('#addressADDIn').val());
								
								$('#a'+number).prop('href', '#addr-Change');			//다시 변경 버튼으로 변경
								$('button[value='+number+']').text('주소 변경하기');
								$('button[value='+number+']').prop('class','btn btn-info');
								
								$('#addressADDIn').val('');
								
								$('#ADDAddrBtnCancel').click();
							}else{
								alert('주소 추가에 실패 하셨습니다 다시 변경해주세요');
							}
						},
						error:function(data){
							console.log('실패');
						}
					});
	         });
	         
	      });
	</script>
	
<!-- 배송지 변경 모달 -->
<div class="remodal" data-remodal-id="addr-Change">
  <button data-remodal-action="close" class="remodal-close"></button>
		<br>
  			<div>
				 <h1>배송지 변경</h1>
				 <hr>
				<div class='inputForm' style='width: 80%;margin-left: auto;margin-right: auto; text-align:left;'>
					<label style='font-weight: bold;font-size: 25px;'>변경 할 주소</label><input type='text' id='addressIn' class='form-control'>
					<input type='hidden' id='changeAddr' value=''>
				</div>
				
			<br><br>
		</div>
		  <button data-remodal-action="cancel" id='chageAddrBtnCancel' class="remodal-cancel">취소</button>
		  <div id='changeAddrBtn' class="remodal-confirm">배송지 변경</div>
</div>


<!-- 배송지 추가 모달 -->
<div class="remodal" data-remodal-id="addr-add">
  <button data-remodal-action="close" class="remodal-close"></button>
		<br>
  			<div>
				 <h1>배송지 추가</h1>
				 <hr>
				<div class='inputForm' style='width: 80%;margin-left: auto;margin-right: auto; text-align:left;'>
					<label style='font-weight: bold;font-size: 25px;'>추가 할 주소</label><input type='text' id='addressADDIn' class='form-control'>
					<input type='hidden' id='ADDAddr' value=''>
				</div>
				
			<br><br>
		</div>
		  <button data-remodal-action="cancel" id='ADDAddrBtnCancel' class="remodal-cancel">취소</button>
		  <div id='ADDAddrBtn' class="remodal-confirm">배송지 추가</div>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script>
	var arr = '<%=arr%>';
	var pro_detail_no = '<%=pro_detail_no%>';
	var amount = '<%=amount%>';
	
  IMP.init('imp97286619');
  function cash(){
	  var addr = $.trim($("#address-address").text());
      IMP.request_pay({
          pg : 'danal',
          pay_method : 'card',
          merchant_uid : 'merchant_' + new Date().getTime(),
          name : '<%=pd.getPro_name()%>',
          amount : <%=pd.getPro_price()*amount%>,
          buyer_email : user_email,
          buyer_name : user_name,
          buyer_tel : user_tel,
          buyer_addr : addr,
          buyer_postcode : ''
      }, function(rsp) {
      if ( rsp.success ) {
          var msg = '';
          msg += rsp.imp_uid;
          msg += ',' +rsp.name;
          msg += ',' +rsp.buyer_name;
          msg += ',' + rsp.paid_amount;
          location.href="<%=request.getContextPath()%>/paymentView?imp="+msg+"&bak="+arr+"&pro_detail_no="+pro_detail_no+"&amount="+amount+"&user_No="+user_No+"&addr="+addr;
      } else {
      }
      });
  }
</script>

</body>

</html>


