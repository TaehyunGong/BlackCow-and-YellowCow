<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import='com.kh.Semi.member.model.vo.*'%>

<!-- 네이버 로그인 api -->
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%
  String clientId = "OA8xSbJB_nNsZA1XOZLt";//애플리케이션 클라이언트 아이디값";
  String redirectURI = URLEncoder.encode("http://localhost:8001/Semi/NaverLogin", "UTF-8");
  SecureRandom random = new SecureRandom();
  String state = new BigInteger(130, random).toString();
  String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
  apiURL += "&client_id=" + clientId;
  apiURL += "&redirect_uri=" + redirectURI;
  apiURL += "&state=" + state;
%>
<% 
	//접근시 가져온 메세지
	String msg = null;
	Member loginUser = null;
	if(session.getAttribute("msg") == null || session.getAttribute("loginUser") == null){
		msg = "처음";
	}else{
		loginUser = (Member)session.getAttribute("loginUser");	//로그인세션
		msg = (String)session.getAttribute("msg");
	}
	
%>

<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%= request.getContextPath() %>/css/common/bootstrap.min.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/common/custom.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/common/pushy-buttons.css" rel="stylesheet">
<link href="<%= request.getContextPath() %>/css/common/remodal.css" rel="stylesheet" >
<link href="<%= request.getContextPath() %>/css/common/remodal-default-theme.css" rel="stylesheet" >
<link href="<%= request.getContextPath() %>/css/common/userJoinFormstyle.css" rel="stylesheet" >
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Yeon+Sung" rel="stylesheet">

<script src="https://npmcdn.com/tether@1.2.4/dist/js/tether.min.js"></script>
<script src="<%= request.getContextPath() %>/js/common/jquery.min.js"></script>
<script src="<%= request.getContextPath() %>/js/common/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/js/common/scrollPosStyler.js"></script>
<script src="<%= request.getContextPath() %>/js/common/remodal.js"></script>

<!-- 농부되기 추가   -->
<script src="<%= request.getContextPath() %>/js/doFarmer/doFarmer.js"></script>

<script>
	
	<% 
		if(request.getAttribute("bool") != null){
			switch((String)request.getAttribute("bool")){
				case "loginComplete" : %>location.href=document.referrer;<% break;
				case "loginFalse" : %>alert('아이디 또는 비밀번호가 맞지 않습니다.'); history.go(-1)<% break;
				case "logout" : %> <% break;
				case "joinComplete" : %> alert('회원가입에 성공하셨습니다.');  <% break;
				case "joinFalse" : %> alert('회원가입에 실패하셨습니다.'); <% break;
				default : %> alert('잘못된 접근');<%
			}
		}
		
	%>
	
</script>

    <script>
        function naverLogin()
        {
            window.open("<%=apiURL%>",
                    "childForm", "width=570, height=350, resizable = no, scrollbars = no");    
        }
        
        function kakaoLogin(user_id, email){
        	window.open("<%=request.getContextPath()%>/KakaoLogin?user_id="+user_id+"&email="+email,
                    "childForm", "width=570, height=350, resizable = no, scrollbars = no");
        }
	</script>

