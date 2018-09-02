<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import='com.kh.Semi.dips.model.vo.*,java.util.ArrayList'%>
    
    <%
	ArrayList<Dibs> list = (ArrayList<Dibs>)request.getAttribute("list");
    
    String btn = "";
	%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome Style -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Gaegu" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 네비바 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Yeon+Sung" rel="stylesheet">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/funding/fundingList.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/funding/ProgressBar.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/pushy-buttons.css">
<%!
	public String progressBar(String pro) {
		String cho ="";
		switch(pro){
			case "PR5" : cho="<button type='button' class='btn btn-dark' style='width:100%; height:100%;'>종료</button>"; break;
			case "PR4" : cho="<button type='button' class='btn btn-warning' style='width:100%; height:100%;'>배송중</button>"; break;
			case "PR3" : cho="<button type='button' class='btn btn-primary' style='width:100%; height:100%;'>진행중</button>"; break;
			case "PR2" : cho="<button type='button' class='btn btn-secondary' style='width:100%; height:100%;'>모금종료</button>"; break;
			case "PR1" : cho="<button type='button' class='btn btn-success' style='width:100%; height:100%;'>모금중</button>"; break;
		}
		return cho;
	}
%>
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
	#sub-3
	{
		height:38px;
		border-bottom:1px solid black;
		
	}
	
	#sub-3 ul {
		list-style:none;
		margin-top:1px; 
		text-align:center; 
		margin-left:38%; 
		font-family:"yeonsung";
		
		}
		
	#sub-3 ul li{
		float:left;
		font-size:23px;
		font-weight:bold;
		margin-right:40px;
		}
		
	#sub-3 ul li a
	{
		text-decoration:none;
		color:black;
	}
	
	#sub-3 ul li a:hover{
		text-decoration:none;
		color:black;
	}

	#infoboard:hover
	{
		display:block;
		border-bottom:5px solid green;
	}
	
	.dropdown-toggle1
	{
		display:block;
		border-bottom:5px solid green;
	}
	
	#sub-3 ul li a:hover
	{
		text-decoration:none; 
		border-bottom:5px solid green;
	}
	
	#sub-3 ul li li a:hover
	{
		text-decoration:none; 
		border-bottom:5px solid green;
	}
	
  .btn1
  {
  	margin-left:43%;
  }
  .btn2
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
			
	.btn-lg2, .btn-group-lg2 > .btn2 
	{
 	 padding: 1.5rem 3rem;
  	 font-size: 1.7rem;
  	 border-radius: 0.3rem;
	} 
		.btn-lg1, .btn-group-lg1 > .btn1 
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



	#al /* 체크박스 */
	{
		 position: static; 
	     /* display:inline-block; */
         width:20px;
         height:20px;
         border:2px solid #bcbcbc;
         margin-left:180px; 
        
         cursor:pointer;
	}

	.all-view{
	margin-top:40px;
	margin-left:auto;
	margin-right:auto;
	width:80%;
	overflow:auto;
	display:block;
	border-bottom:5px solid green;
	}
	
	.view-hr
	{
	display:block;
	border-bottom:5px solid green;
	
	}
	
	.far fa-heart
	{
	width:50px;
	heigth:50px;
	}
	
</style>
</head>



    <body>
        
  

     <%@ include file='../common/navbar.jsp' %>
     
      
	<br><br><br><br>
	
	
	<div class="topArea">
	<br>
		
	</div>
	
	
	<div id="sub-3" class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align ="center">
		<ul class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align ="center">
			<li><a href="/Semi/views/myPage/editInformation.jsp" id="freeboard1">내정보</a></li>
			
		<li class="dropdown"><a class="dropdown-toggle1" data-toggle="dropdown" href="#">찜목록 <span></span></a>
        <ul class="dropdown-menu">
          <li><a href='<%=request.getContextPath() %>/selectDibsO?userNo=<%=loginUser.getMember_No()%>'>상시</a></li>
          <li><a href='<%=request.getContextPath() %>/selectDibs?userNo=<%=loginUser.getMember_No()%>'>펀딩</a></li>
         </ul>
			
			
		 <li class="dropdown"><a class="dropdown-toggle2" data-toggle="dropdown" href="#">장바구니 <span></span></a>
         <ul class="dropdown-menu">
          	<li><a href='<%=request.getContextPath() %>/basket.bo?userNo=<%=loginUser.getMember_No()%>'>상시</a></li>
          	<li><a href="/Semi/views/basket/basketPview.jsp">펀딩</a></li>
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
		<h1 id="MidText">찜&nbsp;&nbsp;&nbsp;목&nbsp;&nbsp;&nbsp;록(&nbsp;펀&nbsp;&nbsp;&nbsp;딩&nbsp;)</h1>
	</div>
	
	
	<br><br><br><br>
	
		<div class="box">
	<form name="all_check">
			 
