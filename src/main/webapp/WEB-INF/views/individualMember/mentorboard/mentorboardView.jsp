<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table {
	  border-collapse: collapse;
	  width: 100%;
	}
	
	th, td {
	  padding: 8px;
	  text-align: left;
	  border-bottom: 1px solid #ddd;
	}
	
	tr:nth-child(even) {background-color: #f2f2f2;}
</style>
<script type="text/javascript">
	$(function(){
		$('#mentorboard_cn').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
	        
		});
		$('#mentorboard_cn').summernote('code','${mentorboardInfo.mentor_cn}');
	
		$('#mentorboard_cn').summernote('destroy');
		
		$('form[name=updateForm]').submit(function(){
		     var mentor_cn =   "${mentorboardInfo.mentor_cn}";
			 $(this).append('<input type="hidden" name="mentor_cn" value="'+mentor_cn+'"/>');
			 $(this).attr('action','/mentorboard/mentorboardUpdateForm.do');
			 return true;
		});
		
		$('#deleteBTN').click(function(){
			

			if(confirm('정말 삭제하시겠습니까?')){
			location.href = '/mentorboard/deleteMentorboard.do?mentor_num='+${mentorboardInfo.mentor_num};
			   return true;
			}
		});
		
		$('#listBTN').click(function(){
			var search_keyword = "${search_keyword}";
			var search_keycode = "${search_keycode}";
			location.href = '/mentorboard/mentorboardHome.do?search_keyword='+search_keyword+'&search_keycode='+search_keycode;
		});
	});
</script>
</head>
<body>
   <form name="updateForm" action="/mentorboard/mentorboardUpdateForm.do" method="post">
     <div class="comment-form-wrap pt-5" >
           <h3 class="mb-5">게시물 </h3>           
             <table>
	             <tr>
		              <td width="10%"><label for="name">아이디:</label></td>
		              <td><div>${mentorboardInfo.indvdl_id}</div></td>
		              <input type="hidden" id="indvdl_id" name="indvdl_id" value="${mentorboardInfo.indvdl_id}">
		              <input type="hidden" id="mentor_num" name="mentor_num" value="${mentorboardInfo.mentor_num}">
		              <input type="hidden" id="rnum" name="rnum" value="${mentorboardInfo.rnum}">    
	             </tr>
             </table>
             
             <table>
	             <tr>
		              <td width="10%"><label for="name">제목:</label></td>
		              <input type="hidden" id="mentor_sj" name="mentor_sj" value="${mentorboardInfo.mentor_sj}">
		              <td><div>${mentorboardInfo.mentor_sj}</div></td>
		            
	             </tr>
              </table>
              
             <table>
	             <tr>
		              <td width="10%"><label for="name">첨부파일:</label></td>
		              <c:forEach items="${mentorboardInfo.items}" var="fileitem" varStatus="stat">
		              <td><input type="button" id="file01" name="files" value="${fileitem.men_file_name}"
		              		onclick="javascript:location.href='/mentorboard/mentorboardDownload.do?fileSaveName=${fileitem.men_file_savename}&fileName=${fileitem.men_file_name }';"></td>   
		              </c:forEach>  
	             </tr>
              </table>
              
              <div class="form-group"  style="margin-left:1%">
	                <label for="message">내용</label>
	                <div id="mentorboard_cn"></div>
              </div>  
              <div class="form-group" style="margin-left: 80%"> 
              	<c:if test="${LOGIN_INDVDLMEMINFO.indvdl_id eq mentorboardInfo.indvdl_id}">            
	               <button type="button" id="deleteBTN" class="btn btn-primary py-2">삭제</button>
	               <button type="submit" id="updateBTN" class="btn btn-primary py-2">수정</button>
	               <button type="button" id="listBTN" class="btn btn-primary py-2">목록</button>       
           		</c:if>  
           		<c:if test="${LOGIN_INDVDLMEMINFO.indvdl_id ne mentorboardInfo.indvdl_id}">
           		  <button type="button" id="listBTN" style="margin-left:70%" class="btn btn-primary py-2">목록</button> 
            	</c:if>
             </div>
        </div>
    </form>
		 <div id ="listReply" ></div>    
	        <div class="container" >
		        <label for="content">comment</label>
			        <form name="commentInsertForm">
			            <div class="input-group">
			                <input type="hidden" name="mentor_num" value="${mentorboardInfo.mentor_num}"/>
			                <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
			                <span class="input-group-btn">
			              <c:if test="${!empty LOGIN_INDVDLMEMINFO.indvdl_id}">
			                 <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
			              </c:if>
			                </span>
			            </div>
			        </form>
	        </div>
	  <div class="container">
       	 <div class="commentList"></div>
     </div>        
