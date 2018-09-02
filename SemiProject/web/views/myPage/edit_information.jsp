<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Custom styles for this template -->
<link href="/Semi/css/custom.css" rel="stylesheet">


<!-- Font Awesome Style -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Gaegu" rel="stylesheet">
 <link href="css/bootstrap.min.css" rel="stylesheet">
  
 <!-- font awesome -->
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="css/style.css" media="screen" title="no title" charset="utf-8">
    
    <!-- 네비바 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    

<style>
.topArea {
		background-image:url(/web/images/common/초원.jpg);
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
 	#freeboard{
		display:block;
		border-bottom:5px solid green;
	} 
	#infoboard:hover
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
	

	
	
	
	
	/* ======================== */
/* 	#freeboard{
		display:block;
		border-bottom:5px solid green;
		
	}
	#infoboard:hover{
		display:block;
		border-bottom:5px solid green;
	}
	*/
	#freeboardtext{
		height:240px;
		border:1px solid white;
		text-align:center;

	} 
	#text-free-1{
		font-size:50px;
		font-weight:bold;
		text-align:center;
		margin-top:100px;

	}
	#text-free-2{
		font-size:15px;
		margin-left:220px;
		
	}
	
	.board_main{
		
		height:100%;
		width:100%;
		
	}
	.table{
	
		width:1100px;
		border-top:5px solid green;
	}
	.all{margin:0 auto;}
	



	/* ======================== */
	
	
	
		 .btn2
	 {
	 	margin-left : 700px;
	 }
	
 	 .btn-info2 
 	 {
 		color: #fff;
 		background-color: #2F9D27;
  		border-color: #5bc0de;
	 }
				
				
	.btn-info2:hover 
	{
  		color: #fff;
  		background-color: #31b0d5;
  		border-color: #2aabd2;
	}

	 .btn-lg2, .btn-group-lg2 > .btn2 
	{
 	 padding: 1.5rem 3rem;
  	 font-size: 1.7rem;
  	 border-radius: 0.3rem;
	 } 
	 
	 .btn-info2:hover 
	 {
  	color: #fff;
  	background-color: #31b0d5;
  	border-color: #2aabd2;
	}

	 
	 
	   .btn1
	 {
	 	 margin-left : 50px; 
	 }
	  .btn-info1 
	  {
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
	 .btn-info1:hover 
	 {
  	color: #fff;
  	background-color: #31b0d5;
  	border-color: #2aabd2;
	}


.greenline
	{
		height:10px;
		border-bottom:5px solid green;
	
	}
	
	.container
	{
		margin-left:700px;
	}
	
		 .box
	{
		width:900px;
		margin:0 auto; 
	}  
	
	#id
	{
	 	position: static; 
	     /* display:inline-block; */
         width:20px;
         height:20px;
         border:2px solid #bcbcbc;
         margin-left:180px; 
        
         cursor:pointer;
	}
	
	
	
</style>
    <body>
        
    <%@ include file='../common/navbar.jsp' %>
     
      

	<div class="topArea col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<br>
		<h1 id="topText">마이페이지</h1>
	
	</div>
	
	
	
	<div id="sub-2" class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align ="center">
		<ul class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align ="center">
			<li><a href="/Semi/views/myPage/edit_information.jsp" id="freeboard">내정보</a></li>
			
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
	
	<div class="MidArea">
		<br>
		<h1 id="MidText">회&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;정&nbsp;&nbsp;&nbsp;보</h1>
	</div>


	
	
	<div class="board_main" align="center">


	<br><br><br><br><br><br><br><br><br><br>
	
	 <article class="container">
	<form class="form-horizontal">
	
	<div class="form-group">
            <label class="col-sm-3 control-label" for="inputPassword">아이디</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="아이디">
          </div>
        </div>
        
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">닉네임</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" type="password" placeholder="닉네임">
        </div>
        </div>
        
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" type="password" placeholder="숫자, 특수문자 포함 8자 이상">
        </div>
        </div>
           <div class="form-group">
            <label class="col-sm-3 control-label" for="inputNumberCheck">주소</label>
          <div class="col-sm-6">
            <div class="input-group">
              <input class="form-control" id="inputNumberCheck" type="text" placeholder="인증번호">
              <span class="input-group-btn">
                <button class="btn btn-success" type="button">주소 검색<i class="fa fa-edit spaceLeft"></i></button>
              </span>
            </div>
          </div>
           <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck"></label>
             <div class="col-sm-6">
              <input class="form-control" id="inputPasswordCheck" type="password" placeholder="상세 주소를 입력하세요">
                <p class="help-block"></p>
             </div>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">이메일</label>
        <div class="col-sm-6">
         <div class="input-group">
          <input class="form-control" id="inputEmail" type="email" placeholder="이메일  주소를 정확히 입력해 주세요">
        	 <span class="input-group-btn">
                    <button class="btn btn-success">인증메일 전송<i class="fa fa-mail-forward spaceLeft"></i></button>
                  </span> 
        </div>
        </div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label" for="inputNumber">연락처(HP)</label>
              <div class="col-sm-6">
                <div class="input-group">
                  <input type="tel" class="form-control" id="inputNumber" placeholder="- 없이 입력해 주세요" />
                  
                </div>
              </div>
        </div>
       
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
            <div class="col-sm-6" data-toggle="buttons">
              <label class="btn btn-warning active">
                <input id="agree" type="checkbox" autocomplete="off" chacked>
                  <span class="fa fa-check"></span>
              </label>
              <a href="#">이용약관</a> 에 동의 합니다.
            </div>
          </div>
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="submit">정보수정<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="submit">수정취소<i class="fa fa-times spaceLeft"></i></button>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">탈퇴하기<i class="fa fa-check spaceLeft"></i></button>
          </div>
        </div>
        </form>
          <hr>
        </div>
      </article>
	
	
        
	</div>
        




</div>


<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" align="center">탈퇴하기</h4>
        </div>
        <div class="modal-body">
        
        	<br><br>
	
	<img class="img-card" src='<%=request.getContextPath()%>/images/funding/탈퇴.PNG' width="700px" height="500px">
	
	
		
<br><br><br>

	
<hr>

<br><br><br>


<div class="form-group">
    <label for="pwd">패스워드</label>
    <input type="password" class="form-control" id="pwd">
    <label for="pwd">패스워드 확인</label>
    <input type="password" class="form-control" id="pwd">
  </div>
  <div class="greenline">
  </div>
  <div class="checkbox">
      <label><input type="checkbox" id="al" name="remember"> 안내사항을 확인하였으며, 이에 동의 합니다.</label>
  </div>

  <br><br><br><br>
     
        </div>
        
        <div class="modal-footer">
         <button type="button" onclick="application();" class="btn btn-default" data-dismiss="modal">탈퇴하기</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

        
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        
	<script src="/Semi/js/core.js"></script> 
	<script src="/Semi/js/jquery.min.js" ></script> 
	<script src="/Semi/js/bootstrap.min.js"></script> 
	<script src="/Semi/js/scrollPosStyler.js"></script> 
	<script src="/Semi/js/swiper.min.js"></script> 
	<script src="/Semi/js/isotope.min.js"></script> 
	<script src="/Semi/js/nivo-lightbox.min.js"></script> 
	<script src="/Semi/js/wow.min.js"></script> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    </body>
</html>