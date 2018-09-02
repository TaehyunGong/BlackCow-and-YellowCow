<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.Semi.payment.model.vo.*"%>
<% ArrayList<Payment> list = (ArrayList<Payment>)request.getAttribute("list"); %>
 <%@page buffer = "10000kb" %>
     


  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome Style -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Gaegu" rel="stylesheet">

<!-- 네비바 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>

	.topArea {
		background-image:url(/Semi/images/common/마이페이지.png);
		width:100%;
		height:400px;
		font-family:"yeonsung";
		
	}
	#topText {
		font-size:125px;
		margin-top:140px;
		font-weight:bold;
		color:#ccc;
		text-align:center;
	}
	
	#MidText {
		font-size:80px;
		margin-top:110px;
		font-weight:bold;
		color:#ccc;
		text-align:center;
	}
	
	 .box
	{
		width:1500px;
		margin:0 auto; 
	}  
	
	/* =========마이페이지 메뉴========== */
	#sub-2
	{
		height:38px;
		border-bottom:1px solid black;
		
	}
	
	#sub-2 ul {
		list-style:none;
		margin-top:1px; 
		text-align:center; 
		margin-left:38%; 
		
		
		}
		
	#sub-2 ul li{
		float:left;
		font-size:23px;
		font-weight:bold;
		margin-right:40px;
		}
		
	#sub-2 ul li a
	{
		text-decoration:none;
		color:black;
	}
	
	#sub-2 ul li a:hover{
		text-decoration:none;
		color:black;
	}

	#infoboard:hover
	{
		display:block;
		border-bottom:5px solid green;
	}
	
	.dropdown-toggle3
	{
		display:block;
		border-bottom:5px solid green;
	}
	
	#sub-2 ul li a:hover
	{
		text-decoration:none; 
		border-bottom:5px solid green;
	}
	
	
		#sub-2 ul li li a:hover
	{
		text-decoration:none; 
		border-bottom:5px solid green;
	}
	



/* ======환불 버튼 색상 ===== */
  .btn-info {
  color: #fff;
  background-color: #2F9D27;
  border-color: #5bc0de;
			}
			
	.btn-lg2, .btn-group-lg2 > .btn2 
	{
 	 padding: 2rem 3rem;
  	 font-size: 1.7rem;
  	 border-radius: 0.3rem;
	} 
#Paymentbd
{
	font-size:20px;
	padding:10px;
	
}

