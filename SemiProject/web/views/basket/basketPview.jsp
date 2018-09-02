<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--     Bootstrap core CSS
<link href="css/bootstrap.min.css" rel="stylesheet"> -->
<!-- Custom styles for this template -->

<link href="css/custom.css" rel="stylesheet">

<!-- Helper Styles -->
<link href="css/loaders.css" rel="stylesheet">
<link href="css/swiper.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/nivo-lightbox.css">
<link rel="stylesheet" href="css/nivo_themes/default/default.css">
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

<style>

	.topArea {
		background-image:url(images/common/초원.jpg);
		width:100%;
		height:400px;
		font-family:"yeonsung";
		
	}
	#topText {
		font-size:125px;
		margin-top:140px;
		font-weight:bold;
		color:WHITE;
		text-align:center;
	}
	
	#MidText {
		font-size:80px;
		margin-top:110px;
		font-weight:bold;
		color:black;
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
		font-family:"yeonsung";
		
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
	


/* 	.sticky {
  		position: fixed;
 		top: 0;
  		width: 15%;
  		height:100%
		} */
		
/* ======환불 버튼 색상 ===== */
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
	
</style>
</head>



    <body>
        
  

     <%@ include file='../common/navbar.jsp' %>
     
      
	<br><br><br><br>
	
	
	<div class="topArea">
	<br>
		<h1 id="topText">장&nbsp;&nbsp;&nbsp;&nbsp;바&nbsp;&nbsp;&nbsp;&nbsp;구&nbsp;&nbsp;&nbsp;&nbsp;니</h1>
	</div>
	
	
	<<div id="sub-2" class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align ="center">
		<ul class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align ="center">
			<li><a href="/Semi/views/myPage/edit_information.jsp" id="freeboard1">내정보</a></li>
			
		<li class="dropdown"><a class="dropdown-toggle1" data-toggle="dropdown" href="#">찜목록 <span></span></a>
        <ul class="dropdown-menu">
          <li><a href="/Semi/views/dip/dipOtview.jsp">상시</a></li>
          <li><a href="/Semi/views/dip/dipPview.jsp">펀딩</a></li>
          </ul>
			
			
		 <li class="dropdown"><a class="dropdown-toggle2" data-toggle="dropdown" href="#">장바구니 <span></span></a>
         <ul class="dropdown-menu">
          	<li><a href="/Semi/views/basket/basketOtview.jsp">상시</a></li>
          	<li><a href="/Semi/views/basket/basketPview.jsp">펀딩</a></li>
          </ul>
          
          	
          	 <li class="dropdown"><a class="dropdown-toggle3" data-toggle="dropdown" href="#">결제내역 <span></span></a>
         <ul class="dropdown-menu">
          	<li><a href="/Semi/views/payment/paymentOtview.jsp">상시</a></li>
          	<li><a href="/Semi/views/payment/paymentPview.jsp">펀딩</a></li>
          </ul>
         	
		
		</ul>
		
	</div>
	
	<br><br>
	
	
	<div class="MidArea">
		<br>
		<h1 id="MidText">장&nbsp;&nbsp;&nbsp;바&nbsp;&nbsp;&nbsp;구&nbsp;&nbsp;&nbsp;니&nbsp;&nbsp;&nbsp;(&nbsp;펀&nbsp;&nbsp;&nbsp;딩&nbsp;)</h1>
	</div>
	
	
	<br><br><br><br>
	
	<div class="box">
	
	<form name="all_check">
<div class='all-view'>
   	
   		<div class="clear"></div>
   		<hr class='view-hr'>
   		
   		<div class='all-view-fund'>
   		<div class='row'>
   			<%for(int i=0;i<4;i++){ %>
   			<div id='fund-cards' class=" col-sm-3 wow fadeIn">
		            <div class="card">
		            
		            <div class="checkb"><input type="checkbox" id="al" name="check"/></div>
		            	<a href='http://naver.com' style="text-decoration:none; color:black;">
		             	   <img class="img-card" src='<%=request.getContextPath()%>/images/funding/melon.jpg'>
		                </a>
		                <div class="card-content">
		                    <h4 class="card-title">
		                    	치킨
		                    </h4>
		                    
		                    <p class="">
		                        <div id="myProgress">
								  <div id="myBar" class='myBarS'>
								    <div id="label" class='labelS'>
								    </div>
								  </div>
								</div>
		                    </p>
		                    <p>
			                   	<span class='fund-money-l'>갓태현 농부</span>
			                   	<span class='fund-money-r'><%=99 %>%</span>
			                </p>
			                <div class="clear"></div>
			                <hr class='mode-hr'>
		                    <p class='fund-periodAndPersonnel alpha'>
		                    	<label class='fund-period'>28남음</label></label>
		                    	<span class='fund-money-r'>
			                    	
		                    	</span>
		                    </p>
		                </div>
		            </div>
		       </div>
		      <%} %>
		 </div>
   		</div>
			 
			 </form>
			</div>
		
			
			
			<br><br><br><br><br><br>
			
	   <input type="button"class="btn1 btn-info1 btn-lg1" onclick="check_all();" value="전체체크"/>
	   <input type="button" class="btn2 btn-info2 btn-lg2" value="선택주문"/>  	
  		<br><br><br><br><br><br><br><br><br><br><br>
       
 

			<br><br><br><br><br><br>
			<br><br><br><br><br><br>
			<br><br><br><br><br><br>
			<br><br><br><br><br><br>
			<br><br><br><br><br><br>

			
  		 <script>
		 function check_all() 
 		{
			for(var i=0; i < all_check.check.length; i++)
			{
				all_check.check[i].checked = true;
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