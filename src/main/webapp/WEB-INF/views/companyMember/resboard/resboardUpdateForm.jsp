<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		//여기 아래 부분
		$('#res_cn').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
	          
		});
		
		$('#res_cn').summernote('code','${resboardInfo.res_cn}');
		
		$('form[name=updateResboard]').submit(function(){
	       
	        
			if($('#res_sj').val()==''){
				alert('제목이 비어있습니다.');
			    return false;
			}
			
			if($('#res_cn').val()==''){
				alert('대화명 항목이 비어있습니다.');
				return false;
			}
			
			 var res_cn =   $('#res_cn').summernote('code');
			
			$(this).append('<input type="hidden" name="res_cn" value="'+res_cn+'"/>');
			$(this).append('<input type="hidden" name="res_num" value="${resboardInfo.res_num}"/>');
			$(this).attr('action','/resboard/updateResboard.do');
			 
			return true;
		});
		
		$('#cancelBTN').click(function(){
			if(!confirm('예를 누르시면 작성한 내용이 사라집니다.')){
				return false;
	    	}else {
	    		return true;
	    	}
		});
		
		  $('#listBTN').click(function(){
		    	if(confirm('돌아가시겠습니까? 작성된 내용이 사라집니다.')){
		    		location.href = '/resboard/resboardHome.do';
		    	}
		 });
		  
		
	});
	
</script>
</head>
<body>	
       <div class="comment-form-wrap pt-5" style="width:70%;margin-left: 20%">
       	
            <h3 class="mb-5">게시물 </h3>
               <form name="updateResboard" id="fileForm" action="" class="p-5 bg-light" method="post" role="form"  enctype="multipart/form-data">
                   <table>
			             <tr>
				              <td><label for="name">id:</label></td>
				              <td>${resboardInfo.com_id}</td>
			             </tr>
			              <tr>
				              <td width="10%"><label for="name">첨부파일:</label></td>
				              <c:forEach items="${resboardInfo.items}" var="fileitem" varStatus="stat">
<!-- 					              <td class="fileItem"> -->
<!-- 					               </td> -->
					              <td><input type="file" id="testUploadFile" name="files"></td>
				              </c:forEach>
				             
			        	   </tr>
	              </table>
	              
	           
                  <div class="form-group">
	                    <label for="name">제목</label>
	                    <input type="text" class="form-control" id="res_sj" name="res_sj" value="${resboardInfo.res_sj }">
                  </div>
                  <div class="form-group">
	                    <label for="">내용</label> 
	                     <div id="res_cn"></div>
                  </div>
                  <div class="form-group" style="margin-left: 90%">
                    	<input type="submit" value="수정" class="btn btn-primary py-2"> 
                  		<input type="button" value="목록" class="btn btn-primary py-2" id="listBTN">
                  		
                  </div>
              </form>
        </div>        
</body>
<script type="text/javascript">

$("#testUploadFile").change(function(){
    var res_num = '${resboardInfo.res_num }';
    
    var formData = new FormData($("#fileForm")[0]);
    formData.append("res_num",res_num);
    $.ajax({
        type : 'post',
        url : '${pageContext.request.contextPath}/resboard/updateResboardFile.do',
        data : formData,
        processData : false,
        dataType : "json",
        contentType : false,
        async    : false,
        success : function(result) {
        	var a = '';
            alert("파일 수정이 완료되었습니다.");

        }
        
    });      
 
});    
 

</script>
</html>