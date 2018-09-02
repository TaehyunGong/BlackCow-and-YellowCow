<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="com.kh.Semi.board.model.vo.*" %>
<%
	Board b = (Board)request.getAttribute("b");
%>
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
		background-image:url(/Semi/images/common/QNA.png);
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
		font-size:15px;
		margin:0 auto;
	}
	
	.board_main{
		width:1100px;
		margin:0 auto;
		border-top:5px solid green;
	}
	.table{
		width:1100px;
		border-collapse:collapse;
		border-spacing:0;
		border-top:5px solid green; 
	}
	
	.head-title{
		display:inline-block;
	}
	.title1{width:110px; height:25px;}
	.title2{width:550px; height:25px;}
	.title3{border-left:1px solid lightgray; width:300px; height:25px;}
	.title4{width:130px; height:25px; text-align:center;}
	.writer{padding-top:7px;}
	.ct-bottom{display:inline-block;}
	.reply-1{display:inline-block;}
	
	.form-control{
		resize:none;
	}
	.view_header {padding:10px 20px;border-bottom:1px solid #ccc}
.view_header .title_area {overflow:hidden;font-size:16px;padding:0;margin:0}
.view_header .title_area dt {float:left;padding-right:20px}
.view_header .title_area dd {overflow:hidden}
.view_info {position:relative;border-top:1px dashed #ccc;margin:0 -20px;padding:10px 20px 0;font-size:12px}
.view_info .data {position:absolute;right:20px;top:10px}
.view_info .data span {padding-left:15px;position:relative}
.view_info .data span ~ span {margin-left:15px;}
.view_info .data span ~ span:before {content:'';position:absolute;left:0;top:50%;height:10px;width:1px;background-color:#ccc;margin-top:-5px}
.view_contents {padding:20px;border-bottom:1px solid #ccc}
	.content-bottom{border-bottom:1px solid #ccc;}
	
	.re-1{width:100px; height:50px; text-align:center;}
	.re-2{width:850px;}
	.re-3{width:50px; font-size:12px;}
	.re-4{width:50px; font-size:12px;}
	.re-5{width:120px;}
	.re-3, .re-4:hover{cursor:pointer;}
	
	
	/* .coment-head{display:inline;}
	.coment-head-main{width:1050px; height:80px; align:top;}
	.coment-1{display:inline-block;}
	.cc-1{border:1px solid black; width:60px; height:60px;}
	.cc-2{border:1px solid black; width:150px; height:30px;}
	.cc-3{border:1px solid black; width:200px; height:30px;}
	.cc-4{border:1px solid black; width:200px; height:30px;}
	.cc-5{border:1px solid black; width:800px; height:30px;} */
	
</style>
    <body>
        
    <%@ include file="../common/navbar.jsp" %>
        
	<div class="topArea">
	<!-- <br>
		<h1 id="topText">1:1문의</h1>
		<h4 id="subText">신속하게 답변해 드리겠습니다.</h4> -->
	</div>
	<div id="sub-1">
		<ul class="ulsub-1">
			<li><a class="ul-li-a" href="<%=request.getContextPath() %>/selectList.hp" id="infoboard">나의 문의내역 확인</a></li>
			<li><a class="ul-li-a" href="<%=request.getContextPath() %>/views/helpDesk/help_QnA.jsp" id="freeboard">문의하기</a></li>
		</ul>
		
	</div>
	
	
	<div id="freeboardtext">
		<h2 id="text-free-1">문의내용확인</h2>
	</div>
	<div id="text-free-2">- 문의 내용과 맞지않는 문의유형을 선택하실 경우 답변이 지연될 수 있습니다.</div>
	
	<div class="board_main" style="width:1100px; height:400px;">
	<form name="writeform" action="" method="post">
		<div class="view_header">
			<dl class="title_area">
				<dt>제목</dt>
				<input type="hidden" class="b_no" value="<%=b.getBoard_No()%>">
				<dd><%=b.getBoard_Title() %></dd>
			</dl>
			<div class="view_info">
				<div class="preson"><%=b.getMember_No() %></div>
				<div class="data">
					<span><%=b.getWrite_Date() %></span>
					
				</div>
			</div>
		</div>
		<div class="view_contents">
			<%=b.getBoard_Content() %>
		</div>
		
		
		
		<!-- 글쓰기,답글,목록 -->
		<div class="reply-bottom" align="right">
		<% if(!loginUser.getMember_Id().equals("admin")){ %>
			<input type="button" class="btn" onclick="location.href='<%=request.getContextPath()%>/views/helpDesk/help_QnA.jsp'" value="문의하기" style="width:100px; height:40px; margin-top:10px; background-color:green; color:white;">
		<% }else{ %>
			<input type="button" class="btn" onclick="location.href='<%=request.getContextPath()%>/updateQnaInfo.hp?num=<%=b.getBoard_No() %>'" value="답변등록" style="width:100px; height:40px; margin-top:10px; background-color:green; color:white;">
		<% } %>
			<input type="button" class="btn" onclick="location.href='<%=request.getContextPath()%>/selectList.hp'" value="목록으로" style="width:100px; height:40px; margin-top:10px; background-color:green; color:white;">
		</div>
		
		
    
    
    
	</form>
	</div>
        
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="../common/footer.jsp" %>




    </body>
</html>