<nav class="navbar navbar-toggleable-md mb-4 top-bar sps">
    <div class="container">
        <a class="navbar-brand" href="<%=request.getContextPath() %>/MainFunding"><span><img src='<%=request.getContextPath()%>/images/common/icon.png' height='30px' width='30px'></img>&nbsp;우리두레이야기</span></a>
        <div class="collapse navbar-collapse" id="navbarCollapse1">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath() %>/fundingListAll">농사펀드</a> 
                	<div class='hover-nav locations' >
                		<div><a href='<%=request.getContextPath() %>/fundingListAll'>농사펀드</a></div>
                	</div>
                </li>
                <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath() %>/foodListAll">두레상회</a> 
                	<div class='hover-nav locations'>
                		<div><a href='<%=request.getContextPath() %>/foodListAll'>두레상회</a></div>
                	</div>
                </li>
                <li class="nav-item"> <a class="nav-link" href="<%=request.getContextPath() %>/selectList.bo">도란도란</a> 
                	<div class='hover-nav'>
                		<div><a href="<%=request.getContextPath() %>/selectList.bo">자유게시판</a></div>
                		<div><a href="<%=request.getContextPath() %>/views/community/farm_info.jsp">정보게시판</a></div>
                	</div>
                </li>
                <li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/selectList.hp">고객센터</a> 
                	<div class='hover-nav qna'>
                	<% if(loginUser != null){ %>
                		<div><a id="QNAbtn" href='<%=request.getContextPath() %>/selectList.hp'>Q&A</a></div>
                	<% }else{ %>	
                		<div><a id="QNAbtn" href=''>Q&A</a></div>
                		<script>
                			$(function(){
                				$("#QNAbtn").click(function(){
                					alert("로그인하셔야 이용이 가능합니다.");
                				});
                			});
                		</script>
                	<% } %>
                		<div><a href='<%=request.getContextPath() %>/views/helpDesk/help_FaQ.jsp'>FAQ</a></div>
                		<% if(loginUser != null && loginUser.getMember_Type().equals("M4")){ %>
                		<div><a href="<%=request.getContextPath() %>/searchAllQna.hp">문의내역</a></div>
                		<% } %>
                	</div>
                </li>
                <% if(loginUser != null && loginUser.getMember_Type().equals("M2")){ %>
	                <li class="nav-item"> <a class="nav-link" href="#game">농부되기</a> 
	                	<div class='hover-nav locations'>
	                		<div><a href='#modal3'>농부신청</a></div>
	                	</div>
	                </li>
                <%} %>
                <% if(loginUser == null){ %>
                	<li class="nav-item sign" id='sign'><a href='#modal2' class="nav-link">로그인</a></li>
                <%}else if(loginUser.getMember_Type().equals("M4")){ %>
                	<li class="nav-item sign" id='sign'><a href='' class="nav-link">관리자</a>
               		<div class='hover-nav' >
                		<div><a class='sign-suc' href='<%=request.getContextPath()%>/views/admin/adminMain.jsp' target='_blank'>관리자 메뉴</a></div>
                		<div><a class='sign-suc' href='<%=request.getContextPath() %>/selectList.fa'>쪽지</a></div>
                		<div><a class='sign-suc' href='<%=request.getContextPath()%>/logout.mem'>로그아웃</a></div>
               		</div>
                	</li>
                <%}else if(loginUser.getMember_Type().equals("M3")){ %>
               		<li class="nav-item sign" id='sign'><a href='' class="nav-link"><%=loginUser.getMember_Nick()%></a>
               		<div class='hover-nav' >
                		<div><a class='sign-suc' href='<%=request.getContextPath()%>/views/seller/sellerMain.jsp' target='_blank'>판매자 메뉴</a></div>
                		<div><a class='sign-suc' href='<%=request.getContextPath() %>/views/myPage/editInformation.jsp'>마이홈</a></div>
                		<div><a class='sign-suc' href='<%=request.getContextPath() %>/selectList.fa'>쪽지</a></div>
                		<div><a class='sign-suc' href='<%=request.getContextPath()%>/logout.mem'>로그아웃</a></div>
               		</div>
                	</li>
                <%}else{ %>
                	<li class="nav-item sign" id='sign'><a href='' class="nav-link"><%=loginUser.getMember_Nick() %></a>
                		<div class='hover-nav' >
	                		<div><a class='sign-suc' href='<%=request.getContextPath() %>/views/myPage/editInformation.jsp'>마이홈</a></div>
	                		<div><a class='sign-suc' href='<%=request.getContextPath() %>/selectList.fa'>쪽지</a></div>
	                		<div><a class='sign-suc' href='<%=request.getContextPath()%>/logout.mem'>로그아웃</a></div>
                		</div>
                	</li>
                <%} %>
            </ul>
        </div>
    </div>
</nav>

<!-- 로그인 모달 -->

