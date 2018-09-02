<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.Semi.board.model.vo.*,
	com.kh.Semi.dips.model.vo.*,com.kh.Semi.funding.model.vo.*"%>
	
	
	<%
	

	
	HashMap<String, Object> intro = (HashMap<String, Object>)request.getAttribute("intro");
	
	int pnum =  Integer.parseInt(request.getAttribute("pnum").toString());
	
	int remain = Integer.parseInt(request.getAttribute("remain").toString());
	
	int progress = Integer.parseInt(request.getAttribute("progress").toString());
	
	
	ArrayList<Dibs> dibs = (ArrayList<Dibs>)request.getAttribute("dibs");
	
	ProductList productStatus = (ProductList)request.getAttribute("productStatus");
	
	String fundingBtn = "";
	
	String[][] arr = (String[][])request.getAttribute("arr");
	

	%>
	
	<%!
	public String prodStatus(String pro) {
		String cho ="";
		switch(pro){
			case "PR5" : cho="<button type='button' class='buttonFund' style='background:#d8d8d8; color:#2b2b2b;' disabled>종료</button>"; break;
			case "PR4" : cho="<button type='button' class='buttonFund' style='background:#f0ad4e; color:#fff;' disabled>배송중</button>"; break;
			case "PR3" : cho="<button type='button' class='buttonFund' style='background:#0275d8; color:#fff;' disabled>재배중</button>"; break;
			case "PR2" : cho="<button type='button' class='buttonFund' style='background:#f23535;' disabled>모금종료</button>"; break;
			case "PR1" : cho="<button type='button' class='buttonFund' onclick='popupOpen();'>펀딩하기</button>"; break;
		}
		return cho;
	}
	
	
	%>
	
	<% fundingBtn = prodStatus(productStatus.getProgress());  %>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common/ProgressBar.css">

<!-- 아이콘  -->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" 
integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

<!-- ------------  -->

<link href="<%= request.getContextPath() %>/css/funding/sticky.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/funding/product.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/funding/topbtn.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/funding/productIntro.css" rel="stylesheet">


<!-- 배너 및 폰트  -->
<link href="<%= request.getContextPath() %>/css/funding/banner.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Nanum+Gothic|Yeon+Sung" rel="stylesheet">
<!-- ------------  -->
<title>Insert title here</title>


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
	
	<%-- input[type="checkbox"]:checked{
		background:url(<%=request.getContextPath() %>/images/common/checked.jpg) no-repeat 0 0; 
	    background-size: cover;
		appearance: none;
		-webkit-appearance: none; /* Safari and Chrome */ 
	} --%>
	
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
		/* float: left; */
		background:#96730c;
		border:solid 3px #96730c;
		margin-left:auto;
		margin-right:auto;
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
	<%@ include file="../common/navbar.jsp"%>
	
	<div class="bannerArea">
		
		<%-- <% if(intro != null && intro.size() != 0) { %>
		<div class="bannerImg"
		style="background-image:url(<%= request.getContextPath() %>/images/funding/<%=intro.get("ori_filename")%>">
		</div>
		
		<div class="bannerText">
			<h2 class="textArea" align="center"><%=intro.get("pro_name") %></h2>
		</div>
		
		<% }else{ %>
		<div class="bannerImg"
		style="background-image:url(<%=request.getContextPath()%>/images/funding/cheken.jpg)">
		</div>
		
		<div class="bannerText">
			<h2 class="textArea" align="center">Not Open~!</h2>
		</div>
		<% } %> --%>
		
	</div>
	<br>

	<p align="center" style="color:#5e6063; text-shadow: 2px 2px green;
