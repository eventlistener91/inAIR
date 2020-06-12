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
		
		$('#res_cn').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
	        
		});
		$('#res_cn').summernote('code','${resboardInfo.res_cn}');
	
	    $('#res_cn').summernote('destroy');
	    
		$('form[name=updateForm]').submit(function(){
		   
			 var res_cn = " ${resboardInfo.res_cn}";

			 $(this).append('<input type="hidden" name="res_cn" value="'+ res_cn+'"/>');
			 
			 $(this).attr('action','/resboard/resboardUpdateForm.do');
		});
		
		$('#deleteBTN').click(function(){
			if(confirm('삭제하시겠습니까?')){
				var res_num = " ${resboardInfo.res_num}";
				location.href='/resboard/deleteResboard.do?res_num='+res_num;
			}
		});
		
		$('#listBTN').click(function(){
			if(confirm('돌아가시겠습니까?')){
				var search_keyword = "${search_keyword}";
		        var search_keycode = "${search_keycode}";
				location.href='/resboard/resboardHome.do?search_keyword='+search_keyword+'&search_keycode=' + search_keycode;
			}
		});
		
		
		$('#fboardComTBY tr').click(function(){
			$("#comment").toggle();
			var $freeboard_group = $(this).find('td:eq(0) input').val();
			var indvdl_id = "${LOGIN_INDVDLMEMINFO.indvdl_id}";
			var freeboard_sn = $(this).find('td:eq(1) input').val();
			var freeboard_depth =  $(this).find('td:eq(2) input').val();
			var freeboard_num =  $(this).find('td:eq(3) input').val();
		});

	});
</script>
</head>
<body>
   <form name="updateForm" action="" method="post">
     <div class="comment-form-wrap pt-5" style="width:60%;margin-left: 25%">
           <h3 class="mb-5">게시물 </h3>           
             <table>
	             <tr>
		              <td width="10%"><label for="name">아이디:</label></td>
		              <td><div>${resboardInfo.com_id}</div></td>
		              <input type="hidden" id="com_id" name="com_id" value="${resboardInfo.com_id}">
		              <input type="hidden" id="res_num" name="res_num" value="${resboardInfo.res_num}">
		              <input type="hidden" id="rnum" name="rnum" value="${resboardInfo.rnum}">    
	             </tr>
             </table>
             
             <table>
	             <tr>
		              <td width="10%"><label for="name">제목:</label></td>
		              <input type="hidden" id="res_sj" name="res_sj" value="${resboardInfo.res_sj}">
		              <td><div>${resboardInfo.res_sj}</div></td>
	             </tr>
              </table>
              
             <table>
	             <tr>
		              <td width="10%"><label for="name">첨부파일:</label></td>
		              <c:forEach items="${resboardInfo.items}" var="fileitem" varStatus="stat">
		              <td><input type="button" id="file01" name="files" value="${fileitem.res_name}"
		              		onclick="javascript:location.href='/resboard/resboardDownload.do?fileSaveName=${fileitem.res_file_savename}&fileName=${fileitem.res_name}';"></td>
		              </c:forEach>
	             </tr>
              </table>
              
              <div class="form-group" style="margin-left:1%">
	                <label for="message">내용</label>
	                <div id="res_cn"></div>
              </div>
              
              <div class="form-group" style="margin-left: 80%">     
              	<c:if test="${LOGIN_COMMEMINFO.com_id eq resboardInfo.com_id}">     
	               <button type="button" id="deleteBTN" class="btn btn-primary py-2">삭제</button>
	               <button type="submit" id="updateBTN" class="btn btn-primary py-2">수정</button>
	                <button type="button" id="listBTN" style="" class="btn btn-primary py-2">목록</button>       
	           </c:if> 
	           <c:if test="${LOGIN_COMMEMINFO.com_id ne resboardInfo.com_id}">         
	               <button type="button" id="listBTN" style="margin-left:70%" class="btn btn-primary py-2">목록</button>       
              </c:if> 
             </div>
        </div>
    </form>
		 <div id ="listReply" ></div>    
	        <div class="container" style="margin-left: 25%;width: 60%">
		         <c:if test="${!empty LOGIN_COMMEMINFO.com_id}">
			        <label for="content">comment</label>
				        <form name="commentInsertForm">
				            <div class="input-group">
				               <input type="hidden" name="freeboard_num" value="${freeboardInfo.freeboard_num}"/>
					           <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
					           <span class="input-group-btn">
				              	 <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
			                   </span>
			               </div>
			            </form>
			         </c:if>
	        	</div>
    <div class="container" style="margin-left: 25%;width: 60%">
        <div class="commentList"></div>
    </div>
    <!-- 추가 -->
	
</div>

</body>
<script>

//게시글 번호
var res_num = '${resboardInfo.res_num}';
//댓글 그룹 번호
var res_group = '${resboardInfo.res_group}';
//이력서 경력 사항 

$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = {'com_id':'${LOGIN_COMMEMINFO.com_id}', 'res_group' : '${resboardInfo.res_group }', 'res_sj' : '댓글','res_sn' : '${resboardInfo.res_sn }', 'res_depth' : '${resboardInfo.res_depth }', 'res_num' : '${resboardInfo.res_num }','res_cn' :$("input[name=content]").val()}; //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});

