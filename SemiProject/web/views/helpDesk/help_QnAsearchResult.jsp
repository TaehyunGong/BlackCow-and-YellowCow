<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.Semi.board.model.vo.*" %>
<%@ page import="java.util.*" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	String admin = "admin";
	
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
		margin:0 auto;
		font-size:15px;
	}
	
	.board_main{
		width:1100px;
		margin:0 auto;
		border-top:5px solid green;
		
	}
	.table{
		width:1100px;
		
	}
	.btn-write{color:white; background-color:green;}
.write-bottom{width:1100px;margin:0 auto; max-width:98%; text-align:right;}
.write-bottom-1{margin-top:8px;}

.hp-1, .hp-2, .hp-3, .hp-4{font-weight:bold; font-size:16px; text-align:center;}
.hp-1{width:120px;}
.hp-2{width:730px;}
.hp-3, .hp-4{width:120px;}

.qna-1, .qna-2, .qna-3, .qna-4{font-wieght:bold; font-size:16px;}
.qna-1, .qna-3, .qna-4{text-align:center;}

/* 페이징처리 관련 css */
.pageArea * {box-sizing:border-box}
.pageArea {text-align:center;margin-top:15px;}
.pageArea button {display:inline-block;padding:0 5px;height:30px;min-width:30px;text-align:center;line-height:20px;border:1px solid #ccc;color:#333;font-size:13px;margin:0 2px}
.pageArea button.active {background-color:lightgray;color:black;border-color:#333;font-weight:bold}
.pageArea button.active:hover{cursor:pointer; background-color:black;color:white;}

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
		<h2 id="text-free-1">나의 문의내역</h2>
	</div>
	<div id="text-free-2">- 회원님께서 문의주셨던 내용들입니다.</div>
	
	<div class="board_main">
		<table class="table table-bordered table-hover not-header">
		
		<thead>
			<tr>
				<td class="hp-1">회원명</td>
				<td class="hp-2">제목</td>
				<td class="hp-3">문의일자</td>
				<td class="hp-4">진행상태</td>
			</tr>
		</thead>
		<tbody>
		<% for(Board b : list){ %>
			<% if(loginUser.getMember_Nick().equals(b.getMember_No())){ %>
				<tr>
					<input type="hidden" value="<%=b.getBoard_No()%>">
					<td class="hp-1"><%=b.getMember_No() %></td>
					<td class="hp-2"><%=b.getBoard_Title() %></td>					
					<td class="hp-3"><%=b.getWrite_Date() %></td>
					<td class="hp-4"><%=b.getQna_Status() %></td>
				</tr>
			<% } %>
		<% } %>
			
		</tbody>
	</table>
	
	</div>
	
	<script>
		$(function(){
			$(".board_main tbody td").mouseenter(function(){
				$(this).parent().css({"background":"lightgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				var num = $(this).parent().children("input").val();
				location.href="<%=request.getContextPath()%>/selectOne.hp?num="+num;
			});
		});
	</script>
	
	<div class="pageArea" align="center">
		<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectList.hp?currentPage=1'">≪</button>
		<% if(currentPage <= 1){ %>
			<button class="active" disabled>＜</button>
		<% }else{ %>
			<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectList.hp?currentPage=<%=currentPage - 1%>'">＜</button>
		<% } %>
		
		<% for(int p = startPage; p <= endPage; p++){
			if(p == currentPage){%>
				<button class="active" disabled style="background-color:white; color:black"><%= p %></button>
			<% }else{ %>
				<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectList.hp?currentPage=<%=p%>'"><%=p %></button>
			<% } %>
		<% } %>
		
		<% if(currentPage >= maxPage){ %>
			<button class="active" disabled>＞</button>
		<% }else{ %>
			<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectList.hp?currentPage=<%=currentPage + 1%>'">＞</button>
		<% } %>
			<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectList.hp?currentPage=<%=maxPage%>'">≫</button>
	</div>
	
	<div class="write-bottom">
        <input type="button" value="문의하기" class="btn btn-write" onclick="location.href='<%=request.getContextPath()%>/views/helpDesk/help_QnA.jsp'"><br>
		
	</div>
        
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="../common/footer.jsp" %>
    </body>
</html>