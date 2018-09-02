<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type">
<meta content="no-cache" http-equiv="pragma">
<title>작목별농업기술정보 Open API Ajax 샘플 페이지</title>

<!-- 공통 CSS, JS 선언 -->
<link href="http://api.nongsaro.go.kr/css/api.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://api.nongsaro.go.kr/js/framework.js"></script>
<script type="text/javascript" src="http://api.nongsaro.go.kr/js/openapi_nongsaro.js"></script>

<script type="text/javascript">

	$(function(){
		$.ajax({
			url:"http://api.nongsaro.go.kr/service/cropTechInfo/insttList?apiKey=20180822P8XL8HHAFE05EWZ6F6BGRG",
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

	// 파라메터 값 호출
	function nongsaroOpenApiPopRequest(valuename)    //javascript로 구현한 Request
	{
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

	nongsaroOpenApiRequest.apiKey = "20180822P8XL8HHAFE05EWZ6F6BGRG";//Api Key  - 발급받은 인증키로변경
	nongsaroOpenApiRequest.serviceName = "cropTechInfo";//서비스명
	nongsaroOpenApiRequest.operationName = "insttList";//오퍼레이션명 - nongsaroApiLoadingArea 영역에 로딩할 오퍼레이션
	nongsaroOpenApiRequest.insttCode = nongsaroOpenApiPopRequest("insttCode");
	nongsaroOpenApiRequest.sKncrCode = nongsaroOpenApiPopRequest("sKncrCode");
	nongsaroOpenApiRequest.htmlArea="nongsaroApiLoadingAreaInstt";//첫번째로 HTML을 로딩할영역
	nongsaroOpenApiRequest.callback = "<%=request.getContextPath()%>/views/community/ajax_local_callback.jsp";//크로스 도메인 처리를 위한 콜백페이지 - 샘플소스에 있는 콜백페이지를 서버에 올리고 올린 경로로 수정
</script>
</head>

<body>
<div id="nongsaroApiLoadingAreaInstt"></div><!-- 기관명 목록 HTML 로딩 영역 -->
<div id="nongsaroApiLoadingArea"></div><!-- 메인카테고리 HTML 로딩 영역 -->
<div id="nongsaroApiLoadingArea1"></div><!-- 중분류카테고리 HTML 로딩 영역 -->
<div id="nongsaroApiLoadingArea3"></div><!-- 대분류기술코드 HTML 로딩 영역 -->
<div id="nongsaroApiLoadingArea4"></div><!-- 소분류기술코드 HTML 로딩 영역 -->
<div id="nongsaroApiLoadingArea5"></div><!-- 작목기술목록 HTML 로딩 영역 -->
</body>
</html>