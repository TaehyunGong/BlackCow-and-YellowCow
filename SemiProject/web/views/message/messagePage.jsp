<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="./messageError.jsp" %>
<%@ page import="com.kh.Semi.message.model.vo.Message, java.util.ArrayList" %>
<%	
	String userId = (String) request.getParameter("uid");
	int listNo = Integer.parseInt(request.getParameter("listno"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대화창</title>
<style type="text/css">
	#msgpage {
		width : 400px;
		height : 600px;
		overflow:scroll;
		font-size : 20px;
		border-radius: 7px;
		-webkit-border-radius: 7px;
		-moz-border-radius: 7px;
		box-shadow: 0 1px 9px rgba(51,51,51,.8);
		-webkit-box-shadow: 0 1px 9px rgba(51,51,51,.8);
		-moz-box-shadow: 0 1px 9px rgba(51,51,51,.8);
		background: rgba(255,102,0,.5);
	}
	
	#msgpage .you {
    background-color: #ecf0f1;
    max-width: 60%;
    margin: 4px;
    clear: both;
    float: left;
    border-radius: 7px;
	-webkit-border-radius: 7px;
	-moz-border-radius: 7px;
	}
 
	#msgpage .me {
    background-color: #C1E4EC;
    max-width: 60%;
    margin : 4px;
    height: auto;
    clear: both;
    float: right;
    border-radius: 7px;
	-webkit-border-radius: 7px;
	-moz-border-radius: 7px;
	}
</style>
<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

	$(function(){
		var userid = '<%= userId %>';
		var listNo = <%= listNo %>;
	
		$.ajax({
			url : "/hifive/mpage",
			type : "get",
			data : { uid : userid , listno : listNo },
			dataType : "json",			
			success : function(data){
				//배열로 된 전송값을 직렬화해서 하나의 문자열로 바꿈
				var jsonStr = JSON.stringify(data);							
				//문자열을 json 객체로 바꿈
				var json = JSON.parse(jsonStr);
				
				var values = "";

				if(json.list.length!=0){
					
					for(var i in json.list){						
						if(json.list[i].sender == userid)
							values += "<div class='you'>" + json.list[i].content + "</div><br>";
						else
							values += "<div class='me'>" + json.list[i].content + "</div><br>";
					}
				} else{
					values += "<tr><td colspan='3'>대화 목록이 없습니다.</td></tr>";
				}
				$("#message").html($("#message").html()+values);			
				
			}, // success
			error : function(jqXHR, textstatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
			} // error
		});
	});

	
</script>
</head>
<body>


<div id="msgpage">
	<div id="message">
	</div>
</div><br>

<form action="/hifive/msend?listno=<%= listNo %>&userid=<%=userId%>" method="post">
	<input type="text" name="content" size="42">
	<input type="submit" value="보내기"​>
</form> 

</body>
</html>