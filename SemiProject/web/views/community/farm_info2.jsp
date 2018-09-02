<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
    <head>
    </head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta content="no-cache" http-equiv="pragma">

<!-- Font Awesome Style -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Gaegu" rel="stylesheet">

<link href="http://api.nongsaro.go.kr/css/api.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://api.nongsaro.go.kr/js/framework.js"></script>
<script type="text/javascript" src="http://api.nongsaro.go.kr/js/openapi_nongsaro.js"></script>

<style>
	.topArea {
		background-image:url(/Semi/images/common/농사정보.png);
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
		width:600px;
		margin:0 auto;
		font-size:15px;
	}
	
	.board_main{
		width:600px;
		margin:0 auto;
		
		
	}
	.table{
		width:600px;
		margin:0 auto;
		border-top:5px solid green;
	}
	.btn-write{color:white; background-color:green;}
.write-bottom{width:1100px;margin:0 auto; max-width:98%; text-align:right;}
.write-bottom-1{margin-top:8px;}
table tbody tr td .t_type{align:center;}
.t_type, .t_name, .t_day, .t_count{text-align:center;}



.farmInfo-1{height:150px; width:200px;}
.farmInfo-text1:hover{cursor:pointer;}

</style>
    <body>
        
    <%@ include file="../common/navbar.jsp" %>
        
	<div class="topArea">
	<%-- <img src="<%=request.getContextPath()%>/images/common/도란도란.png"> --%>
		<!-- <h1 id="topText">도란도란</h1>
		<h4 id="subText">서로의 이야기를 나누는 공간</h4> -->
	</div>
	<div id="sub-1">
		<ul class="ulsub-1">
			<li><a class="ul-li-a" href="<%=request.getContextPath() %>/selectList.bo" id="freeboard">자유게시판</a></li>
			<li><a class="ul-li-a" href="<%=request.getContextPath() %>/views/community/farm_info.jsp" id="infoboard">농사 정보 게시판</a></li>
		</ul>
		<!-- <li><a href="/Semi/views/community/doran_main.jsp" id="freeboard">자유게시판</a></li> -->
		
	</div>
	<div id="freeboardtext">
		<h2 id="text-free-1">농사 정보 게시판</h2>
	</div>
	<div id="text-free-2">- 해당 자료는 농촌진흥청에서 제공하고 있습니다.</div>
	
	<div class="board_main">
	
		
		<table class="table table-bordered">
		
		<thead>
			<tr>
				<th class="farmInfo-1"><img src="<%=request.getContextPath() %>/images/common/정보이미지.JPG" style="width:170px; height:130px;"></th>
				<th class="farmInfo-1"><img src="<%=request.getContextPath() %>/images/common/정보이미지.JPG" style="width:170px; height:130px;"></th>
				<th class="farmInfo-1"><img src="<%=request.getContextPath() %>/images/common/농작업이미지.JPG" style="width:170px; height:130px;"></th>
			</tr>
			<tr>
				<th class="farmInfo-text1" onclick="location.href='<%=request.getContextPath()%>/views/community/farm_info.jsp'">작목별농업기술정보</th>
				<th class="farmInfo-text1" onclick="location.href='<%=request.getContextPath()%>/views/community/farm_info2.jsp'">주간농사정보</th>
				<th class="farmInfo-text1" onclick="location.href='<%=request.getContextPath()%>/views/community/farm_info3.jsp'">농작업일정</th>
			</tr>
			
			<tr>
				<th class="farmInfo-1"><img src="<%=request.getContextPath() %>/images/common/농작업이미지.JPG" style="width:170px; height:130px;"></th>
				<th class="farmInfo-1"><img src="<%=request.getContextPath() %>/images/common/기타정보이미지.JPG" style="width:170px; height:130px;"></th>
				<th class="farmInfo-1"><img src="<%=request.getContextPath() %>/images/common/품종이미지.JPG" style="width:170px; height:130px;" ></th>
			</tr>
			<tr>
				<th class="farmInfo-text1" onclick="location.href='<%=request.getContextPath()%>/views/community/farm_info4.jsp'">농산물소득정보</th>
				<th class="farmInfo-text1" onclick="location.href='<%=request.getContextPath()%>/views/community/farm_info5.jsp'">농업용어사전</th>
				<th class="farmInfo-text1" onclick="location.href='<%=request.getContextPath()%>/views/community/farm_info6.jsp'">품종정보</th>
			</tr>
			
			<tr>
				<th class="farmInfo-1"><img src="<%=request.getContextPath() %>/images/common/정보이미지.JPG" style="width:170px; height:130px;"></th>
				<th class="farmInfo-1"><img src="<%=request.getContextPath() %>/images/common/정보이미지.JPG" style="width:170px; height:130px;"></th>
				<th class="farmInfo-1"><img src="<%=request.getContextPath() %>/images/common/기타정보이미지.JPG" style="width:170px; height:130px;"></th>
			</tr>
			<tr>
				<th class="farmInfo-text1" onclick="location.href='<%=request.getContextPath()%>/views/community/farm_info7.jsp'">현장애로기술사례</th>
				<th class="farmInfo-text1" onclick="location.href='<%=request.getContextPath()%>/views/community/farm_info8.jsp'">현장기술지원</th>
				<th class="farmInfo-text1" onclick="location.href='<%=request.getContextPath()%>/views/community/farm_info9.jsp'">병해충발생정보</th>
			</tr>
		</thead>
	</table> 
	</div>
	<script type="text/javascript">
	
	$(function(){
		$.ajax({
			url:"http://api.nongsaro.go.kr/service/weekFarmInfo/weekFarmInfoList?apiKey=20180822P8XL8HHAFE05EWZ6F6BGRG",
			type:"GET",
			success:function(data){
				nongsaroOpenApiPopRequest(data);
			},
			error:function(data){
				console.log("오류야...");
				console.log(data);
			}
		});
	});
	
	function nongsaroOpenApiPopRequest(valuename){
	    var rtnval = "";
	    var nowAddress = unescape(location.href);
	    var parameters = (nowAddress.slice(nowAddress.indexOf("?")+1,nowAddress.length)).split("&");

	    for(var i = 0 ; i < parameters.length ; i++){
	        var varName = parameters[i].split("=")[0];
	        if(varName.toUpperCase() == valuename.toUpperCase()){
	            rtnval = parameters[i].split("=")[1];
	            break;
	        }
	    }
	    return rtnval;
	}

	nongsaroOpenApiRequest.apiKey = "20180822P8XL8HHAFE05EWZ6F6BGRG";
	nongsaroOpenApiRequest.serviceName = "weekFarmInfo";
	nongsaroOpenApiRequest.operationName = "weekFarmInfoList";
	nongsaroOpenApiRequest.htmlArea="nongsaroApiLoadingArea";
	nongsaroOpenApiRequest.callback = "<%=request.getContextPath()%>/views/community/ajax_local_callback.jsp";

		
	</script>
	<br><br><br><br>
	<hr>
	
	
	
	<div id="nongsaroApiLoadingArea"></div><!-- 메인카테고리 HTML 로딩 영역 -->
	
        
        
        
        <br><br><br><br><br><br><br><br><br><br><br>
       <%@ include file="../common/footer.jsp" %>
        

    </body>
</html>