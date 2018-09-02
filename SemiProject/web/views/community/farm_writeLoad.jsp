<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		color:WHITE;
		text-align:center;
	}
	#subText{
		color:WHITE;
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
		<h2 id="text-free-1">농사 정보 게시판</h2>
	</div>
	<div id="text-free-2">- 선정적, 비방글은 무통보 삭제될 수 있습니다.</div>
	
	<div class="board_main" style="width:1100px; height:400px;">
	<form name="writeform" action="" method="post">
		<div class="view_header">
			<dl class="title_area">
				<dt></dt>
				<dd>심심해요 심심해요 심심해요 심심해요 심심해요 심심해요 </dd>
			</dl>
			<div class="view_info">
				<div class="preson">태혀니 (tony_******@naver.com)</div>
				<div class="data">
					<span>2018-07-31</span>
					<span>조회수 : 55</span>
				</div>
			</div>
		</div>
		<div class="view_contents">
			컨텐츠 영역
		</div>
		<!-- <div class="head">
		<div class="head-title title1" align="center"><span>일상</span></div>
		<div class="head-title title2" align="left"><span>심심해요</span></div>
		<div class="head-title title3" align="left"><span>자유게시판</span></div>
		<div class="head-title title4" align="left"><span>18-07-31</span></div>
		</div>
		<div class="writer" align="left" style="width:1100px; height:40px; border-top:1px solid lightgray;"><span>&nbsp;&nbsp;태혀니 (tony_******@naver.com)</span></div>
		<div class="contents" align="left" style="width:1100px; height:400px; border:1px solid lightgray;"><span></span></div> -->
		
		<!-- 댓글과 조회수 부분 -->
		<div class="content-bottom">
			<div class="ct-bottom" align="center" style="width:130px; height:30px; margin-top:5px;"><span>댓글 2</span></div>
			
		</div>
		
		<!-- 댓글출력부분 -->
		<div style="border-bottom:1px solid lightgray;">
			<table>
				<tr>
					<td rowspan="2" style="width:60px;"><img src="/Semi/images/funding/멜론.jpg" style="width:55px; height:55px; border-radius:30px;"></td>
					<td style="width:100px;">닉네임</td>
					<td style="width:300px;" align="center">2018-07-31 18:27:33</td>
				</tr>
				<tr>
					<td colspan="2">태현님 저도 심심함</td>
				</tr>
			</table>
		</div>
		<div style=" margin-top:5px; border-bottom:1px solid lightgray;">
			<table>
				<tr>
					<td rowspan="2" style="width:60px;">프로필사진</td>
					<td style="width:100px;">닉네임</td>
					<td style="width:300px;" align="center">2018-07-31 18:27:33</td>
				</tr>
				<tr>
					<td colspan="2">저랑 댓글놀이 긔긔?</td>
				</tr>
			</table>
		</div>
		
		<!-- 댓글창부분 -->
		<div class="replay-total" style="margin-top:10px;">
		<div class="replyDiv reply-1">
        <textarea class="form-control" style="width:988px; height:60px;"></textarea>
       <!--  <input type="text" style="width:990px; height:60px;"> -->
      </div>
          <div  class="reply-1">
          <input type="submit" class="btn" value="등록" style="width:105px; height:60px; margin-top:-50px; background-color:green; color:white;">
          </div>
		</div>
		
		<!-- 글쓰기,답글,목록 -->
		<div class="reply-bottom" align="right">
			<input type="button" class="btn" value="글쓰기" style="width:100px; height:40px; margin-top:10px; background-color:green; color:white;">
			<input type="button" class="btn" value="답글" style="width:100px; height:40px; margin-top:10px; background-color:green; color:white;">
			<input type="button" class="btn" value="목록으로" style="width:100px; height:40px; margin-top:10px; background-color:green; color:white;">
		</div>
		
		
		
		
		
		<!-- <div class="coment-head-main">
		<div class="coment-head">
			<div class="coment-1 cc-1"></div>
		</div>
		<div class="coment coment-head">
			<div class="coment-1 cc-2"></div>
			<div class="coment-1 cc-3"></div>
			<div class="coment-1 cc-4"></div>
			<div class="coment-1 cc-5"></div>
		</div>
		</div> -->
		
		
		
		<!-- <div class="container">
      <div class="contentlist">
        <div class="table">
          <tbody>
            <tr class="reply_line">
              <td class="userName"></td>
              <td class="datetime"></td>
              <td class="reply"></td>
            </tr>          
          </tbody>
        </div>
        <div class="content">
          CONTENT
        </div>       
      </div>
      <div class="replyDiv">
        
          <textarea class="form-control"></textarea>
          <input type="submit" class="btn" value="등록">
      </div>
    </div> -->
    
    
    
	</form>
	</div>
        
        
        
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br>



<!-- <table class="table table-bordered">
		
			<tr>
				<th class="text-center" width="20"><strong style="color:#000;"><i class="fa fa-cog fa-lg" aria-hidden="true"></i></strong></th>
				<td style="width:100px;" align="center"><strong style="color:#000;">일상</strong></td>
				 <td style="widtd:100px;">심심해요</td>
				 <td style="width:150px;">자유게시판</td>
				 <td style="width:100px;" align="center">18-07-31</td>
				<th class="text-center" width="10"><strong style="color:#000;"></strong></th>
				<th class="text-center" width="10"><strong style="color:#000;"></strong></th>
				<th class="text-center" width="20"><strong style="color:#000;"></strong></th>
				<th class="text-center" width="20"><strong style="color:#000;"></strong></th>
			</tr>
			<tr>
				<td colspan="4" align="left">태혀니 (tony_******@naver.com)</td>
			</tr>
			<tr>
				<td colspan="4" style="width:1000px; height:400px;">내애요오오오오옹</td>
			</tr>
			<tr>
				<td align="center">댓글 2</td>
				<td colspan="3" align="left">조회수 30</td>
			</tr>
			<tr style="height:20px; width:30px;">
				<td align="center" rowspan="2" style="width:30px;">프로필사진</td>
				<td style="width:50px;">경더기</td>
				<td style="width:50px;">2018-07-31 18:27:25</td>
				<td style="width:550px;">댓글달기</td>
			</tr>
			<tr style="height:20px;">
				<td colspan="3">태현님 저도 심심해요 !</td>
			</tr>
			<tr>
				<td style="width:50px;" rowspan="2" align="center"></td>
				<td style="width:50px;" rowspan="2" align="center">프로필사진</td>
				<td style="width:50px;">태혀니</td>
				<td style="width:500px;">2018-07-31 18:32:22</td>
			</tr>
			<tr>
				<td colspan="2">경덕님 저랑 댓글놀이 ㄱㄱ?</td>
			</tr>
			<tr>
				<td colspan="3"><input type="text" size="300" style="width:850px;"></td>
			</tr>
			
	</table> -->

    </body>
</html>