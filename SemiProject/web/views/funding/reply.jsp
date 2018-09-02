<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.Semi.board.model.vo.*,com.kh.Semi.dips.model.vo.*,
    com.kh.Semi.funding.model.vo.*"%>
    
    <%
    	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
    
    int pro_Detail_No =  Integer.parseInt(request.getAttribute("pnum").toString());
    
    HashMap<String, Object> intro = (HashMap<String, Object>)request.getAttribute("intro");
    
    int remain = Integer.parseInt(request.getAttribute("remain").toString());
    
    int progress = Integer.parseInt(request.getAttribute("progress").toString());
    
    ArrayList<Dibs> dibs = (ArrayList<Dibs>)request.getAttribute("dibs");
    
    ProductList productStatus = (ProductList)request.getAttribute("productStatus");
	
	String fundingBtn = "";

	ArrayList<HashMap<String, Object>> popRank = (ArrayList<HashMap<String, Object>>)request.getAttribute("popRank");
	
	ArrayList<HashMap<String, Object>> newFundlist = (ArrayList<HashMap<String, Object>>)request.getAttribute("newFundlist");
	
	ArrayList<HashMap<String, Object>> deadlineFundlist = (ArrayList<HashMap<String, Object>>)request.getAttribute("deadlineFundlist");

	
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


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" 
integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">



<link href="<%= request.getContextPath() %>/css/funding/sticky.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/funding/product.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/funding/cheerup.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/funding/topbtn.css" rel="stylesheet">


<!-- 배너 및 폰트  -->
<link href="<%= request.getContextPath() %>/css/funding/banner.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Nanum+Gothic|Yeon+Sung" rel="stylesheet">
<!-- ------------  -->

</head>
<body>
	
	<%@ include file="../common/navbar.jsp"%>
	
	<div class="bannerArea">
		
		
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
				
				<input type='hidden' id='pro_detail_no' name='pro_detail_no' value='<%=pro_Detail_No%>'> <!-- pro_detail_no -->
				<input type='hidden' id='amount' name='amount' value='0'> <!-- 수량 amount -->
				<input type='hidden' id='fundList' name='fundList' value='' readonly>			<!-- 구매할 밭 면적 -->
				<input type='hidden' id='farmSize' name='farmSize' value='' readonly>			<!-- 평당 면적 -->
			</form>
	
			<script type="text/javascript">
		        function popupOpen()
		        {
					var popUrl = "<%=request.getContextPath() %>/ViewFiled?name=<%=intro.get("member_Id")%>&price=<%=intro.get("pro_price") %>";	//팝업창에 출력될 페이지 URL
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
					<i class="far fa-heart" style="font-size:40px;" onclick='dips(<%=pro_Detail_No %>, this);' value='<%=pro_Detail_No %>'></i>
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
					<i class="far fa-heart" name="heart" style="font-size:40px;" disabled></i>
				</div>
			
			</div>
			<% } %>
	
	</div>