<div class="remodal" data-remodal-id="modal2" style='width:300px; padding:0px;'>
  <button data-remodal-action="close" class="remodal-close"></button>
		<br>
		<form action="<%= request.getContextPath() %>/login.mem" method='post'>

	<label class='login_header'>로그인</label>

	 <table class='login-table' style='margin:0 auto;'>
		<tr>
			<td>
 		     	<input name='userId' class="form-control" type="text" placeholder='ID' style='width:75%; margin-left: auto; margin-right: auto;'>
			</td>
		</tr>
		<tr>
			<td>
				<input name='userPwd' class="form-control" type="password" placeholder='PASSWORD' style='width:75%; margin-left: auto; margin-right: auto;'>
			</td>
		</tr>
		<tr>
			<td>
			<br>
			  <button data-remodal-action="cancel" class="btns btn--sm btn--red" style='width: 100px;'>취소</button>
			  &nbsp;
			  <button type='submit' class="btns btn--sm btn--blue" style='width: 100px;'>로그인</button>
			</td>
		</tr>
		<tr>
			<td>
                  <a href='#modal'><div class="btns btn--sm btn--blue" style='width: 73%; background:#47d867'>회원가입</div></a>
			</td>
		</tr>
		<tr>
			<td>
				<hr>
				<label class='login_header'>SNS</label>
			</td>
		</tr>
		<tr class='tr-sns-login'>
			<td>
				<a onclick='naverLogin()' class='sns-login'></a>
				<a id="kakao-login-btn"></a>
				<%-- <a onclick='naverLogin()'><div class='sns-login' style='background-image: url("<%=request.getContextPath()%>/images/common/naver_login_big.PNG");'></div></a> --%>
				<%-- <a href='#'><div class='sns-login' style='background-image: url("<%=request.getContextPath()%>/images/common/kakao_login_btn_large.png");'></div></a> --%>
			</td>
		</tr>
	</table>
	<br><br>
	</form>
	
</div>


				
 <script type='text/javascript'>
 
        Kakao.init('a8004af3cf14f2187ce86e8e3a84b0e4');
        // 카카오 로그인 버튼을 생성합니다.
       Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          persistRefreshToken : true,
          success: function(authObj) {
          var accessToken=Kakao.Auth.getAccessToken();
         var refreshToken=authObj.refresh_token;
           if(accessToken){
              Kakao.API.request({
                url: '/v1/user/me',
                success: function(res){
                      kakaoLogin(res.id, res.kaccount_email);
                   },
                      fail: function(err) {
                   alert(JSON.stringify(err));
                 }
             });
           }
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        });
    </script>

<!-- 회원가입 모달 -->

