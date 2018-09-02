<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap core CSS -->

<!-- Custom styles for this template -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- 네비바 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.topArea {
      background-image:url(/Semi/images/common/마이페이지.png);
      width:100%;
      height:400px;
      font-family:"yeonsung";
      
   }
   #topText {
      font-size:125px;
      margin-top:140px;
      font-weight:bold;
      color:#ccc;
      text-align:center;
   }
   
   #MidText {
      font-size:80px;
      margin-top:110px;
      font-weight:bold;
      color:#ccc;
      text-align:center;
   }
   
    .box
   {
      width:1500px;
      margin:0 auto; 
   }  
   
   /* =========마이페이지 메뉴========== */
   #sub-2
   {
      height:38px;
      border-bottom:1px solid black;
      
   }
   
   #sub-2 ul {
      list-style:none;
      margin-top:1px; 
      text-align:center; 
      margin-left:38%; 
      }
      
   #sub-2 ul li{
      float:left;
      font-size:23px;
      font-weight:bold;
      margin-right:40px;
      }
      
   #sub-2 ul li a
   {
      text-decoration:none;
      color:black;
   }
   
   #sub-2 ul li a:hover{
      text-decoration:none;
      color:black;
   }
    #freeboard{
      display:block;
      border-bottom:5px solid green;
   } 
   #infoboard:hover
   {
      display:block;
      border-bottom:5px solid green;
   }
   
   
   #sub-2 ul li a:hover
   {
      text-decoration:none; 
      border-bottom:5px solid green;
   }
   
      #sub-2 ul li li a:hover
   {
      text-decoration:none; 
      border-bottom:5px solid green;
   }
   

   
   
   
   
   /* ======================== */
/*    #freeboard{
      display:block;
      border-bottom:5px solid green;
      
   }
   #infoboard:hover{
      display:block;
      border-bottom:5px solid green;
   }
   */
   #freeboardtext{
      height:240px;
      border:1px solid white;
      text-align:center;

   } 
   #text-free-1{
      font-size:50px;
      font-weight:bold;
      text-align:center;
      margin-top:100px;

   }
   #text-free-2{
      font-size:15px;
      margin-left:220px;
      
   }
   
   .board_main{
      
      height:100%;
      width:100%;
      
   }
   .table{
   
      width:1100px;
      border-top:5px solid green;
   }
   .all{margin:0 auto;}
   



   /* ======================== */
   
   
   
       .btn2
    {
       margin-left : 700px;
    }
   
     .btn-info2 
     {
       color: #fff;
       background-color: #2F9D27;
        border-color: #5bc0de;
    }
            
            
   .btn-info2:hover 
   {
        color: #fff;
        background-color: #31b0d5;
        border-color: #2aabd2;
   }

    .btn-lg2, .btn-group-lg2 > .btn2 
   {
     padding: 1.5rem 3rem;
      font-size: 1.7rem;
      border-radius: 0.3rem;
    } 
    
    .btn-info2:hover 
    {
     color: #fff;
     background-color: #31b0d5;
     border-color: #2aabd2;
   }

    
    
      .btn1
    {
        margin-left : 50px; 
    }
     .btn-info1 
     {
        color: #fff;
        background-color: #2F9D27;
         border-color: #5bc0de;
      }
     .btn-lg1, .btn-group-lg1 > .btn1 
   {
     padding: 1.5rem 3rem;
      font-size: 1.7rem;
      border-radius: 0.3rem;
    }
    .btn-info1:hover 
    {
     color: #fff;
     background-color: #31b0d5;
     border-color: #2aabd2;
   }


.greenline
   {
      height:10px;
      border-bottom:5px solid green;
   
   }
   
   .container
   {
      margin-left:700px;
   }
   
       .box
   {
      width:900px;
      margin:0 auto; 
   }  
   
   #id
   {
       position: static; 
        /* display:inline-block; */
         width:20px;
         height:20px;
         border:2px solid #bcbcbc;
         margin-left:180px; 
        
         cursor:pointer;
   }
   
   
   
    .reauth-email {
   display: block;
   color: #404040;
   line-height: 2;
   margin-bottom: 10px;
   font-size: 14px;
   text-align: center;
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
   -moz-box-sizing: border-box;
   -webkit-box-sizing: border-box;
   box-sizing: border-box;
} 

