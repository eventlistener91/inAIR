<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	var name = '';
	function idFileUpload(fileName) {
		var fileNameArray = fileName.split("\\");
		fileName = fileNameArray[fileNameArray.length-1];
		
		if(!/\.(jpg|jpeg|gif|png)/.test(fileName.toLowerCase())) {
			alert('이미지 파일을 선택해주세요.');
			return;
		}
		
		$('#fileName').val(fileName);
		
		$.ajax({
			dataType : 'json'
			,error : function(result) {
						alert(result.status);
					}
			,success : function(result) {
						name = result.fileName;
						$('#viewTable').html('<img src="/files/' + name + '" width="180px" height="200px" onclick="popupClose();" />');
					}
		});
		
		$('#idPicForm').submit();
	}
	
	function popupClose() {
		$(opener.document).find('#viewTable').html('<img src="/files/' + name + '" width="180px" height="200px" />');
		self.close();
	}
	
</script>
</head>
<body>

<form id="idPicForm" action="/myPage/idPictureFileUpload.do" method="post" enctype="multipart/form-data">
	<input type="text" id="fileName" name="fileName"/>
	<span id="hiddenFileInput">
			<input type="file" id="idPicture" name="idPicture" onchange="idFileUpload(this.value);"/>
	</span>
	
</form>
	<div style="overflow: auto; white-space: nowrap; overflow-X: hidden; height: 200px;" id="viewTable"></div>

</body>
</html>