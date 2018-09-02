<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	boolean bool = false;
	int attachNo = 0;
	String farmQTY = "";
	if(request.getParameter("bool") != null){
		if((request.getParameter("bool").toString()).equals("true")){
			bool = true;
			attachNo= Integer.parseInt(request.getParameter("attachNo"));
			farmQTY = request.getParameter("farmQTY");
		}else{
			%><script>alert('농사면적 받기 실패하셨습니다.');</script><%
		}
	}
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>농장 면적 기입</title>
<script src="<%= request.getContextPath() %>/js/common/jquery.min.js"></script>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/pushy-buttons.css">
<style>
	input[type=checkbox]{
	    
	    display:inline-block; width:40px; height:40px; vertical-align:middle; 
	    margin: -3px;
	    background:url(<%=request.getContextPath() %>/images/common/ground.jpg) no-repeat 0 0; 
	    background-size: cover;
	    appearance: none; 
	    -webkit-appearance: none; /* Safari and Chrome */ 
	    border-radius:0; border:0;

	}
	input[type="checkbox"]:checked{
		background:url(<%=request.getContextPath() %>/images/common/choice.jpg) no-repeat 0 0; 
	    background-size: cover;
		appearance: none;
		-webkit-appearance: none; /* Safari and Chrome */ 
		border-radius:0; border:0; 
	}
	input[type=checkbox]:hover{
	    background:skyblue;
	}
	
	.chkBox{
		width:600px;
		height:545px;
		float: left;
		background:#96730c;
		border:solid 3px #96730c;
	}
	
	.infoBox{
		width:400px;
		height:460px;
		float: right;
		background:skyblue;	
		text-align: center;
		border: solid;
	}
	
	.amount{
		color:black;
		font-size:20px;
	}
	
</style>
</head>
<body>

<script>
	<%
		if(bool){
	%>
		opener.document.getElementById("read").value = <%=attachNo%>;
		opener.document.getElementById("count").value = <%=farmQTY%>;
		opener.parent.changeBtn();
		window.close();
	<%
		}
	%>
</script>

<div class='chkBox'>
	<form id="form1" name="form1" method="post" style='margin:5px' action="<%=request.getContextPath() %>/InsertFarmArea">
		<!-- <label>구매할 농부의 농장이름 : </label><input type='text' name='table'> -->
		<input type='hidden' id='name' name='name'> <br>
		<input type='hidden' id='farmSizeIn' name='farmSize'>
		<input type='hidden' id='farmQTY' name='farmQTY'>
		 <br>
		<%for(int i=1;i<(15*15)+1; i++){ %>
			<input type="checkbox" id='ch<%=i %>' name="bak" value="<%=i%>" />
			<%if(i%15 == 0){ %>
				<br>
			<%} %>
		<%} %>
		<br>
	</form>
</div>

<div class='infoBox'>
		<h1>농장 면적 기입</h1>
		<p><label class='amount'>선택한 면적 갯수 : <label id='amount'>0</label>개</label></p>
		<label>밭면적(m2단위) : </label>
		<input type='number' id='farmSizeOut' min="1" MAX="100" STEP="1" VALUE="1" SIZE="6" name='farmSize'>
		<hr style='width:80%'>
		
		<h3 style='color:red'>- 주의 사항 -</h3>
		<p><b>
			면적은 15*15 입니다.<br>
			10개 이상의 면적을 선택하셔야 합니다.<br>
			더큰 면적이나 작은 면적은<br>
			 저희 버전에선 지원하지 않습니다.<br>
			 <br>
			<br>
			만들기 후 펀딩신청중에는 재수정 할수 있습니다. 
		</b></p>
		
		<hr style='width:80%'>
		
		<button type='button' id='makeFarm' class='btns btn--md btn--red' onclick='insertFarm()' style='width:270px' disabled>10개 이상 선택하셔야합니다.</button>
</div>

<script>
	function insertFarm(){
		document.getElementById("name").value = opener.document.getElementById("hid").value;
		document.getElementById("farmSizeIn").value = document.getElementById("farmSizeOut").value;
		document.getElementById("farmQTY").value = $('#amount').text();
		$('#form1').submit();
    }
	
	$(function(){
		$('input:checkbox[name=bak]').click(function(){
			if($('input:checkbox[name=bak]:checked').length >= 10){
				$('#makeFarm').attr('disabled',false);
				$('#makeFarm').text('만 들 기');
				$('#makeFarm').css('background','#2DC4D4');
			}else{
				$('#makeFarm').attr('disabled',true);
				$('#makeFarm').text('10개 이상 선택하셔야합니다.');
				$('#makeFarm').css('background','#e65d4f');
			}
			$('#amount').text($('input:checkbox[name=bak]:checked').length); 
		});
	})
	
</script>
	
</body>
</html>