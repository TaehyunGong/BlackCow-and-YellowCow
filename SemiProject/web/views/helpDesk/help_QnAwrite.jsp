<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
		height:700px;
		margin:0 auto;
		
		
	}
	.table{
		width:1100px;
		border-collapse:collapse;
		border-spacing:0;
		border-top:5px solid green; 
	}
	table tbody tr td .t_type{align:center;}
.t_name, .t_day, .t_count{text-align:center;}
	.btn-write{color:white; background-color:green;}
.write-bottom{width:1100px;margin:0 auto; max-width:98%; text-align:right;}
.write-bottom-1{margin-top:8px;}
	
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
			<li><a class="ul-li-a" href="/Semi/views/helpDesk/help_QnA.jsp" id="freeboard">문의하기</a></li>
			<li><a class="ul-li-a" href="<%=request.getContextPath() %>/selectList.hp" id="infoboard">나의 문의내역 확인</a></li>
		</ul>
		
	</div>
	
	
	<div id="freeboardtext">
		<h2 id="text-free-1">답변등록</h2>
	</div>
	<div id="text-free-2"></div>
	
	<div class="board_main">
	<form name="writeform" action="" method="post">
		<table class="table table-bordered">
		<colgroup>
			<col style="width:12%">
			<col style="width:13%">
			<col style="width:13%">
			<col style="width:22%">
			<col style="width:40%">
		</colgroup>
		
			<tr>
				<td class="t_type" style="text-align:center;">문의유형</td>
				<td class="t_tit">
					<input type="radio" id="returnmoney"><label for="returnmoney">　환불</label>
				</td>
				<td class="t_name">
					<input type="radio" id="siteinfo"><label for="siteinfo">　사이트이용</label>
				</td>
				<td class="t_day">
					<input type="radio" id="site_etc"><label for="site_etc">　기타</label>
				</td>
				<td class="t_count"></td>
			</tr>
				<!-- <th class="text-center" width="10"><strong style="color:#000;"></strong></th>
				<th class="text-center" width="10"><strong style="color:#000;"></strong></th>
				<th class="text-center" width="20"><strong style="color:#000;"></strong></th>
				<th class="text-center" width="20"><strong style="color:#000;"></strong></th> -->
			
			<tr>
				<td id="td1" style="width:130px;" align="center"><strong style="color:#000;">제목</strong></td>
				<td colspan="4'"> 
				이러쿵 저러쿵 환불은 어떻게 하나요?
				</td>
			</tr>
			<tr>
				<td style="width:130px; height:400px;" align="center"><strong style="color:#000;">답변내용</strong></td>
				<td colspan="4">
				<textarea name="editor1" id="editor1" rows="10" cols="80"></textarea>
				 <script>
					CKEDITOR.replace('editor1',{
						width:'950px',
						height:'350px',
						enterMode:'2',
						shiftEnterMode:'2'
						
						
					});
					
					
				</script>
				</td>
			</tr>
			<!-- <tr>
				<td style="width:120px;" align="center"><strong style="color:#000;">파일<br>첨부</strong></td>
				<td>
				<input type="text" name="fileaddress" style="width:300px; margin-top:10px;">&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="file" name="file">
				</td>
			</tr> -->
			<tr>
				
				<td align="right" colspan="5">
				<input type="submit" class="btn btn-write" value="답변등록">
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