.form-joinMember #inputEmail, .form-joinMember,.form-joinMember2 #inputNumber {
   direction: ltr;
   height: 44px;
   font-size: 14px;
}

.form-joinMember input[type=email], .form-joinMember input[type=text],
   .form-joinMember button {
   width: 100%;
   height: 35px;
   display: block;
   margin-bottom: 10px;
   z-index: 1;
   position: relative;
   -moz-box-sizing: border-box;
   -webkit-box-sizing: border-box;
   box-sizing: border-box;
}
.form-joinMember2 input[type=email], .form-joinMember2 input[type=password],
   .form-joinMember2 input[type=text], .form-joinMember2 input[type=tel],
   .form-joinMember2 button {
   width: 100%;
   height: 40px;
   display: block;
   margin-bottom: 10px;
   z-index: 1;
   position: relative;
   -moz-box-sizing: border-box;
   -webkit-box-sizing: border-box;
   box-sizing: border-box;
}

.form-joinMember2 .form-control:focus {
   border-color: rgb(104, 145, 162);
   outline: 0;
   -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
      rgb(104, 145, 162);
   box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
      rgb(104, 145, 162);
}

p, label {
   text-align: center;
   font-weight: 400;
   color: rgba(0, 0, 0, 0.54);
}


#submit {
   width: 60%;
   height: 40px;
   margin-left: auto;
   margin-right: auto;
}

.form-joinMember .form-control:focus {
   border-color: rgb(104, 145, 162);
   outline: 0;
   -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
      rgb(104, 145, 162);
   box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
      rgb(104, 145, 162);
}
   
   #hidden1 label{
    color:green;
    font-style: italic;
}

#hidden2 label{
    color:red;
    font-style: italic;
}

