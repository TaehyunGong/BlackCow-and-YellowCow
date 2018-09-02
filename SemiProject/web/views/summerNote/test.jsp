<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>bootstrap4</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
  </head>
  <body>

    <!-- <div id="summernote"></div> -->
    <%@ include file="../common/navbar.jsp" %>
    
    <script src="<%= request.getContextPath() %>/js/common/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
    	<div class="topArea">
	
		<!-- <h1 id="topText">도란도란</h1>
		<h4 id="subText">서로의 이야기를 나누는 공간</h4> -->
	</div>
	<div id="sub-1" >
		<ul>
			<li><a href="#" id="freeboard">자유게시판</a></li>
			<li><a href="/Semi/views/community/farm_info.jsp" id="infoboard">농사 정보 게시판</a></li>
		</ul>
		
	</div>
	
	
	
	<div id="freeboardtext">
		<h2 id="text-free-1">자유게시판</h2>
	</div>
	<div id="text-free-2">- 선정적, 비방글은 무통보 삭제될 수 있습니다.</div>
	
	<div class="board_main">
	<form name="writeform" action="<%=request.getContextPath() %>/insert.bo" method="post">
		<table class="table table-bordered ">
		
			<tr>
				<!-- <th class="text-center" width="20"><strong style="color:#000;"><i class="fa fa-cog fa-lg" aria-hidden="true"></i></strong></th> -->
				<td style="width:130px;" align="center"><strong style="color:#000;">게시판</strong></td>
				 <td><select name="category">
					<option>자유게시판</option>
					<option>농사정보게시판</option>
				</select> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="secondCategory">
					<option>말머리</option>
					<option>정보</option>
					<option>일상</option>
					<option>자유</option>
				</select>
				 </td>
				<!-- <th class="text-center" width="10"><strong style="color:#000;"></strong></th>
				<th class="text-center" width="10"><strong style="color:#000;"></strong></th>
				<th class="text-center" width="20"><strong style="color:#000;"></strong></th>
				<th class="text-center" width="20"><strong style="color:#000;"></strong></th> -->
			</tr>
			<tr>
				<td id="td1" style="width:130px;" align="center"><strong style="color:#000;">제목</strong></td>
				<td> 
				<input type="text" name="title" size="50" style="width:700px;">
				</td>
			</tr>
			<tr>
				<td style="width:130px; height:400px;" align="center"><strong style="color:#000;">내용</strong></td>
				<td>
    <textarea id="summernote1"></textarea>
    <script>
      $('#summernote1').summernote();
    </script>
				
				</td>
			</tr>
			<tr>
				<td style="width:120px;" align="center"><strong style="color:#000;">파일<br>첨부</strong></td>
				<td>
				<input type="text" name="fileaddress" style="width:300px; margin-top:10px;">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="file" name="file">
				</td>
			</tr>
			<tr>
				<td></td>
				<td align="right">
				<input type="submit" value="게시글 등록">
				</td>
			</tr>
			
		
		
	</table>
	</form>
	</div>
        
        
        
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
    
  </body>
</html>
Without Boo