font-family: 'Nanum Pen Script', cursive; font-size:80px;"><%=intro.get("pro_name") %></p>
	<hr style="width:60%;">

	<br>
	


	<div class="outer">

		<div id="container2">
		<% if(intro != null && intro.size() != 0) { %>
			<img src="<%= request.getContextPath() %>/images/funding/<%=intro.get("ori_filename")%>"
					style="width: 100%; height: 470px; float:left;" >
		<% }else{ %>
			<img src="<%= request.getContextPath() %>/images/funding/cheken.jpg"
					style="width: 100%; height: 470px; float:left;" >
		<% } %>
		</div>
		
		<%-- <div id="container">
			<div class="mySlides">
				<img src="<%= request.getContextPath() %>/images/funding/cheken.jpg"
					style="width: 100%; height: 424px;">
			</div>

			<div class="mySlides">
				<img src="<%= request.getContextPath() %>/images/funding/melon.jpg"
					style="width: 100%; height: 424px;">
			</div>

			<div class="mySlides">
				<img src="<%= request.getContextPath() %>/images/funding/pizza.jpg"
					style="width: 100%; height: 424px;">
			</div>

			<div class="mySlides">
				<img src="<%= request.getContextPath() %>/images/funding/strowberry.jpg"
					style="width: 100%; height: 424px;">
			</div>

			<div class="mySlides">
				<img src="<%= request.getContextPath() %>/images/funding/cheken.jpg"
					style="width: 100%; height: 424px;">
			</div>

			<div class="mySlides">
				<img src="<%= request.getContextPath() %>/images/funding/cheken.jpg"
					style="width: 100%; height: 424px;">
			</div>


			<a class="prev" onclick="plusSlides(-1)">❮</a> 
			<a class="next" onclick="plusSlides(1)">❯</a>



			<div class="row" style="width: 100%; margin-left: 0px;">
				<div class="column">
					<img class="demo cursor" src="<%= request.getContextPath() %>/images/funding/cheken.jpg"
						style="width: 100%; height: 76px;" onclick="currentSlide(1)">
				</div>
				<div class="column">
					<img class="demo cursor" src="<%= request.getContextPath() %>/images/funding/melon.jpg"
						style="width: 100%; height: 76px;" onclick="currentSlide(2)">
				</div>
				<div class="column">
					<img class="demo cursor" src="<%= request.getContextPath() %>/images/funding/pizza.jpg"
						style="width: 100%; height: 76px;" onclick="currentSlide(3)">
				</div>
				<div class="column">
					<img class="demo cursor" src="<%= request.getContextPath() %>/images/funding/strowberry.jpg"
						style="width: 100%; height: 76px;" onclick="currentSlide(4)">
				</div>
				<div class="column">
					<img class="demo cursor" src="<%= request.getContextPath() %>/images/funding/cheken.jpg"
						style="width: 100%; height: 76px;" onclick="currentSlide(5)">
				</div>
				<div class="column">
					<img class="demo cursor" src="<%= request.getContextPath() %>/images/funding/cheken.jpg"
						style="width: 100%; height: 76px;" onclick="currentSlide(6)">
				</div>
			</div>
		</div> --%>


		<div class="dofunding">
			<div class="priceArea">
			<% if(intro != null && intro.size() != 0) { %>
				<span style="font-size: 15px; font-weight:bold;  color: #b7b7b7;">개당 가격 </span>&nbsp;
				<span style="font-size: 45px; font-weight:bold; color:green;">\<%=intro.get("pro_price") %></span>
			
			<% } else { %>
				<span style="font-size: 15px; font-weight:bold;  color: #b7b7b7;">개당 가격 </span>&nbsp;
				<span style="font-size: 45px; font-weight:bold; color:green;">---</span>
			<% } %>
			</div>
			<br>
			<div class="fundArea">
				<span style="font-size: 15px; font-weight:bold;  color: #b7b7b7;">
				펀딩 진행률  </span>&nbsp;
				<% if(intro != null && intro.size() != 0) {  %>
				<span class="fontnumber"><%=progress%>%</span>
				<% } else { %>
				<span class="fontnumber">--%</span>
				<% } %>
			</div>
			<% if(intro != null && intro.size() != 0) { %>
			<div id="myProgress" style="margin-left: 60px;">
				<div id="myBar" class='myBarS'>
					<div id="label" class='labelS'></div>
				</div>
			</div>
			<% } else { %>
			<div id="myProgress" style="margin-left: 60px;">
				<div id="myBar2" class='myBarS'>
					<div id="label2" class='labelS'></div>
				</div>
			</div>
			<% } %>
			
			<br>
			<% if(intro != null && intro.size() != 0) { %>
			<div class="fundArea">
				<span class="fontTitle" >남은 기간</span>&nbsp;
				<span class="fontnumber"><%=intro.get("deadline") %>일</span>
				<span style="font-weight:bold;">(<%=intro.get("pro_deadline") %>까지)</span>
			</div>
			<div class="fundArea">
				<span class="fontTitle">남은 수량</span>&nbsp;
				<span class="fontnumber"><%=remain %>개</span>
				
			</div>
			
			
			<% if(progress == 100 || intro.get("pro_date").equals(intro.get("pro_deadline")) ) { %>
			
			<%= fundingBtn %>
			
			<% } else { %>
				
				<% if(loginUser == null) { %>
			 <button class="buttonFund" onclick="noMemberUser();">
				로그인이 필요합니다
			</button>
		
			<% } else if(loginUser.getMember_Type().equals("M1")){ %>
			<button class="buttonFund" onclick="noMemberUser2();">
				정회원만 가능합니다
			</button>
			
			<% }else{ %>
			
			<%= fundingBtn %>
			<form id='buyForm' action='<%=request.getContextPath()%>/PaymentBuy' method='POST'>
				<input type='hidden' id='user' name='hid' value='USERSSSS'>		<!-- 유저 아이디 -->
				<input type='hidden' id='seller' name='no' value='seller'> <!-- 판매자 아이디 -->
				
				<input type='hidden' id='pro_detail_no' name='pro_detail_no' value='<%=pnum%>'> <!-- pro_detail_no -->
				<input type='hidden' id='amount' name='amount' value='0'> <!-- 수량 amount -->
				<input type='hidden' id='fundList' name='fundList' value='' readonly>			<!-- 구매할 밭 면적 -->
				<input type='hidden' id='farmSize' name='farmSize' value='' readonly>			<!-- 평당 면적 -->
			</form>
	
			<script type="text/javascript">
		        function popupOpen()
		        {
					var popUrl = "<%=request.getContextPath() %>/ViewFiled?name=<%=intro.get("member_Id")%>&price=<%=intro.get("pro_price") %>";	/* 팝업창에 출력될 페이지 URL */
					var popOption = "width=1050, height=600, resizable=no, scrollbars=no, status=no,location=no;";    //팝업창 옵션(optoin)
		            window.name = "parentForm";
		            window.open(popUrl,"", popOption);    
		        }
		        
		        function paymentPage(){
		        	$('#buyForm').submit();
		        }
			</script>
			<%} %>
				
			
			<% } %>
			
			<div style="font-size:18px; width:400px; margin-left: 60px; margin-top:30px; font-weight:bold;">
					<span style="font-size:25px; font-weight:bold; color:green;"><%=intro.get("member_name") %></span>님의 농장입니다
			</div>
			
			
			<div style="margin-top:25px">
				<!--  <div style="float:right; margin-right:110px;">
					<i class="fas fa-cart-arrow-down" style="font-size:40px;" onclick="location.href='#';"></i>
				</div> -->
					
				<div style="float:left; margin-left:180px;">
					<i class="far fa-heart" style="font-size:40px;" onclick='dips(<%=pnum %>, this);' value='<%=pnum %>'></i>
				</div>
			
			</div>
			<% } else { %>
			<div class="fundArea">
				<span class="fontTitle" >남은 기간</span>&nbsp;
				<span class="fontnumber">--일</span>
			</div>
			<div class="fundArea">
				<span class="fontTitle">구매자</span>&nbsp;
				<span class="fontnumber">--명</span>
			</div>
			<button class="buttonFund" onclick="location.href='#'" disabled>
				펀딩하기
			</button>
			
			<div style="font-size:18px; width:400px; margin-left: 60px; margin-top:30px; font-weight:bold;">
					<span style="font-size:25px; font-weight:bold;">--</span>님의 농장입니다
			</div>
			
			
			<div style="margin-top:25px">
				<!--  <div style="float:right; margin-right:110px;">
					<i class="fas fa-cart-arrow-down" style="font-size:40px;" onclick="location.href='#';"></i>
				</div> -->
					
				<div style="float:left; margin-left:180px;">
					<i class="far fa-heart" style="font-size:40px;" onclick='dips(<%=pnum %>, this);' value='<%=pnum %>' id='heart'></i>
				</div>
			
			</div>
			<% } %>
			
			
			
	
	</div>