#hidden3 label{
    color:red;
    font-style: italic;
}
#lineHr{background-color:green;}
   
   
</style>
    <body>
        
    <%@ include file='../common/navbar.jsp' %>
     
      

   <div class="topArea">
   <br>
      <h1 id="topText"></h1>
   
   </div>
   
   
   
	<div id="sub-2" class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align ="center">
		<ul class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align ="center">
			<li><a href="/Semi/views/myPage/editInformation.jsp" id="freeboard1">내정보</a></li>
			
		<li class="dropdown"><a class="dropdown-toggle1" data-toggle="dropdown" href="#">찜목록 <span></span></a>
        <ul class="dropdown-menu">
          <li><a href='<%=request.getContextPath() %>/selectDibsO?userNo=<%=loginUser.getMember_No()%>'>상시</a></li>
          <li><a href='<%=request.getContextPath() %>/selectDibs?userNo=<%=loginUser.getMember_No()%>'>펀딩</a></li>
         </ul>
			
			
		 <li class="dropdown"><a class="dropdown-toggle2" data-toggle="dropdown" href="#">장바구니 <span></span></a>
         <ul class="dropdown-menu">
          	<li><a href='<%=request.getContextPath() %>/basket.bo?userNo=<%=loginUser.getMember_No()%>'>상시</a></li>
          	<li><a href="/Semi/views/basket/basketPview.jsp">펀딩</a></li>
          </ul>
          
          	
          	 <li class="dropdown"><a class="dropdown-toggle3" data-toggle="dropdown" href="#">결제내역 <span></span></a>
         <ul class="dropdown-menu">
          	<li><a href='<%=request.getContextPath() %>/payment.po?userNo=<%=loginUser.getMember_No()%>'>상시</a></li>
          	<li><a href='<%=request.getContextPath() %>/payment.pf?userNo=<%=loginUser.getMember_No()%>'>펀딩</a></li>
          </ul>
         	
		
		</ul>
		
	</div>

   
   <div class="MidArea">
      <br>
      <h1 id="MidText">회&nbsp;&nbsp;&nbsp;원&nbsp;&nbsp;&nbsp;정&nbsp;&nbsp;&nbsp;보</h1>
   </div>


   
   
   <div class="board_main" align="center">


   <br><br><br><br><br><br><br><br><br><br>
   
    <article class="container">
   <form id="editInfo" action="<%=request.getContextPath()%>/editInfo.mem" method="post"> 
      <table class="table table-bordered table-hover" id="memberInfoTable" style="text-align:center; border:1px solid #ddddd">
      <thead>
         <tr>
            <th colspan="3"><h4></h4> </th>
         </tr>
      </thead>
      <tbody>
         <tr>
         
            <td style="width: 110px; height: 100px; vertical-align:middle"><h5>아이디</h5></td>
            <td style="vertical-align:middle"><input class ="form-control" type="text"  id='userId'  name='userId' readonly  value="<%= loginUser.getMember_Id()%>"></td>
         </tr>
         <% if(loginUser.getLogin_Type().equals("SNS")){ %>
          <tr>
            <td style="width: 110px; height: 100px; vertical-align:middle"><h5>비밀번호 변경</h5></td>
            <td colspan="2"  style="vertical-align:middle"><input readonly onkeyup="passwordCheckFunction();" class ="form-control" name='userPwd' id='pwd1' type = "password" maxlength="20" placeholder="비밀번호를 입력하세요 "></td>
         </tr>
            <tr>
            <!-- <td colspan="3">
               <div class="error-password">
               <label style="color: red; font-style: italic;">영문,숫자,특수문자(!@$%^&* 만 허용)포함 8자 이상 입력 바랍니다.</label>
            </div>
            </td> -->
         </tr>
         <tr>
            <td style="width: 110px; height: 100px; vertical-align:middle"><h5>비밀번호 변경 확인</h5></td>
            <td colspan="2" style="vertical-align:middle"><input readonly onkeyup="passwordCheckFunction();" class ="form-control" name='userPwd2' id='pwd2'  type = "password" maxlength="20" placeholder="비밀번호를 확인  "></td>
         </tr>
         <tr>
            <!-- <td colspan="3">
               <div class="error-password2">
               <label style="color: red; font-style: italic;">비밀번호가 일치하지
                  않습니다.</label>
            </div>
            </td> -->
         </tr>
         <% }else{ %>
         <tr>
            <td style="width: 110px; height: 100px; vertical-align:middle"><h5>비밀번호 변경</h5></td>
            <td colspan="2"  style="vertical-align:middle"><input onkeyup="passwordCheckFunction();" class ="form-control" name='userPwd' id='pwd1' type = "password" maxlength="20" placeholder="비밀번호를 입력하세요 "></td>
         </tr>
            <tr>
            <td colspan="3">
               <div class="error-password">
               <label style="color: red; font-style: italic;">영문,숫자,특수문자(!@$%^&* 만 허용)포함 8자 이상 입력 바랍니다.</label>
            </div>
            </td>
         </tr>
         <tr>
            <td style="width: 110px; height: 100px; vertical-align:middle"><h5>비밀번호 변경 확인</h5></td>
            <td colspan="2" style="vertical-align:middle"><input onkeyup="passwordCheckFunction();" class ="form-control" name='userPwd2' id='pwd2'  type = "password" maxlength="20" placeholder="비밀번호를 확인  "></td>
         </tr>
         <tr>
            <td colspan="3">
               <div class="error-password2">
               <label style="color: red; font-style: italic;">비밀번호가 일치하지
                  않습니다.</label>
            </div>
            </td>
         </tr>
         <% } %>
         <tr>
            <td style="width: 110px; height: 100px; vertical-align:middle"><h5>이름</h5></td>
            <td colspan="2" style="vertical-align:middle"><input class ="form-control" type ="text" name='userName' id='join-name' maxlength="20" value= "<%= loginUser.getMember_Name()%>" ></td>
         </tr>
         <tr>
            <td colspan="3">
               <div class="error-name">
               <label style="color: red; font-style: italic;">2글자 이상 한글만
                  입력하실 수 있습니다.</label>
            </div>
            </td>
         </tr>
            <tr>
            <td style="width: 110px; height: 100px; vertical-align:middle"><h5>닉네임</h5></td>
            <td colspan="2" style="vertical-align:middle"><input class ="form-control" type ="text" name='userNick' id='join-nick' maxlength="20"  value= "<%= loginUser.getMember_Nick()%>"></td>
         </tr>
         <tr>
            <td colspan="3">
         <div class="error-nickName">
               <label style="color: red; font-style: italic;">이미 사용 중인
                  별명입니다.</label>
            </div>
            <div class="error-nickName2">
               <label style="color: green; font-style: italic;">사용 가능한 별명입니다.</label>
            </div>
         </td>
         <tr>
            <td style="width: 110px; height: 100px; vertical-align:middle"><h5>주소</h5></td>
            <td colspan="2" style="vertical-align:middle"><input class ="form-control" type ="text" name='userAdd' id='userAdd'  maxlength="20" value="<%=loginUser.getAddress()%>"></td>
         </tr>
         <tr>
               
               <td>
                  <button type="button" class="form-control btn btn-primary" id="recieveNumber">인증메일전송</button>  
               </td>
               <td>
               <input type="text" id="inputEmail" name="email" class="form-control" value= "<%= loginUser.getEmail()%>">
               </td>
               
            </tr>
            <tr>
               <td colspan="3">
                  <div id="hidden1">
                     <label>인증번호가 메일로 발송 되었습니다.</label>
                  </div>
                  <div id="hidden2">
                     <label>이미 가입된 계정입니다. 로그인 해주세요.</label>
                  </div>
                  <input type="hidden" id="authenticationNum">
               </td>
            </tr>
            <tr>
               <td>
               <input class="form-control btn btn-primary checkMailNumber" type="button" value="인증하기">
               </td>
            
               <td colspan="3" align="center"><input type="text" id="inputNumber" class="form-control" placeholder="인증번호" required>
               </td>
               
               </tr>
            <tr>
            
               <td colspan="3">
                  <div id="hidden3">
                     <label>인증 번호가 일치하지 않습니다. 확인해주세요.</label>
                  </div>
               </td>
            </tr>
      </tbody>
      
      
      </table>
      
  
   
   <div class="form-group">
              <label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
            <div class="col-sm-6" data-toggle="buttons">
              <label class="btn btn-warning active">
                <input id="agree" type="checkbox" autocomplete="off" chacked>
                  <span class="fa fa-check"></span>
              </label>
              <a href="#">이용약관</a> 에 동의 합니다.
            </div>
          </div>
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <input type="button"   class="btn btn-primary" id="userInfoUpdateBtn" value="정보수정">
            <input type="button"  class="btn btn-danger" onclick="cancle()" value="수정취소"><!-- <i class="fa fa-times spaceLeft"></i> -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">탈퇴하기<i class="fa fa-check spaceLeft"></i></button>
          </div>
        </div>
      </form>

    </article>
   


