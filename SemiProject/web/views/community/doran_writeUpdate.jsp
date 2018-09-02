<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.Semi.board.model.vo.*" %>
<% Board b = (Board)request.getAttribute("b"); %>
<!DOCTYPE html>
<html>
    <head>
 <meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Nanum+Gothic|Yeon+Sung" rel="stylesheet">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
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
		height:700px;
		margin:0 auto;
		
		
	}
	.table{
		width:1100px;
		border-collapse:collapse;
		border-spacing:0;
		border-top:5px solid green; 
	}
	.btn-write{background-color:green; color:white;}
	
	
</style>
    <body>
        
    <%@ include file="../common/navbar.jsp" %>
     <script src="<%= request.getContextPath() %>/js/common/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script> 
        
	<div class="topArea">
	<!-- <br>
		<h1 id="topText">도란도란</h1>
		<h4 id="subText">서로의 이야기를 나누는 공간</h4> -->
	</div>
	<div id="sub-1">
		<ul class="ulsub-1">
			<li><a class="ul-li-a" href="<%=request.getContextPath() %>/selectList.bo" id="freeboard">자유게시판</a></li>
			<li><a class="ul-li-a" href="<%=request.getContextPath() %>/views/community/farm_info.jsp" id="infoboard">농사 정보 게시판</a></li>
		</ul>
		
	</div>
	
	
	<div id="freeboardtext">
		<h2 id="text-free-1">자유게시판</h2>
	</div>
	<div id="text-free-2">- 선정적, 비방글은 무통보 삭제될 수 있습니다.</div>
	
	<div class="board_main">
	<form name="writeform" action="<%=request.getContextPath() %>/updateOneBoard.bo?num=<%=b.getBoard_No() %>" method="post">
		<table class="table table-bordered">
		
			
			<tr>
				<td id="td1" style="width:130px;" align="center"><strong style="color:#000;">제목</strong></td>
				<td> 
				<input type="text" name="title" size="50" style="width:700px;" value="<%=b.getBoard_Title()%>">
				</td>
			</tr>
			<tr>
				<td style="width:130px; height:400px;" align="center"><strong style="color:#000;">내용</strong></td>
				<td>
				<textarea name="content" id="summernote" rows="10" cols="80"><%=b.getBoard_Content() %></textarea>
				<script>
				$(function(){
	            	 $("#summernote").summernote({
	            		height : 400 
	            	 });
	             });
					
				</script>
				
				</td>
			</tr>
			
			<tr>
				<td></td>
				<td align="right">
				<input type="submit" class="btn btn-write" value="게시글 등록">
				</td>
			</tr>
			
		
		
	</table>
	</form>
	</div>
        
        
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <%@ include file="../common/footer.jsp" %>
    </body>
</html>