</div>
<script type="text/javascript">
//게시글 번호
var mentor_num = '${mentorboardInfo.mentor_num}';
//댓글 그룹 번호
var mentor_group = '${mentorboardInfo.mentor_group}';
//이력서 경력 사항 
var mentor_lowpro_name = '${mentor_lowpro_name}';
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = {'indvdl_id' : '${LOGIN_INDVDLMEMINFO.indvdl_id}', 'mentor_group' : '${mentorboardInfo.mentor_group }', 'mentor_sj' : '댓글','mentor_sn' : '${mentorboardInfo.mentor_sn }', 'mentor_depth' : '${mentorboardInfo.mentor_depth }', 'mentor_num' : '${mentorboardInfo.mentor_num }','mentor_cn' :$("input[name=content]").val()}; //commentInsertForm의 내용을 가져옴
    commentInsert(insertData,mentor_lowpro_name); //Insert 함수호출(아래)
});

//list 출력
function commentList(){
var params =  {'mentor_group' : mentor_group};
	$.ajax({
	        url : '${pageContext.request.contextPath}/mentorboard/commentList.do'
	       ,data : params
	       ,type : 'post'
		   ,dataType : "json"
	       ,success : function(result){
	    	   var list = result.mentorList;
	       	 $('.commentList').empty();
	           var a =''; 
	           	for(var i=0;i<list.length;i++){
	               a += '<div class="commentArea" style="border-bottom:1px solid darkgray;width:100%; margin-bottom: 15px; margin-left: '+result.mentorList[i].mentor_depth*20+'px;">';
	               a += '<a class="commentLowpro'+result.mentorList[i].mentor_num+'"> <a style="color:green">'+result.mentorList[i].mentor_lowpro_name+'</a>';
	               a += '<div class="commentInfo'+result.mentorList[i].mentor_num+'">'+' 작성자 : '+result.mentorList[i].indvdl_id;
	               if(result.mentorList[i].indvdl_id=="${LOGIN_INDVDLMEMINFO.indvdl_id}"){
	               a += '<a  onclick="commentUpdate('+result.mentorList[i].mentor_num+',\''+result.mentorList[i].mentor_cn+'\',\''+result.mentorList[i].indvdl_id+'\');"> 수정 </a>';
	               a += '<a  onclick="commentDelete('+result.mentorList[i].mentor_num+',\''+result.mentorList[i].indvdl_id+'\');"> 삭제 </a> ';
	               }else{
	            	   a+='<a></a>';
	            	   a+='<a></a>';
	               }
	               if("${LOGIN_INDVDLMEMINFO.indvdl_id}"!==""){
	               a += '<a onclick="commentReplyInsert('+result.mentorList[i].mentor_num+',\''+result.mentorList[i].mentor_depth+'\',\''+result.mentorList[i].mentor_sn+'\',\''+mentor_lowpro_name+'\');"> 답글 </a> </div>';
	               }else{
	            	   a+='<a></a></div>';
	               }
	               a += '<div class="commentContent'+result.mentorList[i].mentor_num+'"> <p> 내용 : '+result.mentorList[i].mentor_cn +'</p>';
	               a += '</div></div>';
	               a += '<div class="commentReplyContent'+result.mentorList[i].mentor_num+'"></div>'	               
	           	}
	           $(".commentList").append(a);
	       }
	   });
}
//댓글 등록
function commentInsert(insertData,mentor_lowpro_name){
	if(mentor_lowpro_name == ''){
		alert('권한이 없습니다.이력서에 경력을 추가하세요!!')
		$('[name=content]').val('');
		return false;
	}else{
    $.ajax({
        url : '${pageContext.request.contextPath}/mentorboard/insertMentorboardReply.do',
        type : 'post',
        data : insertData,
        success : function(data){
                commentList(); 
                $('[name=content]').val('');
            
        }
    });
	}
}