<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title" align="center">탈퇴하기</h4>
        </div>
        <div class="modal-body" align="left">
  
   <img class="img-card" src='<%=request.getContextPath()%>/images/common/탈퇴.png' width="700px" height="500px">
   <br>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   <input type="checkbox" id="withCheckBtn" style="width:17px; height:17px;"> <label for="withCheckBtn">모든 사항을 확인 하였으며 탈퇴에 동의합니다.</label>
   <hr id="lineHr">
   <div class="passwordArea" align="center">
  <label>비밀번호 </label>&nbsp;&nbsp;&nbsp;<input type="password" name="userPwd" id="userPwdCheck">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
   <label>비밀번호확인 </label>&nbsp;&nbsp;&nbsp;<input type="password" name="userPwd2" id="userPwdCheck2"> 
   </div>   

   
<hr id="lineHr">
<div class="buttonClickArea" align="center">
<button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>&nbsp;&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-primary" id="deleteSite">탈퇴하기</button>
</div>
<br><br><br>

        </div>
      </div>
</div>
</div>
        
        <br><br><br><br><br><br><br><br><br><br><br>
  
    <script>
    
	$(function(){	//회원탈퇴 관련 모달에서 검사 + ajax로 DB에 저장된 비밀번호와 일치여부 확인 후 탈퇴처리.
		$("#deleteSite").click(function(){
			var checkStatus = $("#withCheckBtn").prop("checked");
    		var userPwd = $("#userPwdCheck").val();
    		var userPwd2 = $("#userPwdCheck2").val();
    		
    		if(checkStatus == false){
    			alert("동의버튼을 체크해주세요.");
    		}else if(userPwd == ""){
    			alert("비밀번호를 입력해주세요.");
    		}else if(userPwd2 == ""){
    			alert("비밀번호확인을 입력해주세요.");
    		}else if(userPwd != userPwd2){
    			alert("비밀번호와 비밀번호확인의 입력값이 다릅니다.");
    		}else{
    		
    		$.ajax({
    			url:"<%=request.getContextPath()%>/deleteCheck.mem",
    			type:"POST",
    			data:{
    				userNo:<%=loginUser.getMember_No()%>,
    				userPwd:userPwd,
    				userPwd2:userPwd2
    				},
    			success:function(data){
    				//alert("result : " + data);
    				if(data == 1){
						alert("탈퇴되었습니다.");
						location.href="<%=request.getContextPath()%>/deleteStatusMember.mem";
    				}else{
    					alert("비밀번호가 잘못되었습니다.");
    					$("#userPwdCheck").focus();
    				}
    			},
    			error:function(data){
    				alert("result : " + data);
    			}
    		});
		}
		});
		
	});
    
    
    	
    var certificationNum = 0;
    var checkNumer = $("#inputNumber").val();
    function checkMail(data){	//인증번호가 발송이 성공되면 띄워줌.
    	$("#inputNumber").val(data);
    }
    
    $(function(){
		$(".checkMailNumber").click(function(){
			checkNumber = $("#inputNumber").val();
			var authenticationNum = $("#authenticationNum").val();
			
			console.log(authenticationNum);
			console.log(checkNumber);
			console.log(authenticationNum.trim() == checkNumber.trim()	);			
			
			if(checkNumber == ""){
				alert("인증번호가 요청되지 않았습니다.");
			}else if(authenticationNum.trim() == checkNumber.trim()){
    			alert("인증되었습니다.");
    			certificationNum = 1;
    		}else{
    			alert("인증번호가 잘못되었습니다.");
    			certificationNum = 2;
    		}
    	});
		
		$("#userInfoUpdateBtn").click(function(){	//정보수정을 눌렀을 때 실행할 펑션.
			console.log("클릭됫을 때 인증번호 값 : " + certificationNum);
			if(certificationNum == 1){
				console.log("1일때 실행된다.");
				changeForm();
			}else{
				alert("이메일 인증번호가 다릅니다.");
				$("#inputNumber").focus();
			}
		});
		
	});
    
    function changeForm(){
    	var pw1 = $("#pwd1").val();
    	var pw2 = $("#pwd2").val();
    	var userName = $("#join-name").val();
    	var userNick = $("#join-nick").val();
    	var userAddress = $("#userAdd").val();
    	var userEmail = $("#inputEmail").val();
    	
    	if(userAddress == ""){
    		alert("주소가 입력되지 않았습니다.");
    		$("#userAdd").focus();
    	}
    	
    	$.ajax({
    		url:"<%=request.getContextPath()%>/editInfo.mem",
    		type:"POST",
    		data:{
    			userName:userName,
    			userPwd:pw1,
    			userNick:userNick,
    			userAddress:userAddress,
    			userEmail:userEmail
    		},
    		dataType:"json",
    		success:function(data){
    			if(data > 0){
    			console.log("성공으로 와주세요..");
    			alert("정보가 수정되었습니다.");
    			location.href="<%=request.getContextPath()%>/views/myPage/editInformation.jsp";
    			}else{
    				alert("수정에 실패했습니다.");
    			}
    		},
    		error:function(data){
    			console.log("정보수정 에러는 오지마세요..");
    		}
    	});
    	
    }
    
    <%-- function changeForm(){
       var pw1 = $("#pwd1").val();
       var pw2 = $("#pwd2").val();
       var userName = $("#join-name").val();
       var userNick = $("#join-nick").val();
       var userAdd = $("#userAdd").val();
       var userEmail = $("#inputEmail").val();
       
       $.ajax({
          url:"<%=request.getContextPath()%>/editInfo.mem?userNo=<%=loginUser.getMember_No()%>",
          type:"post",
          data:{
            userPwd:pw1,
             userName:userName,
             userNick:userNick,
             userAdd:userAdd,
             userEmail:userEmail
             },
          success:function(data){
             alert("성공");
             console.log(data);
             
             updateMemberInfo(data);
             
          },
          error:function(data){
             console.log("여기 오지 마세요.");
          }
          });
       }
    
     
     function updateMemberInfo(data){
        var $table = $("#memberInfoTable tbody");
         $table.html("");
    
    
     $table += "<tr>";
        $table += "<td style='width: 110px; height: 100px; vertical-align:middle'><h5>아이디</h5></td>";
        $table += "<td style='vertical-align:middle'>";
        $table += "<input class='from-control'  type='text'  id='userId'  name='userId' readonly value="+data.member_Id+"></td>";
        $table +="</tr>";
        $table +="<tr>";
        $table +="<td colspan='3'>";
        $table +="<div class='error-password'>";
        
  /*       $table +="<label style='color: red; font-style: italic;'>영문,숫자,특수문자(!@$%^&* 만 허용)포함 8자 이상 입력 바랍니다.</label>"; */
         $table +="</div>";
        $table +="</td>";
         $table +="</tr>";
        $table +="<tr>";
          $table +="<td style='width: 110px; height: 100px; vertical-align:middle'><h5>비밀번호 변경</h5></td>";
          $table +="<td colspan='2'  style='vertical-align:middle'><input onkeyup='passwordCheckFunction();' class ='form-control' name='userPwd' id='pwd1' type = 'password' maxlength='20' placeholder='비밀번호를 입력하세요 '></td>";
          $table +="</tr>";
          $table +="<tr>";
          $table +="<td colspan='3'>";
          $table +="<div class='error-password'>";
          
    /*       $table +="<label style='color: red; font-style: italic;'>영문,숫자,특수문자(!@$%^&* 만 허용)포함 8자 이상 입력 바랍니다.</label>"; */
           $table +="</div>";
          $table +="</td>";
           $table +="</tr>";
         $table +="<tr>";
         $table +="<td style='width: 110px; height: 100px; vertical-align:middle'><h5>비밀번호 변경 확인</h5></td>";
           $table +="<td colspan='2' style='vertical-align:middle'><input onkeyup='passwordCheckFunction();' class ='form-control' name='userPwd2' id='pwd2'  type = 'password' maxlength='20' placeholder='비밀번호를 확인  '></td>";
              $table +="</tr>";
              $table +="<tr>";
              $table +="<td colspan='3'>";
              $table +="<div class='error-password2'>";
/*               $table +="<label style='color: red; font-style: italic;'>비밀번호가 일치하지 않습니다.</label>"; */
              $table +="</div>";
              $table +="</td>";
              $table +="</tr>";
              
              $table +="<tr>";
              $table +="<td style='width: 110px; height: 100px; vertical-align:middle'><h5>이름</h5></td>";
              $table +="<td colspan='2' style='vertical-align:middle'><input class ='form-control' type ='text' name='userName' id='join-name' maxlength='20' value="+data.member_Name+"></td>";
              $table +="</tr>";
              $table +="<tr>";
              $table +="<td colspan='3'>";
              $table +="<div class='error-name'>";
/*               $table +="<label style='color: red; font-style: italic;'>2글자 이상 한글만 입력하실 수 있습니다.</label>"; */
              $table +="</div>";
              $table +="</td>";
              $table +="</tr>";
              $table +="<tr>";
              $table +="<td style='width: 110px; height: 100px; vertical-align:middle'><h5>닉네임</h5></td>";
              $table +="<td colspan='2' style='vertical-align:middle'><input class ='form-control' type ='text' name='userNick' id='join-nick' maxlength='20' value="+data.member_Nick+"></td>";
              $table +="</tr>";
              $table +="<tr>";
              $table +="<td colspan='3'>";
              $table +="<div class='error-nickName'>";
/*               $table +="<label style='color: red; font-style: italic;'>이미 사용 중인 별명입니다.</label>"; */
              $table +="</div>";
              $table +="<div class='error-nickName2'>";
/*               $table +="<label style='color: green; font-style: italic;'>사용 가능한 별명입니다.</label>"; */
              $table +="</div>";
              $table +="</td>";
              $table +="<tr>";
              $table +="<td style='width: 110px; height: 100px; vertical-align:middle'><h5>주소</h5></td>";
               $table +="<td colspan='2' style='vertical-align:middle'><input class ='form-control' type ='text' name='userAdd' id='userAdd'  maxlength='20' placeholder='주소를 정확하게 입력하세요 ' value="+data.address+"></td>"; 
              $table +="</tr>";
              $table +="<tr>";
                    
              $table +="<td>";
    $table +="<button type='button' class='form-control btn btn-primary' id='recieveNumber'>인증메일전송</button>  ";
       $table +="</td>";
          $table +="<td>";
             $table +="<input type='text' id='inputEmail' name='email' class='form-control' value="+data.email+">";
                $table += "</td>";

                $table += "</tr>";
                $table += "<tr>";
                $table += "<td colspan='3'>";
                $table += "<div id='hidden1'>";
/*                 $table += "<label>인증번호가 메일로 발송 되었습니다.</label>"; */
                $table += "</div>";
                $table += "<div id='hidden2'>";
/*                 $table += "<label>이미 가입된 계정입니다. 로그인 해주세요.</label>"; */
                $table += "</div>";
                $table += "<input type='hidden' id='authenticationNum'>";
                $table += "</td>";
                $table += "</tr>";
                $table += "<tr>";
                $table += "<td>";
                $table += "<button class='form-control btn btn-primary' type='submit'>인증하기</button>";
                $table += "</td>";

                $table += "<td colspan='3' align='center'><input type='text' id='inputNumber' class='form-control' placeholder='인증번호' required>";
                $table += "</td>";

                $table += "</tr>";
                $table += "<tr>";

                $table += "<td colspan='3'>";
                $table += "<div id='hidden3'>";
/*                 $table += "<label>인증 번호가 일치하지 않습니다. 확인해주세요.</label>"; */
                $table += "</div>";
                $table += "</td>";
                $table += "</tr>";
			
                $("#memberInfoTable").append($table);
             } --%>

   
    
    
    
    function cancle() {
       location.href="editInformation.jsp";
    }
    
      
      $(function(){
         
         var userName = $("#join-name");
         var userPwd = $("#pwd1");
         var userAdd = $("#userAdd");
         var userPwd2 = $("#pwd2");
          var nickName = $("#jojn-nick");
          
          $(".error-name").hide();
          $(".error-password").hide();
          $(".error-password2").hide();
          $(".error-nickName").hide();
          $(".error-nickName2").hide();
          $(".error-cNumber").hide();
          $(".error-cNumber2").hide();
          
          //이름 유효성 검사
          var regName = /^[가-힝]{2,}$/;
          userName.blur(function() {
             if (!regName.test(userName.val())) {
                $(".error-name").show();
               userName.select();
            }else{
               $(".error-name").hide();
            }
          }); 
          //비밀번호 유효성 검사
          var regPwd = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*&^])[A-Za-z\d$@$!%*&^]{8,}$/;
          userPwd.blur(function(){
             console.log(regPwd.test(userPwd.val()));
             if (!regPwd.test(userPwd.val())) {
                $(".error-password").show();
               //userPwd.select();
            }else{
               $(".error-password").hide();
               
               if(userPwd.val() != null){
                   if (userPwd.val() != userPwd2.val()) {
                      $(".error-password2").show();
                     userPwd2.select();
                  }else{
                     $(".error-password2").hide();
                  }
                }
            }
             
          })
          
          //비밀번호 확인란 일치 검사
          userPwd2.blur(function(){
             if (userPwd.val() != userPwd2.val()) {
                $(".error-password2").show();
               userPwd2.select();
            }else{
               $(".error-password2").hide();
            }
          })
         
           //닉네임 중복 확인 (ajax)
          
            nickName.blur(function(){
               $(".error-nickName").hide();
               $(".error-nickName2").hide();
               
              var nickName = $("#inputNickName").val();
              
              $.ajax({
                 url:"<%= request.getContextPath()%>/memberCheck.me",
                 data:{nickName:nickName},
                 type:"get",
                 success:function(data){
                    console.log("성공");
                    if(data == 1){
                       $(".error-nickName2").hide();
                       $(".error-nickName").show();
                       $("#inputNickName").select();
                    }else{
                       $(".error-nickName").hide();
                       $(".error-nickName2").show();
                    }
                    
                 },
                 error:function(data){
                    console.log("에러");
                 }
                 
              });
              
          });  
     
      
      $(function(){	
         $("#hidden1").hide();
         $("#hidden2").hide();
         $("#hidden3").hide();
         
         $("#recieveNumber").click(function(){  //인증번호 발송 ajax.
            $("#hidden1").hide();
             $("#hidden2").hide();
             
            $.ajax({
               url:"<%= request.getContextPath()%>/joinMail.me",
               data:{email:$("#inputEmail").val()},
                   type:"get",
                   success:function(data){
                     console.log("성공");
                     if(data == 2){
                         $("#hidden2").show();
                     }else{
                        $("#hidden1").show();
                        $("#authenticationNum").val(data);
                     }
                     checkMail(data);
                   },
                   error:function(data){
                     console.log("실패");
                  }
            });
         });
         
      });
          
      function validate(){
         $("#hidden3").hide();
         
         var inputNumber = $("#inputNumber").val();
         var authenticationNum = $("#authenticationNum").val();
         var trim = $.trim(authenticationNum);
         
         console.log(trim);
         
         if(inputNumber != trim){
            $("#hidden3").show();
            return false; 
         }
         return true;
      }
      
      });
      
      
      
      
      function validate(){
         
         if($(".error-name").is(':visible')){
            return false;
         }else if($(".error-password").is(':visible')){
            return false;
         }else if($(".error-password2").is(':visible')){
            return false;
         }else if($(".error-phone").is(':visible')){
            return false;
         }else if($(".error-phone2").is(':visible')){
            return false;
         }else if($(".error-nickName").is(':visible')){
            return false;
         }else if($(".error-cNumber").is(':visible')){
            return false;
         }else if($(".error-cNumber2").is(':visible')){
            return false;
         }else if($(".error-bNumber").is(':visible')){
            return false;
         }else if($(".error-bNumber2").is(':visible')){
            return false;
         }else if($(".error-bNumber3").is(':visible')){
            return false;
         }
         
         if($("#business-member").is(':hidden')){
            /////여기요 여기
         }
            
           return true;
      }
      
      
      </script>
      

        
        
<!--         
   <script src="/Semi/js/core.js"></script>  -->
   <script src="/Semi/js/jquery.min.js" ></script> 
   <script src="/Semi/js/bootstrap.min.js"></script> 
   <!-- <script src="/Semi/js/scrollPosStyler.js"></script> 
   <script src="/Semi/js/swiper.min.js"></script> 
   <script src="/Semi/js/isotope.min.js"></script> 
   <script src="/Semi/js/nivo-lightbox.min.js"></script> 
   <script src="/Semi/js/wow.min.js"></script>  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
   <!--  <script src="js/bootstrap.min.js"></script>
 -->
    </body>
</html>