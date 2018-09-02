<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.Semi.facing.model.vo.*"%>
    <%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.json.simple.*" %>


 <% //보낸쪽지 1개 상세페이지.
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
		width:900px;
		margin:left;
		
		
	}
		#page{
	 width: 100%;
 text-align: center;
	}
	
	#main{
	display : inline-block;
	}
	.table{
		width:900px;
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
	.topArea {
		background-image:url(/Semi/images/common/도란도란.png);
		width:100%;
		height:400px;
	}
.view_header {padding:10px 20px;}
.view_header .title_area {overflow:hidden;font-size:16px;padding:0;margin:0}
.view_header .title_area dt {float:left;padding-right:20px}
.view_header .title_area dd {overflow:hidden}
.view_info {position:relative;border-top:1px dashed #ccc;margin:0 -20px;padding:10px 20px 0;font-size:12px}
.view_info .data {position:absolute;right:20px;top:10px}
.view_info .data span {padding-left:15px;position:relative}
.view_info .data span ~ span {margin-left:15px;}
.view_info .data span ~ span:before {content:'';position:absolute;left:0;top:50%;height:10px;width:1px;background-color:#ccc;margin-top:-5px}
.view_contents {padding:20px; margin-top:20px; border-top:1px solid #ccc;border-bottom:1px solid #ccc;}
.content-bottom{border-bottom:1px solid #ccc;}

.view_contentstext{padding:20px; margin-left:-140px; margin-top:20px; float:left;}
	
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
		
	<div id="main">
		
		<div id="welcome">
			<div class="title">
			<p></p>
				<h2>보낸 편지함</h2>
				</div>
		</div>
		<div id="featured">
			
	
	<div class="board_main" style="width:800px; height:400px;">
		<div class="view_header">
			<dl class="title_area">
				<dt></dt>
				<input type="hidden" class="b_no" value="<%=f.getFacing_No()%>">
				<dd>제목 &nbsp;<%=f.getFacing_Title() %></dd>
				</dl>
			<div class="view_info">
				<div class="preson" style="float:left">받는사람 &nbsp;<%=f.getReceiver() %></div>
				<div class="data">
					<span>보낸날짜 </span>
					<span><%=f.getWrite_Date() %></span>
		
				</div> 
			</div>
		</div>
		<div class="view_contentstext">내용</div>
		<div class="view_contents">
			<%=f.getFacing_Content() %>
		</div>

      </div>
          <div  class="reply-1">
         
          </div>
		</div>
		
		<!-- 글쓰기,답글,목록 -->
		<div class="reply-bottom" align="right">
			<input type="button" class="btn" value="삭제" onclick="deleteFacing();" style="width:100px; height:40px; margin-top:10px; background-color:green; color:white;"></input>
			<input type="button" class="btn" value="목록" onclick="backList();" style="width:100px; height:40px; margin-top:10px; background-color:green; color:white;"></input>
		</div>
		
		
		<script>
			
			function deleteFacing(){
				alert("쪽지가 삭제되었습니다.");
				location.href="<%=request.getContextPath()%>/deleteSendFacing.fa?num=<%=f.getFacing_No()%>";
			}
		
		
			function backList(){
				
				location.href="<%=request.getContextPath()%>/selectSendList.fa";
			}
		
		</script>
		
		
		

    
    
	
	</div>
        
        
        
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>


</div>
</div>
</div>
<script src="/Semi/js/chat/core.js"></script> 
<script src="/Semi/js/chat/jquery.min.js" ></script> 
<script src="/Semi/js/chat/bootstrap.min.js"></script> 
<script src="/Semi/js/chat/scrollPosStyler.js"></script> 
<script src="/Semi/js/chat/swiper.min.js"></script> 
<script src="/Semi/js/chat/isotope.min.js"></script> 
<script src="/Semi/js/chat/nivo-lightbox.min.js"></script> 
<script src="/Semi/js/chat/wow.min.js"></script> 


</body>
</html>
