 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
	$(function(){
		$('#deleteBTN').click(function(){
				if('${LOGIN_ADMININFO.admin_id}' == ''){
		    		alert('권한이 없습니다.');
		    		return false;
		    	}
				if(confirm('정말 삭제하시겠습니까?')){
				location.href = '/admin/resboard/deleteResboard.do?res_num='+${resboardInfo.res_num};
				   return true;
				}
		
		});
	});
	
	</script>
</head>
<body>
	<div id="content">
		  <div id="content-header">
			    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>회원관리</a> <a href="#" class="current">개인회원 상세정보</a> </div>
			    <h1>자료실 상세정보</h1>
		  </div>
	  <div class="container-fluid" style="padding-right:20%; padding-left:20%;">
	   	 <div class="row-fluid" style="height:95%;">
	    	<div class="span6" style="justify-content:center; width:100%; align-items:center;">
		        <div class="widget-box" style="width:100%">	        
			       <div class="widget-title">
			        	<h5>자료실게시판</h5>
			       </div>
			       <div class="widget-content nopadding" style="height:100%;">
				      <form action="#" method="get" class="form-horizontal" style="height:100%;">
				         <div class="control-group" style="height:15%; padding-left:10%;">
				             <label class="control-label"> 아이디 :</label>
				             <div class="controls">
					             <c:if test="${resboardInfo.indvdl_id != null}">
					              	 <span class="help-block" style="margin-top:5px;">${resboardInfo.indvdl_id}</span>
					             </c:if>
					             <c:if test="${resboardInfo.indvdl_id==null }">
					              	 <span class="help-block" style="margin-top:5px;">${resboardInfo.com_id}</span>
					             </c:if>
				             </div>
				         </div>
				         <div class="control-group" style="height:15%; padding-left:10%;">
				             <label class="control-label"> 작성일 :</label>
				             <div class="controls">
				               	<span class="help-block" style="margin-top:5px;">${resboardInfo.res_rgsde}</span>
				             </div>
				         </div>
				         <div class="control-group" style="height:15%; padding-left:10%;">
				             <label class="control-label"> 제목 :</label>
				             <div class="controls">
				               	<span class="help-block" style="margin-top:5px;">${resboardInfo.res_sj}</span>
				             </div>
				         </div>
				         <div class="control-group" style="height:15%; padding-left:10%;">
				             <label class="control-label"> 첨부파일 : </label>
				              <c:forEach items="${resboardInfo.items}" var="fileitem" varStatus="stat">
					             <div class="controls">
					               <input type="button" id="file01" name="files" value="${fileitem.res_name}">
					             </div>
				              </c:forEach>
				         </div>
				         <div class="control-group" style="height:15%; padding-left:10%;">
				             <label class="control-label"> 내용 : </label>
				             <div class="controls">
				               	<span class="help-block" style="margin-top:5px;">${resboardInfo.res_cn}</span>
				             </div>
				         </div>
				      </form>
			       </div><!-- end widget-content nopadding -->
			       <c:if test="${!empty LOGIN_ADMININFO.admin_id}">
				       <div style="margin-left:95%;margin-top:1%">
				       		<button class="btn btn-info" id="deleteBTN">삭제</button>
				       </div>
				   </c:if>
				   
			       <div class="container"  style="margin-top:6%">
						<div class="commentList"></div>
				  </div>
		        </div><!-- end widget-box -->
		        
		      </div><!-- span6 -->
	    	</div><!-- end row-fluid -->
	  	</div><!-- end container-fluid -->
	</div><!-- end content -->
</body>
<script>

//게시글 번호
var res_num = '${resboardInfo.res_num}';
//댓글 그룹 번호
var res_group = '${resboardInfo.res_group}';
//이력서 경력 사항 

$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = {'indvdl_id' : '${LOGIN_INDVDLMEMINFO.indvdl_id}','com_id':'${resboardInfo.com_id}', 'res_group' : '${resboardInfo.res_group }', 'res_sj' : '댓글','res_sn' : '${resboardInfo.res_sn }', 'res_depth' : '${resboardInfo.res_depth }', 'res_num' : '${resboardInfo.res_num }','res_cn' :$("input[name=content]").val()}; //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});

//list 출력
function commentList(){
var params =  {'res_group' : res_group};
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
	               a += '<div class="commentInfo'+result.resboardList[i].res_num+'">'+'댓글번호 : '+result.resboardList[i].rnum+' / 작성자 : '+result.resboardList[i].indvdl_id;	             
	           	  if("${!empty LOGIN_ADMININFO.admin_id}"==""){
	               a += '<a  onclick="commentDelete('+result.resboardList[i].res_num+',\''+result.resboardList[i].indvdl_id+'\');"> 삭제 </a> ';
	           	  }
	               a += '<a></a> </div>';
	               a += '<div class="commentContent'+result.resboardList[i].res_num+'"> <p> 내용 : '+result.resboardList[i].res_cn +'</p>';
	               a += '</div></div>';
	               a += '<div class="commentReplyContent'+result.resboardList[i].res_num+'"></div>'	               
	           	}
	           $(".commentList").append(a);
	       }
	   });

}



//댓글 삭제 
function commentDelete(res_num,indvdl_id) {
	if('${LOGIN_ADMININFO.admin_id}' == ''){
		alert('권한이 없습니다.');
		return false;
	}	
	$.ajax({
		url : '${pageContext.request.contextPath}/resboard/deleteResboardComment.do',
	    type: 'post',
	    data: {'res_num': res_num},
	    success : function(data){
	    	commentList();//댓글 삭제후 목록 출력 
	    }	
	});
	
	
}




$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});







</script>



</html>