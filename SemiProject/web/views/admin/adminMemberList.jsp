<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.Semi.member.model.vo.*, java.util.*"%>
<% ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list"); %>
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
	<link href="<%=request.getContextPath() %>/js/seller/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath() %>/js/seller/datatables/buttons.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath() %>/js/seller/datatables/fixedHeader.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath() %>/js/seller/datatables/responsive.bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath() %>/js/seller/datatables/scroller.bootstrap.min.css" rel="stylesheet" type="text/css" />

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
                  <h2>회원 조회</h2>
                  
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <table id="datatable" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                        <th>아이디</th>
                        <th>이름</th>
                        <th>닉네임</th>
                        <th>회원 등급</th>
                        <th>주소</th>
                        <th>연락처</th>
                      </tr>
                    </thead>


                    <tbody>
                    <% for(Member m : list){ 
                    	if(!m.getMember_Type().equals("M4")){
                    %>
                    	<tr>
                    		<td><%=m.getMember_Id() %></td>
                    		<td><%=m.getMember_Name() %></td>
                    		<td><%=m.getMember_Nick() %></td>
                    		<%
                    			String type = m.getMember_Type();
                    			String typeVal = "";
                    			switch(type){
                    			case "M1" : typeVal = "간단회원"; break;
                    			case "M2" : typeVal = "일반회원"; break;
                    			case "M3" : typeVal = "판매자"; break;
                    			}
                    		%>
                    		<td><%=typeVal %></td>
                    		<td><%=m.getAddress() %></td>
                    		<td><%=m.getTel() %></td>
                    	</tr>
                    	<% } %>
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
			
		<% }else{
			request.getRequestDispatcher("../common/page_404.jsp").forward(request, response);
		} %>
		


	<script src="<%=request.getContextPath() %>/js/seller/bootstrap.min.js"></script>
 	<!-- Datatables-->
    <script src="<%=request.getContextPath() %>/js/seller/datatables/jquery.dataTables.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/seller/datatables/dataTables.bootstrap.js"></script>
    <script src="<%=request.getContextPath() %>/js/seller/datatables/dataTables.buttons.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/seller/datatables/buttons.bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/seller/datatables/jszip.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/seller/datatables/pdfmake.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/seller/datatables/vfs_fonts.js"></script>
    <script src="<%=request.getContextPath() %>/js/seller/datatables/buttons.html5.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/seller/datatables/buttons.print.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/seller/datatables/dataTables.fixedHeader.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/seller/datatables/dataTables.keyTable.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/seller/datatables/dataTables.responsive.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/seller/datatables/responsive.bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/seller/datatables/dataTables.scroller.min.js"></script>


    <!-- pace -->
    <script src="js/pace/pace.min.js"></script>
    <script>
      var handleDataTableButtons = function() {
          "use strict";
          0 !== $("#datatable-buttons").length && $("#datatable-buttons").DataTable({
            dom: "Bfrtip",
            buttons: [{
              extend: "copy",
              className: "btn-sm"
            }, {
              extend: "csv",
              className: "btn-sm"
            }, {
              extend: "excel",
              className: "btn-sm"
            }, {
              extend: "pdf",
              className: "btn-sm"
            }, {
              extend: "print",
              className: "btn-sm"
            }],
            responsive: !0
          })
        },
        TableManageButtons = function() {
          "use strict";
          return {
            init: function() {
              handleDataTableButtons()
            }
          }
        }();
    </script>
    <script type="text/javascript">
      $(document).ready(function() {
        $('#datatable').dataTable();
        $('#datatable-keytable').DataTable({
          keys: true
        });
        $('#datatable-responsive').DataTable();
        $('#datatable-scroller').DataTable({
          ajax: "<%=request.getContextPath()%>/js/seller/datatables/json/scroller-demo.json",
          deferRender: true,
          scrollY: 380,
          scrollCollapse: true,
          scroller: true
        });
        var table = $('#datatable-fixed-header').DataTable({
          fixedHeader: true
        });
      });
      TableManageButtons.init();
    </script>
	<!-- gauge js -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/gauge/gauge.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/gauge/gauge_demo.js"></script>
	<!-- chart js -->
	<script src="<%=request.getContextPath() %>/js/seller/chartjs/chart.min.js"></script>
	<!-- bootstrap progress js -->
	<script src="<%=request.getContextPath() %>/js/seller/progressbar/bootstrap-progressbar.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/seller/nicescroll/jquery.nicescroll.min.js"></script>
	<!-- icheck -->
	<script src="<%=request.getContextPath() %>/js/seller/icheck/icheck.min.js"></script>
	<!-- daterangepicker -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/moment/moment.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/datepicker/daterangepicker.js"></script>

	<script src="<%=request.getContextPath() %>/js/seller/custom.js"></script>

	<!-- flot js -->
	<!--[if lte IE 8]><script type="text/javascript" src="js/excanvas.min.js"></script><![endif]-->
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/flot/jquery.flot.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/flot/jquery.flot.pie.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/flot/jquery.flot.orderBars.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/flot/jquery.flot.time.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/flot/date.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/flot/jquery.flot.spline.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/flot/jquery.flot.stack.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/flot/curvedLines.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/flot/jquery.flot.resize.js"></script>
	<!-- /footer content -->
</body>

</html>
