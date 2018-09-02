<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="com.kh.Semi.facing.model.vo.*, java.util.*" %>

 <% //받은쪽지함
	ArrayList<Facing> list = (ArrayList<Facing>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); 
	
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
<link href="../../css/chat/default.css" rel="stylesheet" type="text/css" media="all" />
<!-- Helper Styles -->
<link href="/Semi/css/chat/loaders.css" rel="stylesheet">
<link href="/Semi/css/chat/swiper.min.css" rel="stylesheet">
<link rel="stylesheet" href="/Semi/css/chat/animate.min.css">
<!-- <link rel="stylesheet" href="/Semi/css/nivo-lightbox.css">
<link rel="stylesheet" href="/Semi/css/nivo_themes/default/default.css"> -->
<!-- Font Awesome Style -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Gaegu" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/funding/fundingList.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/funding/ProgressBar.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/pushy-buttons.css">
<script src="<%= request.getContextPath() %>/js/common/jquery.min.js"></script>

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->
</head>
<style>
.topArea {
		background-image:url(/Semi/images/common/도란도란.png);
		width:100%;
		height:400px;
	}
	#pro{
	width:100px;
	height:100px;
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

	.board_main{
		width:800px;
		margin:left;
		
		
	}

	.blankzone{border-bottom:1px solid #ccc;}
	.t_type, .t_name, .t_day, .t_check{text-align:center;}
	.t_type{width:50px;}
	.t_name{width:120px;}
	.t_day{width:120px;}
	.t_check{width:100px;}
	
	#page{
	 width: 100%;
 text-align: center;
	}
	
	#main{
	display : inline-block;
	}


.title{font-weight:bold;font-size:24px;font-family:"Arial Black", Gadget, sans-serif !important;;text-align:center;vertical-align:top}
.tg  {width :100%;border-collapse:collapse;border-spacing:0;border-color:#ccc;}
.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-top-width:1px;border-bottom-width:1px;border-color:#ccc;color:#333;background-color:#fff;}
.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-top-width:1px;border-bottom-width:1px;border-color:#ccc;color:#333;background-color:#f0f0f0;}
.tg tbody{background-color:#f9f9f9;text-align:left;vertical-align:top}
.tg thead th {background-color:#329a9d;font-weight:bold;color:#efefef;text-align:left;vertical-align:top}
.hover {
		max-width:400px; 
		height:80px; 
		line-height:80px; 
		margin:20px auto; 
		background-color:#f8bbd0;  
		text-align:center; transition:all 0.8s, color 0.3s 0.3s;  
		color:#504f4f; cursor: pointer;  
	}
	.hover:hover{
		color:#fff;
	}

.tg tbody:hover td[rowspan], tr:hover td {
   background: #fffafa; 
}




}
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
	   <br>
	  
   </div>
		<div id="page" class="container">
		
			
		
		<div id="tabMenu-list">
		
		<button type="button"  onclick="location.href='<%=request.getContextPath()%>/selectList.fa'">받은 쪽지함</button>
		<button  type="button" onclick="location.href='<%=request.getContextPath()%>/selectSendList.fa'">보낸 쪽지함</button>
		<button  type="button" onclick="location.href='<%=request.getContextPath()%>/writeInfo.fa'">쪽지 보내기</button>
	</div>
		
	
	<div id="main" >
		<br><br><br><br><br><br><br><br>
		<div id="welcome">
			<div class="title">
				<h4>받은 편지함</h4>
				<br></br>
				</div>
		</div>
		

		<div id="featured">
			
			
			<div id="text-free-2"></div>
		
	<div class="board_main">
		<table class="tg">
		<!-- <colgroup>
			<col style="width:10%">
			<col style="width:auto">
			<col style="width:12%">
			<col style="width:12%">
			<col style="width:12%">
		</colgroup> -->
		<thead>
		<tr >
		
		
		</tr>
			<tr class="titlearea">
				<!-- <th class="text-center" width="20"><strong style="color:#000;"><i class="fa fa-cog fa-lg" aria-hidden="true"></i></strong></th> -->
				
				<th class="t_type"><strong><!--  <input type="checkbox"> --></strong></th>
				<th class="t_tit"><strong> 제목</strong></th>
				<th class="t_name"><strong>보낸사람</strong></th>
				<th class="t_check"><strong>수신일자</strong></th>
				<th class="t_day"><strong>수신확인</strong></th>
		
			</tr>
			<!-- <tr>
				<th colspan="4" class="blankzone">　</th>
			</tr> -->
			
		</thead>
		
		<tbody>
		
			
			<!-- <tr>
				<td class="t_type">  <input type="checkbox"></td>
				<td class="t_tit" style="float:left";><a href="" class="tover">문의합니다.</a></td>
				<td class="t_name">유저1</td>
				<td class="t_day">2018-07-31</td>
			</tr> -->
			
			<% for(Facing f : list){ 
				if(Integer.parseInt(f.getReceiver()) == loginUser.getMember_No()){%>
				<tr>
					<input type="hidden" value="<%=f.getFacing_No()%>">	
					<td> </td>
					<td class="t_tit"><%=f.getFacing_Title() %></td>
					<td class="t_name"><%=f.getWriter() %></td>
					<td class="t_day"><%=f.getWrite_Date() %></td>
					<td class="t_check"><%=f.getReception_Check() %></td>
				</tr>
				<% } %>
			<% } %> 
			
			
		</tbody>
	</table>
	<%-- <input type="hidden" value="<%=loginUser.getMember_No()%>"></input> --%>
	<script>
		$(function(){
			$(".board_main td").mouseenter(function(){
				$(this).parent().css({"background":"lightgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				var num = $(this).parent().children("input").val();
				location.href="<%=request.getContextPath()%>/selectOne.fa?num=" + num;
			});
			
			/* $.ajax({
				url:"selectList.fa?",
				type:"GET",
				success:function(){
					console.log("성공했지비");
				},
				error:function(data){
					console.log("오지마세요.");
					console.log(data);
				}
			}); */
			
			
		});
		
	</script>
	
	<%-- 페이지처리 --%>
	<div class="pageArea" align="center">
	<br></br>
		<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectList.fa?currentPage=1'">≪</button>
		<% if(currentPage <= 1){ %>
			<button class="active" disabled>＜</button>
		<% }else{ %>
			<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectList.fa?currentPage=<%=currentPage - 1%>'">＜</button>
		<% } %>
		
		<% for(int p = startPage; p <= endPage; p++){
			if(p == currentPage){%>
				<button class="active" disabled><%= p %></button>
			<% }else{ %>
				<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectList.fa?currentPage=<%=p%>'"><%=p %></button>
			<% } %>
		<% } %>
		
		<% if(currentPage >= maxPage){ %>
			<button class="active" disabled>＞</button>
		<% }else{ %>
			<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectList.fa?currentPage=<%=currentPage + 1%>'">＞</button>
		<% } %>
			<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectList.fa?currentPage=<%=maxPage%>'">≫</button>
	</div>
	
	</div>
	<hr></hr>
		<div class="write-bottom">
      	<br></br>
		<!-- <select class="write-bottom-1">
			<option>보낸사람</option>
			<option>제목</option>
		</select> -->
		<!-- <input type="search" class="searchBox write-bottom-1"></input>
		<input type="button" value ="검색" class="btn write-bottom-1" onclick=""></input> -->
	<%-- 	<% if(loginUser != null){ %>
				<button onclick="location.href='views/board/boardInsertForm.jsp'">작성하기</button>
			<% } %> --%>
	</div>	
			
			
			</div>
	</div>
</div>

</body>
</html>
