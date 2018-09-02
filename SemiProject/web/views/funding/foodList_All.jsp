<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='com.kh.Semi.funding.model.vo.*,java.util.ArrayList'%>
<%@ page import='com.kh.Semi.dips.model.vo.*'%>
<!DOCTYPE html>
<html>
<%
	ArrayList<ProductList> list = (ArrayList<ProductList>)request.getAttribute("list");
	ArrayList<Dibs> dibs = (ArrayList<Dibs>)request.getAttribute("dibs");
	String prog = request.getParameter("progress");
	String btn = "";
%>
<%!
	public String titlePosition(String pro) {
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/funding/foodList.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/funding/ProgressBar.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/pushy-buttons.css">
<script src="<%= request.getContextPath() %>/js/common/jquery.min.js"></script>
<title>농사펀드</title>
</head>
<body>
	<%@ include file='../common/navbar.jsp' %> 
	<div class="topArea col-lg-12 col-md-12 col-sm-12 col-xs-12">
	   <br>
   </div>
   
   	<div id="tabMenu-list">
		<button onclick='location.href="<%=request.getContextPath()%>/foodListAll"'>전체</button>
		<button onclick='location.href="<%=request.getContextPath()%>/FoodingListOne?catagory=식량작물"'>식량작물</button>
		<button onclick='location.href="<%=request.getContextPath()%>/FoodingListOne?catagory=특용작물"'>특용작물</button>
		<button onclick='location.href="<%=request.getContextPath()%>/FoodingListOne?catagory=채소"'>채소</button>
		<button onclick='location.href="<%=request.getContextPath()%>/FoodingListOne?catagory=과수"'>과수</button>
	</div>
   
   <div class='all-view'>
   		<span class='all-view-title'><h1>전체</h1></span>
   		<div class="clear"></div>
   		<hr class='view-hr'>
   		
   		<div class='all-view-fund'>
   		<div id='addbox' class='row'>
				<div class='all-view-fund'>
			   		<div class='row addrow'>
			   			<%for(int i=0; i<list.size() ;i++){
			   				String style="";
			   				String dipStyle="";
			   				switch(i%4){
				   				case 0:  style = "top: 230px; width:480px; text-align: right;"; dipStyle="float: left; font-size: 47px;"; break;
				   				case 1 : style = "top: 230px; width:480px; text-align: left;"; dipStyle="float: right; font-size: 47px;";break;   				
				   				case 2 : style = "top: 0px; width:480px; text-align: right;"; dipStyle="float: left; font-size: 47px;";break;
				   				case 3 : style = "top: 0px; width:480px; text-align: left;"; dipStyle="float: right; font-size: 47px;";break;
			   				}
			   			%>
				   				<div id='fund-cards' class=" col-sm-6 wow fadeIn">
						            <div class="card" style='background-image:url(<%=request.getContextPath()%>/images/funding/<%=list.get(i).getOri_fileName()%>);background-repeat: no-repeat;background-size: cover;' onclick='linkProduct("<%=request.getContextPath() %>/ProductViewCounting?product_page=<%=list.get(i).getPro_detail_no()%>")'>
					             	   <div class='img-text' style='<%=style%>'>
					             	   		<div class='dipDiv' style='<%=dipStyle%>'>
								            	<i class="far fa-star" id='bubbleCancel' onclick='dips(<%=list.get(i).getPro_detail_no() %>, this, event); ' value='<%=list.get(i).getPro_detail_no() %>'></i>
					             	   		</div>
					             	   		<h3 style='font-weight:700;'><%=list.get(i).getPro_name() %></h3>
					             	   		<h4 style='font-weight:700;'><%=list.get(i).getSellerName() %> 농부의 상품</h4>
					             	   </div>
						            </div>
						       </div>
		     			 <%} %>
					 </div>
		   		</div>
		 </div>
   		</div>
   		
   <div class='detail-btn'>
   		<%if(list.size() > 3){ %>
	   		<button id='addFund' class='btns btn--xs btn--green' >더 많은 펀딩 상품 보기</button>
	   	<%} %>
   </div>
   </div>
   <br><br><br><br><br><br><br><br><br><br><br><br>
   <%@ include file='../common/footer.jsp' %>
</body>

<!-- 펀딩 아이템 컨텐츠  자바스크립트-->
<script type="text/javascript"> 

		function linkProduct(tag){
			location.href=tag;
		}
		
		//찜하기
		function dips(num, btn, event){
			event.stopPropagation();
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
		
		//더보기 추가 기능
		var count = 8;
		var idNum = 5;
		$(function(){
			$('#addFund').click(function(){
				$.ajax({
					url:'selectFoodFour',
					data:{
						num : count
					},
					success:function(data){
						console.log(data);
						if(data === 'null'){
							$('#addFund').remove();
							/* $('#addFund').prop('disabled', true).css('width','340px');
							$('#addFund').css('background','red').text('더이상 펀딩상품이 존재하지 않습니다.'); */
						}else{
							var value = JSON.parse(data);
							if(value.length != 4){
								$('#addFund').remove();
							}
							for(var i=0 ; i<value.length; i++){
								/* console.log(value[i].pro_detail_no);
								console.log(value[i].ranks);
								console.log(value[i].pro_name);
								console.log(value[i].pro_count);
								console.log(value[i].pro_qty);
								console.log(value[i].pro_date);
								console.log(value[i].pro_price);
								console.log(value[i].ori_fileName); */
								var img = 'images/funding/'+value[i].ori_fileName;
								$('.addrow').append("<div id='fund-cards' class='col-sm-6 wow fadeIn'>"+
											            "<div class='card' style='background-image:url(<%=request.getContextPath()%>/images/funding/"+value[i].ori_fileName+"); background-repeat: no-repeat;background-size: cover;' onclick=linkProduct('<%=request.getContextPath() %>/ProductViewCounting?product_page="+value[i].pro_detail_no+"')>"+
												            "<div class='img-text' style='"+titlePosition(i)+"'>"+
													            "<div class='dipDiv' style='"+dipPosition(i)+"'>"+
													            	"<i class='far fa-star' id='bubbleCancel' onclick='dips("+value[i].pro_detail_no+", this, event);' value='"+value[i].pro_detail_no+"'></i>"+
									             	   			"</div>"+
												            	"<h3 style='font-weight:700;'>"+value[i].pro_name+"</h3>"+
										             	   		"<h4 style='font-weight:700;'>"+value[i].member_name+" 농부의 상품</h4>"+
								             	   			"</div>"+
											            "</div>"+
							      					 "</div>");
								idNum+=1;
							}
							dibsOn();	//찜되어있는거 체크 해주기
						}
						count+=4;
						
					},
					
				})
			})
			
		})
		
		function dipPosition(i){
			var dipStyle ="";
			switch(i%4){
				case 0:  style = dipStyle="float: left; font-size: 47px;"; break;
				case 1 : style = dipStyle="float: right; font-size: 47px;";break;   				
				case 2 : style = dipStyle="float: left; font-size: 47px;";break;
				case 3 : style = dipStyle="float: right; font-size: 47px;";break;
			}
			return dipStyle;
		}
		
		function titlePosition(i){
			var style="";
			switch(i%4){
  				case 0:  style = "top: 230px; width:480px; text-align: right;"; break;
  				case 1 : style = "top: 230px; width:480px; text-align: left;"; break;   				
  				case 2 : style = "top: 0px; width:480px; text-align: right;"; break;
  				case 3 : style = "top: 0px; width:480px; text-align: left;"; break;
			}	
			return style;
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
				$("[value='"+arr[i]+"']").css('font-weight','900');
			}
		}
	</script>	

</html>