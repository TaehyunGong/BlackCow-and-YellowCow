<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.Semi.member.model.vo.*" %>
<%@ page import="com.kh.Semi.facing.model.vo.*" %>
<%@ page import="java.util.*" %>
<%//쪽지 답장 보내기 눌렀을때 보여줄 페이지.
	Facing f = (Facing)request.getAttribute("f");
	
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


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../../css/chat/default.css" rel="stylesheet" type="text/css" media="all" />


<link href="/Semi/css/chat/loaders.css" rel="stylesheet">
<link href="/Semi/css/chat/swiper.min.css" rel="stylesheet">
<link rel="stylesheet" href="/Semi/css/chat/animate.min.css">


<!-- Font Awesome Style -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Gaegu" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/funding/fundingList.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/funding/ProgressBar.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/pushy-buttons.css">
<script src="<%= request.getContextPath() %>/js/common/jquery.min.js"></script>

</head>

<!-- 
<link href="/Semi/css/bootstrap.min.css" rel="stylesheet">
Custom styles for this template
<link href="/Semi/css/custom.css" rel="stylesheet"> -->
<style>
	#pro{
	width:100px;
	height:100px;
	}
	

	.table{
		width:800px;
		border-collapse:collapse;
		border-spacing:0;
		border-top:5px solid green; 
	}
	
	.topArea {
		background-image:url(/Semi/images/common/도란도란.png);
		width:100%;
		height:400px;
	}
	
</style>
<body>
   <%@ include file="../common/navbar.jsp" %>
    <div class="topArea col-lg-12 col-md-12 col-sm-12 col-xs-12">
	 
	  
   </div>
    <script src="<%= request.getContextPath() %>/js/common/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>  
	
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
				<h2>쪽지 보내기</h2>
				</div>
		</div>
		<div id="featured">
			
			
			
	<div class="board_main">
	
		<table class="table table-bordered">
		
			<tr>
				<!-- <th class="text-center" width="20"><strong style="color:#000;"><i class="fa fa-cog fa-lg" aria-hidden="true"></i></strong></th> -->
				<td style="width:100px; height:50px;" align="center"><strong style="color:#000;">제목</strong></td>
				<td>
				 <input type="text" name="title" id="title" size="50" style="width:600px; height:25px; float:center;"></input>
				 </td>
				
				 
				<!-- <th class="text-center" width="10"><strong style="color:#000;"></strong></th>
				<th class="text-center" width="10"><strong style="color:#000;"></strong></th>
				<th class="text-center" width="20"><strong style="color:#000;"></strong></th>
				<th class="text-center" width="20"><strong style="color:#000;"></strong></th> -->
			</tr>
			<tr>
				<td id="td1" style="width:130px; height:50px;" align="center"><strong style="color:#000;">받는 사람</strong></td>
				<td>
				<input type="text" name="receiver" id="receiver" size="50" value="<%=f.getWriter()%>"style="width:600px; height:25px; float:center;"></input>
				</td>
			</tr>
			<tr>
				<td style="width:130px; height:400px;" align="center"><strong style="color:#000;">내용</strong></td>
				<td>
				<textarea name="content" id="content" size="1000" style="width:600px; height:400px;"></textarea>
				</td>
			</tr>
			<tr>
				<td></td>
				<td align="right">
				<input type="button" onclick="sendFacing();" class="btn btn-write" value="쪽지보내기"></input>
				</td>
			</tr>
			
			
			
			
	</table>
	</div>  
	<script>
	
	
		$(function(){
			var reciverNo = 0;
		});
		
		function sendFacing(){
			var title = $("#title").val();
			var receiver = $("#receiver").val();
			var content = $("#content").val();
			
			console.log("제목 : " + title);
			console.log("받는사람 : " + receiver);
			//console.log("받는사람 유저번호 : " + receiverNo);
			console.log("내용 : " + content);
			
			$.ajax({
				url:"<%=request.getContextPath()%>/sendFacing.fa",
				type:"post",
				data:{title:title, receiver:receiver, content:content},
				success:function(data){
					console.log("데이터 : " + data);
					if(data > 0){
						alert("쪽지를 발송했습니다.");
						
					}
					$("#title").val("");
					$("#receiver").val("");
					$("#content").val("");
				},
				error:function(data){
					alert("존재하지 않는 회원 입니다.");
					$("#receiver").focus();
				}
			});
			
			
		}
	</script>
	

			
			</div>
	</div>
</div>


</body>
</html>
