<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
	
	#freeboard:hover{
		display:block;
		border-bottom:5px solid green;
	}
	#infoboard{
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
		height:700px;
		margin:0 auto;
		
		
	}
	.table{
		width:1100px;
		border-collapse:collapse;
		border-spacing:0;
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
			<li><a href="/Semi/views/community/doran_main.jsp" id="freeboard">자유게시판</a></li>
			<li><a href="/Semi/views/community/farm_info.jsp" id="infoboard">농사 정보 게시판</a></li>
		</ul>
		
	</div> -->
	
	
	<div id="freeboardtext">
		<h2 id="text-free-1">자주 묻는 질문</h2>
	</div>
	<div id="text-free-2">- 찾으시는 질문이 없는 경우 1:1 문의를 이용해 주세요.</div>
	
	<div class="board_main">
	<form name="writeform" action="" method="post">
		<table class="table table-bordered">
			
			<tr>
				<td id="td1" style="width:130px;" align="center"><strong style="color:#000;">제목</strong></td>
				<td> 
				<input type="text" name="title" size="50" style="width:700px;">
				</td>
			</tr>
			<tr>
				<td style="width:130px; height:400px;" align="center"><strong style="color:#000;">내용</strong></td>
				<td>
				<textarea name="editor1" id="editor1" rows="10" cols="80"></textarea>
				
				</td>
			</tr>
			<!-- <tr>
				<td style="width:120px;" align="center"><strong style="color:#000;">파일<br>첨부</strong></td>
				<td>
				<input type="text" name="fileaddress" style="width:300px; margin-top:10px;">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="file" name="file">
				</td>
			</tr> -->
			<tr>
				<td></td>
				<td align="right">
				<input type="submit" value="게시글 등록">
				</td>
			</tr>
			
		
		
	</table>
	</form>
	</div>
        


    </body>
</html>