</div>

	
	
	<br>
	<div id="tabMenu">
		<button class="tablinks active" onclick="category(event)" id="intro"
			value="btn1">펀딩소개</button>
		<button class="tablinks" onclick="category(event)" id="story"
			value="btn2">스토리  </button>
		<button class="tablinks" onclick="category(event)" id="cheerUp"
			value="btn3">응원하기</button>
		<button class="tablinks" onclick="category(event)" value="btn4" id="reple">후기</button>
		<button class="tablinks" onclick="category(event)" value="btn5" id="mun">문의   </button>
	</div>
	
	<br><br><br>
	
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	
	
	<div class="outerArea77">
	
		<% if(intro != null && intro.size() != 0) { %>
		<div class="content77">
			<p align="center" style="font-weight:bold; font-size:60px; color:green; font-family: 'Yeon Sung';"><%=intro.get("member_name")%>
			<span style="font-size:30px; color:black;">님의 밭 평면도</span></p>
			<br>
			<div class='chkBox'>
				<% if(arr != null && arr.length != 0) { %>
				<%int row=0; %>
				<%for(int i=1;i<(15*15)+1; i++){ %>
				<%if((arr[row][(i-1)%15].equals("."))){ %>
					<input type="checkbox" id='ch<%=i %>' name="bak" value="<%=i%>" disabled/>
				<%}else if(!(arr[row][(i-1)%15].equals("O"))){ %>
					<input type="checkbox" id='ch<%=i %>' name="bak" value="<%=i%>" disabled checked/>
				<%}else{ %>
					<input type="checkbox" id='ch<%=i %>' name="bak" value="<%=i%>" />
				<%} %>
				<%if(i%15 == 0){ row++;%>
					<br>
				<%} %>
			<%} }%>
			
			</div>
			
		
		</div>
		<br>
		<div class="contentArea77">
		
				<%= intro.get("board_content") %>
			
		</div>
		<% } else { %>
		
			<div class="headTitle3">
					Not Open~!
				</div>
		<% }  %>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<script src="<%= request.getContextPath() %>/js/funding/sticky.js"></script>
	<script src="<%= request.getContextPath() %>/js/funding/product.js"></script>
	<script src="<%= request.getContextPath() %>/js/funding/topbtn.js"></script>
	
