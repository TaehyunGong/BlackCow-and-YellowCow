<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
	boolean bool = (boolean)request.getAttribute("bool");
	String name = (String)request.getAttribute("name");
	String email = (String)request.getAttribute("email");
	String id = (String)request.getAttribute("id");
	String refresh_token = (String)request.getAttribute("refresh_token");
	boolean suc = false;
	if(request.getAttribute("suc") != null){
		suc = true;
	}
	request.setAttribute("bool", "loginComplete");
%>
  <head>
    <title>네이버로그인</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/pushy-buttons.css">
    <link href="<%= request.getContextPath() %>/css/common/bootstrap.min.css" rel="stylesheet">
    
  </head>
  <body onload="addInfor();">
  	<!-- onload="setParentText();" -->
  	<script type="text/javascript">	
        
        function addInfor(){
        	
        	if(<%=bool%>){
        		if(<%=suc%>){
        			alert('회원가입 완료');
        		}
        		setParentText();
        	}else{
        		console.log("추가입력");
        	}
        	
        }
        function setParentText(){	//메인페이지 새로고침후 닫기
        	opener.location.href = '<%=request.getContextPath()%>/MainFunding';
        	window.close();
        }
   </script>
   
   <div style='width:100%; height:400px; text-align: center;'>
   		<label style='font-size:50px; font color:green; margin-left:auto; margin-right:auto'>추가입력</label>
   		
   		<br>
   		<hr style='width:80%;'>
   		<h4>당신의 닉네임을 작성해 주십시오.</h4>
   		<form action='<%=request.getContextPath() %>/memberSNSJoin.mem' method='post'>
   			<input type='hidden' name='refresh_token' value='<%=refresh_token%>'>
   			<input type='hidden' name='id' value='<%=id%>'>
   			
   			<%if(name != null){ %>
	   		<label style='font-size:20px'>이름 : </label>
	   		<input type='text' name='name' value='<%=name%>'  readonly>
	   		<br>
	   		<%} if(email != null){ %>
	   		<label style='font-size:20px'>이메일 : </label>
	   		<input type='text' name='email' value='<%=email%>' style="width: 200px;" readonly>
	   		<br>
	   		<%} %>
	   		<label style='font-size:20px'>닉네임 : </label>
	   		<input type='text' name='nick' placeholder='닉네임 입력'>
	   		<br><br>
	   		<button class='btns btn--sm btn--green'>회원가입</button>
   		</form>
   </div>
   
  </body>
</html>