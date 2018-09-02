<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='com.kh.Semi.member.model.vo.*, java.util.*'%>
<% ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)request.getAttribute("list"); %>
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
                  <h2>상시 먹거리 상품 조회</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <p class="text-muted font-13 m-b-30">
                  </p>
                  <table id="datatable" class="table table-striped table-bordered">
                    <thead>
                      <tr>
                        <th style="width: 20%">상품 이름</th>
                        <th>총 수량</th>
                        <th>구매자</th>
                        <th>가격</th>
                        <th style="width: 20%">보기/수정/삭제</th>
                      </tr>
                    </thead>
                    <tbody>
                      <% for(HashMap h : list){ %>
                    	<tr>
                    		<td><%=h.get("pro_name") %> <br><small>신청일 <%=h.get("pro_date") %></small></td>
                    		<td><%=h.get("pro_count") %></td>
                    		<td><%=h.get("pro_qty") %>명</td>
                    		<td><%=h.get("pro_price") %></td>
                    		<input type="hidden" value="<%=h.get("pro_detail_no") %>">
                    		<td>
	                          <a href="#" class="btn btn-info btn-xs" id="modify"><i class="fa fa-pencil"></i> 상품 수정신청 </a>
	                          <a href="#" class="btn btn-danger btn-xs" id="deleteApp"><i class="fa fa-trash-o"></i> 상품 삭제신청 </a>
	                        </td>
                    	</tr>
                    <% } %>
                      
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
			<script>
			$(function(){
				$("td a:nth-child(1)").click(function(){
					var modify = $(this).parent().parent().children("input").val();
					$(this).attr("href", "<%=request.getContextPath()%>/modify?modify=" + modify);
				});
				$("td a:nth-child(2)").click(function(){
					var check = confirm('삭제신청하시겠습니까?');
					var memberNo = <%=loginUser.getMember_No()%>;
					var deleteApp = $(this).parent().parent().children("input").val();
					console.log(check);
					console.log(deleteApp);
					if(check == true){
					$.ajax({
     					url : "<%=request.getContextPath()%>/qtyCheck",
     					data : {memberNo:memberNo, pro_detail_no:deleteApp},
     					success : function(data){
     						var qty = data.result;
     						if(qty > 0){
     							alert('구매자가 있는 상품은 삭제하실 수 없습니다.');
     							location.href='<%=request.getContextPath()%>/views/seller/sellerMain.jsp';
     						}else{
     							$(this).attr("href", location.href='<%=request.getContextPath()%>/deleteApp?deleteApp=' + deleteApp);
     						}
     					},
     					error : function(){
     						console.log('qty 조회 실패');
     					}
     				});
					}else{
						location.reload();
					}
				});
			});
			</script>



                    
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
