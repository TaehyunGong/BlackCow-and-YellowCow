<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세페이</title>	
<style>
	

.notice_board {width:960px; margin:0 auto;}
	
	
	
	
.detail_page {border:1px solid gray; height:500px; }
	
	.board_inner {float:left; }
.board_inner li {float:left; list-style:none; margin-right:10px; }
	.board_inner li a {text-decoration:none; color:black;}
	.board_inner li a:hover {text-decoration: underline;}
	
.detail_page2 {height:75px; border-top:1px solid gray; border-bottom:1px solid gray; clear:both; text-decoration:none;}
	
	.chat {display:inline-block; line-height: 0}
	.detail_page2 span a {text-decoration:none; color:black;}
	.detail_page2 span a:hover {text-decoration: underline;}
	

</style>
</head>	
<body>
<%@ include file='../common/navbar.jsp' %>
	<br><br><br>
        <div class="notice_board">
			   
        	<div class="detail_page">
				<ul class="board_inner">
			   	<li><a href="#">삭제</a></li>
			   	<li><a href="#">답장</a></li>
			   </ul>
			
				<div class="detail_page2">
				<h3 class="chat">보낸사람</h3> <span><a href="">곰내(jongjjn1027)</a></span><br>
				<h3 class="chat">받은시간</h3> <span>2018-05-05 [16:46]</span> 
				<span class="chat2"><a href="">차단</a></span>
				
				</div>
				<div class="detail_page3">
				
				내용없음
				</div>
				
			</div>
        </div>

	
	
	
	
</body>	
</html>