</div>

	
	
	<br>
	<div id="tabMenu">
		<button class="tablinks" onclick="category(event)" id="intro"
			value="btn1">펀딩소개</button>
		<button class="tablinks" onclick="category(event)" id="story"
			value="btn2">스토리  </button>
		<button class="tablinks" onclick="category(event)" id="cheerUp"
			value="btn3">응원하기  </button>
		<button class="tablinks active" onclick="category(event)" value="btn4" id="reple">후기  </button>
		<button class="tablinks" onclick="category(event)" value="btn5" id="mun">문의  </button>
	</div>
	
	<br>
	
	<button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
	
	<div class="commentArea">
		<div class="leftArea">
			<div class="head">
				<div class="headTitle">
					 후기를 남겨주세요!
				</div>
				
				<div class="replyCount">
				 	<span><%=list.size() %>개</span>의 후기가 있습니다
				</div>
			</div>
			
			<form action="<%=request.getContextPath() %>/insertFd.bo" method="post">
			<div class="replyArea">
				<div class="replyCmt">
					<textarea class="replyContent" maxlength="500" placeholder="내용을 적어주세요" name="replyCtArea" ></textarea>
				</div>			
				<div class="cntCount">
					<span id="counter">0/500</span>
				</div>
				<div class="btnsubmit">
				<% if(loginUser != null) {%>
					<button type="submit" id="checkReplyContent">후기작성</button>
					<script>
						$("#checkReplyContent").click(function(){
							
							if($(".replyCmt textarea[name=replyCtArea]").val() == ''){
								alert("글을 작성해 주세요");
								return false;
							}
							
						});
					</script>
					<% }else{ %>
					<button type="button" onclick="noMemberUser()">응원하기</button>
					<% } %>
				</div>
			</div>
			<% if(loginUser != null) { %>
			<input type="hidden" name="memberNo" value="<%=loginUser.getMember_No() %>">
			<% } %>
			<input type="hidden" name="pro_De_No" value="<%=pro_Detail_No%>">
			<input type="hidden" name="bdType" value="B4">
			<input type="hidden" name="refBoard" value="R4">
			<input type="hidden" name="progressNum" value="<%=progress %>">
			<% if(intro != null){ %>
			<input type="hidden" name="sellerNo" value="<%=intro.get("member_No")%>">
			<input type="hidden" name="pro_name" value="<%=intro.get("pro_name")%>">
			<% } %>
			</form>
			
			<hr><hr>
			
			
			
			<% for(int i=0; i<list.size(); i++){ %>
			
			<div class="reListArea">
				<div class="reHeader">
					<!-- <div class="reImg">
						<img src="<%=request.getContextPath()%>/images/funding/strowberry.jpg">
					</div> -->
					
					<div class="reUserInfo">
						<span class="reIdArea"><%=list.get(i).getMember_No() %></span><br>
						<%=list.get(i).getWrite_Date() %>
					</div>
				</div>
				<div class="reContent">
					<div class="content">
						<p>
						<%=list.get(i).getBoard_Content() %>
						</p>
					</div>
					<div class="replysubmit">
						<button onclick="replyWrite(<%=list.get(i).getBoard_No() %>);" value="<%=list.get(i).getBoard_No() %>">답글</button>
					</div>
				</div>
				<hr>
			</div>
			
			
			
			<div class="allReply" id="replynumber<%=list.get(i).getBoard_No() %>">
			
			<!-- 원본 댓글  -->
			
			
			
			
			
		<div id="replyAjax<%=list.get(i).getBoard_No()%>">
			
		</div>
			
		
			
			
			
			
			
		
			
			
			
			
			
			<!-- 댓글 달기  -->
				<div class="rereArea">
					<div class="reremodel"></div>
					
					<form>
					<div class="replyReply">
						<textarea id="replyTextArea<%=list.get(i).getBoard_No()%>" maxlength="500" placeholder="내용을 적어주세요"></textarea>
					</div>
					
					<div class="btnsubmit1">
						<button type="button" onclick="rereplysubmit(<%=list.get(i).getBoard_No()%>);">답글하기</button>
					</div>
					</form>
				</div>
				
			</div>
			<hr>
			
			<% } %>
			
			
			
		
			
			
			
			
			<!-- leftarea end  -->
		</div>
	
	<div class="rightArea">
			<div class="chartArea">
					<div class="chartOuter">
						<h6 style="margin-left:10px; font-weight:bold">인기 프로젝트</h6>
							<hr style="width:95%" >
					<div class="chart">	
					
						<% for(int i=0; i < popRank.size(); i++){ %>
						<div style="width:100%; padding:3px; font-weight:bold;">
							<div class="chartOrder"><%=i+1 %></div>
						
							<div class="chartContent"><a class="chartlink" href="javascript:moveproduct(<%=popRank.get(i).get("pnum")%>, <%=popRank.get(i).get("percent") %>);">
							<%=popRank.get(i).get("pro_name") %></a></div>
						</div>
								
						
						
							
								
						<% } %>
						
						
					</div>	
				  </div>
				</div>
				
				<br><br>
				
				<div class="chartArea">
					<div class="chartOuter">
						<h6 style="margin-left:10px; font-weight:bold">신규 프로젝트</h6>
							<hr style="width:95%" >
					<div class="chart">	
					
						<% for(int i=0; i < newFundlist.size(); i++){ %>
						<div style="width:100%; padding:3px; font-weight:bold;">
							<div class="chartOrder"><%=i+1 %></div>
						
							<div class="chartContent">
							<a class="chartlink" href="javascript:moveproduct(<%=newFundlist.get(i).get("pnum")%>,<%=newFundlist.get(i).get("percent")%>)">
							<%=newFundlist.get(i).get("pro_name") %></a></div>
						</div>
								
						<% } %>
				
					</div>	
				  </div>
				</div>
				
				<br><br>
				
				<div class="chartArea">
					<div class="chartOuter">
						<h6 style="margin-left:10px; font-weight:bold">마감임박 프로젝트</h6>
							<hr style="width:95%" >
					<div class="chart">	
					
						<% for(int i=0; i < deadlineFundlist.size(); i++){ %>
						<div style="width:100%; padding:3px; font-weight:bold;">
							<div class="chartOrder"><%=i+1 %></div>
						
							<div class="chartContent">
							<a class="chartlink" href="javascript:moveproduct(<%=deadlineFundlist.get(i).get("pnum")%>,<%=deadlineFundlist.get(i).get("percent")%>)">
							<%=deadlineFundlist.get(i).get("pro_name") %></a></div>
						</div>
								
						<% } %>
				
					</div>	
				  </div>
				</div>
		</div>
	</div>
	
	
	
	
	<script src="<%= request.getContextPath() %>/js/funding/sticky.js"></script>
	<script src="<%= request.getContextPath() %>/js/funding/product.js"></script>
	<script src="<%= request.getContextPath() %>/js/funding/cheerup.js"></script>
	<script src="<%= request.getContextPath() %>/js/funding/topbtn.js"></script>
	
	
