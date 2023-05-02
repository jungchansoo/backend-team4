<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Upload with Ajax</h1>
	
	<div class='uploadDiv'>
		<input type='file' name='uploadFile' multiple>
	</div>
	
	<button id='uploadBtn'> Upload </button>
	
	
	
<!--  https://releases.jquery.com/  -->
<script src="https://code.jquery.com/jquery-3.6.4.js" 
integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" 
crossorigin="anonymous">
</script>
<script>
  $(document).ready(function(){
	  
	// 파일 확장자와 크기를 설정하고 이를 검사한다. 
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; // 5242880Byte= 5MB 
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과입니다.");
			return false;
		}
		
		if(regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
  // 파일 등록
  $("#uploadBtn").on("click", function(e){
 
    var formData = new FormData();
    var inputFile = $("input[name='uploadFile']");
    var files = inputFile[0].files;
    
    console.log(files);
    
  //add filedate to formdata
	for(var i=0; i<files.length; i++) {
		
		if(!checkExtension(files[i].name, files[i].size)){
			return false;
		}
		formData.append("uploadFile", files[i]);
		
	}// end for
	
	$.ajax({
		url: '/uploadAjaxAction',
		processData : false,
		contentType: false,
		data: formData,
		type: 'POST',
		success: function(result) {
			alert("Upload");
		}
	
	}); // end $.ajax
	
  });  
});
</script>

</body>
</html>