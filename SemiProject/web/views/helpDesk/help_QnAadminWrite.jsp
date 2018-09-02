<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.Semi.board.model.vo.*" %>
<%
	Board b = (Board)request.getAttribute("b");
%>
<!DOCTYPE html>
<html>
    <head>
    </head>
 <meta charset="UTF-8">
 <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Nanum+Gothic|Yeon+Sung" rel="stylesheet">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">

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
	
	#freeboard{
		display:block;
		border-bottom:5px solid green;
	}
	#infoboard:hover{
		display:block;
		border-bottom:5px solid green;
	}
	#helpAllQnA:hover{display:block; border-bottom:5px solid green;}
	
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
	.btn-write{color:white; background-color:green;}
.write-bottom{width:1100px;margin:0 auto; max-width:98%; text-align:right;}
.write-bottom-1{margin-top:8px;}
	.board_main table {table-layout:fixed}
.board_main .table-bordered {border:none}
.board_main .table-bordered td, .board_main .table-bordered th {
	border-left:none;
	border-right:none;}
	.t_type, .t_name, .t_day, .t_count{text-align:center;}
	
	
</style>

<script>
	function sendFile(file, editor){
		//파일 전송을 위해 폼 생성.
		data = new FormData();
		data.append("uploadFile", file);
		
		$.ajax({
			data:data,
			type:"post",
			url:"./summernote_imageUploadHp.jsp",
			cache:false,
			contentType:false,
			processData:false,
			success:function(data){
				console.log("올라간다 이미지@");
				$(editor).summernote('editor.insertImage', data.url);
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
	}
	
	
</script>
    <body>
        
   <%@ include file="../common/navbar.jsp" %>
    <script src="<%= request.getContextPath() %>/js/common/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script> 
        
	<div class="topArea">
	<!-- <br>
		<h1 id="topText">1:1문의</h1>
		<h4 id="subText">신속하게 답변해 드리겠습니다.</h4> -->
	</div>
	<div id="sub-1">
		<ul class="ulsub-1">
			<%-- <li><a class="ul-li-a" href="#" id="freeboard">문의하기</a></li>
			<li><a class="ul-li-a" href="<%=request.getContextPath() %>/selectList.hp" id="infoboard">나의 문의내역 확인</a></li> --%>
			<%-- <% if(loginUser.getMember_Id().equals("admin")){ %>
			<li><a href="<%=request.getContextPath() %>/searchAllQna.hp" id="helpAllQnA">문의내역 보기</a></li>
			<% } %> --%>
		</ul>
		
	</div>
	
	
	<div id="freeboardtext">
		<h2 id="text-free-1">문의답변</h2>
	</div>
	<div id="text-free-2"><!-- - 문의 내용과 맞지않는 문의유형을 선택하실 경우 답변이 지연될 수 있습니다. --></div>
	<form name="writeForm" action="<%=request.getContextPath()%>/insertAnswer.hp?num=<%=b.getBoard_No() %>" method="post">
	<div class="board_main">
		<table class="table table-bordered table-hover not-header">
		<colgroup>
			<col style="width:12%">
			<col style="width:13%">
			<col style="width:13%">
			<col style="width:22%">
			<col style="width:40%">
		</colgroup>
		<thead>
			<tr>
				
				<th colspan="5" style="border-top:5px solid green; background-color:lightgray;">　상세입력란</th>
			</tr>
			
			<tr>
				<td class="t_type t_name">제목</td>
				<td colspan="4" class="t_tit">
					<textarea name="title" style="width:950px; height:25px; resize:none; overflow:hidden;"><%=b.getBoard_Title() %></textarea>
				</td>
			</tr>
			<tr>
				<td class="t_type t_name">답변내용</td>
				<td colspan="4" class="t_tit">
					<textarea name="content" id="summernote" style="width:950px; height:400px; resize:none;"><%=b.getBoard_Content() %></textarea>
					<script>
					$(function(){
		            	 $("#summernote").summernote({
		            		height : 400,
		            		callbacks:{
		            			//이미지 업로드시 이벤트 발생
		            			onImageUpload:function(files, editor, welEditable){
		            				console.log(files);
		            				console.log(editor);
		            				console.log(welEditable);
		            				
		            				sendFile(files[0], this);
		            			}
		            		}
		            	 });
		            	 
		             });
					</script>
				</td>
			</tr>
			
			
		</thead>
		
	</table>
	
	
	</div>
	
	<div class="write-bottom">
		<input type="reset" value="작성취소" class="btn btn-write">&nbsp;&nbsp;
        <button type="submit" value="접수하기" id="btnQna" class="btn btn-write">답변하기</button><br>
        <script>
        	$(function(){
        		
        		$("#btnQna").click(function(){
        			alert("답변이 등록되었습니다.");
        		});
        	});
        </script>
	</div>
     </form>   
        
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <%@ include file="../common/footer.jsp" %>


    </body>
</html>