<script>
//클릭 시 목록 이동
$(function(){
	$(".tablinks").click(function(){
		
		
		var pnum = <%=pnum%>; /* 임시번호  */
		var progress = <%=progress%>;
		var type = "B4"; /* 펀드상품  B5 상시상품  */
		var board3 = "R3"; /* 응원하기  */
		var board4 = "R4"; /* 후기 */
		var board5 = "R5"; /* 문의  */
		
		
		/* "리퀘스트/Chup?num="+num+"&num2="+num2; */
		
		if($(this).attr('value') == "btn1"){
			location.href="<%=request.getContextPath() %>/selectProduct.bo?product_page=" + pnum +"&progress=" + progress;
		}else if($(this).attr('value') == "btn2"){
			location.href="<%=request.getContextPath()%>/selectFundStory.bo?product_page=" + pnum +"&progress=" + progress;
		}else if($(this).attr("value") == "btn3"){
			location.href="<%=request.getContextPath() %>/selectFd.bo?pnum="+ pnum + "&type="+ type +"&board="+ board3 +"&progress=" + progress;
		}else if($(this).attr("value") == "btn4"){
			location.href="<%=request.getContextPath() %>/selectFd.bo?pnum="+ pnum + "&type="+ type +"&board="+ board4 +"&progress=" + progress;
		}else if($(this).attr("value") == "btn5"){
			location.href="<%=request.getContextPath() %>/selectFd.bo?pnum="+ pnum + "&type="+ type +"&board="+ board5 +"&progress=" + progress;
		}
		
	});
});


