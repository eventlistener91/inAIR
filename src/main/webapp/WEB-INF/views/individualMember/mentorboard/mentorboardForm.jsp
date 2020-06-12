<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	//여기 아래 부분
	$('#mentor_cn').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
          
	});
	$('form[name=insertMentorboard]').submit(function(){
		
		if($('#mentor_sj').val()==''){
			alert('제목이 비어있습니다.');
		    return false;
		}
		
		if($('#mentor_cn').val()==''){
			alert('대화명 항목이 비어있습니다.');
			return false;
		}
		
		
		 var mentor_cn =   $('#mentor_cn').summernote('code').replace(/\n/g, "");
		 $(this).append('<input type="hidden" name="mentor_cn" value="'+mentor_cn+'"/>');
		 $(this).attr('action','/mentorboard/insertMentorboard.do');
		 
		 return true;
	});
	$('#cancelBTN').click(function(){
		if(!confirm('예를 누르시면 작성한 내용이 사라집니다.')){
			return false;
    	} else {
    		return true;
    	}
	});
	
	 $('#listBTN').click(function(){
	    	if(confirm('돌아가시겠습니까? 작성된 내용이 사라집니다.')){
	    		location.href = '/mentorboard/mentorboardHome.do';
	    	}
	   });

});

</script>
</head>
<body>	
    <div class="comment-form-wrap pt-5" >
        <h3 class="mb-5">게시물 </h3>
            <form name="insertMentorboard" action="" class="p-5 bg-light" method="post" enctype="multipart/form-data">
                <table>
			          <tr>
				          <td><label for="name">id:</label></td>
				          <td>${LOGIN_INDVDLMEMINFO.indvdl_id }</td>
			           </tr>
	            </table>
	            
                <div class="form-group">
	                  <label for="name">제목</label>
	                  <input type="text" class="form-control" id="mentor_sj" name="mentor_sj">
                	  <input type="hidden" id="indvdl_id" name="indvdl_id" value="${LOGIN_INDVDLMEMINFO.indvdl_id}">
                </div>
                
                <div class="form-group">
	                  <label for="mentor_cn">내용</label> 
	                  <textarea id="mentor_cn"></textarea>
                </div>
                
                <div class="form-group">
	                  <label for="files">첨부파일1:</label> 
	                  <input type="file" id="files" name="files">
                </div>
                <div class="form-group" style="margin-left: 85%;display:flex">
                  	<input type="submit" value="등록" class="btn btn-primary py-2" > 
                  	<input type="button" value="목록" class="btn btn-primary py-2" id="listBTN">
                </div>
           </form>
     </div>
</body>
</html>