<script>

//클릭 시 목록 이동
$(function(){
	$(".tablinks").click(function(){
		
		
		var pnum = <%=pro_Detail_No%>;
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



function replyWrite(num){
	
	var re = document.getElementById("replynumber" + num);
	
	
	if(re.style.display == 'none'){
		
		
		 re.style.display = "block";
		 
		
			var bnum = num;
			var type = "B4";
			var board = "R4";
			
			$.ajax({
				url:"<%=request.getContextPath()%>/selectReply.bo",
				data:{bnum:bnum,type:type,board:board},
				type:"post",
				success:function(data){
					console.log(data);
					
					
					
				
					$outer = $("#replyAjax" + bnum);
					$outer.html('');
					
					
					
					
					for(var key in data){
						
					
					
					
					
					 var $content = $("<div class='reListArea2'>"+"<div class='reHeaderTwo'>" +
							 "<div class='reremodel2'></div>" + 
								
							
								"<div class='reUserInfo2'>" +
									"<span class='reIdArea2'>" + data[key].member_No + "</span><br>" +
									"<span class='reDateArea'>" + data[key].write_Date + "</span>" +
								"</div>" +
							"</div>" +
							"<div class='reContent2'>" +
								"<div class='content2'>" +
									"<p>" +
										data[key].board_Content +
									"</p>" +
								"</div>" +
								"<div class='replysubmit2'>" +
									
								"</div>" +
							"</div>" +
							"<hr>" + "</div>");
					
					
					
					$outer.append($content);
					
				
					 
					
						
					 	
					}
					
					
				
				},
				error:function(){
					console.log("실패");
				}
			});
	
	} else {
        re.style.display = "none";
    }
	

}




function rereplysubmit(bnum){
	
	if($("#replyTextArea" + bnum).val() != ''){
		
		<%if(loginUser == null){ %>
		
		alert("회원가입 후 이용가능합니다");
		
		
		 <%	}else if(!loginUser.getMember_Id().equals(intro.get("member_Id"))){ %>
		 	alert("판매자 회원만 이용가능합니다");
		 	<% }else { %>
		 	
		 	var content = $("#replyTextArea" + bnum).val();
			var mnum = <%=loginUser.getMember_No()%>;
			var pnum = <%=pro_Detail_No%>;
			var type = "B4";
			var board = "R4";
			
			 $.ajax({
				url:"<%=request.getContextPath()%>/insertFundReply.bo",
				data:{bnum:bnum,type:type,board:board,content:content,mnum:mnum,pnum:pnum},
				type:"post",
				success:function(data){
					console.log(data);
					
					
					$outer = $("#replyAjax" + bnum);
					$outer.html('');
					
					
					
					
					for(var key in data){
						
					
					
					
					
					 var $content = $("<div class='reListArea2'>"+"<div class='reHeaderTwo'>" +
							 "<div class='reremodel2'></div>" + 
								
							
								"<div class='reUserInfo2'>" +
									"<span class='reIdArea2'>" + data[key].member_No + "</span><br>" +
									"<span class='reDateArea'>" + data[key].write_Date + "</span>" +
								"</div>" +
							"</div>" +
							"<div class='reContent2'>" +
								"<div class='content2'>" +
									"<p>" +
										data[key].board_Content +
									"</p>" +
								"</div>" +
								"<div class='replysubmit2'>" +
									
								"</div>" +
							"</div>" +
							"<hr>" + "</div>");
					
					
					
					$outer.append($content);
					
				
					 
					
						
					 	
					}
					
					
					
				},
				error:function(){
					console.log("실패");
				}
				
			});
		 	
		 	<% } %>
		
		
		
	}else{
		alert("글을 작성해 주세요");
	}
	
	
	
} 

function noMemberUser(){
	
	alert("회원가입 후 이용가능합니다");
}


function noMemberUser2(){
	
	alert("정회원으로 계정 가입 후 이용가능합니다");
}



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
	
	
	// 차트 페이지 이동
	
	function moveproduct(pnum, percent){
		
		var proNum = pnum;
		
		var per = percent;
													
		location.href="<%=request.getContextPath() %>/selectProduct.bo?product_page=" + proNum +"&progress=" + per;
				
		
	}

</script>

	

</body>
</html>