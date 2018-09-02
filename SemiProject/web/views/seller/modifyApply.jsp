<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='com.kh.Semi.member.model.vo.*, java.util.*'%>
<%HashMap<String, Object> hmap = (HashMap<String, Object>)request.getAttribute("hmap"); %>
<% Member loginUser = (Member)session.getAttribute("loginUser"); %>
<%
 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("MM/dd/yyyy");
 String today = formatter.format(new java.util.Date());
%>
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
	<!-- editor -->
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/css/seller/editor/external/google-code-prettify/prettify.css" rel="stylesheet">
	<link href="<%=request.getContextPath() %>/css/seller/editor/index.css" rel="stylesheet">
	<!-- select2 -->
  	<link href="<%=request.getContextPath() %>/css/seller/select/select2.min.css" rel="stylesheet">
	<!-- Custom styling plus plugins -->
	<link href="<%=request.getContextPath() %>/css/seller/custom.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/seller/maps/jquery-jvectormap-2.0.3.css" />
	<link href="<%=request.getContextPath() %>/css/seller/icheck/flat/green.css" rel="stylesheet" />
	<link href="<%=request.getContextPath() %>/css/seller/floatexamples.css" rel="stylesheet" type="text/css" />

	<script src="<%=request.getContextPath() %>/js/seller/jquery.min.js"></script>
	<script src="<%=request.getContextPath() %>/js/seller/nprogress.js"></script>
	<script type="text/javascript">
        /* summernote에서 이미지 업로드시 실행할 함수 */
        function sendFile(file, editor) {
            // 파일 전송을 위한 폼생성
          data = new FormData();
           data.append("uploadFile", file);
           
           console.log(data);
           $.ajax({ // ajax를 통해 파일 업로드 처리
               data : data,
               type : "POST",
               url : "<%= request.getContextPath() %>/imgUpload",
               cache : false,
               contentType : false,
               processData : false,
               success : function(data) { // 처리가 성공할 경우
                    // 에디터에 이미지 출력
                  $(editor).summernote('editor.insertImage', data.url);
               },
               error:function(request,status,error){
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                
               
               }

           });   
       }
       
       
       function deleteFile(src) {
			
    	    $.ajax({
    	        data: {src : src},
    	        type: "POST",
    	        url: "<%= request.getContextPath() %>/imgDelete", // replace with your url
    	        cache: false,
    	        success: function(data) {
    	            console.log(data);
    	            alert('삭제완료');
    	        }
    	    });
    	    
    	}
   </script>
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
                  <h2>상품 수정</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                  <!-- start form for validation -->
                  <form id="demo-form" data-parsley-validate action="<%=request.getContextPath()%>/productUpdate" method="post" enctype="multipart/form-data">
                  	<input type="hidden" name="memberNo" value="<%=loginUser.getMember_No() %>">
                    <label for="fullname">상품 명 * :</label>
                    <input type="text" id="proName" class="form-control" name="proName" value="<%=hmap.get("pro_name")%>" required /><br>

                    <label for="price">가격 * :</label>
                    <input type="text" id="price" class="form-control" name="price" data-parsley-trigger="change" value="<%=hmap.get("pro_price")%>" required /><br>
					
					<label for="count">수량 * :</label>
                    <input type="text" id="count" class="form-control" name="count" data-parsley-trigger="change" value="<%=hmap.get("pro_count")%>" required /><br>
                    <label>상품 구분</label><br><br>
                    <p>
                    <%if(hmap.get("category").equals("식량작물")){ %>
						  <label for="c1">식량작물</label>
	                      <input type="radio" class="flat" name="category" id="c1" value="식량작물" checked/>
	                      &nbsp;&nbsp;&nbsp;&nbsp;
						  <label for="c2">특용작물</label>
	                      <input type="radio" class="flat" name="category" id="c2" value="특용작물" />
	                      &nbsp;&nbsp;&nbsp;&nbsp;
	                      <label for="c3">과수</label>
	                      <input type="radio" class="flat" name="category" id="c3" value="과수" />
	                      &nbsp;&nbsp;&nbsp;&nbsp;
	                      <label for="c4">채소</label>
	                      <input type="radio" class="flat" name="category" id="c4" value="채소" />
					<% }else if(hmap.get("category").equals("특용작물")){ %>
						  <label for="c1">식량작물</label>
	                      <input type="radio" class="flat" name="category" id="c1" value="식량작물"/>
	                      &nbsp;&nbsp;&nbsp;&nbsp;
						  <label for="c2">특용작물</label>
	                      <input type="radio" class="flat" name="category" id="c2" value="특용작물" checked/>
	                      &nbsp;&nbsp;&nbsp;&nbsp;
	                      <label for="c3">과수</label>
	                      <input type="radio" class="flat" name="category" id="c3" value="과수" />
	                      &nbsp;&nbsp;&nbsp;&nbsp;
	                      <label for="c4">채소</label>
	                      <input type="radio" class="flat" name="category" id="c4" value="채소" />
					<% }else if(hmap.get("category").equals("과수")) {%>
						  <label for="c1">식량작물</label>
	                      <input type="radio" class="flat" name="category" id="c1" value="식량작물"/>
	                      &nbsp;&nbsp;&nbsp;&nbsp;
						  <label for="c2">특용작물</label>
	                      <input type="radio" class="flat" name="category" id="c2" value="특용작물"/>
	                      &nbsp;&nbsp;&nbsp;&nbsp;
	                      <label for="c3">과수</label>
	                      <input type="radio" class="flat" name="category" id="c3" value="과수" checked/>
	                      &nbsp;&nbsp;&nbsp;&nbsp;
	                      <label for="c4">채소</label>
	                      <input type="radio" class="flat" name="category" id="c4" value="채소" />
					<% }else if(hmap.get("category").equals("채소")) {%>
						  <label for="c1">식량작물</label>
	                      <input type="radio" class="flat" name="category" id="c1" value="식량작물"/>
	                      &nbsp;&nbsp;&nbsp;&nbsp;
						  <label for="c2">특용작물</label>
	                      <input type="radio" class="flat" name="category" id="c2" value="특용작물"/>
	                      &nbsp;&nbsp;&nbsp;&nbsp;
	                      <label for="c3">과수</label>
	                      <input type="radio" class="flat" name="category" id="c3" value="과수"/>
	                      &nbsp;&nbsp;&nbsp;&nbsp;
	                      <label for="c4">채소</label>
	                      <input type="radio" class="flat" name="category" id="c4" value="채소" checked/>
					<% } %>
                    </p><br>
                    <p>
                    <% if(hmap.get("product_type") != null){  %>
	                    	<label for="P1">상시 판매 상품</label>
	                        <input type="radio" class="flat" name="productType" id="P1" value="P1" checked disabled/>
	                        <input type="hidden" name="productType" value="P1">
	                        &nbsp;&nbsp;&nbsp;&nbsp;
	  					  	<label for="P2">달성형 펀딩 상품</label>
	                        <input type="radio" class="flat" name="productType" id="P2" value="P2" disabled/>
	                        &nbsp;&nbsp;&nbsp;&nbsp;
	                        <label for="P3">미달성형 펀딩 상품</label>
	                        <input type="radio" class="flat" name="productType" id="P3" value="P3" disabled/>
                     <% }else if(hmap.get("funding_type").equals("P2")) {%>
                     	    <label for="P1">상시 판매 상품</label>
	                        <input type="radio" class="flat" name="productType" id="P1" value="P1"/>
	                        &nbsp;&nbsp;&nbsp;&nbsp;
	  					  	<label for="P2">달성형 펀딩 상품</label>
	                        <input type="radio" class="flat" name="productType" id="P2" value="P2" checked/>
	                        &nbsp;&nbsp;&nbsp;&nbsp;
	                        <label for="P3">미달성형 펀딩 상품</label>
	                        <input type="radio" class="flat" name="productType" id="P3" value="P3" />
                     <% }else{ %>
                     		<label for="P1">상시 판매 상품</label>
	                        <input type="radio" class="flat" name="productType" id="P1" value="P1"/>
	                        &nbsp;&nbsp;&nbsp;&nbsp;
	  					  	<label for="P2">달성형 펀딩 상품</label>
	                        <input type="radio" class="flat" name="productType" id="P2" value="P2" />
	                        &nbsp;&nbsp;&nbsp;&nbsp;
	                        <label for="P3">미달성형 펀딩 상품</label>
	                        <input type="radio" class="flat" name="productType" id="P3" value="P3" checked/>
                     <% } %>
                    	  
                    </p>
                    <label>모금 마감일자 설정</label>
                    <div class="well">
                    	 <fieldset>
	                        <div class="control-group">
	                          <div class="controls">
	                            <div class="col-md-11 xdisplay_inputx form-group has-feedback">
	                              <input type="text" class="form-control has-feedback-left" name="deadline" id="single_cal1" placeholder="First Name" aria-describedby="inputSuccess2Status" value="<%=today%>">
	                              <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
	                              <span id="inputSuccess2Status" class="sr-only">(success)</span>
	                            </div>
	                          </div>
	                        </div>
	                      </fieldset>
	                    </div>
	                    <label>상품 소개 작성</label>
                    <textarea id="summernote" name="proContent" required>
							<%=hmap.get("board_content") %>
					</textarea>
	                <label>썸네일 : &nbsp; </label><input type="file" id='thumbnail' name="filename" size=40 required>
	                <br>
	                <input type="hidden" name="product_no" value="<%=hmap.get("product_no") %>">
                    <input type="hidden" id="pro_detail_no" name="pro_detail_no" value="<%=hmap.get("pro_detail_no") %>">
                    <input type="hidden"  id="memberNo" name="memberNo" value="<%=loginUser.getMember_No() %>">
	                <input type="button" id="modifyApp" class="btn btn-primary" value="수정 신청">
                  </form>
                  <br>
                  <!-- end form for validations -->

                </div>
              </div>
         <script>
             $(document).ready(function() {
         	  	 var fileExtension = ['.jpg', '.png', '.jpeg', '.gif',];
                $('#summernote').summernote({ // summernote를 사용하기 위한 선언
                    height: 300,
                    lang: 'ko-KR',
                    toolbar: [
                        // [groupName, [list of button]]
                        ['style', ['bold', 'italic', 'underline', 'clear']],
                        ['font', ['strikethrough', 'superscript', 'subscript']],
                        ['fontsize', ['fontname', 'fontsize']],
                        ['color', ['color']],
                        ['para', ['ul', 'ol', 'paragraph']],
                        ['height', ['height']],
                        ['insert', ['picture', 'link', 'video', 'table', 'hr']]
                      ],
	                callbacks: { // 콜백을 사용
                        // 이미지를 업로드할 경우 이벤트를 발생
                   onImageUpload: function(files, editor, welEditable) {
                       console.log(files);
                         
                         for (var i = files.length - 1; i >= 0; i--) {
                        	 
                         	for(var j = 0; j < fileExtension.length; j++){
                         		var extleng = files[i].name.length;
                         		var extdot = files[i].name.lastIndexOf('.');
                         		var ext = files[i].name.substring(extdot, extleng).toLowerCase();

                        		 console.log(ext + ' / ' + fileExtension[j]) 
                        	 if(ext == fileExtension[j]){
                     		  sendFile(files[i], this); 
                         	}
                            }
                         }
                  },
                  onMediaDelete : function(target) {
                      alert(target[0].src);
                      deleteFile(target[0].src);
                      console.log(target[0].src)
               }
            }});
         }); 
      	</script>
         	<script>
         		$(function(){
         			$("#modifyApp").click(function(){
         				var memberNo = $("#memberNo").val();
         				var pro_detail_no = $("#pro_detail_no").val();
         				$.ajax({
         					url : "<%=request.getContextPath()%>/qtyCheck",
         					data : {memberNo:memberNo, pro_detail_no:pro_detail_no},
         					success : function(data){
         						var qty = data.result;
         						if(qty > 0){
         							alert('구매자가 있는 상품은 수정하실 수 없습니다.');
         							location.href='<%=request.getContextPath()%>/views/seller/sellerMain.jsp';
         						}else{
         							$("form").submit();
         						}
         					},
         					error : function(){
         						console.log('qty 조회 실패');
         					}
         				});
         			});
         		});
         	</script>
         	 <!-- datepicker -->
	  <script type="text/javascript">
	    $(document).ready(function() {
	
	      var cb = function(start, end, label) {
	        console.log(start.toISOString(), end.toISOString(), label);
	        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
	        //alert("Callback has fired: [" + start.format('MMMM D, YYYY') + " to " + end.format('MMMM D, YYYY') + ", label = " + label + "]");
	      }
	
	      var optionSet1 = {
	        startDate: moment().subtract(29, 'days'),
	        endDate: moment(),
	        minDate: '01/01/2012',
	        maxDate: '12/31/2015',
	        dateLimit: {
	          days: 60
	        },
	        showDropdowns: true,
	        showWeekNumbers: true,
	        timePicker: false,
	        timePickerIncrement: 1,
	        timePicker12Hour: true,
	        ranges: {
	          'Today': [moment(), moment()],
	          'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	          'Last 7 Days': [moment().subtract(6, 'days'), moment()],
	          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
	          'This Month': [moment().startOf('month'), moment().endOf('month')],
	          'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	        },
	        opens: 'left',
	        buttonClasses: ['btn btn-default'],
	        applyClass: 'btn-small btn-primary',
	        cancelClass: 'btn-small',
	        format: 'MM/DD/YYYY',
	        separator: ' to ',
	        locale: {
	          applyLabel: 'Submit',
	          cancelLabel: 'Clear',
	          fromLabel: 'From',
	          toLabel: 'To',
	          customRangeLabel: 'Custom',
	          daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
	          monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
	          firstDay: 1
	        }
	      };
	      $('#reportrange span').html(moment().subtract(29, 'days').format('MMMM D, YYYY') + ' - ' + moment().format('MMMM D, YYYY'));
	      $('#reportrange').daterangepicker(optionSet1, cb);
	      $('#reportrange').on('show.daterangepicker', function() {
	        console.log("show event fired");
	      });
	      $('#reportrange').on('hide.daterangepicker', function() {
	        console.log("hide event fired");
	      });
	      $('#reportrange').on('apply.daterangepicker', function(ev, picker) {
	        console.log("apply event fired, start/end dates are " + picker.startDate.format('MMMM D, YYYY') + " to " + picker.endDate.format('MMMM D, YYYY'));
	      });
	      $('#reportrange').on('cancel.daterangepicker', function(ev, picker) {
	        console.log("cancel event fired");
	      });
	      $('#options1').click(function() {
	        $('#reportrange').data('daterangepicker').setOptions(optionSet1, cb);
	      });
	      $('#options2').click(function() {
	        $('#reportrange').data('daterangepicker').setOptions(optionSet2, cb);
	      });
	      $('#destroy').click(function() {
	        $('#reportrange').data('daterangepicker').remove();
	      });
	    });
	  </script>
	  <!-- /datepicker -->
	  <script type="text/javascript">
	    $(document).ready(function() {
	      $('#single_cal1').daterangepicker({
	        singleDatePicker: true,
	        calender_style: "picker_1"
	      }, function(start, end, label) {
	        console.log(start.toISOString(), end.toISOString(), label);
	      });
	      $('#single_cal2').daterangepicker({
	        singleDatePicker: true,
	        calender_style: "picker_2"
	      }, function(start, end, label) {
	        console.log(start.toISOString(), end.toISOString(), label);
	      });
	      $('#single_cal3').daterangepicker({
	        singleDatePicker: true,
	        calender_style: "picker_3"
	      }, function(start, end, label) {
	        console.log(start.toISOString(), end.toISOString(), label);
	      });
	      $('#single_cal4').daterangepicker({
	        singleDatePicker: true,
	        calender_style: "picker_4"
	      }, function(start, end, label) {
	        console.log(start.toISOString(), end.toISOString(), label);
	      });
	    });
	  </script>
	  <script type="text/javascript">
	    $(document).ready(function() {
	      $('#reservation').daterangepicker(null, function(start, end, label) {
	        console.log(start.toISOString(), end.toISOString(), label);
	      });
	    });
	  </script>
	  <!-- /datepicker -->
         	
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
		<% }else{
			request.getRequestDispatcher("../common/page_404.jsp").forward(request, response);
		} %>
		
		


	

	<script src="<%=request.getContextPath() %>/js/seller/bootstrap.min.js"></script>

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
	 <!-- textarea resize -->
	<script src="<%=request.getContextPath() %>/js/seller/textarea/autosize.min.js"></script>
	<script>
	  autosize($('.resizable_textarea'));
	</script>
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
	<!-- dropzone -->
  	<script src="<%=request.getContextPath() %>/js/seller/dropzone/dropzone.js"></script>
	<!-- worldmap -->
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/maps/jquery-jvectormap-2.0.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/maps/gdp-data.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/maps/jquery-jvectormap-world-mill-en.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/seller/maps/jquery-jvectormap-us-aea-en.js"></script>
	<!-- pace -->
	<!-- include summernote css/js -->
	<link href="<%=request.getContextPath() %>/css/summernote.css" rel="stylesheet">
	<script src="<%=request.getContextPath() %>/js/summernote.js"></script>
	<!-- /footer content -->
</body>

</html>