//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
function commentUpdate(mentor_num,mentor_cn,indvdl_id) {
 	if('${LOGIN_INDVDLMEMINFO.indvdl_id}' != indvdl_id){
		alert('권한이 없습니다.');
	}
    var a ='';
    a += '<div><a onclick=" commentList();"> 취소 </a></div>';
    a += '<div class="input-group">';   
    a += '<input type="text" class="form-control" name="content_'+mentor_num+'" value="'+mentor_cn+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+mentor_num+');">수정</button> </span>';
    a += '</div>';
    $('.commentContent'+mentor_num).html(a);
	
}

//댓글 수정
function commentUpdateProc(mentor_num) {
	 var updateContent = $('[name=content_'+mentor_num+']').val();
	    $.ajax({
	        url : '${pageContext.request.contextPath}/mentorboard/updateMentorboardComment.do',
	        type : 'post',
	        data : {'mentor_cn' : updateContent, 'mentor_num' : mentor_num},
	        success : function(data){
	             commentList(mentor_num); //댓글 수정후 목록 출력 
	        }
	    });
}

//댓글 삭제 
function commentDelete(mentor_num,indvdl_id) {
	if('${LOGIN_INDVDLMEMINFO.indvdl_id}' != indvdl_id){
		alert('권한이 없습니다.');
		return false;
	}	
	$.ajax({
		url : '${pageContext.request.contextPath}/mentorboard/deleteMentorboard.do',
	    type: 'post',
	    data: {'mentor_num': mentor_num},
	    success : function(data){
	    	commentList(mentor_num);//댓글 삭제후 목록 출력 
	    }	
	});
	
	
}

//대댓글 등록-input폼을 추가 
function commentReplyInsert(mentor_num,mentor_depth,mentor_sn,mentor_lowpro_name) {
	if(mentor_lowpro_name == ''){
		alert('권한이 없습니다.이력서에 경력을 추가하세요!!')
		$('[name=content]').val('');
		return false;
	}
	var a ='';
	    a += '<div><a onclick=" commentList();"> 취소 </a></div>';
	    a += '<div class="input-group">';
	    a += '<input type="text" class="form-control" placeholder="내용을 입력하세요." name="content_'+mentor_num+'"/>';
	    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentReplyReplyInsert('+mentor_depth+',\''+mentor_num+'\',\''+mentor_sn+'\');">등록</button> </span>';
	    a += '</div>';
	    $('.commentReplyContent'+mentor_num).html(a);
	
}

//대댓글 등록
function commentReplyReplyInsert(mentor_depth,mentor_num,mentor_sn){
	var mentor_cn = $("input[name='content_"+mentor_num+"']").val();
	 var insertData = {'indvdl_id' : '${LOGIN_INDVDLMEMINFO.indvdl_id}', 'mentor_group' : '${mentorboardInfo.mentor_group }', 'mentor_sj' : '댓글','mentor_sn' : mentor_sn, 'mentor_depth' : mentor_depth,'mentor_cn' :mentor_cn, 'mentor_num' : '${mentorboardInfo.mentor_num }'};
	$.ajax({		 
	        url : '${pageContext.request.contextPath}/mentorboard/insertMentorboardReply.do',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	                commentList(); 
	                $('[name=content]').val('');
	            
	        }
	    });

}


$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});


</script>
</body>
</html>