/* 프로그레스바  */
function progressed(number){
	/* 펀딩 프로그레스바*/
  var elem = document.getElementById("myBar");   
  var width = 0;
  var id = setInterval(frame, 30);
  
  if(number < 30){
  	document.getElementById("label").style.backgroundColor = "orange";
  	document.getElementById("label").style.color = "black";
  }else if(number < 70){
	document.getElementById("label").style.backgroundColor = "yellow";  
	document.getElementById("label").style.color = "black";
  }
  function frame() {
    if (width >= number) {
      clearInterval(id);
    } else {
      width++; 
      elem.style.width = width + '%'; 
      document.getElementById("label").innerHTML = width * 1  + '%';
    }
  }
  


}


/* 페이지 로드시 이벤트 작동 */

	$(function(){
		
		 progressed(<%=progress%>);     
		
	});


function noMemberUser(){
	
	alert("회원가입 후 이용가능합니다");
}


function noMemberUser2(){
	
	alert("정회원으로 계정 가입 후 이용가능합니다");
}



//찜하기
function dips(num, btn){
	

	 if($(btn).attr('class') == "far fa-heart"){
		<%if(loginUser != null){%>
			/* $(btn).css('font-size','40px'); */
			$(btn).attr('class','fas fa-heart');
			$.ajax({
				url:'insertDibs',
				data:{
					num : num,
					user_no : <%=loginUser.getMember_No()%>
				},
				success:function(data){
					if(data != 0){
						alert('해당 상품을 찜하였습니다.');
					}else{
						alert('이미 찜 목록에 있는 상품이거나 찜에 실패하셨습니다.');
					}
				}
			});
			
		<%}else{%>
			alert('로그인 하셔야지 찜을 하실수 있습니다.');
		<%}%>
	}else{
		<%if(loginUser != null){%>
		$(btn).attr('class','far fa-heart');
		
		$.ajax({
			url:'deleteDibs',
			data:{
				num : num,
				user_no : <%=loginUser.getMember_No()%>
			},
			success:function(data){
				if(data != 0){
					alert('해당 상품을 찜목록에서 제외하셨습니다.');
				}else{
					alert('찜제거에 실패하셨습니다.');
				}
			}
		});
		
	<%}else{%>
		alert('로그인 하셔야지 찜을 하실수 있습니다.');
	<%}%>
	} 
}

dibsOn();

//페이지 로드시 찜 걸리게하기
var arr ;
function dibsOn(){
	var user_dib = '';
	<%
		if(dibs != null){
			for(int i=0; i<dibs.size(); i++){
	%>
		user_dib += <%=dibs.get(i).getPro_detail_no() %>+' ';
	<%
			}
		}
	%>
	arr = user_dib.split(' ');
	for(var i in arr){
		$(".dofunding i[value='"+arr[i]+"']").attr('class','fas fa-heart');
	
	}
}






</script>
	

</body>
</html>