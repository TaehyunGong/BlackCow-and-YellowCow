<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import='com.kh.Semi.funding.model.vo.*,java.util.ArrayList'%>
<%@ page import='com.kh.Semi.dips.model.vo.*,java.util.ArrayList'%>
<!DOCTYPE html>
<html>
<%
	ArrayList<ProductList> list = (ArrayList<ProductList>)request.getAttribute("list");
	ArrayList<Dibs> dibs = (ArrayList<Dibs>)request.getAttribute("dibs");
	String prog = request.getParameter("progress");
	String btn = "";
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/funding/fundingList.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/funding/ProgressBar.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/funding/selectCustom.css">
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
		<button onclick='location.href="<%=request.getContextPath()%>/fundingListAll"'>전체</button>
		<button onclick='location.href="<%=request.getContextPath()%>/FundingListOne?catagory=식량작물"'>식량작물</button>
		<button onclick='location.href="<%=request.getContextPath()%>/FundingListOne?catagory=특용작물"'>특용작물</button>
		<button onclick='location.href="<%=request.getContextPath()%>/FundingListOne?catagory=채소"'>채소</button>
		<button onclick='location.href="<%=request.getContextPath()%>/FundingListOne?catagory=과수"'>과수</button>
	</div>
   
   <div class='all-view'>
   		<span class='all-view-title'><h1>전체</h1></span>
   		<span class='all-view-select'>
   			<select name='progressSelect' class='custom-select' style='margin-top: 8px;'>
   				<option id='PR0' value='all'>전체</option>
   				<option id='PR1' value='PR1'>모금중 펀딩</option>
   				<option id='PR2' value='PR2'>모금종료 펀딩</option>
   				<option id='PR3' value='PR3'>진행중 펀딩</option>
   				<option id='PR4' value='PR4'>배송중 펀딩</option>
   				<option id='PR5' value='PR5'>종료된 펀딩</option>
   			</select>
   		</span>
   		<div class="clear"></div>
   		<hr class='view-hr'>
   		
   		<div class='all-view-fund'>
   		<div id='addbox' class='row'>
   			<%for(int i=0;i<list.size();i++){ %>
   			<%btn =progressBar(list.get(i).getProgress()); %>
   			
   			<div id='fund-cards' class="col-sm-3 wow fadeIn">
		            <div class="card">
		            	<a href='<%=request.getContextPath() %>/ProductViewCounting?product_page=<%=list.get(i).getPro_detail_no() %>&progress=<%=list.get(i).getRanks()%>' style="text-decoration:none; color:black;">
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
		                    <div class='fund-periodAndPersonnel alpha'>
		                    	<label class='fund-period'><%=list.get(i).getPro_date() %> 시작</label></label>
		                    	<span class='fund-money-r'>
			                    	<i class="far fa-heart" onclick='dips(<%=list.get(i).getPro_detail_no() %>, this);' value='<%=list.get(i).getPro_detail_no() %>'></i>
		                    	</span>
		                    </div>
		                    <div>
		                    	<%=btn %>
		                    </div>
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

<!-- 펀딩 아이템 컨텐츠  자바스크립트-->
<script type="text/javascript"> 

		//진행상태 셀렉터
		$(function(){
			
			<%if(list.size() != 4){%> $('#addFund').remove(); <%}%>
			
			$('#<%=prog%>').attr('selected','true');	//셀렉터 누를때마다 옵션 값 변동
			
			$('select[name=progressSelect]').change(function(){	//셀렉터 누르면 바로 이동
				var pro = $('select[name=progressSelect]').val();
				location.href='<%=request.getContextPath()%>/fundingListAll?progress='+pro;
			})
		})

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
					url:'selectFundFour',
					data:{
						num : count,
						progress : $('select[name=progressSelect]').val()
					},
					success:function(data){
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
								$('#addbox').append("<div id='fund-cards' class='col-sm-3 wow fadeIn'>"+
							            "<div class='card'>"+
							            	"<a href='<%=request.getContextPath()%>/ProductViewCounting?product_page="+value[i].pro_detail_no+"&progress="+value[i].ranks+"' style='text-decoration:none; color:black;'>"+
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
							                    "<div class='fund-periodAndPersonnel alpha'>"+
							                    	"<label class='fund-period'>"+value[i].pro_date+" 시작</label></label>"+
							                    	"<span class='fund-money-r'>"+
								                    	"<i class='far fa-heart' onclick='dips("+value[i].pro_detail_no+", this);' value='"+value[i].pro_detail_no+"'></i>"+
							                    	"</span>"+
							                    "</div>"+
							                    "<div>"+
							                    	Progressbar(value[i].progress)+
							                    "</div>"+
							                "</div>"+
							            "</div>"+
							       "</div>"+
							       "<script>"+"$(function(){progressed("+idNum+", "+value[i].ranks+");})"+"<"+"/script>");
								idNum+=1;
							}
							dibsOn();	//찜되어있는거 체크 해주기
						}
						count+=4;
						
					},
					
				})
			})
			
		})
		
		function Progressbar(pro){
			var cho ="";
			switch(pro){
				case "PR5" : cho="<button type='button' class='btn btn-dark' style='width:100%; height:100%;'>종료</button>"; break;
				case "PR4" : cho="<button type='button' class='btn btn-warning' style='width:100%; height:100%;'>배송중</button>"; break;
				case "PR3" : cho="<button type='button' class='btn btn-primary' style='width:100%; height:100%;'>진행중</button>"; break;
				case "PR2" : cho="<button type='button' class='btn btn-secondary' style='width:100%; height:100%;'>모금종료</button>"; break;
				case "PR1" : cho="<button type='button' class='btn btn-success' style='width:100%; height:100%;'>모금중</button>"; break;
			}
			return cho;
		}
		
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