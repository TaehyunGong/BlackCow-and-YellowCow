<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='com.kh.Semi.member.model.vo.*, java.util.*'%>
<%ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)request.getAttribute("list");%>
<% Member loginUser = (Member)session.getAttribute("loginUser");%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Meta, title, CSS, favicons, etc. -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>우리 두레 이야기 - 관리자</title>

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
   margin-top:4%;
   margin-left:auto;
   margin-right:auto;
   width: 1200px;
   height: 800px;
   padding: 16px;
   border: 5px solid black;
   background-color: white;
   overflow: auto;   
   z-index:100;
   font-size:20px;
   color:black;
   border-radius:20px;
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
	<% if(loginUser != null && loginUser.getMember_Type().equals("M4")){ %>
	<div class="container body"  style="background:#000000;">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">

					<div class="navbar nav_title"  style="background:#000000;">
						<a href="<%=request.getContextPath() %>/views/admin/adminMain.jsp" class="site_title" style="background:#000000;"><i class="fa fa-user"></i> <span>관리자 페이지</span></a>
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

						<div class="menu_section">
							<h3><%=loginUser.getMember_Nick() %></h3>
							<ul class="nav side-menu">
								<li><a style="background:#000000;"><i class="fa fa-users"></i> 회원 관리 <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
										<li><a href="<%=request.getContextPath() %>/selectAllMember.mem">회원 조회</a>
										</li>
										<li><a href="<%=request.getContextPath() %>/farmApprove">농가 신청 관리</a>
										</li>
									</ul>
								</li>
								<li><a style="background:#000000;"><i class="fa fa-shopping-bag"></i> 상품관리 <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
										<li><a href="<%=request.getContextPath() %>/fundingApprove">펀딩 신청 관리</a>
										</li>
										<li><a href="<%=request.getContextPath() %>/productApprove">상시판매 신청 관리</a>
										</li>
										<%-- <li><a href="<%=request.getContextPath() %>/deleteApprove">상품 삭제신청 관리</a>
										</li> --%>
									</ul>
								</li>
								<!-- <li><a><i class="fa fa-book"></i> 게시판 관리 <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
										<li><a href="empty.html">1:1문의</a>
										</li>
										<li><a href="empty.html">상품 배치 변경</a>
										</li>
									</ul>
								</li> -->
									<li><a style="background:#000000;"><i class="fa fa-bar-chart"></i> 통계 <span class="fa fa-chevron-down"></span></a>
									<ul class="nav child_menu" style="display: none">
										<li><a href="<%=request.getContextPath() %>/views/admin/buyer.jsp">통계</a>
										</li>
										<%-- <li><a href="<%=request.getContextPath() %>/views/admin/visitor.jsp">사이트 방문자 통계</a>
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
                <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false" id="facing">
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
              <h3>관리자 기능</h3>
            </div>
            
          </div>
          <div class="clearfix"></div>
          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>상시판매 신청 관리<small>(상품 소개는 상품명을 클릭하세요)</small></h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <table id="datatable" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                        <th>농가명</th>
                        <th>상품명</th>
                        <th>가격</th>
                        <th>신청일</th>
                        <th>상품 분류</th>
                        <th>승인/거절</th>
                      </tr>
                    </thead>
                    <% for(HashMap<String, Object> h : list) { %>
                   	<tr>
                   		<input type="hidden" value="<%=h.get("product_no") %>" class="product_no">
                   		<input type="hidden" value="<%=h.get("pro_detail_no") %>" class="pro_detail_no">
                   		<input type="hidden" value="<%=h.get("member_id") %>" class="member_id">
                   		<td><%=h.get("farm_name") %></td>
                   		<td><a href="#open"><%=h.get("pro_name") %></a></td>
                   		<td><%=h.get("pro_price") %></td>
                   		<td><%=h.get("pro_date") %></td>
                   		<td><%=h.get("category") %></td>
                   		<input type="hidden" class="intro" value='<%=h.get("board_content") %>'>
                   		<td><button class="btn btn-primary btn-xs farmApp">승인하기</button><button class="btn btn-danger btn-xs farmRej">거절하기</button></td>
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
            <div id="storyDiv" class="form-group text-center" align="center" style="margin-left:90%; color:black">
               <a href="#close" style="color:black; font-weight:bold; font-size:20pt;">창 닫기</a>
            </div>
            <p style="margin-top:50px;" id="intro"></p>
         </div>
       </div>
			
		<script>
		   $(function(){
		      $("td a").click(function(){
		         var intro = $(this).parent().parent().children(".intro").val();
		         $("#intro").html(intro);
		      });
		   });
		   
		   $(function(){
			   $(".farmApp").click(function(){
				   var product_no = $(this).parent().parent().children(".product_no").val();
				   var pro_detail_no = $(this).parent().parent().children(".pro_detail_no").val();
				   $.ajax({
					   url : "<%=request.getContextPath()%>/productApp",
					   data : {product_no:product_no, pro_detail_no:pro_detail_no},
					   success : function(data){
						   var result = data;
						   if(result > 0){
							   alert('해당 상품이 승인되었습니다.');
							   location.replace("<%=request.getContextPath()%>/productApprove");
						   }else{
							   console.log('상품승인 실패');
							   location.reload();
						   }
					   }
				   });
			   });
		   });
		   
		   $(function(){
			   $(".farmRej").click(function(){
				   var product_no = $(this).parent().parent().children(".product_no").val();
				   var pro_detail_no = $(this).parent().parent().children(".pro_detail_no").val();
				   $.ajax({
					   url : "<%=request.getContextPath()%>/productRej",
					   data : {product_no:product_no, pro_detail_no:pro_detail_no},
					   success : function(data){
						   var result = data;
						   if(result > 0){
							   alert('해당 상품의 승인이 거절되었습니다.');
							   location.replace("<%=request.getContextPath()%>/productApprove");
						   }else{
							   console.log('거절 실패');
							   location.reload();
						   }
					   }
				   });
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
