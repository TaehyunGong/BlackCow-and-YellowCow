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
		color:WHITE;
		text-align:center;
	}
	#subText{
		color:WHITE;
		text-align:center;
	}
	#sub-1{
		height:40px;
		border-bottom:1px solid black;
		
	}
	.ulsub-1 {
		list-style:none;
		margin-top:15px;
		text-align:center;
		margin-left:38%;
	}
	.ulsub-1 li{
		float:left;
		font-size:23px;
		font-weight:bold;
		margin-right:40px;
	}
	.ulsub-1 li .ul-li-a{
		text-decoration:none;
		color:black;
	}
	.ulsub-1 li .ul-li-a:hover{
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
		<h1 id="topText">도란도란</h1>
		<h4 id="subText">서로의 이야기를 나누는 공간</h4> -->
	</div>
	<div id="sub-1">
		<ul class="ulsub-1">
			<li><a class="ul-li-a" href="<%=request.getContextPath() %>/selectList.bo" id="freeboard">자유게시판</a></li>
			<li><a class="ul-li-a" href="#" id="infoboard">농사 정보 게시판</a></li>
		</ul>
		
	</div>
	<div id="freeboardtext">
		<h2 id="text-free-1">농사 정보 게시판</h2>
	</div>
	<div id="text-free-2">- 선정적, 비방글은 무통보 삭제될 수 있습니다.</div>
	
	<div class="board_main">
		<table class="table table-bordered table-hover not_header">
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
		<% if(loginUser.getMember_Type().equals("M4")){ %>
        	<input type="button" value="글쓰기" class="btn btn-write" Onclick="window.location='doran_write.jsp'"><br>
        <% } %>
		<select class="write-bottom-1">
			<option>작성자</option>
			<option>제목</option>
		</select>
		<input type="search" class="searchBox write-bottom-1">
		<input type="button" value="검색" class="btn write-bottom-1">
	</div>
        
        
        
        
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>


    </body>
</html>