//list 출력
function commentList(){
var params =  {'res_group' : res_group};
var com_id = "${LOGIN_COMMEMINFO.com_id}";
	$.ajax({
	        url : '${pageContext.request.contextPath}/resboard/commentList.do'
	       ,data : params
	       ,type : 'post'
		   ,dataType : "json"
	       ,success : function(result){
	    	   var list = result.resboardList;
	    	  
	       	 $('.commentList').empty();
	           var a ='';
	          
	           	for(var i=0;i<list.length;i++){
	        
	              	 a += '<div class="commentArea" style="border-bottom:1px solid darkgray;width:90%; margin-bottom: 15px; margin-left: '+result.resboardList[i].res_depth*20+'px;">';
	               if(result.resboardList[i].indvdl_id!=null){
	                 a += '<div class="commentInfo'+result.resboardList[i].res_num+'">'+'댓글번호 : '+result.resboardList[i].rnum+' / 작성자 : '+result.resboardList[i].indvdl_id;	             
	               }
	               
	               if(result.resboardList[i].indvdl_id==null){
	            	 a += '<div class="commentInfo'+result.resboardList[i].res_num+'">'+'댓글번호 : '+result.resboardList[i].rnum+' / 작성자 : '+result.resboardList[i].com_id;	               
	               }
	               
	               if(result.resboardList[i].com_id !="${LOGIN_COMMEMINFO.com_id}" & result.resboardList[i].indvdl_id!=null){
	                 a += '<a></a>';
	               }
	               
	               if(result.resboardList[i].com_id =="${LOGIN_COMMEMINFO.com_id}" & result.resboardList[i].indvdl_id == null){
	            	 a += '<a  onclick="commentUpdate('+result.resboardList[i].res_num+',\''+result.resboardList[i].res_cn+'\',\''+result.resboardList[i].com_id+'\');"> 수정 </a>'; 
	               }
	               
	               if(result.resboardList[i].com_id != "${LOGIN_COMMEMINFO.com_id}" & result.resboardList[i].indvdl_id!=null ){
	            	 a += '<a></a>';
	               }
	               
	               if(result.resboardList[i].com_id == "${LOGIN_COMMEMINFO.com_id}" & result.resboardList[i].indvdl_id==null ){
	            	 a += '<a  onclick="commentDelete('+result.resboardList[i].res_num+',\''+result.resboardList[i].com_id+'\');"> 삭제 </a> ';
	               }
		             a += '<a onclick="commentReplyInsert('+result.resboardList[i].res_num+',\''+result.resboardList[i].res_depth+'\',\''+result.resboardList[i].res_sn+'\');"> 답글 </a> </div>';
		             a += '<div class="commentContent'+result.resboardList[i].res_num+'"> <p> 내용 : '+result.resboardList[i].res_cn +'</p>';
		             a += '</div></div>';
		             a += '<div class="commentReplyContent'+result.resboardList[i].res_num+'"></div>'	               
	           	}
	           $(".commentList").append(a);
	       }
	   });

}
//댓글 등록
function commentInsert(insertData){
	
    $.ajax({
        url : '${pageContext.request.contextPath}/resboard/insertResboarddReply.do',
        type : 'post',
        data : insertData,
        success : function(data){
                commentList(); 
                $('[name=content]').val('');
            
        }
    });

}

//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
function commentUpdate(res_num,res_cn,com_id) {
    var a ='';
    a += '<div><a onclick=" commentList();"> 취소 </a></div>';
    a += '<div class="input-group">';   
    a += '<input type="text" class="form-control" name="content_'+res_num+'" value="'+res_cn+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+res_num+');">수정</button> </span>';
    a += '</div>';
    $('.commentContent'+res_num).html(a);
	
}

//댓글 수정
function commentUpdateProc(res_num) {
	
	 var updateContent = $('[name=content_'+res_num+']').val();
	    $.ajax({
	        url : '${pageContext.request.contextPath}/resboard/updateFreeboardComment.do',
	        type : 'post',
	        data : {'res_cn' : updateContent, 'res_num' : res_num},
	        success : function(data){
	             commentList(); //댓글 수정후 목록 출력 
	        }
	    });
}

//댓글 삭제 
function commentDelete(res_num,com_id) {
	
	$.ajax({
		url : '${pageContext.request.contextPath}/resboard/deleteResboardComment.do',
	    type: 'post',
	    data: {'res_num': res_num},
	    success : function(data){
	    	commentList();//댓글 삭제후 목록 출력 
	    }	
	});
	
	
}

//대댓글 등록-input폼을 추가 
function commentReplyInsert(res_num,res_depth,res_sn) {
	var a ='';
	    a += '<div><a onclick=" commentList();"> 취소 </a></div>';
	    a += '<div class="input-group">';
	    a += '<input type="text" class="form-control" placeholder="내용을 입력하세요." name="content_'+res_num+'"/>';
	    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentReplyReplyInsert('+res_depth+',\''+res_num+'\',\''+res_sn+'\');">등록</button> </span>';
	    a += '</div>';
	    $('.commentReplyContent'+res_num).html(a);
	
}

//대댓글 등록
function commentReplyReplyInsert(res_depth,res_num,res_sn){
	var res_cn = $("input[name='content_"+res_num+"']").val();
	 var insertData = {'com_id':'${LOGIN_COMMEMINFO.com_id}','res_group' : '${resboardInfo.res_group }', 'res_sj' : '댓글','res_sn' : res_sn, 'res_depth' : res_depth,'res_cn' :res_cn, 'res_num' : '${resboardInfo.res_num }'};
	$.ajax({		 
	        url : '${pageContext.request.contextPath}/resboard/insertResboardReply.do',
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
</html>