<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='com.kh.Semi.member.model.vo.*'%>
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
				
              <div class="x_panel">
                <div class="x_title">
                  <h2>판매자 자격 내려놓기</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <!-- start form for validation -->
                  <form id="demo-form" data-parsley-validate action="<%=request.getContextPath() %>/sellerRetire" method="post">
                    <label for="password">비밀번호 입력 </label>
                    <input type="password" id="password" class="form-control" name="password" required /><br>

                    <label for="password2">비밀번호 재입력 </label>
                    <input type="password" id="password2" class="form-control" name="password2" data-parsley-trigger="change" required /><br>

                        <label for="message">자격을 내려놓는 이유를 알려주세요  </label>
                        <textarea id="message" required="required" class="form-control" name="message" data-parsley-trigger="keyup" data-parsley-minlength="20" data-parsley-maxlength="100" data-parsley-minlength-message="Come on! You need to enter at least a 20 caracters long comment.."
                          data-parsley-validation-threshold="10"></textarea>

                        <br/>
                        <input type="button" id="retireBtn" class="btn btn-primary" value="탈퇴하기">
                  </form>
                  <!-- end form for validations -->
			<script>
				$(function(){
					$("#retireBtn").click(function(){
				        var userPwd = $("#password").val();
				        var userPwd2 = $("#password2").val();
			         	if(userPwd != userPwd2){
				        	alert('비밀번호 재입력이 일치하지 않습니다.')
				        	location.replace('<%=request.getContextPath()%>/views/seller/sellerRetire.jsp');
				        }else{
				        	$.ajax({
				        		url : "<%=request.getContextPath()%>/passCheck.mem",
				        		data : {userPwd:userPwd},
				        		type : "post",
				        		success : function(data){
				        			var result = decodeURIComponent(data.passCheck);
				        			if(result == "true"){
				        				$.ajax({
				        					url : "<%=request.getContextPath()%>/recordCheck",
				        					type : "get",
				        					success:function(data){
				        						var recordCheck = decodeURIComponent(data.recordCheck);
				        							console.log(recordCheck);
				        						if(recordCheck == "true"){
				        							$.ajax({
							        					url : "<%=request.getContextPath()%>/sellerRetire.mem",
							        					data : {userPwd:userPwd},
							        					type : "post",
							        					success:function(data){
							        						var checkData = data.retireCheck;
							        						if(checkData > 0){
							        							alert('고객님 요청에 따라 판매자 자격이 정지되었습니다.');
							        							location.href='<%=request.getContextPath()%>/reSession.mem';
							        						}
							        					},
							        					error:function(){
							        						alert('판매자 자격이 정지되지 않음');
							        					}
							        				});
				        						}else{
				        							alert('등록하신 상품이 종료되고 30일이 경과해야 신청하실 수 있습니다.')
				        							location.replace('<%=request.getContextPath()%>/views/seller/sellerMain.jsp');
				        						}
				        					},
				        					error:function(){
				        						alert('날짜조회실패');
				        					}
				        				});
				        			}else{
				        				alert('패스워드가 틀렸습니다.');
				        			}
				        		},
				        		error : function(){
				        			alert('패스체크 안됨');
				        		}
				        	});
				        }
				});
				});
			</script>
			
			

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
		
	</div>
	</div>
	</div>
	

	<script src="<%=request.getContextPath() %>/js/seller/bootstrap.min.js"></script>
	<!-- bootstrap progress js -->
	<script src="<%=request.getContextPath() %>/js/seller/progressbar/bootstrap-progressbar.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/seller/nicescroll/jquery.nicescroll.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/seller/custom.js"></script>
	
	<!-- /footer content -->
</body>

</html>
