<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='com.kh.Semi.member.model.vo.*, java.util.*'%>
<% ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)request.getAttribute("list");%>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
<!DOCTYPE html>
<html lang="ko">

<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <!-- Meta, title, CSS, favicons, etc. -->
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">

   <title>우리 두레 이야기 - 판매자</title>

   <!-- Bootstrap core CSS -->

   <link href="<%=request.getContextPath() %>/css/seller/bootstrap.min.css" rel="stylesheet">

   <link href="<%=request.getContextPath() %>/fonts/fonts/font-awesome.min.css" rel="stylesheet">
   <link href="<%=request.getContextPath() %>/css/seller/animate.min.css" rel="stylesheet">

   <!-- Custom styling plus plugins -->
   <link href="<%=request.getContextPath() %>/css/seller/custom.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/seller/maps/jquery-jvectormap-2.0.3.css" />
   <link href="<%=request.getContextPath() %>/css/seller/icheck/flat/green.css" rel="stylesheet" />
   <link href="<%=request.getContextPath() %>/css/seller/floatexamples.css" rel="stylesheet" type="text/css" />

   <script src="<%=request.getContextPath() %>/js/seller/jquery.min.js"></script>
   <script src="<%=request.getContextPath() %>/js/seller/nprogress.js"></script>
<style>
.white_content {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0);
    opacity:0;
    -webkit-transition: opacity 400ms ease-in;
    -moz-transition: opacity 400ms ease-in;
    transition: opacity 400ms ease-in;
    pointer-events: none;
}
.white_content:target {
    opacity:1;
    pointer-events: auto;
}
.white_content > div {
   margin-top:10%;
   margin-left:auto;
   margin-right:auto;
   width: 500px;
   height: 450px;
   padding: 16px;
   border: 5px solid black;
   background-color: white;
   overflow: auto;   
   z-index:100;
   font-size:20px;
   color:black;
   border-radius:20px;
   background-image:url("<%=request.getContextPath()%>/images/common/양식.png");
   background-size:cover;
}


</style>
</head>
	<script>

	$(function(){
		$(".facingUl").empty();
		$.ajax({
			url : "<%=request.getContextPath()%>/selectFacing",
			data : {member_no:<%=loginUser.getMember_No()%>},
			success : function(data){
				var $ul = $('.facingUl');
				var $top = $('<span>수신 확인은 쪽지를 클릭하세요</span>');
				$ul.append($top);
				$.each(data, function(index, val){
					$(".checkAlert").text(val.listSize);
					var $ul = $('.facingUl');
					var $li = $('<li>');
					var $a = $('<a class="reception">');
					var $span = $('<span>');
					var $nameSpan = $('<span>').text(decodeURIComponent(val.writer));
					var $later = $('<span class="time">').text(decodeURIComponent(val.write_date));
					var $title = $('<span class="message">').text(decodeURIComponent(val.facing_title));
					var $hidden = $('<input type="hidden" value="+val.facing_no+" class="facing_no">');
					
					$li.append($a);
	            	$a.append($span);
	            	$li.append($hidden);
	            	$span.append($nameSpan);
	            	$span.append($later);
	            	$a.append($title);
	            	$ul.append($li);
				})
			}
		});
	});
	/* $(function(){
		$(".message").click(function(){
			console.log('click');
			var test = $(this).parent().children('.facing_no').val();
			console.log(test);
		});
	}); */

	</script>

