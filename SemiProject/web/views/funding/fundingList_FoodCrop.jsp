<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='com.kh.Semi.funding.model.vo.*,java.util.ArrayList'%>
<!DOCTYPE html>
<html>
<%
ArrayList<ProductList> list = (ArrayList<ProductList>)request.getAttribute("list");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/funding/fundingList.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/funding/ProgressBar.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/pushy-buttons.css">
<script src="<%= request.getContextPath() %>/js/common/jquery.min.js"></script>
<title>농사펀드</title>

<!-- 펀딩 아이템 컨텐츠  자바스크립트-->
	<script type="text/javascript"> 
		function progressed(num, number){
			/* 펀딩 프로그레스바*/
		  var elem = document.getElementById("myBar"+num);   
		  var width = 0;
		  var id = setInterval(frame, 30);
		  
		  function frame() {
		    if (width >= number) {
		      clearInterval(id);
		    } else {
		      width++; 
		      elem.style.width = width + '%'; 
		    }
		  }
		}
		
		var count = 8;
		var idNum = 5;
		$(function(){
			$('#addFund').click(function(){
				$.ajax({
					url:'selectFundFourOne',
					data:{
						num : count,
						choice : '식량작물'
					},
					success:function(data){
						if(data === 'null'){
							$('#addFund').prop('disabled', true).css('width','340px');
							$('#addFund').css('background','red').text('더이상 펀딩상품이 존재하지 않습니다.');
						}else{
							
							var value = JSON.parse(data);
							for(var i=0 ; i<value.length; i++){
								console.log(value[i].pro_detail_no);
								console.log(value[i].ranks);
								console.log(value[i].pro_name);
								console.log(value[i].pro_count);
								console.log(value[i].pro_qty);
								console.log(value[i].pro_date);
								console.log(value[i].pro_price);
								console.log(value[i].ori_fileName);
								var img = 'images/funding/'+value[i].ori_fileName;
								$('#addbox').append("<div id='fund-cards' class='col-sm-3 wow fadeIn'>"+
							            "<div class='card'>"+
							            	"<a href='Semi/selectProduct.bo?product_page="+value[i].pro_detail_no+"' style='text-decoration:none; color:black;'>"+
							             	   "<img class='img-card' src='"+img+"'>"+
							                "</a>"+
							                "<div class='card-content'>"+
							                    "<h4 class='card-title'>"+
							                    	value[i].pro_name +
							                    "</h4>"+
							                    "<p class=''>"+
							                        "<div id='myProgress'>"+
													  "<div id='myBar"+idNum+"' class='myBarS'>"+
													    "<div id='label' class='labelS'>"+
													    "</div>"+
													  "</div>"+
													"</div>"+
							                    "</p>"+
							                    "<p>"+
								                   	"<span class='fund-money-l'>면적당 :"+value[i].pro_price+"원</span>"+
								                   	"<span class='fund-money-r'>"+value[i].ranks+"%</span>"+
								                "</p>"+
								                "<div class='clear'></div>"+
								                "<hr class='mode-hr'>"+
							                    "<p class='fund-periodAndPersonnel alpha'>"+
							                    	"<label class='fund-period'>"+value[i].pro_date+" 시작</label></label>"+
							                    	"<span class='fund-money-r'>"+
								                    	"<i class='fas fa-shopping-cart'></i>&nbsp;"+
								                    	"<i class='far fa-heart'></i>"+
							                    	"</span>"+
							                    "</p>"+
							                "</div>"+
							            "</div>"+
							       "</div>"+
							       "<script>"+"$(function(){progressed("+idNum+", "+value[i].ranks+");})"+"<"+"/script>");
								idNum+=1;
							}
						}
						count+=4;
						
					},
					
				})
			})
		})
		
		
	</script>	

</head>
<body>
	<%@ include file='../common/navbar.jsp' %> 
	<div class="topArea col-lg-12 col-md-12 col-sm-12 col-xs-12">
	   <br>
	      <h1 id="topText">펀딩</h1>
	      <h4 id="subText">농부를 도와주는 공간</h4>
   </div>
   
   	<div id="tabMenu-list">
		<button onclick='location.href="<%=request.getContextPath()%>/fundingListAll"'>전체</button>
		<button onclick='location.href="<%=request.getContextPath()%>/fundingListFoodCrop"'>식량작물</button>
		<button onclick='location.href="<%=request.getContextPath()%>/fundingListSpecialCrops"'>특용작물</button>
		<button onclick='location.href="<%=request.getContextPath()%>/fundingListVegetable"'>채소</button>
		<button onclick='location.href="<%=request.getContextPath()%>/fundingListFruit"'>과수</button>
	</div>
   
   <div class='all-view'>
   		<span class='all-view-title'><h1>식량작물</h1></span>
   		<span class='all-view-select'>
   			<select style='margin-top: 8px;'>
   				<option>전체</option>
   				<option>진행중인 펀딩</option>
   				<option>재비중인 펀딩</option>
   				<option>완료된 펀딩</option>
   			</select>
   		</span>
   		<div class="clear"></div>
   		<hr class='view-hr'>
   		
   		<div class='all-view-fund'>
   		<div id='addbox' class='row'>
   			<%for(int i=0;i<list.size();i++){ %>
   			<div id='fund-cards' class="col-sm-3 wow fadeIn">
		            <div class="card">
		            	<a href='<%=request.getContextPath() %>/selectProduct.bo?product_page=<%=list.get(i).getPro_detail_no() %>' style="text-decoration:none; color:black;">
		             	   <img class="img-card" src='<%=request.getContextPath()%>/images/funding/<%=list.get(i).getOri_fileName()%>'>
		                </a>
		                <div class="card-content">
		                    <h4 class="card-title">
		                    	<%=list.get(i).getPro_name()%>
		                    </h4>
		                    
		                    <p class="">
		                        <div id="myProgress">
								  <div id="myBar<%=i %>" class='myBarS'>
								    <div id="label" class='labelS'>
								    </div>
								  </div>
								</div>
		                    </p>
		                    <p>
			                   	<span class='fund-money-l'>면적당 :<%=list.get(i).getPro_price() %>원</span>
			                   	<span class='fund-money-r'><%=list.get(i).getRanks() %>%</span>
			                </p>
			                <div class="clear"></div>
			                <hr class='mode-hr'>
		                    <p class='fund-periodAndPersonnel alpha'>
		                    	<label class='fund-period'><%=list.get(i).getPro_date() %> 시작</label></label>
		                    	<span class='fund-money-r'>
			                    	<i class="fas fa-shopping-cart"></i>&nbsp;
			                    	<i class="far fa-heart"></i>
		                    	</span>
		                    </p>
		                </div>
		            </div>
		       </div>
		       <script>
			       $(function(){
						progressed(<%=i%>, <%=list.get(i).getRanks()%>);
					})		
		       </script>
		       
		      <%} %>
		 </div>
   		</div>
   		
   <div class='detail-btn'>
   		<button id='addFund' class='btns btn--xs btn--green' >더 많은 펀딩 상품 보기</button>
   </div>
   </div>
   <br><br><br><br><br><br><br><br><br><br><br><br>
   <%@ include file='../common/footer.jsp' %>
</body>
</html>