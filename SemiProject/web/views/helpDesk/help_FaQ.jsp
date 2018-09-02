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
		background-image:url(/Semi/images/common/자주묻는질문.png);
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
		
		
	}
	.table{
		width:1100px;
		border-top:5px solid green;
	}
	.help_a{text-decoration:none;color:black;}
	.help_a:hover{text-decoration:none;color:black;}
	.help_bottom{width:1100px; height:250px; margin:0 auto; border-bottom:1px solid #ccc;}
.help-bottom-1{width:1100px;}

.help-before{display:inline-block;}
.help-bottom-2, .help-bottom-3{display:inline-block; width:500px; margin-left:10px;height:140px; margin-top:20px;}
.help-bottom-2{margin-left:35px;}
/* .help-bottom-3{border-left:1px solid #ccc;} */
/* .help_bottom .help-before span ~ span:before{
	content:''; position:absolute;left:0 auto; top:95%; height:175px; width:1px; margin-left:13px; background-color:#ccc; margin-top:12%;} */

.b-info1{display:inline-block;}
.b-info3{display:inline-block;}
.help-bottom-2, .help-bottom-3{padding-top:40px; padding-left:20px; font-size:45px;}
.help_bottom_1{font-size:35px;}
.help_bottom_2{width:1100px; border-bottom:1px solid #ccc;}
.btn-write{color:white; background-color:green;}
.write-bottom{width:1100px;margin:0 auto; max-width:98%; text-align:right;}
.write-bottom-1{margin-top:8px;}

#helpImage{width:100px; height:100px;}

	
	
</style>
    <body>
        
   <%@ include file="../common/navbar.jsp" %>
        
	<div class="topArea">
	<!-- <br>
		<h1 id="topText">FAQ</h1>
		<h4 id="subText">자주 문의하시는 질문과 답변을 모아두었습니다.</h4> -->
	</div>
	<!-- <div id="sub-1" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<ul class="ulsub-1">
			<li><a class="ul-li-a" href="#" id="freeboard"></a></li>
			<li><a class="ul-li-a" href="/Semi/views/community/farm_info.jsp" id="infoboard"></a></li>
		</ul>
		
	</div> -->
	
	
	<div id="freeboardtext">
		<h2 id="text-free-1">자주 묻는 질문</h2>
	</div>
	<div id="text-free-2">- 찾으시는 질문이 없는 경우 1:1 문의를 이용해 주세요.</div>
	
	<div class="board_main">
		
		
		<table class="table table-bordered table-hover not-header">
		<colgroup>
			<col style="width:10%">
			<col style="width:auto">
			<col style="width:5%">
		</colgroup>
		<thead>
			<tr class="faq6" onclick="faq6();">
				<th class="text-center1"><strong style="color:#000;">사이트이용</strong></th>
				<th class="text-center2"><strong style="color:#000;">판매자 신청 기준이 있나요?</strong></th>
				<th class="text-center3"><strong style="color:#000;"><img class="faq6im" src="../../images/common/helpdown.png" style="width:18px; height:18px;"></strong></th>
			</tr>
			<tr  class="faq6-1">
				<th colspan="3">
					<div>신청기준은 사이트내 농가신청 메뉴를 통해 자세히 확인하실 수 있습니다.<br>
					1. 흙에서 농사짓는 농부<br>
					2. 친환경 농사를 짓거나 전환할 의지가 있는 농부<br>
					3. 아이들에게 안전한 가공식품을 만드는 농부<br>
					4. 제초제를 사용하지 않는 농부<br>
					5. 자연의 속도로 농사짓는 농부
					</div>
				</th>
			</tr>
			<tr class="faq5" onclick="faq5();">
				<th class="text-center1"><strong style="color:#000;">결제</strong></th>
				<th class="text-center2"><strong style="color:#000;">투자한 뒤 과정이 궁금합니다.</strong></th>
				<th class="text-center3"><strong style="color:#000;"><img class="faq5im" src="../../images/common/helpdown.png" style="width:18px; height:18px;"></strong></th>
			</tr>
			<tr  class="faq5-1">
				<th colspan="3">
					<div>- 펀딩개설자에게 2~3차례에 걸쳐 투자금이 전달됩니다.<br>
					- 개설자는 리워드상품을 준비하고, 투자자들에게 믿을 수 있는 상품을 제공하기 위해 노력합니다.<br>
					　 2주단위로 작물재배상황을 공유하고, 투자자들은 해당 펀딩내에서 확인하실 수 있습니다.<br>
					- 해당 펀딩의 기간이 종료되면, 개설자는 투자자들에게 상품을 배송합니다.
					</div>
				</th>
			</tr>
			<tr class="faq4" onclick="faq4();">
				<th class="text-center1"><strong style="color:#000;">결제</strong></th>
				<th class="text-center2"><strong style="color:#000;">모집금액을 달성하지 못하였을 경우는 어떻게 되나요?</strong></th>
				<th class="text-center3"><strong style="color:#000;"><img class="faq4im" src="../../images/common/helpdown.png" style="width:18px; height:18px;"></strong></th>
			</tr>
			<tr  class="faq4-1">
				<th colspan="3">
					<div>모집금액을 100%달성하지 못하였을 경우에는 두 가지로 나뉘게 됩니다.<br>
					해당 펀딩이 취소되는 경우, 모집금액달성과 무관하게 진행을 시작하게 되는경우로 해당 진행에 대해서는 펀딩 등록자가<br>
					등록신청을 진행할 때 설정하실 수 있습니다.</div>
				</th>
			</tr>
			<tr class="faq3" onclick="faq3();">
				<th class="text-center1"><strong style="color:#000;">사이트이용</strong></th>
				<th class="text-center2"><strong style="color:#000;">리워드란 무엇인가요?</strong></th>
				<th class="text-center3"><strong style="color:#000;"><img class="faq3im" src="../../images/common/helpdown.png" style="width:18px; height:18px;"></strong></th>
			</tr>
			<tr  class="faq3-1">
				<th colspan="3">
					<div>펀딩상품 개설자가 펀드를 후원하고 응원하는 투자자들에게 보답하는 의미로 제공하는 실질적인 서비스를 의미합니다.<br>
					리워드는 진행하는 펀드와 관련된 다양한 농산품을 제공하거나 할 수 있습니다.<br>
					진행하는 펀드마다 리워드 상품이 다르니 확인하시고 투자하세요!</div>
				</th>
			</tr>
			<tr class="faq2" onclick="faq2();">
				<th class="text-center1"><strong style="color:#000;">환불</strong></th>
				<th class="text-center2"><strong style="color:#000;">환불신청은 어떻게 하나요?</strong></th>
				<th class="text-center3"><strong style="color:#000;"><img class="faq2im" src="../../images/common/helpdown.png" style="width:18px; height:18px;"></strong></th>
			</tr>
			<tr  class="faq2-1">
				<th colspan="3">
					<div>환불은 마이페이지 내에서 신청하실 수 있습니다.<br>
					펀딩상품이 모집이 마감되어 진행을 시작하게 되었을 경우에는 환불이 불가합니다.<br>
					배송받으신 상품에 문제가 있는 경우에는 해당 사진을 첨부하여 신청해주시는 경우에는 확인 후 응답해드리겠습니다.</div>
				</th>
			</tr>
			<tr class="faq1" onclick="faq1();">
				<th class="text-center1"><strong style="color:#000;">사이트이용</strong></th>
				<th class="text-center2"><strong style="color:#000;">회원 정보 수정은 어디서 하나요?</strong></th>
				<th class="text-center3"><strong style="color:#000;"><img class="faq1im" src="../../images/common/helpdown.png" style="width:18px; height:18px;"></strong></th>
			</tr>
			<tr  class="faq1-1">
				<th colspan="3">
					<div>회원 정보 수정은 우측 상단 로그인하신 곳에 마우스를 갖다 대시면<br>
					마이페이지 메뉴에서 진행하실 수 있습니다.</div>
				</th>
			</tr>
		</thead>
		<!-- <tbody>
			
			
		</tbody> -->
	</table>
	
	
	</div>
	
	
	<% if(loginUser.getMember_Nick().equals("admin")){ %>
	<div class="write-bottom">
        <input type="button" value="글쓰기" class="btn btn-write" Onclick="<%=request.getContextPath()%>/views/helpDesk/help_FaQwrite.jsp"><br>
    <% } %>
		<!-- <select class="write-bottom-1">
			<option>작성자</option>
			<option>제목</option>
		</select>
		<input type="search" class="searchBox write-bottom-1">
		<input type="button" value="검색" class="btn write-bottom-1" onclick="window.location='help_FaQsearchResult.jsp'"> -->
	</div>
	<br><br><br>
	
	<div class="help_bottom help_bottom_1">
		<div class="help_bottom_2"><span><strong>원하는 답변을 찾지 못하셨나요?</strong></span></div>
		<div class="help-bottom-1">
			<!-- <div class="help-bottom-2">
				<div class="b-info1"><img src="../../images/common/helpimage.PNG"></div>
				<div class="b-info1 b-info2"><span><strong><a href="" class="help_a"> 이용안내 바로가기</a></strong></span></div>
			</div> -->
			
			<div class="help-bottom-3">
				<div class="b-info3"><img id="helpImage" src="../../images/common/helpimage.PNG"></div>
				<div class="b-info3 b-info4"><strong><a href="<%=request.getContextPath() %>/views/helpDesk/help_QnA.jsp" class="help_a"><span class="helptext"> 1:1문의 바로가기</span></a></strong></div>
			</div>
		</div>
	</div>
        
        <br><br><br><br><br><br><br><br>
        
        <script>
        
        	$(function(){
        		
        		$(".faq1-1").hide();
        		$(".faq2-1").hide();
        		$(".faq3-1").hide();
        		$(".faq4-1").hide();
        		$(".faq5-1").hide();
        		$(".faq6-1").hide();
        		
        	});
        	var ctn1 = 0;
        	var ctn2 = 0;
        	var ctn3 = 0;
        	var ctn4 = 0;
        	var ctn5 = 0;
        	var ctn6 = 0;
        	function faq1(){
        		ctn1++;
        		$(".faq1").click(function(){
        			if(ctn1 % 2 == 0){
        				$(".faq1-1").show();
        				$(".faq1im").attr("src", "../../images/common/helpup.PNG");
        			}else{
        				$(".faq1-1").hide();
        				$(".faq1im").attr("src", "../../images/common/helpdown.png");
        			}
        		});
        	}
        	function faq2(){
        		ctn2++;
        		$(".faq2").click(function(){
        			if(ctn2 % 2 == 0){
        				$(".faq2-1").show();
        				$(".faq2im").attr("src", "../../images/common/helpup.PNG");
        			}else{
        				$(".faq2-1").hide();
        				$(".faq2im").attr("src", "../../images/common/helpdown.png");
        			}
        		});
        	}
        	function faq3(){
        		ctn3++;
        		$(".faq3").click(function(){
        			if(ctn3 % 2 == 0){
        				$(".faq3-1").show();
        				$(".faq3im").attr("src", "../../images/common/helpup.PNG");
        			}else{
        				$(".faq3-1").hide();
        				$(".faq3im").attr("src", "../../images/common/helpdown.png");
        			}
        		});
        	}
        	function faq4(){
        		ctn4++;
        		$(".faq4").click(function(){
        			if(ctn4 % 2 == 0){
        				$(".faq4-1").show();
        				$(".faq4im").attr("src", "../../images/common/helpup.PNG");
        			}else{
        				$(".faq4-1").hide();
        				$(".faq4im").attr("src", "../../images/common/helpdown.png");
        			}
        		});
        	}
        	function faq5(){
        		ctn5++;
        		$(".faq5").click(function(){
        			if(ctn5 % 2 == 0){
        				$(".faq5-1").show();
        				$(".faq5im").attr("src", "../../images/common/helpup.PNG");
        			}else{
        				$(".faq5-1").hide();
        				$(".faq5im").attr("src", "../../images/common/helpdown.png");
        			}
        		});
        	}
        	function faq6(){
        		ctn6++;
        		$(".faq6").click(function(){
        			if(ctn6 % 2 == 0){
        				$(".faq6-1").show();
        				$(".faq6im").attr("src", "../../images/common/helpup.PNG");
        			}else{
        				$(".faq6-1").hide();
        				$(".faq6im").attr("src", "../../images/common/helpdown.png");
        			}
        		});
        	}
        	
        </script>
         <%@ include file="../common/footer.jsp" %>


    </body>
</html>