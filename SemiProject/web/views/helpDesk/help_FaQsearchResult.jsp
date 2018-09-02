<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
 <meta charset="UTF-8">

<!-- Font Awesome Style -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Gaegu" rel="stylesheet">

<style>
	.topArea {
		background-image:url(/Semi/images/common/도란도란.png);
		width:100%;
		height:400px;
	}
	#topText {
		font-size:125px;
		margin-top:140px;
		font-weight:bold;
		color:#ccc;
		text-align:center;
	}
	#subText{
		color:#ccc;
		text-align:center;
	}
	#sub-1{
		height:40px;
		border-bottom:1px solid black;
		
	}
	ul {
		list-style:none;
		margin-top:15px;
		text-align:center;
		margin-left:38%;
	}
	ul li{
		float:left;
		font-size:23px;
		font-weight:bold;
		margin-right:40px;
	}
	ul li a{
		text-decoration:none;
		color:black;
	}
	ul li a:hover{
		text-decoration:none;
		color:black;
	}
	
	#freeboard{
		display:block;
		border-bottom:5px solid green;
	}
	#infoboard:hover{
		display:block;
		border-bottom:5px solid green;
	}
	
	#freeboardtext{
		height:240px;
		border:1px solid white;
	}
	#text-free-1{
		font-size:50px;
		font-weight:bold;
		text-align:center;
		margin-top:100px;
	}
	#text-free-2{
		width:1100px;
		margin:0 auto;
		font-size:15px;
	}
	
	.board_main{
		width:1100px;
		margin:0 auto;
		
		
	}
	.table{
		width:1100px;
		border-top:5px solid green;
	}
	
	
</style>
    <body>
        
   <%@ include file="../common/navbar.jsp" %>
        
	<div class="topArea">
	<!-- <br>
		<h1 id="topText">FAQ</h1>
		<h4 id="subText">자주 문의하시는 질문과 답변을 모아두었습니다.</h4> -->
	</div>
	
	<!-- <div id="sub-1" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<ul class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<li><a href="#" id="freeboard">자유게시판</a></li>
			<li><a href="/Semi/views/community/farm_info.jsp" id="infoboard">농사 정보 게시판</a></li>
		</ul>
		
	</div> -->
	
	
	<div id="freeboardtext">
		<h2 id="text-free-1">자주 묻는 질문</h2>
	</div>
	<div id="text-free-2">- 찾으시는 질문이 없는 경우 1:1 문의를 이용해 주세요.</div>
	
	<div class="board_main">
		<table class="table table-bordered table-hover not-header">
		<colgroup>
			<col style="width:10%">
			<col style="width:auto">
			<col style="width:12%">
			<col style="width:12%">
			<col style="width:12%">
		</colgroup>
		<thead>
			<tr>
				<!-- <th class="text-center" width="20"><strong style="color:#000;"><i class="fa fa-cog fa-lg" aria-hidden="true"></i></strong></th> -->
				<th class="text-center"><strong style="color:#000;"> </strong></th>
				<th class="text-center"><strong style="color:#000;">제목</strong></th>
				<th class="text-center"><strong style="color:#000;">작성자</strong></th>
				<th class="text-center"><strong style="color:#000;">작성일자</strong></th>
				<th class="text-center"><strong style="color:#000;">조회수</strong></th>
			</tr>
		</thead>
		<tbody>
			
			
		</tbody>
	</table>
	
	
	</div>
	
	<div class="write-bottom">
       
		<select class="write-bottom-1">
			<option>작성자</option>
			<option>제목</option>
		</select>
		<input type="search" class="searchBox write-bottom-1">
		<input type="button" value="검색" class="btn write-bottom-1" onclick="window.location='help_FaQsearchResult.jsp'">
	</div>
	<br>
	
	<div class="help_bottom help_bottom_1">
		<div class="help_bottom_2"><span><strong>원하는 답변을 찾지 못하셨나요?</strong></span></div>
		<div class="help-bottom-1">
			<div class="help-bottom-2">
				<div class="b-info1"><img src="../../images/common/helpimage.PNG"></div>
				<div class="b-info1 b-info2"><span><strong> 이용안내 바로가기</strong></span></div>
			</div>
			<div class="help-before"><span></span><span></span></div>
			<div class="help-bottom-3">
				<div class="b-info3"><img src="../../images/common/helpimage.PNG"></div>
				<div class="b-info3 b-info4"><strong> 1:1문의 바로가기</strong></div>
			</div>
		</div>
	</div>
        
        
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>

    </body>
</html>