#Paymentth
{
	font-size:20px;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th
{
padding:8px;
vertical-align:middle;
border-top:1px solid #ddd;
}

#returnReason
{
width:100px;
height:100px;
}
.proimg
	{
		width:150px;
		height:150px;
	}
	
</style>
</head>



    <body>
        
  

     <%@ include file='../common/navbar.jsp' %>
     
      
	<br><br><br><br>
	
	
	<div class="topArea">
	<br>
		
	</div>
	
	
			<div id="sub-2" class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align ="center">
		<ul class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align ="center">
			<li><a href="/Semi/views/myPage/editInformation.jsp" id="freeboard1">내정보</a></li>
			
		<li class="dropdown"><a class="dropdown-toggle1" data-toggle="dropdown" href="#">찜목록 <span></span></a>
        <ul class="dropdown-menu">
          <li><a href="/Semi/views/dip/dipOtview.jsp">상시</a></li>
          <li><a href='<%=request.getContextPath() %>/selectDibs?userNo=<%=loginUser.getMember_No()%>'>펀딩</a></li>
         </ul>
			
			
		 <li class="dropdown"><a class="dropdown-toggle2" data-toggle="dropdown" href="#">장바구니 <span></span></a>
         <ul class="dropdown-menu">
          	<li><a href='<%=request.getContextPath() %>/basket.bo?userNo=<%=loginUser.getMember_No()%>'>상시</a></li>
         
          </ul>
          
          	
          	 <li class="dropdown"><a class="dropdown-toggle3" data-toggle="dropdown" href="#">결제내역 <span></span></a>
         <ul class="dropdown-menu">
          	<li><a href='<%=request.getContextPath() %>/payment.po?userNo=<%=loginUser.getMember_No()%>'>상시</a></li>
          	<li><a href='<%=request.getContextPath() %>/payment.pf?userNo=<%=loginUser.getMember_No()%>'>펀딩</a></li>
          </ul>
         	
		
		</ul>
		
	</div>

	<br><br>
	
	
	<div class="MidArea">
		<br>
		<h1 id="MidText">구&nbsp;&nbsp;&nbsp;매&nbsp;&nbsp;&nbsp;내&nbsp;&nbsp;&nbsp;역&nbsp;&nbsp;&nbsp;(&nbsp;상&nbsp;&nbsp;&nbsp;시&nbsp;)</h1>
	</div>
	
	
	<br><br><br><br>
	
	<div class="box">
	
			 <table id="Paymentth" class="table table-hover">
			 
				<thead>
				<tr>
				<th class="text-center" width ="5" ><strong style="color:#000;">번호</strong></th>
				<th class="text-center" width ="20" ><strong style="color:#000;">상품정보</strong></th>
				<th class="text-center" width ="20"><strong style="color:#000;">주문일자</strong></th>
				<th class="text-center" width ="20"><strong style="color:#000;">결제금액</strong></th>
				<th class="text-center" width ="20"><strong style="color:#000;">결제종류</strong></th>
				<th class="text-center" width ="20"><strong style="color:#000;">배송상태</strong></th>
				<th class="text-center" width ="20"><strong style="color:#000;">환불신청</strong></th>

				</tr>
				</thead>
		
			
			
				<tbody id="Paymentbd" vertical-align="middle">
				<% if(list.size()>0){ %>
			 	<% for(Payment p : list) {%>	
				 <%-- <img class="proimg" src='<%=request.getContextPath()%>/images/funding/<%=p.getOri_fileName()%>'> --%>
				<tr>
					<td align="center"><%= p.getPay_num() %></td>
					<td align="center"><img class="proimg" src='<%=request.getContextPath()%>/images/funding/<%=p.getOri_fileName()%>'><br><%= p.getPro_name() %></td>
					<td align="center"><%= p.getPay_date()%></td>
					<td align="center"><%=p.getPro_price()%></td>
					<td align="center"><%= p.getPay_type()%></td>
					<td align="center"><%= p.getWaybill()%></td>
					<input type="hidden" id="paymentDn<%=p.getPay_detail_no()%>" values="<%=p.getPay_detail_no()%>">
					<input type="hidden" id="sellerNo<%=p.getPay_detail_no()%>" value="<%=p.getSellerNo()%>">
					<input type="hidden" id="member_nick<%=p.getPay_detail_no()%>" value="<%=p.getMember_nick()%>">
					
					<%if(p.getRefund_prog() != null){ %>
						<% if(p.getRefund_prog().equals("RES")){ %>
								<td align="center"> 
								<button type="button" id="btnsuc<%=p.getPay_detail_no()%>"
								class="btn btn-info btn-lg" data-toggle="modal" 
								data-target="#myModal<%=p.getPay_detail_no()%>" disabled>환불완료</button>
					</td>
					
				  		<% }
						else if(p.getRefund_prog().equals("REQ")){ %>
								<td align="center"> 
								<button type="button" id="btnsuc<%=p.getPay_detail_no()%>"
								class="btn btn-info btn-lg" data-toggle="modal" 
								data-target="#myModal<%=p.getPay_detail_no()%>" disabled>환불중</button>
					
								</td>
						<%} %>	
					<% }
					else{ %>
							<td align="center"> 
							<button type="button" id="btnsuc<%=p.getPay_detail_no()%>"
							class="btn btn-info btn-lg" data-toggle="modal" 
							data-target="#myModal<%=p.getPay_detail_no()%>">환불신청</button>
		
							</td>
							<% } %> 	 
								<% }} %> 
				</tr>
				
		
	
			</tbody>
			
			
			</table>
			
	</div>
		
			<%System.out.println("펀딩뷰입니당=================================================="); %>
			
			
			
  		<br><br><br><br><br><br><br><br><br><br><br>
       
 







  <!-- 환불신청 모달 -->
  <% if(list != null) { 
  
  	for(Payment p : list) {%>
  <div class="modal fade" id="myModal<%=p.getPay_detail_no() %>" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" align="center">환불신청하기</h4>
        </div>
        <div class="modal-body">
        
        <p>환불상품</p>
        <textarea cols=150 rows=10 id="returnReason" style="resize:none" placeholder="환불사유"></textarea>
        
        </div>
        
        <div class="modal-footer">
         <button type="button" onclick="application(<%=p.getPay_detail_no() %>);" class="btn btn-default" data-dismiss="modal">신청하기</button>
         <%-- <i class="far fa-heart" onclick='dips(<%=list.get(i).getPro_detail_no() %>, this);' value='<%=list.get(i).getPro_detail_no() %>'></i> --%>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          
        </div>
      </div>
    </div>
  </div>
  
  <% } }  %>
  
  
  
</div>




        <script src="js/core.js"></script> 
        <script src="js/jquery.min.js" ></script> 
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/scrollPosStyler.js"></script> 
        <script src="js/swiper.min.js"></script> 
		<script src="js/isotope.min.js"></script> 
		<script src="js/nivo-lightbox.min.js"></script> 
		<script src="js/wow.min.js"></script> 
		
		<script>
				function application(num )
		{
				
					alert("환불신청되었습니다.");
					var paynum = num;
					var userNo = <%=loginUser.getMember_No()%>	
					var seller_no = $("#sellerNo"+ num).val();
					
					
					console.log(paynum);
					console.log(seller_no);
					
					
				 	  $.ajax({
						url:"<%=request.getContextPath()%>/returnMoney.py",
						type:"post",
						data:{
							seller_No:seller_no,
							writer:paynum,
							reason:$("#returnReason").val(),
							userNo:userNo
					
				
					},
					dataType:"json",
					success:function(data){
						if(data>0)
							{
							console.log("성공했다!");
							location.href="<%=request.getContextPath()%>/payment.po?userNo=" + userNo;
							
							/* $("#btnsuc"+paynum).html('환불중').attr("disabled"); */
							}
						
					},
					error:function(data){
						console.log(data);
					}
				}); 
 		}
		</script>
		

			}
		}
		
		  <%@ include file="../common/footer.jsp" %>
</body>