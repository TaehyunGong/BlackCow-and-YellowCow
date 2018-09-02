<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='com.kh.Semi.member.model.vo.*'%>

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
              <h3>통계</h3>
            </div>

          </div>
          <div class="clearfix"></div>

          <div class="row">

            <!-- bar chart -->
            <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>판매자들의 월간 판매량</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div id="graph_bar" style="width:100%; height:280px;"></div>
                </div>
              </div>
            </div>
            <!-- /bar charts -->
            
            <!-- line graph -->
            <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>연도별 회사 수익</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content2">
                  <div id="graph_line" style="width:100%; height:300px;"></div>
                </div>
              </div>
            </div>
            <!-- /line graph -->
			
			<!-- pie chart -->
            <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>카테고리별 판매 추이</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content2">
                  <div id="graph_donut" style="width:100%; height:300px;"></div>
                </div>
              </div>
            </div>
            <!-- /Pie chart -->
			
			<!-- bar charts group -->
            <!-- <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel">
                <div class="x_title">
                  <h2>사이트 내 최고 판매자와의 비교</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content1">
                  <div id="graph_bar_group" style="width:100%; height:280px;"></div>
                </div>
              </div>
            </div>
            <div class="clearfix"></div> -->
            <!-- /bar charts group -->

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
		</div>
			
		<% }else{
			request.getRequestDispatcher("../common/page_404.jsp").forward(request, response);
		} %>
		<script>
	$(function () {
		
		
	    /* data stolen from http://howmanyleft.co.uk/vehicle/jaguar_'e'_type */
	    <%-- $.ajax({
	    	url : "<%=request.getContextPath()%>/compareMonth",
	    	success : function(data){
	    		console.log(data[0].jan);
			    var day_data = [
			        {"period": "1월", "회원님의 매출": data[0].jan, "타 판매자의 매출": data[1].jan},
			        {"period": "2월", "회원님의 매출": data[0].feb, "타 판매자의 매출": data[1].feb},
			        {"period": "3월", "회원님의 매출": data[0].mar, "타 판매자의 매출": data[1].mar},
			        {"period": "4월", "회원님의 매출": data[0].apr, "타 판매자의 매출": data[1].apr},
			        {"period": "5월", "회원님의 매출": data[0].may, "타 판매자의 매출": data[1].may},
			        {"period": "6월", "회원님의 매출": data[0].jun, "타 판매자의 매출": data[1].jun},
			        {"period": "7월", "회원님의 매출": data[0].jul, "타 판매자의 매출": data[1].jul},
			        {"period": "8월", "회원님의 매출": data[0].aug, "타 판매자의 매출": data[1].aug},
			        {"period": "9월", "회원님의 매출": data[0].sep, "타 판매자의 매출": data[1].sep},
			        {"period": "10월", "회원님의 매출": data[0].oct, "타 판매자의 매출": data[1].oct},
			        {"period": "11월", "회원님의 매출": data[0].nov, "타 판매자의 매출": data[1].nov},
			        {"period": "12월", "회원님의 매출": data[0].dec, "타 판매자의 매출": data[1].dec}
			    ];
			    Morris.Bar({
			        element: 'graph_bar_group',
			        data: day_data,
			        xkey: 'period',
			        barColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
			        ykeys: ['회원님의 매출', '타 판매자의 매출'],
			        labels: ['회원님의 매출', '타 판매자의 매출'],
			        hideHover: 'auto',
			        xLabelAngle: 60
			    });
	    	}
	    }); --%>
	    

	    $.ajax({
	    	url : "<%=request.getContextPath()%>/adminMonthTotal",
	    	success : function(data){
	    		var jan = data.jan;
	    		var feb = data.feb;
	    		var mar = data.mar;
	    		var apr = data.apr;
	    		var may = data.may;
	    		var jun = data.jun;
	    		var jul = data.jul;
	    		var aug = data.aug;
	    		var sep = data.sept;
	    		var oct = data.oct;
	    		var nov = data.nov;
	    		var dec = data.dec;
			    Morris.Bar({
			        element: 'graph_bar',
			        data: [
			            {device: '1월', value: jan},
			            {device: '2월', value: feb},
			            {device: '3월', value: mar},
			            {device: '4월', value: apr},
			            {device: '5월', value: may},
			            {device: '6월', value: jun},
			            {device: '7월', value: jul},
			            {device: '8월', value: aug},
			            {device: '9월', value: sep},
			            {device: '10월', value: oct},
			            {device: '11월', value: nov},
			            {device: '12월', value: dec},
			        ],
			        xkey: 'device',
			        ykeys: ['value'],
			        labels: ['매출'],
			        barRatio: 0.4,
			        barColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
			        xLabelAngle: 35,
			        hideHover: 'auto'
			    });
	    	}
	    });
	    

	    
	    $.ajax({
			url : "<%=request.getContextPath()%>/adcategoryChart",
			success : function(data){
				var hmap = data;
				var fruit = data.fruit;
				var food = data.food;
				var spe = data.spe;
				var vege = data.vege;
			    Morris.Donut({
			        element: 'graph_donut',
			        data: [
			            {label: '과수', value: fruit},
			            {label: '채소', value: vege},
			            {label: '식량작물', value: food},
			            {label: '특용작물', value: spe}
			        ],
			        colors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
			        formatter: function (y) {
			            return y + "%"
			        }
			    });
			}
		});

		$.ajax({
			url : "<%=request.getContextPath()%>/adminYearTotal",
			success : function(data){
				var foyear = data.foyear*0.15;
				var thyear = data.thyear*0.15;
				var twyear = data.twyear*0.15;
				var onyear = data.onyear*0.15;
				var toyear = data.toyear*0.15;
			    new Morris.Line({
			        element: 'graph_line',
			        xkey: 'year',
			        ykeys: ['value'],
			        labels: ['Value'],
			        hideHover: 'auto',
			        lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
			        data: [
			            {year: '2014', value: foyear},
			            {year: '2015', value: thyear},
			            {year: '2016', value: twyear},
			            {year: '2017', value: onyear},
			            {year: '2018', value: toyear}
			        ]
			    });
			}
		});

	});

	</script>


	<script src="<%=request.getContextPath() %>/js/seller/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/seller/progressbar/bootstrap-progressbar.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/seller/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/seller/icheck/icheck.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/seller/custom.js"></script>
	<!-- pace -->
	<script src="<%=request.getContextPath() %>/js/seller/pace/pace.min.js"></script>
	
	<!-- moris js -->
	<script src="<%=request.getContextPath() %>/js/seller/moris/raphael-min.js"></script>
	<script src="<%=request.getContextPath() %>/js/seller/moris/morris.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/seller/moris/example.js"></script>
</body>

</html>