<div class="remodal" data-remodal-id="modal">
  <button data-remodal-action="close" class="remodal-close"></button>
		<br>
		<form action="<%= request.getContextPath() %>/join.mem" method='post' class="join-form" id='join-form'>
  			<div>
				 <h1>회원 가입</h1>
				
				  <div class="question">
				    <input type="text" id='userId' name='userId' width='300' required/>
				    <label style='font-weight: 800;'>* 아이디</label>
				  </div>
				  <button id='join-check' class='btns btn--sm btn--blue join-btn' type='reset' style='display:none'>아이디 중복 확인</button>
				  <div class="question">
				    <input type="password" name='userPwd' id='pwd1' required/>
				    <label style='font-weight: 800;'>비밀번호</label>
				  </div>
				  <div class="question">
				    <input type="password" name='userPwd2' id='pwd2' required/>
				    <label style='font-weight: 800;'>비밀번호 확인</label>
				  </div>
				  <div class="question">
				    <input type="text" name='userNick' id='join-nick'required/>
				    <label>닉네임</label>
				  </div>
				  <div class="question">
				    <input type="text" name='userName' id='join-name' required/>
				    <label>이름</label>
				  </div>
				  <div class="question">
				    <input type="text" name='email' id='join-email' required/>
				    <label>이메일</label>
				  </div>
			<br><br>
		</div>
		  <button data-remodal-action="cancel" class="remodal-cancel">취소</button>
		  <div id='join-btn' class="remodal-confirm">회원가입</div>
	</form>
	
	<script>
	$(function(){
		
		$('#backURL').val(document.referrer);
		
		var boolId = false;
		var load ;
		$('#join-check').click(function(){
			var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;		//영문 + 아이디 6~20까지
			
			if( !idReg.test( $('#userId').val())){
	            alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
	            $('#userId').focus();
	        }else{
				var userId = $("#userId").val();
				load = userId;
				load2 = $("#pwd1").val();
				load3 = $("#pwd2").val();
				load4 = $("#join-nick").val();
				load5 = $("#join-name").val();
				load6 = $("#join-email").val();
				
				$.ajax({
					url:'<%=request.getContextPath()%>/idCheck.mem',
					type:'post',
					data:{userId:userId},
					success:function(data){
						if(data === "fail"){
							alert('중복된 아이디가 있습니다.');
						}else{
							$("#userId").val(load);
							load2 = $("#pwd1").val(load2);
							load3 = $("#pwd2").val(load3);
							load4 = $("#join-nick").val(load4);
							load5 = $("#join-name").val(load5);
							load6 = $("#join-email").val(load6);
							
							alert('사용 가능한 아이디입니다.');
							$('#join-check').prop('disabled', true);
							$('#join-check').css('background','green').text('확인 완료');
							boolId=true;
						}
					},
					error:function(data){
						console.log('실패');
					}
				});
	        }				
		});
		
		$('#join-btn').click(function(){
			
			if(boolId){									//아이디 체크 했는지 확인
				
				 // 재입력 일치 여부
				 if ($('#pwd1').val() != $('#pwd2').val()) {
				  	alert("입력한 두 개의 비밀번호가 서로  일치하지 않습니다.");
				 }else if(!/^[a-zA-Z0-9!@#$%^&*()?_~]{6,15}$/.test($('#pwd1').val()))
				 { 
				  	alert("비밀번호는 숫자, 영문, 특수문자등 으로 6~15자리를 사용해야 합니다."); 
				 }else{
			        $('#join-form').submit();
				 }
				
			}else{
				alert('아이디 중복 확인을 해주세요');
			}
		})
		
		$('#userId').focus(function(){
		});
		$('#userId').blur(function(){
			if($('#userId').val().length >= 1){
				$('#join-check').show();
			}
		});
	})
	</script>
</div>


<!-- 농부되기 모달 -->

<div class="remodal" data-remodal-id="modal3"
		style="width: 70%; height: 100%; overflow: auto;">

		<div class="outer2" style="width:100%; height:auto; border:1px solid black;">
		<br>
		<h5 style="font-weight:bold; align:center;">우리두레이야기 농가 신청</h5>
		<br>
		<p style="text-align:left; margin-left:18px;">
			우리두레이야기는 자신의 철학을 지킬 수 있는 적정 규모의 농사를 짓는 농부와<br> 함께합니다.<br>
			인증서 보다 중요한 것은 자신과의 약속을 지키는 농사라고 생각합니다.<br>
			내가 기르는 것을 먹게 될 사람을 생각하며 보다 안전하게 농사짓고자 노력하는<br> 농부와 함께 합니다.
		</p>
		
		<h7 style="font-weight:bold; color:green;"><우리두레이야기 기준></h7>
		<br>
		<br>
		<ul align="left" style="font-weight:bold;">
			<li style="list-style-type:circle">
				제초제를 사용하지 사용하지 않는 농부
				<p style="font-weight:normal; font-size:14px;">
					제초제는 토양에 남아 농작물을 통해 사람들에게 돌아오기 때문에 자연과 사람 모두에게 좋지 않습니다.
					제초제를 사용하는 농부님은 우리두레이야기와 함께 하실 수 없습니다.
				</p>
			</li>
			<li style="list-style-type:circle">
				흙에서 농사짓는 농부
				<p style="font-weight:normal; font-size:14px;">
					우리두레이야기는 과학과 인간의 지식이 자연을 모두 대체할 수 있다고 생각하지<br> 않습니다.
					우리의 지식에 자만하지 않고 자연을 이해하고자 노력하는 농부님을<br> 응원합니다.
					아직까지는 양액재배, 식물공장 형태의 농사를 짓는 농부님은 함께<br> 하실 수 없습니다.
				</p>
			</li>
			<li style="list-style-type:circle">
				친환경 농사로 차츰 전환할 의지가 있는 농부
				<p style="font-weight:normal; font-size:14px;">
					기본적으로 친환경, 친자연적으로 농사를 지으시는 농부님을 우선하지만<br> 우리두레이야기를 통해 관행농사에서
					친환경농사로 차츰 전환할 의지가 있는 농부님도<br> 함께 할 수 있습니다. 전환 과정의 위험과 부담이 줄어야 안전하게
					농사 지으시는 분들이 많아지기 떄문입니다.
				</p>
			</li>
			<li style="list-style-type:circle">
				자연의 속도로 농사짓는 농부
				<p style="font-weight:normal; font-size:14px;">
					모든 먹거리에는 자연의 속도가 있습니다. 매실은 익으면 원래 노란색이고, 쌈채소는<br> 손바닥 크기에서
					성장을 멈추지 않습니다. 성장촉진제, 성장억제제를 쓰지 않고,<br> 가능한 자연의 속도로 농사짓는 농부님과 함께 합니다.
				</p>
			</li>	
			<li style="list-style-type:circle">
				동물들의 자라는 환경을 관리하는 농부
				<p style="font-weight:normal; font-size:14px;">
					수산물과 축산물의 경우 동물이 자라는 환경에 대해 고민하고 위생관리를 하는 농부와<br>함께 합니다.
					유통과정에서 약제처리가 되는 수산, 축산물은 등록할 수 없습니다.<br> 항생제와 성장촉진제 사용을 하지 않는
					농부를 우선하며, 불가피하게 사용 시 사전에<br> 공지해야 합니다.
				</p>
			</li>
			<li style="list-style-type:circle">
				아이들에게 안전한 가공식품을 만드는 농부
				<p style="font-weight:normal; font-size:14px;">
					유전자조작 원료, 불필요한 합성착향(색)료, 합성보존료가 들어간 가공식품은 함께 할 수 <br>없습니다.
					국내 농산물을 원재료로 한 가공식품을 우선하며, 상품의 특성 상 첨가물 또는<br> 수입산 재료를 사용하지 않고서는
					상품자체가 어려운 경우에는 협의 후 진행합니다.
				</p>
			</li>
			<li style="list-style-type:circle">
				농촌의 문제를 해결하는 농부
				<p style="font-weight:normal; font-size:14px;">
					우리두레이야기는 농사뿐만 아니라 농촌마을이나 공동체의 문제를 풀기위해 노력하는<br> 농부도 응원합니다.
					농촌의 일손부족 문제를 해결하기 위한 펀드, 공동체를 위한<br> 공간마련을 위한 펀드, 부가가치를 높이기 위한 마을의
					상품개발을 위한 펀드도<br> 우리두레 이야기를 통해 진행할 수 있습니다. 
				</p>
			</li>		
		</ul>
		
		</div>
		<br>
		<div class="outer2" style="width:100%; height:auto; border:1px solid black;">
		<br>
	
		<h7 style="font-weight:bold; color:green;"><우리두레이야기의 농부와 농산물 점검></h7>
		<br>
		<br>
		<ul align="left" style="font-weight:bold;">
			<li style="list-style-type:circle">
				우리두레이야기 이장제도를 통해  지역별 점검
				<p style="font-weight:normal; font-size:14px;">
					농부를 잘 알수 있는 각 지역의 활동가, 단체, 대표농부를 '우리두레이야기 이장'으로<br> 선발해
					더 밀접하게 해당 지역의 농부를 발굴하고 지원하며 관리합니다. 농부는<br> 우리두레이야기를 직접 신청할 수도 있지만
					해당지역의 '우리두레이야기 이장'을 통해<br> 신청하면 보다 많은 지원을 받을 수 있습니다.
				</p>
			</li>
			<li style="list-style-type:circle">
				기존 고객, 주변 농부, 지자체 등의 주변평판
				<p style="font-weight:normal; font-size:14px;">
					각종 인증서나 인증마크는 참조할 뿐, 농부와 농산물을 점검하는 기준이 되지 못합니다.<br>
					기존 고객들, 주변 농부, 해당 지자체 담당 공무원 둥의 주변 평판을 중요하게 생각합니다.
					눈에 보이는 결과가 아닌 그것을 쌓아오는 과정이 더 중요하다고 생각하기 때문입니다.
				</p>
			</li>
			<li style="list-style-type:circle">
				수시 현장 검증
				<p style="font-weight:normal; font-size:14px;">
					수시로 예정하지 않고 농부와 농사현장을 찾아갑니다. 이 방법이 최선이 될 수 없겠지만<br> 우리두레이야기가 할 수 있는
					노력중 하나라고 생각합니다. 직접 현장을 보고, 농부님과<br> 이야기 나누며 농촌과 도시의 간극을 줄이려고 노력하겠습니다.
				</p>
			</li>
			<li style="list-style-type:circle">
				One Strike Out 제도
				<p style="font-weight:normal; font-size:14px;">
					서로에 대한 '신뢰'가 가장 중요합니다. 약속했던 농사 방법과 진행과정을 사전 협의 없이 어기거나 속였을 경우
					펀딩(투자)금액은 전액 회수되며 진행펀드의 취소와 함께<br> 향후 3년 동안 우리두레이야기에 참여할 수 없게 됩니다.
				</p>
			</li>	
			<li style="list-style-type:circle">
				농수축산물의 식품안전검사
				<p style="font-weight:normal; font-size:14px;">
					펀딩(투자)의 결과물로 발송되는 농수축산물 중 일부는 공급전후 수거하여 잔류농약,<br> 중금속, 방사능, 항생제 검사를
					실시합니다. 검사품목과 검사결과는 홈페이지를 통해<br> 공개하는 것을 원칙으로 하고, 앞으로 횟수와 품목을 지속적으로
					늘려갈 수 있도록<br> 노력하겠습니다.
				</p>
			</li>
		</ul>
		<br>
		<h7 style="font-weight:bold; color:green;"><우리두레이야기 진행절차></h7>
		<br>
		<br>
		<ol align="left" style="font-weight:bold; font-size:14px;">
			<li>우리두레이야기 취지와 서비스에 대해 공감 > 진행결정</li>
			<li>우리두레이기 홈페이지 회원가입 및 신청서 작성</li>
			<li>상품샘플 발송(현재 상품이 없을 경우 사진으로 대체)</li>
			<li>상품사진 촬영 및 상품소개페이지 초안 작성 - 우리두레이야기에서 진행</li>
			<li>내용 검토 및 오픈(펀딩 진행)</li>
			<li>주문 리스트 전달 및 예정일에 상품발송</li>
			<li>정산: 펀드 모집 종료일 50% / 상품발송 및 송장 전달 후 50%</li>
			<li>우리두레이야기 수수료 : 14%(PG사 결제수수료, 부가세 포함)</li>
		</ol>
		<br>
		<h7 style="font-weight:bold;"><기타문의사항></h7>
		<br>
		<br>
		<ul align="left" style="font-weight:bold;">
			<li style="list-style-type:circle">
				고객센터 : 070-4545-9898	
			</li>
			<li style="list-style-type:circle">
				E-Mail : duraedurae@durae.co.kr	
			</li>
		
		</div>
		
		<br>

		<form name="check" method="post" action="<%=request.getContextPath() %>/views/doFarmer/doFarmer.jsp"
			onSubmit="return checkForm();">
			
			<input type="checkbox" name="checkbox1" id="checkNoAgree" value="비동의" onclick="oneCheck(this);"> 
			<label for="checkNoAgree">약관에 동의하지 않습니다</label>
				
				 &nbsp;&nbsp;&nbsp; 
				 
			<input type="checkbox" name="checkbox1" id="checkAgree" value="동의" onclick="oneCheck(this);"> 
			<label for="checkAgree">약관에 동의합니다</label> <br><br>

			<button data-remodal-action="cancel" class="remodal-cancel">취소</button>
			<button type='submit' class="remodal-confirm" onclick="chAgree;">확인</button>

	
		</form>
	</div>
 