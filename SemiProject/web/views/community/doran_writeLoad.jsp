<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.Semi.board.model.vo.*"%>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="org.json.simple.*" %>

<% Board b = (Board)request.getAttribute("b"); 
	ArrayList<Board> replyList = (ArrayList<Board>)request.getAttribute("replyList");
	
	
%>

<!DOCTYPE html>
<html>
    <head>
    
    </head>
 <meta charset="UTF-8">

<!-- Font Awesome Style -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Gaegu" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link href="<%=request.getContextPath() %>/fonts/fonts/font-awesome.min.css" rel="stylesheet">
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
	.re-4:hover{cursor:pointer;}
	
	
	.facingImage{display:inline-block;}
	.facingImage:hover{cursor:pointer;}
	
	#imageFacing{width:20px; height:20px;}
	
	
	.modal-title{font-size:12px;}
	
	.btn_modal{width:70px; height:40px; background-color:green; color:white;}
	.btn_modal1{width:110px; height:40px; background-color:green; color:white;}
	
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
		<h1 id="topText">도란도란</h1>
		<h4 id="subText">서로의 이야기를 나누는 공간</h4> -->
	</div>
	<div id="sub-1">
		<ul class="ulsub-1">
			<li><a class="ul-li-a" href="<%=request.getContextPath() %>/selectList.bo" id="freeboard">자유게시판</a></li>
			<li><a class="ul-li-a" href="/Semi/views/community/farm_info.jsp" id="infoboard">농사 정보 게시판</a></li>
		</ul>
		
	</div>
	
	
	<div id="freeboardtext">
		<h2 id="text-free-1">자유게시판</h2>
	</div>
	<div id="text-free-2">- 선정적, 비방글은 무통보 삭제될 수 있습니다.</div>
	
	<div class="board_main" style="width:1100px; height:400px;">
	<form name="writeform" method="post">
		<div class="view_header">
			<dl class="title_area">
				<dt></dt>
				<input type="hidden" class="b_no" value="<%=b.getBoard_No()%>">
				<dd><%=b.getBoard_Title() %></dd>
			</dl>
			<div class="view_info">
				<div class="preson"><%=b.getMember_No() %>&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="facingImage" data-toggle="modal" data-target="#facingModal"><img id="imageFacing" src="<%=request.getContextPath()%>/images/common/쪽지.png"></div>
				</div>
				<div class="data">
					<span><%=b.getWrite_Date() %></span>
					<span>조회수 : <%=b.getBoard_Count() %></span>
				</div> 
			</div>
		</div>
		<div class="view_contents">
			<%=b.getBoard_Content() %>
		</div>
		
		<!-- 작성자 옆 쪽지보내기 클릭시 모달창 -->
		<div class="modal fade" id="facingModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="modal-title"> <%=b.getMember_No() %>님께 쪽지 보내기</h6>
					</div>
					<div class="modal-body">
						<input type="text" id="facingTitle" style="width:270px;" placeholder="제목을입력하세요.">
						<p></p>
						<textarea id="facingContent" style="width:270px; height:100px; resize:none;" placeholder="내용을 입력하세요."></textarea>
					</div>
					<div class="modal-btnArea" align="right">
						<button type="button" class="btn btn_modal" data-dismiss="modal">닫기</button>&nbsp;&nbsp;
						<button type="button" class="btn btn_modal1" id="facingAction" data-dismiss="modal">쪽지보내기</button>&nbsp;&nbsp;&nbsp;
						
					</div>
					<br>
				</div>
			</div>
		</div>
		<input type="hidden" id="memberNoValue" value="<%=b.getMember_No()%>">
		<script>
		var memberNoValue = $("#memberNoValue").val();
			$(function(){
				
				$("#facingAction").click(function(){	//모달창에서 쪽지보내기 버튼 클릭시 작동할 펑션.
					var userNick = memberNoValue;
					var title = $("#facingTitle").val();
					var content = $("#facingContent").val();
					console.log("받는사람 : " + userNick);
					console.log("제목 : " + title);
					console.log("내용 : " + content);
					
					$.ajax({
						url:"<%=request.getContextPath()%>/sendFacing.fa",
						type:"GET",
						data:{title:title, content:content, receiver:userNick},
						success:function(data){
							if(data > 0){
								alert("쪽지를 발송했습니다.");
							}
						},
						error:function(data){
							alert("발송에 실패했습니다.");
						}
					});
					
				});
				
			});
		</script>
		
		<!-- 댓글과 조회수 부분 -->
		<div class="content-bottom">
			<div class="ct-bottom" align="center" style="width:130px; height:30px; margin-top:5px;"><span>댓글  </span></div>
			
		</div>
		</form>
		<!-- 댓글출력부분 -->
		
		<!-- <form id="writeReply"> -->
			
		<div style="border-bottom:1px solid lightgray;">
			<table id="reply-ii">
				<tbody>
					<tr>
						<td> </td>
						<td> </td>
						<td> </td>
						<td> </td>
						<td> </td>
					</tr>
				</tbody>
			</table>
		</div>	
		<div class="replay-total" style="margin-top:10px;">
		<div class="replyDiv reply-1">
        <textarea class="form-control" name="rep_content" id="rep_content" style="width:988px; height:60px;"></textarea>
       <!--  <input type="text" style="width:990px; height:60px;"> -->
      </div>
          <div  class="reply-1">
          <% if(loginUser != null){ %>
          <input type="button" class="btn btn-reply" id="addReply" name="replyArea" value="등록" style="width:105px; height:60px; margin-top:-50px; background-color:green; color:white;">
          <% }else{%>
          <input type="button" class="btn btn-reply" id="addReply" disabled name="replyArea" value="등록" style="width:105px; height:60px; margin-top:-50px; background-color:green; color:white;">
          <% } %>
          </div>
		</div>
			
		<!-- </form> -->
		
		
		<!-- 댓글창부분 -->
		<% if(loginUser != null){ %>
		<input type="hidden" class="memberNickName" value="<%=loginUser.getMember_Nick()%>">
		
		<!-- 글쓰기,답글,목록 -->
		<div class="reply-bottom" align="right">
			<input type="button" class="btn" value="글쓰기" onclick="location.href='<%=request.getContextPath()%>/views/community/doran_write.jsp'" style="width:100px; height:40px; margin-top:10px; background-color:green; color:white;">
			<% if(loginUser.getMember_Nick().equals(b.getMember_No())){ //작성자만 삭제,수정 보이도록 조건문. %>
			<input type="button" class="btn" value="수정하기" onclick="location.href='<%=request.getContextPath()%>/updateBoardInfo.bo?num=<%=b.getBoard_No()%>'"style="width:100px; height:40px; margin-top:10px; background-color:green; color:white;">
			<input type="button" class="btn" value="삭제" onclick="deleteBoard();"style="width:100px; height:40px; margin-top:10px; background-color:green; color:white;">
			<% } %>
			<input type="button" class="btn" value="목록으로" onclick="location.href='<%=request.getContextPath()%>/selectList.bo'"style="width:100px; height:40px; margin-top:10px; background-color:green; color:white;">
		</div>
		<script>
		
			var num = 0;
			var name = $(".memberNickName").val();
			
			$(function(){
				
			
				//페이지 로딩 시 댓글 List 출력.
				getReplyList();
				
				
				//댓글 등록 눌렀을 시 이벤트.
				$("#addReply").click(function(){
					//댓글에 아무 내용이 없을 시 경고창 띄우고, 포커스on.
					if($("#rep_content").val() == ""){
						alert("댓글 내용을 입력하세요.");
						$("#rep_content").focus();
					}
				
					$.ajax({
						url:"insert.rp",
						type:"post",
						data:{boardNo:<%=b.getBoard_No()%>, writer:<%=loginUser.getMember_No()%>, content:$("#rep_content").val()},
						dataType:"json",
						success:function(data){
							console.log("오는거지?");
							console.log(data);
							replyAdd(data);
						},
						error:function(data){
							console.log("여기는오지마라..."+data);
						}
					});
				});
				
				
				function replyAdd(data){
					console.log("replyAdd 여기 펑션은?");
					$("#reply-ii").html("");
					$.each(data, function(index, value){
						
						var $table = $("#reply-ii");
						var $tr = $("<tr style='border-bottom:1px dashed #ccc'>");
						var repNo = $("<input type='hidden' value="+value.board_Detail_No+">");
						num=value.board_Detail_No;
						var writer = $("<td class='re-1'>").text(value.member_No);
						var content = $("<td class='re-2'>").text(value.board_Content);
						var repUp = $("<td class='re-3'>").text(" ");
						var repDe = $("<td class='re-4' onclick=deleteReply("+num+")>").text("삭제");
						var repBl = $("<td class='re-3'>").text(" ");
						var wdate = $("<td class='re-5'>").text(value.write_Date);
						
						$tr.append(repNo);
						$tr.append(writer);
						$tr.append(content);
						$tr.append(repUp);
						if(name == value.member_No){
							$tr.append(repDe);
						}else{
							$tr.append(repBl);
						}
						$tr.append(wdate);
						$table.append($tr);
						
						
					});
						$("#rep_content").val("");
					
				}
				console.log("멤버번호 "+<%=loginUser.getMember_No()%>);
				console.log("닉네임 "+name);
				
				
				function getReplyList(){
					
				
					$.ajax({
						url:"replyList.rp?num="+<%=b.getBoard_No()%>,
						type:"get",
						dataType:"json",
						success:function(data){
							console.log("실행은되니?" + data);
							$("#reply-ii tbody").html("");
							var $table = $("#reply-ii tbody");
							var replyCount = data.length;
							if(data.length > 0){
								
								for(var i = 0; i < data.length; i++){
									$table += "<tr style='border-bottom:1px dashed #ccc;'>";
									$table += "<input type='hidden' value="+data[i].board_Detail_No+">";
									num=data[i].board_Detail_No;
									$table += "<td class='re-1'>" + data[i].member_No + "</td>";
									$table += "<td class='re-2'>" + data[i].board_Content + "</td>";
									$table += "<td class='re-3'> </td>";
									console.log(data[i].member_No);
									if(name == data[i].member_No){
										$table += "<td class='re-4' onclick='deleteReply("+num+");'>삭제</td>";
									}else{
										$table += "<td class='re-3'> </td>";
									}
									$table += "<td class='re-5'>" + data[i].write_Date + "</td>";
									$table += "</tr>";
									console.log(data[i].board_No);
									console.log(data[i].board_Detail_No);
									console.log(num);
								}
									$("#reply-ii").append($table);
							}
							
						}
					});
				}
				
				
			});
			
			//게시글 삭제 호출함수.
			function deleteBoard(){
				var check = confirm("삭제하시겠습니까?");	//예,아니오 true,false 받아옴.
				
				if(check == true){
					alert("삭제되었습니다.");
					location.href="<%=request.getContextPath()%>/delete.bo?num="+<%=b.getBoard_No()%>;
				}
			}
			
			
			//댓글삭제클릭
			function deleteReply(num){
				console.log("클릭되었니?");
				console.log(num);
				alert("댓글이 삭제되었습니다.");
				
				$.ajax({
					url:"delete.rp?num="+num,
					type:"get",
					data:{num:num, boardNo:<%=b.getBoard_No()%>},
					success:function(data){
						console.log(data);
						$("#reply-ii tbody").html("");
						var $table = $("#reply-ii");
						
						for(var i = 0; i < data.length; i++){
							$table += "<tr style='border-bottom:1px dashed #ccc;'>";
							$table += "<input type='hidden' value="+data[i].board_Detail_No+">";
							num=data[i].board_Detail_No;
							$table += "<td class='re-1'>" + data[i].member_No + "</td>";
							$table += "<td class='re-2'>" + data[i].board_Content + "</td>";
							$table += "<td class='re-3'></td>";
							if(name == data[i].member_No){
								$table += "<td class='re-4' onclick='deleteReply("+num+");'>삭제</td>";
							}else{
								$table += "<td class='re-3'> </td>";
							}
							$table += "<td class='re-5'>" + data[i].write_Date + "</td>";
							$table += "</tr>";
							console.log(data[i].board_No);
							console.log(data[i].board_Detail_No);
							console.log(num);
						}
						$("#reply-ii").html($table);
						
					}
				});
				
				
			}
			
		
		</script>
		<% }else{ %>
		 <div class="reply-bottom" align="right">
      		<input type="button" class="btn" value="목록으로" onclick="location.href='<%=request.getContextPath()%>/selectList.bo'"style="width:100px; height:40px; margin-top:10px; background-color:green; color:white;">
    	 </div>
		<script>
			$(function(){
				getReplyList();
			});
			
			function getReplyList(){
				
				
				$.ajax({
					url:"replyList.rp?num="+<%=b.getBoard_No()%>,
					type:"get",
					dataType:"json",
					success:function(data){
						console.log("실행은되니?" + data);
						$("#reply-ii tbody").html("");
						var $table = $("#reply-ii tbody");
						var replyCount = data.length;
						if(data.length > 0){
							
							for(var i = 0; i < data.length; i++){
								$table += "<tr style='border-bottom:1px dashed #ccc;'>";
								$table += "<input type='hidden' value="+data[i].board_Detail_No+">";
								num=data[i].board_Detail_No;
								$table += "<td class='re-1'>" + data[i].member_No + "</td>";
								$table += "<td class='re-2'>" + data[i].board_Content + "</td>";
								$table += "<td class='re-3'> </td>";
								console.log(data[i].member_No);
								if(name == data[i].member_No){
									$table += "<td class='re-4' onclick='deleteReply("+num+");'>삭제</td>";
								}else{
									$table += "<td class='re-3'> </td>";
								}
								$table += "<td class='re-5'>" + data[i].write_Date + "</td>";
								$table += "</tr>";
								console.log(data[i].board_No);
								console.log(data[i].board_Detail_No);
								console.log(num);
							}
								$("#reply-ii").append($table);
						}
						
					}
				});
			}
		</script>
		<% } %>
		
	</div>
        
        
        
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <%@ include file="../common/footer.jsp" %>
	
    </body>
</html>