<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>메시지 레이아웃</title>

<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">
<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
   src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<style type="text/css">


/*  컨테이너 역할 */
.container {
   margin: 0 auto;
   padding: 10px;
}

/* 이게  우리가 이제 만들어야할 공간 */
#main {
   width: 1000px;
   overflow: hidden;
}
/* 이게 왼쪽 메뉴부분!! float:left 가  다음 창을 붙여준다 */
#menu {
   width: 250px;
   margin: 5px 0 0 0;
   float: left;
}
/* 이게 오른쪽 본문 들어가는 부뷴 */
#content1 {
   width: 740px;
   margin: 5px 0 0 0;
   float: left;
   padding: 0 0 0 10px;
   text-align: center;
}

#content2 {
   width: 740px;
   margin: 5px 0 0 0;
   float: left;
   padding: 0 0 0 10px;
   text-align: center;
}

.card-body {
   text-align: center;
}

.rounded-circle {
   width: 50px;
   height: 50px;
}
</style>

<script type="text/javascript">
	$(function(){
		var userid = $("#uid").val();
	
		// 나의 대화 목록
		$.ajax({			
			url : "/hifive/mlist",
			type : "get",
			data : { uid : userid },
			dataType : "json",			
			success : function(data){
				//배열로 된 전송값을 직렬화해서 하나의 문자열로 바꿈
				var jsonStr = JSON.stringify(data);							
				//문자열을 json 객체로 바꿈
				var json = JSON.parse(jsonStr);
				
				var values = "";
				
				if(json.list.length!=0){
					for(var i in json.list){					
						if(json.list[i].user1 == userid){
							/* values += "<tr><td><a href='/hifive/profileinfo?userid="
							+ json.list[i].user2 +"'><img src='/hifive/resources/image/sample10.jpg' alt='' class='rounded-circle' title='프로필로 이동'></a></td><td>" 
							+ json.list[i].userName
							+ "</td><td><a href='/hifive/mpage?listno=" + json.list[i].list_no 
							+ "&uid=" + userid  + "'>" + "보기"
							+ "</a></td></tr>";  */
							values += "<tr><td><a href='/hifive/profileinfo?userid="
							+ json.list[i].user2 +"'><img src='/hifive/resources/image/sample10.jpg' alt='' class='rounded-circle' title='프로필로 이동'></a></td><td>" 
							+ json.list[i].userName
							+ "</td><td><a href='/hifive/views/message/messagePage.jsp?listno=" + json.list[i].list_no 
							+ "&uid="+ json.list[i].user2 + "' onclick=\"window.open(this.href,'','width=420, height=685'); return false;\">" + "보기"
							+ "</a></td></tr>";
						} else{
							values += "<tr><td><a href='/hifive/profileinfo?userid="
							+ json.list[i].user1 + "'><img src='/hifive/resources/image/sample10.jpg' alt='' class='rounded-circle' title='프로필로 이동'></a></td><td>" 
							+ json.list[i].userName
							+ "</td><td><a href='/hifive/mpage?listno=" + json.list[i].list_no 
							+ "&uid=" + userid  + "'>" + "보기"
							+ "</a></td></tr>";
						}

					}				
				} else{
					values += "<tr><td colspan='3'>대화 목록이 없습니다.</td></tr>";
				}			
								
				$("#mlist").html($("#mlist").html()+values);
				
				
			}, // success
			error : function(jqXHR, textstatus, errorThrown){
				console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
			} // error
		}); 	
	});	

</script>

</head>
<body>
   <div class="container">
      <%@ include file="../../header.jsp"%>
      <hr>
      <div id="main">
         <div id="menu">
            <div class="card" style="width: 250px;">
               <div class="card-body">
                  <h5 class="card-title">사용자 기본정보</h5>
                  <h6 class="card-subtitle mb-2 text-muted">(이름및 지역)</h6>
                  <p class="card-text">
                     ......<br>
                     <br>
                     <br>
                     <br>
                     <br>
                     <br>
                     <br>
                     <br>
                     <br>
                  </p>
                  <a href="/hifive/views/support/safety.jsp" class="card-link">안전유의사항</a>

               </div>
            </div>

         </div>
         <div id="content1">
           

            
            <div class="card border-light mb-3" style="max-width: outo">
                 <div class="card-header">나의 대화 목록</div>
                 <div class="card-body">
                   <table class="table table-sm" id="chatList">
                  
                     <thead>
                        <tr>
                           <th scope="col" width="30%">프로필</th>
                           <th scope="col" width="40%">이름</th>
                           <th scope="col" width="30%">대화내역</th>
						
                        </tr>
                     </thead>
                     <tbody id="mlist">
                        <%-- 나의 대화 목록 출력  --%>
                     </tbody>
                  </table> 
                 </div>  
            </div>


 


         </div>

         <div id="content2"></div>
      </div>
      <br>
      <hr>
      <%@ include file="../../footer.jsp"%>
   </div>

</body>
</html>