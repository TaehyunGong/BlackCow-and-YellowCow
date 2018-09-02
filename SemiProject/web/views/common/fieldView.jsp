<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String[][] arr = (String[][])request.getAttribute("field");
	int farmSize = (int)request.getAttribute("farmSize");
	int price = Integer.parseInt((String)request.getAttribute("price"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>밭 면적 구매하기</title>
<script src="<%= request.getContextPath() %>/js/common/jquery.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/pushy-buttons.css">
<style>
	input[type=checkbox]{
	    display:inline-block; width:40px; height:40px; vertical-align:middle; 
	    margin: -3px;
	    background:url(<%=request.getContextPath() %>/images/common/choice.jpg) no-repeat 0 0; 
	    background-size: cover;
	    appearance: none; 
	    -webkit-appearance: none; /* Safari and Chrome */
	    cursor:pointer;
	}

	input[type=checkbox]:not([chekced]):hover{
	    background:red;
	}
	input[type=checkbox]:not([disabled]):hover{
	    background:rgb(66, 244, 128);
	}
	
	input[type="checkbox"]:checked{
		background:url(<%=request.getContextPath() %>/images/common/checked.jpg) no-repeat 0 0; 
	    background-size: cover;
		appearance: none;
		-webkit-appearance: none; /* Safari and Chrome */ 
	}
	
	input[type="checkbox"][disabled][checked]{
		background:url(<%=request.getContextPath() %>/images/common/flag.jpg) no-repeat 0 0; 
	    background-size: cover;
		appearance: none;
		-webkit-appearance: none; /* Safari and Chrome */
	}
	
	input[type="checkbox"]:disabled{
		background:url(<%=request.getContextPath() %>/images/common/stone.jpg) no-repeat 0 0; 
	    background-size: cover;
		appearance: none;
		-webkit-appearance: none; /* Safari and Chrome */ 
	}
	
	.chkBox{
		width:600px;
		height:545px;
		float: left;
	}
	
	.infoBox{
		width:400px;
		height:430px;
		float: right;
		background:skyblue;	
		text-align: center;
		border: solid;
	}
	
	.amount{
		color:black;
		font-size:20px;
	}
	
	.chowon{
		display:inline-block; width:20px; height:20px; vertical-align:middle; 
	    background:url(<%=request.getContextPath() %>/images/common/choice.jpg) no-repeat 0 0; 
	    background-size: cover;
	}
	
	.checked{
		display:inline-block; width:20px; height:20px; vertical-align:middle; 
	    background:url(<%=request.getContextPath() %>/images/common/checked.jpg) no-repeat 0 0; 
	    background-size: cover;
	}
	
	.disabled{
		display:inline-block; width:20px; height:20px; vertical-align:middle; 
	    background:url(<%=request.getContextPath() %>/images/common/flag.jpg) no-repeat 0 0; 
	    background-size: cover;
	}
	
	.stones{
		display:inline-block; width:20px; height:20px; vertical-align:middle; 
	    background:url(<%=request.getContextPath() %>/images/common/stone.jpg) no-repeat 0 0; 
	    background-size: cover;
	}
	
</style>
</head>
<body>
	<div class='chkBox'>
		<form id="form1" name="form1" method="post" action="<%=request.getContextPath() %>/choiceCell">
			<input type='hidden' id='farmSize' name='farmSize' value='<%=farmSize %>'>		<!-- 평당 밭 면적 -->
			<%int row=0; %>
			<%for(int i=1;i<(15*15)+1; i++){ %>
				<%if((arr[row][(i-1)%15].equals("."))){ %>
					<input type="checkbox" id='ch<%=i %>' name="bak" value="<%=i%>" disabled/>
				<%}else if(!(arr[row][(i-1)%15].equals("O"))){ %>
					<input type="checkbox" id='ch<%=i %>' name="bak" value="<%=i%>" disabled checked/>
				<%}else{ %>
					<input type="checkbox" id='ch<%=i %>' name="bak" value="<%=i%>"/>
				<%} %>
				<%if(i%15 == 0){ row++;%>
					<br>
				<%} %>
			<%} %>
		</form>
	</div>
	
	<div class='infoBox'>
		<h1>밭떼기 구매</h1>
		<div><label class='amount'>선택한 면적 갯수 : <label id='amount'>0</label>개</label></div>
		<div><label class='amount'>총 금액  : <label id='cell_Price'>0</label>원</label></div>
		<hr style='width:80%'>
		
		<h3 style='color:green'>- 면적당 의미 -</h3>
		<div style='text-align: left;margin-left: 48px;'>
			<div>
				<span class='chowon'></span> - 구매하실수 있는 면적입니다. 개당  <b><%=farmSize %></b>m<sup>2</sup>
			</div>
			<div>
				<span class='checked'></span> - 구매할 면적 입니다.
			</div>
			<div>
				<span class='disabled'></span> - 다른 투자자가 이미 구매한 구역입니다.
			</div>
			<div>
				<span class='stones'></span> - 선택하실수 없는 구역입니다.
			</div>
		</div>
		
		<hr style='width:80%'>
		
		<b><button type='button' id='makeFarm' class='btns btn--md btn--red' onclick='buyFarm()' style='width:270px' disabled>총 결제 금액 : <label id='cell_Price'>0</label>원</label></button></b>
	</div>
	
	<script>
		
		var price = <%=price%>;
	
		function buyFarm(){
			$('#form1').submit();
	    }
		
		$(function(){
			$('input:checkbox[name=bak]').click(function(){
				var qty = ((15*15)-($('input:checkbox[name=bak]:disabled').length)-($('input:checkbox[name=bak]:checked').length))*-1;
				var num = qty*price;
				
				if($('input:checkbox[name=bak]:checked').length >= 1){
					$('#makeFarm').attr('disabled',false);
					$('#makeFarm').html('<b>총 결제금액 : '+num+'원</b>');
					$('#makeFarm').css('background','#2DC4D4');
				}else{
					$('#makeFarm').attr('disabled',true);
					$('#makeFarm').html('<b>총 결제금액 : '+num+'원</b>');
					$('#makeFarm').css('background','#e65d4f');
				}
				$('#amount').text(qty); 
				$('#cell_Price').text(num); 
			});
		})
	</script>
</body>
</html>