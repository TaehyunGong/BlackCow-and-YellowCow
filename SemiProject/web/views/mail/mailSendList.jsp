<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.Semi.facing.model.vo.*, java.util.*" %>
    
    <% //보낸쪽지함
	ArrayList<Facing> list = (ArrayList<Facing>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage(); 
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Skeleton 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20130902

-->
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
	.table{
		width:800px;
		border-top:5px solid green;
	}
	.blankzone{border-bottom:1px solid #ccc;}
	.t_type, .t_name, .t_day, .t_tit1{text-align:center;}
	.t_type{width:50px;}
	.t_name{width:100px;}
	.t_day{width:120px;}
	
	
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
	#page{
	 width: 100%;
 text-align: center;
	}
	
	#main{
	display : inline-block;
	}

.topArea {
		background-image:url(/Semi/images/common/도란도란.png);
		width:100%;
		height:400px;
	}
.t_tit{width:300px;}
.t_tit1{align:center;}
.t_name, .t_day, .t_count{width:50px; text-align:center;}
</style>
<body>
   <%@ include file="../common/navbar.jsp" %>
    <div class="topArea col-lg-12 col-md-12 col-sm-12 col-xs-12">
	   <br>
	  
   </div>
<div id="page" class="container">
	<div id="tabMenu-list">
		
		<button type="button"  onclick="location.href='<%=request.getContextPath()%>/selectList.fa'">받은 쪽지함</button>
		<button  type="button" onclick="location.href='<%=request.getContextPath()%>/selectSendList.fa'">보낸 쪽지함</button>
		<button  type="button" onclick="location.href='<%=request.getContextPath()%>/writeInfo.fa'">쪽지 보내기</button>
	</div>
		
	<div id="main">
		
		<div id="welcome">
			<div class="title">
			<br><br><br></br></br></br>
				<h2>보낸 편지함</h2>
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
	<br></br>
			<tr class="titlearea">
				<!-- <th class="text-center" width="20"><strong style="color:#000;"><i class="fa fa-cog fa-lg" aria-hidden="true"></i></strong></th> -->
				
				<!-- <th class="t_type"><strong> <input type="checkbox"></strong></th> -->
				<th class="t_tit t_tit1"><strong >제목</strong></th>
				<th class="t_name"><strong>받는사람</strong></th>
				<th class="t_day"><strong>발신일자</strong></th>
				<th class="t_count"><strong>수신여부</strong></th>
				
		
			</tr>
			<!-- <tr>
				<th colspan="4" class="blankzone">　</th>
			</tr> -->
			
		</thead>
		
		<tbody>
		<!-- 
			<tr>
				<td class="t_type">  </td>
				<td class="t_tit"><a href="" class="tover"><br></a></td>
				<td class="t_name"></td>
				<td class="t_day"></td>
			</tr> -->
			
		
			<% for(Facing f : list){
				if(Integer.parseInt(f.getWriter()) == loginUser.getMember_No()){%>
				<tr>
					<input type="hidden" value="<%=f.getFacing_No()%>">	
					<!-- <td> </td> -->
					<td class="t_tit"><%=f.getFacing_Title() %></td>
					<td class="t_name"><%=f.getReceiver() %></td>
					<td class="t_day"><%=f.getWrite_Date() %></td>
					<td class="t_count"><%=f.getReception_Check() %></td>

				</tr>
				<% } %>
			<% } %> 
			
			
		</tbody>
	</table>
	
		<script>
		$(function(){
			$(".board_main td").mouseenter(function(){
				$(this).parent().css({"background":"lightgray", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				var num = $(this).parent().children("input").val();
				location.href="<%=request.getContextPath()%>/sendSelectOne.fa?num=" + num;
			});
			
		});
		
	</script>
	<%-- 페이지처리 --%>
	<div class="pageArea" align="center">
	<br></br>
		<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectSendList.fa?currentPage=1'">≪</button>
		<% if(currentPage <= 1){ %>
			<button class="active" disabled>＜</button>
		<% }else{ %>
			<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectSendList.fa?currentPage=<%=currentPage - 1%>'">＜</button>
		<% } %>
		
		<% for(int p = startPage; p <= endPage; p++){
			if(p == currentPage){%>
				<button class="active" disabled><%= p %></button>
			<% }else{ %>
				<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectSendList.fa?currentPage=<%=p%>'"><%=p %></button>
			<% } %>
		<% } %>
		
		<% if(currentPage >= maxPage){ %>
			<button class="active" disabled>＞</button>
		<% }else{ %>
			<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectSendList.fa?currentPage=<%=currentPage + 1%>'">＞</button>
		<% } %>
			<button class="active" onclick="location.href='<%=request.getContextPath()%>/selectSendList.fa?currentPage=<%=maxPage%>'">≫</button>
	</div>
	
	</div>
	<hr></hr>
		<div class="write-bottom">
      	<br></br>
		<!-- <select class="write-bottom-1">
			<option>받는사람</option>
			<option>제목</option>
		</select>
		<input type="search" class="searchBox write-bottom-1"></input>
		<input type="button" value="검색" class="btn write-bottom-1" onclick=""></input> -->
		<%-- 	<% if(loginUser != null){ %>
				<button onclick="location.href='views/board/boardInsertForm.jsp'">작성하기</button>
			<% } %> --%>
	</div>	
			
			
			</div>
	</div>
</div>
<!-- <script src="/Semi/js/chat/core.js"></script> 
<script src="/Semi/js/chat/jquery.min.js" ></script> 
<script src="/Semi/js/chat/bootstrap.min.js"></script> 
<script src="/Semi/js/chat/scrollPosStyler.js"></script> 
<script src="/Semi/js/chat/swiper.min.js"></script> 
<script src="/Semi/js/chat/isotope.min.js"></script> 
<script src="/Semi/js/chat/nivo-lightbox.min.js"></script> 
<script src="/Semi/js/chat/wow.min.js"></script> 
 -->
</body>
</html>
