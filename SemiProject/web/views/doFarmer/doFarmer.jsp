<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	
    	String value = (String)request.getAttribute("msg");
    
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 배너 및 폰트  -->
<link href="<%= request.getContextPath() %>/css/funding/banner.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Nanum+Gothic|Yeon+Sung" rel="stylesheet">
<!-- ------------  -->


<link href="<%= request.getContextPath() %>/css/doFarmer/doFarmer.css" rel="stylesheet">

</head>

<body>

	
	<%@ include file='../common/navbar.jsp' %>
	
	<% if(loginUser != null && !loginUser.getMember_Type().equals("M3") )  {%>
	<div class="bannerArea2">
	
	
	</div>
	<br><br><br>
	
	
	
	<div class="outer3">
	
		
		<div class="inputArea1">
		
			<form action="javascript:updateInfo();" method="post">
			<input type="hidden" name="memNumber" value="0">
			<div class="inputOuter1">
				
					<span class="farmerFont">농가명</span>
				
			</div>
			<br>
				<div class="checkedName">
					<button onclick="nameCheck(); return false">중복확인</button>
					<input type="hidden" id="checkFarmName" value="1">
				</div>
				<script>
					function nameCheck(){
						
					
						if($("#name").val() == ''){
						
							alert("농가명을 입력해주세요");
				
						}else{
							
							var name = $("#name").val();
								
							var member_No = <%=loginUser.getMember_No()%>;
							
							
							 $.ajax({
								url:"<%=request.getContextPath()%>/farmNameCheck",
								data:{name:name},
								type:"post",
								success:function(data){
									console.log(data);
									
									if(data > 0){
										alert("중복된 농가명입니다");
										$("#checkFarmName").removeClass("successCheck");
									}else{
										alert("사용가능한 농가명입니다")
										$("#checkFarmName").addClass("successCheck");
									}
								
								},
								error:function(){
									console.log("실패");
								}
							});
						}
						
						
						
						
						
					}
					
					

				</script>
			<br><br>
			<div class="inputOuter">
				<input class="farmInput" id="name" type="text" name="farmName" autocomplete=off
						maxlength="12" placeholder="농가명을 입력해주세요(12자리까지가능)">
				<script>
				document.getElementById("name").onkeypress = function(e) {
					
					$("#checkFarmName").removeClass("successCheck");
					
					   var keyCode = e.which ? e.which : e.keyCode;
						
					   console.log(keyCode);
					   	
					   if(keyCode == 32){
						   alert("농가명에 공백은 사용불가합니다");
						   return false;
					   }
					   
					  /*  // 백스페이스 입력시 초기화
					   if(keyCode == 92){
						  
						   $("#checkFarmName").removeClass("successCheck");
					   }
					    */
					   
					
					};
					
					// 키보드 입력 시 초기화
					document.getElementById("name").onkeydown = function(e) {
						
						$("#checkFarmName").removeClass("successCheck");
						
						   
						   
						
						};
						
				</script>
			</div>
			<br><br><br>
			<div class="inputOuter1">
				<span class="farmerFont">농가주소</span>
			</div>
			<br>
			<span class="example">입력 예시 : 경기도 김포시 사우동 263-1</span>
			<br><br>
			<div class="inputOuter">
				<input class="farmInput" id="address" type="text" name="farmAddress" autocomplete=off
				placeholder="농가주소를 입력해주세요">
			</div>
			<br><br><br>
			<div class="inputOuter1">
				<span class="farmerFont">농가면적</span><span class="meter">(단위 : M<sup>2</sup>)</span>
			</div>
			<br>
			<span class="example">입력 예시 : 80, 700, 1000 ... </span>
			<br><br>
			<div class="inputOuter">
				<input class="farmInput2" id="area" type="number" name="farmArea" autocomplete=off
				placeholder="농가면적을 입력해주세요. 숫자만 입력가능합니다">
				<script>
				document.getElementById("area").onkeypress = function(e) {
					
					   var keyCode = e.which ? e.which : e.keyCode;
						
					   console.log(keyCode);
					   	
					   if(keyCode >= 48 && keyCode <= 57){
						  return;
					   }else{
						   alert("숫자만  입력가능합니다");
						   return false;
					   }
					
					};
				</script>
			</div>
			<br><br><br><br>
			<div class="outputOuter">
				<button type="reset" value="취소">취소</button>
			
			&nbsp;&nbsp;
			
				<button type="submit" value="확인">확인</button>
			</div>
			</form>
		</div>
	<script>
	function updateInfo(){
		
		
		
		var mnum = <%=loginUser.getMember_No()%>;
		
		
		
		var checkfarm = $(".successCheck").val();
		
		if($("#name").val() == '' && $("#address").val() == '' && $("#area").val() == ''){
			
			alert("정보를 입력하세요");
			
		}else if($("#name").val() == ''){
				alert("농가명을 입력하세요");
		}else if($("#address").val() == ''){
				alert("농가주소를 입력하세요");
		}else if($("#area").val() == ''){
				alert("농가면적을 입력하세요");
		}else if(checkfarm == undefined){
			alert("농가명 중복확인을 해주세요");
		}else{
			
			var name = $("#name").val();
			var address = $("#address").val();
			var area = $("#area").val();
			
			location.href = "<%=request.getContextPath()%>/updateFarmerMember.me?name="+ name +"&address=" + address + "&area=" + area +"&mnum=" + mnum;
			
		} 
			
			
			

		
		
		
	}
	
	</script>
		
	</div>
	<br><br><br><br><br>
	<% }else{ %>
		<script>
			$(function(){
				alert("잘못된 경로로 접근했습니다");
			});
		</script>
	<% } %>
	<script>
	<% if(value != null){  %>
			
		$(function(){
			alert("<%=value%>");
			location.href="<%=request.getContextPath()%>/MainFunding";
		});
		
	<% } %>
	</script>
</body>
</html>