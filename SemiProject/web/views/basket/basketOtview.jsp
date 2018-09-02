<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.Semi.basket.model.vo.*"%>
<% ArrayList<Basket> list = (ArrayList<Basket>)request.getAttribute("list"); %>
  <%Basket k = new Basket(); %>  
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
	
	.dropdown-toggle2
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

/*   .btn-info {
  color: #fff;
  background-color: #2F9D27;
  border-color: #5bc0de;
			} */
			
/* 	.btn-lg2, .btn-group-lg2 > .btn2 
	{
 	 padding: 2rem 3rem;
  	 font-size: 1.7rem;
  	 border-radius: 0.3rem;
	}  */
	
  .btn1
  {
  	margin-left:43%; 
  }
  .btn2
  {
  
  }
  .btn3
  {
  
  }

  .btn-info1 {
  color: #fff;
  background-color: #2F9D27;
  border-color: #5bc0de;
			}
  .btn-info2 {
  color: #fff;
  background-color: #2F9D27;
  border-color: #5bc0de;
			}
  .btn-info4 {
  color: #fff;
  background-color: #2F9D27;
  border-color: #5bc0de;
			}
	
	.btn-lg1, .btn-group-lg1 > .btn1 
	{
 	 padding: 1.5rem 3rem;
  	 font-size: 1.7rem;
  	 border-radius: 0.3rem;
	}		
	.btn-lg2, .btn-group-lg2 > .btn2 
	{
 	 padding: 1.5rem 3rem;
  	 font-size: 1.7rem;
  	 border-radius: 0.3rem;
	} 
			
	.btn-lg4, .btn-group-lg4 .btn4 
	{
 	 padding: 1.5rem 3rem;
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


	#checkall /* 체크박스 */
	{
		 position: static; 
	     /* display:inline-block; */
         width:20px;
         height:20px;
         border:2px solid #bcbcbc;
         margin-left:10px; 
        
         cursor:pointer;
	}
	.proimg
	{
		width:150px;
		height:150px;
	}
	.product_sum
	{
		margin-left:1200px;
	}
	
	.chk
	{
		 position: static; 
	     /* display:inline-block; */
         width:20px;
         height:20px;
         border:2px solid #bcbcbc;
         margin-left:10px; 
        
         cursor:pointer;
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
			<li><a href="/Semi/views/myPage/editInformation.jsp" id="freeboard">내정보</a></li>
			
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
		<h1 id="MidText">장&nbsp;&nbsp;&nbsp;바&nbsp;&nbsp;&nbsp;구&nbsp;&nbsp;&nbsp;니&nbsp;&nbsp;&nbsp;(&nbsp;상&nbsp;&nbsp;&nbsp;시&nbsp;)</h1>
	</div>
	
	
	<br><br><br><br>
	
	<div class="box">
	
			 <table id="Payment" class="table table-hover">
			 
				<thead id="Paymentth" >
				
				<tr>
				<!-- <th class="text-center" width ="1" ><strong style="color:#000;">
				<input type="checkbox" id="checkall"name ="allcheck" /></strong></th> -->
				<th class="text-center" width ="5" ><strong style="color:#000;"></strong></th>
				<th class="text-center" width ="5" ><strong style="color:#000;">번호</strong></th>
				<th class="text-center" width ="5" ><strong style="color:#000;">상품</strong></th>	
				<!-- onclick="check_all(); "-->
				<th class="text-center" width ="20"><strong style="color:#000;">상품명</strong></th>
				<th class="text-center" width ="20"><strong style="color:#000;">판매가</strong></th>
				<th class="text-center" width ="20"><strong style="color:#000;">수량</strong></th>
				<th class="text-center" width ="20"><strong style="color:#000;">주문금액</strong></th>
				<th class="text-center" width ="20"><strong style="color:#000;">주문관리</strong></th>
				</tr>
				
				</thead>
		
				
			<tbody id="Paymentbd" vertical-align="middle">
				<%int sum = 0; %>
				<%if(list.size() > 0) {%> 
				<form action="<%=request.getContextPath() %>/paymentBasketBuy"  method="post">
				 <%for(Basket b : list) { %>	
				 
				<tr id="trID">
					<td align="center">
					<input type="checkbox" class="chk" id="chk" name="chk" value="<%=b.getCart_no() %>" />
					</td>
					<td align="center"><%=b.getBas_num() %></td>
					<td align="center"><img class="proimg" onclick="movepage(<%=b.getProduct_no()%>);" src='<%=request.getContextPath()%>/images/funding/<%=b.getOri_filename()%>'></td>
					<input type="hidden" id="oriName " name="oriName" value="<%=b.getOri_filename()%>">
					<td align="center"><%=b.getPro_title() %></td>
					<td align="center"><%=b.getPrice()  %>원</td>
					<td align="center"><%=b.getProduct_count() %>개</td>
					<td align="center"><%=sum = b.getPrice() * b.getProduct_count()  %>원</td>
					<td align="center">
					<button type="button" onclick="application(<%=b.getCart_no()%>)" class="btn btn-info btn-lg ">삭제하기</button>
					</td>
					
				</tr>
				
				<%}%>
				 
				<% } %>
				<script>
					function movepage(num){
						location.href='selectFood.bo?product_page='+num;
					}
				
				</script>
		

			</tbody>
			</table>
			 <%-- <%String[] checks = request.getParameterValues("chk"); %>
				<%for(int i =0; i<checks.length; i++) {%>
				<%= checks[i] %>		
				<h1>배열값 : <%=checks[i]%></h1>
				<%}%>  --%>
				
			<hr>
			<br><br><br><br><br><br>
			<%int product_sum = 0; %>
			<%if(list.size() > 0) {%>
			<%for(Basket b : list) { %>	
			<% product_sum +=  b.getPrice() * b.getProduct_count();  %>
			<%}} %>
			<h1 class = "product_sum">총금액 : <%=product_sum%> 원</h1>
			<hr>
			</div>
			
		 <br><br><br><br>
		 <%-- <%
		 String[] checks = request.getParmeterValues("chk");  
		 for(int i = 0; i<checks.length; i++)
		 {
			 System.out.println(checks[i]);
		 }
		
		 %> --%>
		
		 <input type="button"class="btn1 btn-info1 btn-lg1" onclick="check_all_delete();" value="체크삭제"/><%-- <%=b.getCart_no()%> --%>
		 <input type="submit" id="payment" name="payment" onclick="checkDisable(this.form);" class="btn2 btn-info2 btn-lg2" value="선택주문"/>  	
		
		 <br><br><br><br><br><br><br><br>
			
		</form>

		<%@ include file="../common/footer.jsp" %>
        <script src="js/core.js"></script> 
        <script src="js/jquery.min.js" ></script> 
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/scrollPosStyler.js"></script> 
        <script src="js/swiper.min.js"></script> 
		<script src="js/isotope.min.js"></script> 
		<script src="js/nivo-lightbox.min.js"></script> 
		<script src="js/wow.min.js"></script> 
		
		<script>
		
		    function application(num)
		      {
		    	
		    	var img = <%=k.getOri_filename()%>;
		      	var cartNo = num;
		      	var userNo = <%=loginUser.getMember_No()%>;
		      	console.log("카트번호" + cartNo);
		      	console.log("유저번호" + userNo);
		       
				var oriName = null;		      	
		      	
		        $.ajax({
		            url:"<%=request.getContextPath()%>/basketDelete.bd",
		            type:"get",
		            data:{
		               userNo:userNo,
		     
		               cartNo:cartNo
		               
		            },
		            dataType:"json",
		            success:function(data){
		            		console.log(data)
		                  /*  if(data>0)
		                  { */
		                	   
		                  console.log(data + "데이터 도착?");   
		                  console.log("성공했다!");
		              	  
		                  location.href="<%=request.getContextPath()%>/basket.bo?userNo=" + userNo;
						
		                 /*  $table = $("#Paymentbd");
		              
		                  
		                  
		                  $table.html(''); 
		                  
		                  
		                   for(var key in data)
		                   {
							
		  					 var $tr = $("<tr>");
							 //var $checkBox = $("<td>").text(data[key].cart_no);
							 num = data[key].cart_no;
							 oriName = data[key].ori_filename;
		                     var $basNum = $("<td>").text(data[key].bas_num);
		                     //var $img = $("<td>").attr(src, '/images/funding/img');
		                     var $title = $("<td>").text(data[key].pro_title);
		                     var $price = $("<td>").text(data[key].price+"원");
		                     var $count = $("<td>").text(data[key].product_count+"개");
		                     var $sum = $("<td>").text(data[key].price * data[key].product_count+"원");
		              
		                     //var $button = $("<td onclick='application("+num+");'>").text("삭제하기");
		                     
		                     //var repDe = $("<td class='re-4' onclick=deleteReply("+num+")>").text("삭제");
								
		                   	 //$tr.append($checkBox); 
		                     $tr.append($basNum);
		                     //$tr.append($img); 
		                     $tr.append($title);
		                     $tr.append($price);
		                     $tr.append($count);
		                     $tr.append($sum);
		                     //$tr.append($button);				
		                     $table.append($tr);
		                     
		                                          //td.attr(src, "/images/funding/")
							
		                     } 
		                   */
		                  /* } */
		               console.log("데이터값없음");
		            },
		            error:function(data){
		               console.log("에러입니다.");
		            }
		         });
		       
		        
		          alert("장바구니에서 삭제 되었습니다.");
		       
		   
		         }
		</script>
		

             
             
          
            

		<script>

		/* 체크박스가 안되어 있을때 서브밋 버튼 비활성화 */
		$(function(){
			document.getElementById('payment').disabled=true;
			
			$('.chk').click(function(){
				
				var count = 0;
				
				$("input[name='chk']").each(function(){
			  		 if($(this).prop("checked") == true){
			  			 count++;
			  		 }
	 				
	 			});
				
				if(count == 0){
					document.getElementById('payment').disabled=true;
				}else{
					document.getElementById('payment').disabled=false;
				}
				
				
			}) ;	
			
		});
		
 	
		
		
		function check_all_delete()
		{
			var checkboxValues = [];
		    $("input[name='hobby']:checked").each(function(i) {
		        checkboxValues.push($(this).val());
		    });
		     
		    // 사용자 ID(문자열)와 체크박스 값들(배열)을 name/value 형태로 담는다.
		
			console.log("올체크")
			var checks = [];
			$("input[name = 'chk']:checked").each(function(i){
				checks.push($(this).val());
			});
		    var allData = {	"checkAr": checks };
		
			/* var cartNo = num; */
			
			 $.ajax({
				url:"<%=request.getContextPath()%>/basketDelete.ad",
				type:"post",
				date: allDate,
					dataType:"json",
					success:function(data){
				       	if(data>0)
							{
				       		system.out.println(date);
							console.log("성공");
							}	
			},
			error:function(data){
				
				console.log("에러입니다.");
			}
			});
		}
		/*    $(function(){
			      $("tr button").click(function(){
		 */
		/* 장바구니에서 삭제 했을때 ajax */
		
		
		</script>
		



  <%@ include file="../common/footer.jsp" %>
			
			

			 
</body>
	