<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.Semi.board.model.vo.*" %>
<%@page import="java.util.*" %>
<% 
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
		margin:0 auto;
		border-top:5px solid green;
		
		
	}
	.table{
		width:1100px;
		border-collapse:collapse;
		border-spacing:0;
		border-top:5px solid green;
	}
	.btn-write{color:white; background-color:green;}
.write-bottom{width:1100px;margin:0 auto; max-width:98%; text-align:right;}
.write-bottom-1{margin-top:8px;}
	.t_type, .t_name, .t_day, .t_count{text-align:center;}
	
.btn-write{background-color:green; color:white;}
.btn-search{background-color:green; color:white;}
.btn-select{width:80px; height:30px;}
	
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
			<% for(Board b : list){ %>
				<tr>
					<input type="hidden" value="<%=b.getBoard_No()%>">	
					<td class="t_type"><%=b.getBoard_Detail_No() %></td>
					<td class="t_tit"><%=b.getBoard_Title() %></td>
					<td class="t_name"><%=b.getMember_No() %></td>
					<td class="t_day"><%=b.getWrite_Date() %></td>
					<td class="t_count"><%=b.getBoard_Count() %></td>
				</tr>
			<% } %>
			
		</tbody>
	</table>
	</div>
	<%-- 게시글 클릭관련  --%>
	
	<script>
		$(function(){
			$(".board_main td").mouseenter(function(){
				$(this).parent().css({"background":"lightgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				var num = $(this).parent().children("input").val();
				location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num;
			});
		});
	</script>
	
	<div class="pageArea" align="center">
		<button class="active" onclick="location.href='<%=request.getContextPath()%>/search.bo?currentPage=1'">≪</button>
		<% if(currentPage <= 1){ %>
			<button class="active" disabled>＜</button>
		<% }else{ %>
			<button class="active" onclick="location.href='<%=request.getContextPath()%>/search.bo?currentPage=<%=currentPage - 1%>'">＜</button>
		<% } %>
		
		<% for(int p = startPage; p <= endPage; p++){
			if(p == currentPage){%>
				<button class="active" disabled style="background-color:white; color:black"><%= p %></button>
			<% }else{ %>
				<button class="active" onclick="location.href='<%=request.getContextPath()%>/search.bo?currentPage=<%=p%>'"><%=p %></button>
			<% } %>
		<% } %>
		
		<% if(currentPage >= maxPage){ %>
			<button class="active" disabled>＞</button>
		<% }else{ %>
			<button class="active" onclick="location.href='<%=request.getContextPath()%>/search.bo?currentPage=<%=currentPage + 1%>'">＞</button>
		<% } %>
			<button class="active" onclick="location.href='<%=request.getContextPath()%>/search.bo?currentPage=<%=maxPage%>'">≫</button>
	</div>
	
	
	<form action="<%=request.getContextPath()%>/search.bo" method="get">
	<div class="write-bottom">
		<% if(loginUser != null){ %>
        <input type="button" value="글쓰기" class="btn btn-write" Onclick="location.href='<%=request.getContextPath()%>/views/community/doran_write.jsp'"><br>
        <% } %>
		<select class="write-bottom-1 btn-select" name="searchCondition" value="searchCondition" id="searchCondition">
			<option value="allList">전체</option>
			<option value="writer">작성자</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="search" id="searchValue" name="searchValue" class="searchBox write-bottom-1">
		<button type="submit" id="research" value="검색" class="btn write-bottom-1 btn-search" >검색</button>
	</div>
    </form>
   
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <%@ include file="../common/footer.jsp" %>


    </body>
</html>