<div class='all-view'>
   		
   		
   		<div class="clear"></div>
   		<hr class='view-hr'>
   		
   		<div class='all-view-fund'>
   		<div class='row'>
   			<%for(int i=0;i<list.size();i++){ %>
   			<%btn =progressBar(list.get(i).getProgress()); %>
   			
   			<div id='fund-cards' class=" col-sm-3 wow fadeIn">
		            <div class="card">
		            
		           <%-- ,<%=list.get(i).getPro_detail_no() %> --%>
		            	<a href='http://naver.com' style="text-decoration:none; color:black;">
		             	   <img class="img-card" onclick="move(<%=list.get(i).getProduct_no()%>);" src='<%=request.getContextPath()%>/images/funding/<%=list.get(i).getOri_fileName()%>'>
		                </a>
		                <div class="card-content">
		                	
		                    <h2 class="card-title">
		                    	<%=list.get(i).getPro_name()%>
		                    </h2>
		                    
		             		<hr>
			              	          <p class="">
		                        <%-- <div id="myProgress">
								  <div id="myBar<%=i %>" class='myBarS'>
								    <div id="label" class='labelS'>
								    </div>
								  </div>
								</div> --%>
		                    </p>
			              	<h4>
			                   	<span class='fund-money-l'><%=list.get(i).getRanks()%>%</span>  	
			                </h4>
			                <br><hr>
			              
			               <div>
		                    	<%=btn %>
		                    </div>
		                    <span class='fund-money-r'>
			                <i class="far fa-heart" onclick='dips(<%=list.get(i).getDibs_no() %>, this);' value='<%=list.get(i).getDibs_no() %>'></i>
		                    </span>
		                </div>
		            </div>
		       </div>
		       <script>
		       		       $(function(){
						progressed(<%=i%>, <%=list.get(i).getRanks()%>);
					})		
				</script>
		      <%} %>
		       
		 </div>
   		</div>
   		</div>
			 </form>
			</div>
		
		
			<br><br><br><br><br><br>
			

		
			
  		 <script>
  		 
  		 function move(num)
  		 {
  			location.href='selectFood.bo?product_page='+num;
  			 
  		 }
		 function check_all() 
 		{
			for(var i=0; i < all_check.check.length; i++)
			{
				all_check.check[i].checked = true;
			}
		}
		 function progressed(num, number){
				/* 펀딩 프로그레스바*/
			  var elem = document.getElementById("myBar"+num);   
			  var width = 0;
			  var id = setInterval(frame, 30);
			  
			  function frame() {
			    if (width >= number) {
			      clearInterval(id);
			    } else {
			      width++; 
			      elem.style.width = width + '%'; 
			    }
			  }
			}
		    
		 
		 function dips(num, btn){
			console.log("11");
			var userNum = <%=loginUser.getMember_No()%>	
			var num = num;
			console.log("카트번호"+num);
			 if($(btn).attr('style') == undefined){
					<%if(loginUser != null){%>
						$(btn).css('font-weight','900');
						
						$.ajax({
							url:"<%=request.getContextPath()%>/deleteL.dl",
							type:"post",
							data:{
								num : num,
								userNo : <%=loginUser.getMember_No()%>
							},
							success:function(data){
							
							alert('해당 상품을 삭제하였습니다.');
							
							location.href="<%=request.getContextPath()%>/selectDibsO?userNo=" + userNo;
						
							},
				            error:function(data){
				            	alert('데이터 삭제!!!!!!!!!!!!!.');
					            }
						});
					<%}%>
				}
		 }
		 
		 
		 
		 
 		</script>
		  



        <script src="js/core.js"></script> 
        <script src="js/jquery.min.js" ></script> 
        <script src="js/bootstrap.min.js"></script> 
        <script src="js/scrollPosStyler.js"></script> 
        <script src="js/swiper.min.js"></script> 
		<script src="js/isotope.min.js"></script> 
		<script src="js/nivo-lightbox.min.js"></script> 
		<script src="js/wow.min.js"></script>  

		

		
</script>