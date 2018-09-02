<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='java.util.Date, java.text.SimpleDateFormat' %>
<%@ page import='com.kh.Semi.funding.model.vo.*,java.util.ArrayList'%>
<%@ page import='com.kh.Semi.dips.model.vo.*,com.kh.Semi.board.model.vo.*'%>
<%
	ArrayList<MainFunding> list = (ArrayList<MainFunding>)request.getAttribute("list1");
	ArrayList<MainFunding> food = (ArrayList<MainFunding>)request.getAttribute("list2");
	ArrayList<MainFunding> list2 = (ArrayList<MainFunding>)request.getAttribute("list3");
	
	ArrayList<Board> boardList = (ArrayList<Board>)request.getAttribute("boradList");
%>

<%!
	public String progressBar(String pro) {
		String cho ="";
		switch(pro){
			case "PR5" : cho="<button type='button' class='btn btn-dark' style='width:100%; height:100%;'>종료</button>"; break;
			case "PR4" : cho="<button type='button' class='btn btn-warning' style='width:100%; height:100%;'>배송중</button>"; break;
			case "PR3" : cho="<button type='button' class='btn btn-primary' style='width:100%; height:100%;'>진행중</button>"; break;
			case "PR2" : cho="<button type='button' class='btn btn-secondary' style='width:100%; height:100%;'>모금종료</button>"; break;
			case "PR1" : cho="<button type='button' class='btn btn-success' style='width:100%; height:100%;'>모금중</button>"; break;
		}
		return cho;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Do+Hyeon" >
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/mainSlide.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/mainFunding.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/ProgressBar.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/animate.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/mainfoods.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/pushy-buttons.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/newFunddingMain.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/mainIntro.css">

<script type="text/javascript" src="<%= request.getContextPath() %>/js/common/wow.min.js"></script>
<script src="<%= request.getContextPath() %>/js/common/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/js/common/flickity.pkgd.min.js"></script>
<script src="<%= request.getContextPath() %>/js/common/countUp.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCJmTLCExNP_to0T2dgycRI8lBuFuL7mZE&callback=initMap&sensor=true" type="text/javascript"></script>
<script> new WOW().init(); </script>	
<title>메인</title>
<style>
	.new-fundItme{
		font-size:26px;
		color:red;
	}
	
	.fund-period{
		font-weight:bold;
	}
	
	.foodDip{
		font-size:30px;
		color:yellow;
	}
	
	.food-price{
	    float: right;
		font-size:20px;
	}
</style>
</head>
<body>
	<script>
	/* 새로고침시 무조건 최상단에 배치 */
		/* window.onload = function (){
			setTimeout(function(){
				scrollTo(0,0);
			},100);
			
		} */
	</script>
	
	<%@ include file='../common/navbar.jsp' %>
	
	<%
		ArrayList<Dibs> dibs = null;
		if(loginUser!=null)
			dibs = (ArrayList<Dibs>)request.getAttribute("dibs");
	%>
	
	<!-- 슬라이드 -->
	<div class="carousel" data-flickity='{ "wrapAround": true, "autoPlay": 3000, "selectedAttraction": 0.01,
	"friction": 0.15, "pageDots":false}'>
	  <div class="carousel-cell cell-one"><div class='black-shadow'><label class='slide-font'>농부에게 <label style='color:green'>투자</label>하고<br>
	보다 나은 <label style="color:blue">먹을거리</label>로<br>
	돌려받는 <label style='color:red'>크라우드펀딩</label></label>
	</div></div>
	  <div class="carousel-cell cell-two"><div class='black-shadow'><label class='slide-font'>농부에게 <label style='color:green'>투자</label>하고<br>
	보다 나은 <label style='color:blue'>먹을거리</label>로<br>
	돌려받는 <label style='color:red'>크라우드펀딩</label></label></div></div>
	  <div class="carousel-cell cell-three"><div class='black-shadow'><label class='slide-font'>농부에게 <label style='color:green'>투자</label>하고<br>
	보다 나은 <label style='color:blue'>먹을거리</label>로<br>
	돌려받는 <label style='color:red'>크라우드펀딩</label></label></div></div>
	</div>
	
   	<!-- 펀딩 아이템 컨텐츠  자바스크립트-->
	<script type="text/javascript"> 
		function progressed(num, number, money, personnel){
			/* 펀딩 프로그레스바*/
		  var elem = document.getElementById("myBar"+num);   
		  var width = 0;
		  var id = setInterval(frame, 30);
		  
		  if(number < 30){
		  	document.getElementById("label"+num).style.backgroundColor = "orange";
		  	document.getElementById("label"+num).style.color = "black";
		  }else if(number < 70){
			document.getElementById("label"+num).style.backgroundColor = "yellow";  
			document.getElementById("label"+num).style.color = "black";
		  }
		  function frame() {
		    if (width >= number) {
		      clearInterval(id);
		    } else {
		      width++; 
		      elem.style.width = width + '%'; 
		      document.getElementById("label"+num).innerHTML = width * 1  + '%';
		    }
		  }
		  
		 /* 펀딩 금액 애니메이션*/ 
		var optionsMoney = {
		  useEasing: false, 
		  useGrouping: true, 
		  separator: ',', 
		  decimal: '.', 
		  prefix: "모금액 : ", 
		  suffix: '원' 
		};
		
		var optionsPersonnel = {
		  useEasing: true, 
		  useGrouping: true, 
		  separator: '', 
		  decimal: '', 
		  suffix: '명 참여' 
		};
		
		var money = new CountUp('fund-money'+num, 0, money, 0, 2.5, optionsMoney);
		var personnel = new CountUp('fund-personnel'+num, 0, personnel, 0, 2.5, optionsPersonnel);
		if (!money.error) {
		  money.start();
		  personnel.start();
		} else {
		  console.error(demo.error);
		}
		
		}
		/* 스크롤시 이벤트 작동 */
			var fund = 0;
		window.addEventListener('scroll', function() {
			  if(window.scrollY >= 480 && window.scrollY <= 1500 && fund === 0){
			  	<% for(int i=0; i<list.size(); i++){ %>
		        progressed(
		        <%=i%>,
		        <%=list.get(i).getPercent_qty()%>, 
		        <%=list.get(i).getPro_price()%>, 
		        <%=10 %>
		        );
		        <%} %>
		        fund++;
			  }
		});
		
		$(window).scroll(function () {
			var height = $(document).scrollTop();
		}); 
		
			//찜하기
			function dips(num, btn){
				if($(btn).attr('style') == undefined){
					<%if(loginUser != null){%>
						$(btn).css('font-weight','900');
						
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
					$(btn).removeAttr('style');
					
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
				return false;
			}
			
			$(function(){
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
						$("[value='"+arr[i]+"']").css('font-weight','900');
					}
				}
				
			})
		
		
	</script>	
	
	
	<!-- 펀딩 아이템  -->
	<div id='fund' class='funding-items parallax'>
		<div class='funding-title'>
		</div>
		<div class="container items">
		    <div class="row">
		    <% for(int i=0; i<list.size(); i++){ %>
				<%String btn =progressBar(list.get(i).getProgress()); %>
		        <div id='fund-cards' class="col-xs-12 col-sm-3 wow fadeIn">
		            <div class="card">
		            	<a href='<%=request.getContextPath() %>/selectProduct.bo?product_page=<%=list.get(i).getPro_detail_no() %>&progress=<%=list.get(i).getPercent_qty()%>' style="text-decoration:none; color:black;">
		             	   <img class="img-card" src='<%=request.getContextPath()+"/images/funding/"+list.get(i).getOri_fileName()%>'>
		                </a>
		                <div class="card-content">
		                    <h4 class="card-title">
	                            <%=list.get(i).getPro_name() %>
		                    </h4>
		                    
		                    <p class="">
		                        <div id="myProgress">
								  <div id="myBar<%=i%>" class='myBarS'>
								    <div id="label<%=i%>" class='labelS'>
								    </div>
								  </div>
								</div>
		                    </p>
		                    <p  class='fund-money'>
			                   	<span id='fund-money<%=i%>'>0</span>
			                </p>
		                    <div class='fund-periodAndPersonnel alpha'>
		                    	<label class='fund-period'><%=list.get(i).getPro_date()%>일 <label style='color:red'> 까지</label></label>
		                    	<i class="far fa-heart" onclick='dips(<%=list.get(i).getPro_detail_no() %>, this);' value='<%=list.get(i).getPro_detail_no() %>'></i>
		                    </div>
		                    <p style='height:18%;'>
		                    	<%=btn %>
		                    </p>
		                </div>
		            </div>
		        </div>
		    <%} %>
		    </div>
		</div>
		<div class='main-button'>
			<a href='<%=request.getContextPath() %>/fundingListAll'><button class='btns btn--md btn--green'>농사 펀드로 바로가기</button></a>
		</div>
	</div>
	
	<!-- 먹거리 아이템  -->
	<div id='fund' class='foods-items parallax-foods'>
		<div class='foods-title'></div>
		<div class="container items">
		    <div class="row" style='width:670px; margin:0 auto;'>
		    
		    <% for(int i=0; i<food.size(); i++){ %>
		        <div class="col-xs-12 col-sm-6 center-block wow fadeInUp">
		            <div class="foods-card">
						<a href='<%=request.getContextPath() %>/selectFood.bo?product_page=<%=food.get(i).getPro_detail_no() %>' style="text-decoration:none; color:black;">
							
			                <div class='img-card' style='background-image:url("<%=request.getContextPath()+"/images/funding/"+food.get(i).getOri_fileName()%>"); background-repeat: no-repeat; background-size: cover;'>
			                    <h4 class="foods-card-title">
	                            	<%=food.get(i).getPro_name() %>
			                    </h4>
			                </div>
		                    
				      	</a>
		                <i class="far fa-star foodDip" id='bubbleCancel' onclick='dips(<%=food.get(i).getPro_detail_no() %>, this, event); ' value='<%=food.get(i).getPro_detail_no() %>'></i>
		                <label class='food-price'><%=food.get(i).getPro_price() %>원</label>
		            </div>
		        </div>
		    <%} %>
		    </div>
		</div>
		<div class='main-button'>
			<a href='<%=request.getContextPath() %>/foodListAll'><button class='btns btn--md btn--green'>두레상회 입장</button></a>
		</div>
	</div>
	<!-- 새로운 펀딩 아이템  -->
	<div id='fund' class='new-funding-items parallax'>
		<div class='new-funding-title'>
		</div>
		<div class="container new-items">
		    <div class="row center">
		      <% for(int i=0; i<list2.size(); i++){
		    	  int pro = (int)((double)list2.get(i).getPro_qty()/list2.get(i).getPro_count()*100);
		      %>
		        <div class="wow fadeIn"  style="float: none; margin: 0 auto;" >
		            <div class="new-card">
			        <a href='<%=request.getContextPath() %>/selectProduct.bo?product_page=<%=list2.get(i).getPro_detail_no() %>&progress=<%=pro%>' style="text-decoration:none; color:black;">
		                <img class="img-card" src='<%=request.getContextPath()+"/images/funding/"+list2.get(i).getOri_fileName()%>'>
		            </a>
		                <div class="new-card-content">
		                    <div class="card-title" style='height: 42px;'>
	                            	<%=list2.get(i).getPro_name() %>
		                    </div>
		                     <div class="">
		                        <div id="myProgress-sm">
								  <div id="myBar" class='myBarS' style='width:<%=pro%>%'>
								  </div>
								</div>
		                    </div>
		                    <div class='fund-periodAndPersonnel alpha' style='margin-top:10px'>
		                    	<label class='fund-period' style='width: 150px;'>면적 당 <%=list2.get(i).getPro_price()%>원</label>
		                    	<i class="far fa-heart new-fundItme" onclick='dips(<%=list2.get(i).getPro_detail_no() %>, this);' value='<%=list2.get(i).getPro_detail_no() %>'></i>
		                    </div>
		                </div>
		            </div>
		        </div>
		        <br>
		    <%} %>
		    </div>
		</div>
		<div class='main-button'>
			<a href='<%=request.getContextPath() %>/fundingListAll'><button class='btns btn--md btn--green'>더 많은 상품으로 바로가기</button></a>
		</div>
	</div>
	
	<!-- center:{37.499086, 127.032931}, -->
    <script>
	    var map;
	    function initialize() {
	          var latlng = new google.maps.LatLng(37.499086, 127.032931);     
	          var myOptions = {       
	              zoom: 18,       
	              center: latlng,       
	              mapTypeId: google.maps.MapTypeId.ROADMAP     
	          };     
	          map = new google.maps.Map(document.getElementById("googleMap"), myOptions); 
	          map.setTilt(45);
	          
	          var infowindow = new google.maps.InfoWindow({
	              content: '서울특별시 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층'
          	  });
	          
	         var marker = new google.maps.Marker({
	             position: latlng,
	             map: map,
	             title: '검누개'
        	   });
	         
	         marker.addListener('click', function() {
	             infowindow.open(map, marker);
         	  });
	    }
	    window.onload = function() {
	          initialize();
	    }

	</script>

	<div style='margin:300px;'></div>

	<div class='mainIntroTitle'>
		<label>INTRODUCE</label>
	</div>
	<div id='map' class='mainIntro'>
		
	<div class='mainMapS'>
		<label class='mapTitle'>MY MAP</label>
		<div id="googleMap" class='mainMap'></div>
	</div>
		
	<div class='mainCommunity'>
		<label class='CommunityTitle'>COMMUNITY</label>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="공지사항을 나타낸 표" class="board_list">
		<colgroup>
			<col style="width:8%" />
			<col style="width:50%" />
			<col style="width:12%" />
			<col style="width:12%" />
		</colgroup>
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
			</tr>
		</thead>
		<tbody>
		<%
			if(boardList != null){
				ArrayList<Board> boardBox = new ArrayList<Board>();
				for(int i=0; i<boardList.size(); i++){
					String writer = "", boardNo = "공지";
					if(boardList.get(i).getMember_No().equals("jy")){
						writer="notice";
		%>
			<tr class="<%=writer%>">
				<td><%=boardNo %></td>
				<td class="tLeft"><a href="<%=request.getContextPath()%>/selectOne.bo?num=<%=boardList.get(i).getBoard_No()%>"><%=boardList.get(i).getBoard_Title() %></a></td>
				<td><%=boardList.get(i).getMember_No() %></td>
				<td><%=boardList.get(i).getWrite_Date() %></td>
			</tr>
		<%
						}else boardBox.add(boardList.get(i));
					}
				for(int n=0; n<boardBox.size();n++){
		%>
			<tr class="">
				<td><%=boardBox.get(n).getBoard_No() %></td>
				<td class="tLeft"><a href="<%=request.getContextPath()%>/selectOne.bo?num=<%=boardBox.get(n).getBoard_No()%>"><%=boardBox.get(n).getBoard_Title() %></a></td>
				<td><%=boardBox.get(n).getMember_No() %></td>
				<td><%=boardBox.get(n).getWrite_Date() %></td>
			</tr>
		<%			
				}
				} %>
			</tbody>
		</table>
	
		</div>
	</div>
	<div style='margin:200px;'></div>
	<%@ include file='../common/footer.jsp' %>
</body>
</html>