<body class="nav-md">
   <% if(loginUser != null && loginUser.getMember_Type().equals("M3")){ %>
   <div class="container body">
      <div class="main_container">
         <div class="col-md-3 left_col">
            <div class="left_col scroll-view">

               <div class="navbar nav_title" style="border: 0;">
                  <a href="<%=request.getContextPath() %>/views/seller/sellerMain.jsp" class="site_title"><i class="fa fa-user"></i> <span>판매자 페이지</span></a>
               </div>
               <div class="clearfix"></div>

               <!-- 사이드메뉴 상단  -->
               <div class="profile">
                  <div class="profile_pic">
                     <img src="<%=request.getContextPath() %>/images/seller/img.jpg" alt="..." class="img-circle profile_img">
                  </div>
                  <div class="profile_info">
                     <span>환영합니다,</span>
                     <h2><%=loginUser.getMember_Name() %>님</h2>
                  </div>
               </div>
               <!-- /사이드메뉴 상단 -->

               <br/>

               <!-- 사이드바 메뉴 -->
					<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
						<input type="hidden" name="login_member_no" value="<%=loginUser.getMember_No()%>">
						<div class="menu_section">
							<h3><%=loginUser.getFarm_Name() %></h3>
							<ul class="nav side-menu">
								<li><a><i class="fa fa-home"></i> 농가 관리 <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
										<li><a href="<%=request.getContextPath() %>/views/seller/farmerInformation.jsp">농가 정보 수정</a>
										</li>
										<li><a href="<%=request.getContextPath()%>/views/seller/sellerRetire.jsp">판매자 자격 내려놓기</a>
										</li>
									</ul>
								</li>
								<li><a><i class="fa fa-shopping-bag"></i> 상품 <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
										<li><a href="<%=request.getContextPath() %>/views/seller/sellerapply.jsp">상품 신청</a>
										</li>
										<li><a href="<%=request.getContextPath()%>/allFunding">펀딩 상품</a>
										</li>
										<li><a href="<%=request.getContextPath()%>/allProduct">상시판매 상품</a>
										</li>
										<li><a href="<%=request.getContextPath()%>/refundApprove">환불 승인</a>
										</li>
									</ul>
								</li>
								<li><a><i class="fa fa-truck"></i> 배송 관리 <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
										<li><a href="<%=request.getContextPath()%>/allBuyer">전체 조회</a>
										</li>
										<li><a href="<%=request.getContextPath()%>/selectWaybill">운송장 번호 입력</a>
										</li>
									</ul>
								</li>
									<li><a><i class="fa fa-bar-chart"></i> 통계 <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
										<li><a href="<%=request.getContextPath()%>/views/seller/fundingChart.jsp">상품 통계</a>
										</li>
										<%-- <li><a href="<%=request.getContextPath()%>/views/seller/productChart.jsp">상시판매 통계</a>
										</li> --%>
									</ul>
								</li>
							</ul>
						</div>
					</div>
					<!-- /사이드바 메뉴 -->
               
            </div>
         </div>
         
         <!-- 탑 네비게이션 바 -->
            <div class="top_nav">

        <div class="nav_menu">
          <nav class="" role="navigation">
            <div class="nav toggle">
              <a id="menu_toggle"><i class="fa fa-bars"></i></a>
            </div>

            <ul class="nav navbar-nav navbar-right">
              

              <li role="presentation" class="dropdown">
                <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                  <i class="fa fa-envelope-o"></i>
                  <span class="badge bg-green checkAlert"></span>
                </a>
                <ul id="menu1" class="dropdown-menu list-unstyled msg_list animated fadeInDown facingUl" role="menu">
                  
                </ul>
              </li>

            </ul>
          </nav>
        </div>

      </div>
         <!-- 탑 네비 끝 -->
      <!-- 내용 -->
         <div class="right_col" role="main">
        <div class="">
          <div class="page-title">
            <div class="title_left">
              <h3>판매자 기능</h3>
            </div>
            
          </div>
          <div class="clearfix"></div>
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>환불 승인</h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <table id="datatable" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                         <th>아이디</th>
                         <th>닉네임</th>
                        <th>상품명</th>
                        <th>상품타입</th>
                        <th>결제금액</th>
                        <th>결제번호</th>
                        <th>환불사유</th>
                        <th>승인</th>
                      </tr>
                    </thead>
                    <tbody>
                   <% for(HashMap<String, Object> h : list){ %>
                       <tr>
                          <td><%=h.get("member_id") %></td>
                          <td class="member_nick"><%=h.get("member_nick") %></td>
                          <td class="pro_name"><%=h.get("pro_name") %></td>
                          <% if(h.get("product_type") != null) { %>
                              <td class="pro_type">상시 먹거리 상품</td>
                           <% }else if(h.get("funding_type").equals("P2")){ %>
                              <td class="pro_type">달성형 펀딩상품</td>
                           <% }else{ %>
                              <td class="pro_type">미달성형 펀딩상품</td>
                           <% } %>
                          <td class="pay_price"><%=h.get("pay_price") %></td>
                          <td class="accept_no" value="<%=h.get("accept_no") %>"><%=h.get("accept_no") %></td>
                          <input type="hidden" value="<%=h.get("pay_no") %>" class="pay_no">
                          <input type="hidden" value="<%=h.get("pay_detail_no") %>" class="pay_detail_no">
                          <input type="hidden" value="<%=h.get("product_count") %>" class="product_count">
                          <input type="hidden" value="<%=h.get("complete_no")%>" class="completeNo">
                          <td><a href="#open">사유 보기</a></td>
                      <td><button class="btn btn-primary btn-xs">승인하기</button></td>
                       </tr>
                    <% } %>
                    </tbody>
                  </table>
                  
                </div>
              </div>
            </div>
                </div>
              </div>
            
      <!-- 내용 끝 -->
   
            <!-- 푸터 -->

            <footer>
               <div class="copyright-info">
                  <p class="pull-right">우리 두레 이야기 Since 2018-09-03 <a href="http://www.iei.or.kr/main/main.kh?src=overture&kw=003DFA&gclid=CjwKCAjw14rbBRB3EiwAKeoG_5jJaQ97lkxMJt5SZU1HAdDYPL45C7WZwL_HwlVYXRtegAh1mphCWxoCPEwQAvD_BwE" target="_blank">KH Corporation</a>      
                  </p>
               </div>
               <div class="clearfix"></div>
            </footer>
            <!-- 푸터 끝 -->
         </div>
         
         </div>
        </div>
        
        <div class="white_content" id="open">
         <div>  
            <div class="form-group text-center" align="center" style="margin-left:90%; color:black">
               <a href="#close" style="color:lightgray;">닫기</a>
            </div>
            <p style="margin-top:50px;" id="refundR"></p>
         </div>
      </div>
                      
   <script>
   $(function(){
      $("tr a").click(function(){
         var reason = $(this).parent().parent().children(".completeNo").val();
         $("#refundR").text(reason);
      });
   });
   
   $(function(){
      $("tr button").click(function(){
         var imp = $(this).parent().parent().children('.accept_no').text();
         var pro_type = $(this).parent().parent().children('.pro_type').text();
         var pay_no = $(this).parent().parent().children('.pay_no').val();
         var pay_detail_no = $(this).parent().parent().children('.pay_detail_no').val();
         var member_nick = $(this).parent().parent().children('.member_nick').text();
         var pay_price = $(this).parent().parent().children('.pay_price').text();
         if(pro_type == "상시 먹거리 상품"){
            $.ajax({
               url : "<%=request.getContextPath()%>/paymentCencel",
               data : {imp:imp, pro_type:pro_type, pay_no:pay_no, pay_detail_no:pay_detail_no, member_nick:member_nick, pay_price:pay_price},
               success : function(data){
                  var result = data;
                  if(result > 0){
                     alert('상시 먹거리 상품 환불 승인이 완료되었습니다.');
                     location.replace("<%=request.getContextPath()%>/refundApprove");
                  }else{
                     console.log('환불 승인 실패!');
                  }
               },
               error : function(){
                  console.log('상시상품 환불 실패!');
               }
            });
         }else{
            $.ajax({
               url : "<%=request.getContextPath()%>/paymentCencel",
               data : {imp:imp, pro_type:pro_type, pay_no:pay_no, pay_detail_no:pay_detail_no, member_nick:member_nick},
               success : function(data){
                  var result = data;
                  console.log('data : ' + data);
                  if(result > 0){
                     alert('펀딩 상품 환불 승인이 완료되었습니다.');
                     location.replace("<%=request.getContextPath()%>/refundApprove");
                  }else{
                     console.log('환불 승인 실패!');
                  }
               },
               error : function(){
                  console.log('상시상품 환불 실패!');
               }
            });
         }
         <%-- location.href="<%=request.getContextPath()%>/paymentCencel?imp=" + imp + "&pro_type=" + pro_type + "&pay_no=" + pay_no + "&pay_detail_no=" + pay_detail_no + "&member_nick=" + member_nick + "&pay_price=" + pay_price; --%>
      });
   });
   </script>
         
         
      <% }else{
         request.getRequestDispatcher("../common/page_404.jsp").forward(request, response);
      } %>

   <script src="<%=request.getContextPath() %>/js/seller/bootstrap.min.js"></script>
   <!-- bootstrap progress js -->
   <script src="<%=request.getContextPath() %>/js/seller/progressbar/bootstrap-progressbar.min.js"></script>
   <script src="<%=request.getContextPath() %>/js/seller/nicescroll/jquery.nicescroll.min.js"></script>
   <script src="<%=request.getContextPath() %>/js/seller/custom.js"></script>
   <!-- /footer content -->
</body>

</html>