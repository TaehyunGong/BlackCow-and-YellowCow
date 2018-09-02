<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="utf-8">
<head>
	<meta charset="uft-8" />
	<title>summernote</title>
	<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    
    
	<script type="text/javascript">
        /* summernote에서 이미지 업로드시 실행할 함수 */
	 	 function sendFile(file, editor) {
            // 파일 전송을 위한 폼생성
	 		data = new FormData();
	 	    data.append("uploadFile", file);
	 	    $.ajax({ // ajax를 통해 파일 업로드 처리
	 	        data : data,
	 	        type : "POST",
	 	        url : "./summernote_imageUpload.jsp",
	 	        cache : false,
	 	        contentType : false,
	 	        processData : false,
	 	        success : function(data) { // 처리가 성공할 경우
                    // 에디터에 이미지 출력
                   console.log("11");
	 	        	$(editor).summernote('editor.insertImage', data.url);
	 	        },
	 	        error:function(request,status,error){
	 	           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	 	   		
	 	        
	 	        }

	 	    });	
	 	} 
	</script>
</head>
<body>



	<h1>summernote</h1>
	<form name="writeForm" action="./summernote_insert.jsp" method="post">
		<textarea id="summernote">Hello Summernote</textarea>
        <script>
             $(document).ready(function() {
                $('#summernote').summernote({ // summernote를 사용하기 위한 선언
                    height: 400,
					 callbacks: { // 콜백을 사용
                        // 이미지를 업로드할 경우 이벤트를 발생
					    onImageUpload: function(files, editor, welEditable) {
					    	 console.log(files);
				        	  console.log(editor);
				        	  console.log(welEditable);
				        	  
				        	 /*  var opt = {};
					          for (var i = files.length - 1; i >= 0; i--) {
					        	files[i]; //해당파일들을 ajax로 한번씩 FormData로담아서 보내거나 다양하게 처리하시믄됩니다.		        	
					          } */
						     sendFile(files[0], this); 
						}
					} 
				});
			}); 


		</script>
</body>
</html>
