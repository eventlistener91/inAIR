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
				if(confirm('정말 삭제하시겠습니까?')){
				location.href = '/admin/freeboard/deleteFreeboard.do?freeboard_num='+${freeboardInfo.freeboard_num};
				   return true;
				}
		
		});
		$('#listBTN').click(function(){
			if(confirm('목록으로 돌아가시겠습니까?')){
				location.href='/admin/freeboard/adminFreeboardHome.do';
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
			    <h1>자유게시판 상세정보</h1>
		  </div>
	  <div class="container-fluid" style="padding-right:20%; padding-left:20%;">
	   	 <div class="row-fluid" style="height:95%;">
	    	<div class="span6" style="justify-content:center; width:100%; align-items:center;">
		        <div class="widget-box" style="width:100%">	        
			       <div class="widget-title">
			        	<h5>자유게시판</h5>
			       </div>
			       <div class="widget-content nopadding" style="height:100%;">
				      <form action="#" method="get" class="form-horizontal" style="height:100%;">
				         <div class="control-group" style="height:15%; padding-left:10%;">
				             <label class="control-label"> 아이디 :</label>
				             <div class="controls">
				              	 <span class="help-block" style="margin-top:5px;">${freeboardInfo.indvdl_id}</span>
				             </div>
				         </div>
				         <div class="control-group" style="height:15%; padding-left:10%;">
				             <label class="control-label"> 작성일 :</label>
				             <div class="controls">
				               	<span class="help-block" style="margin-top:5px;">${freeboardInfo.freeboard_rgsde}</span>
				             </div>
				         </div>
				         <div class="control-group" style="height:15%; padding-left:10%;">
				             <label class="control-label"> 제목 :</label>
				             <div class="controls">
				               	<span class="help-block" style="margin-top:5px;">${freeboardInfo.freeboard_sj}</span>
				             </div>
				         </div>
				         <div class="control-group" style="height:15%; padding-left:10%;">
				             <label class="control-label"> 첨부파일 : </label>
				              <c:forEach items="${freeboardInfo.items}" var="fileitem" varStatus="stat">
					             <div class="controls">
					               <input type="button" id="file01" name="files" value="${fileitem.free_file_name}">
					             </div>
				              </c:forEach>
				         </div>
				         <div class="control-group" style="height:15%; padding-left:10%;">
				             <label class="control-label"> 내용 : </label>
				             <div class="controls">
				               	<span class="help-block" style="margin-top:5px;">${freeboardInfo.freeboard_cn}</span>
				             </div>
				         </div>
				      </form>
			       </div><!-- end widget-content nopadding -->
			       <div style="margin-left:90%;margin-top:1%">
			       	 <c:if test="${!empty LOGIN_ADMININFO.admin_id}">
			       		<button class="btn btn-info" id="deleteBTN">삭제</button>
			       	 </c:if>
			       	    <button class="btn btn-info" id="listBTN">목록</button>
			       </div>
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

var freeboard_num = '${freeboardInfo.freeboard_num}'; //게시글 번호 

//list출력
function commentList(){
	var id='${LOGIN_INDVDLMEMINFO.indvdl_id}';
	
	
	var params =  {'freeboard_group' : '${freeboardInfo.freeboard_group}'};
	 $.ajax({
	        url : '${pageContext.request.contextPath}/freeboard/commentlist.do'
	        ,data : params
	        ,type:'post'
			    ,dataType : "json"
	        ,success : function(result){
	        	 $('.commentList').empty();
	            var a =''; 
	            $.each(result, function(key, value){ 
	            	
	                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; width:90%;margin-bottom: 15px; margin-left: '+value.freeboard_depth*20+'px;">';
	                a += '<div class="commentInfo'+value.freeboard_num+'">'+'댓글번호 : '+value.rnum+' / 작성자 : '+value.indvdl_id;
	                a += '<a> </a>';
	                if('${LOGIN_ADMININFO.admin_id}' !== ''){
	                a += '<a  onclick="commentDelete('+value.freeboard_num+',\''+value.indvdl_id+'\');"> 삭제 </a> ';
	                }
	                a += '<a> </a> </div>';
	                a += '<div class="commentContent'+value.freeboard_num+'"> <p> 내용 : '+value.freeboard_cn +'</p>';
	                a += '</div></div>';
	                a += '<div class="commentReplyContent'+value.freeboard_num+'"></div>'	               
	            });
	            
	            $(".commentList").append(a);
	        }
	    });
}

//댓글 삭제 
function commentDelete(freeboard_num,indvdl_id){
	
	$.ajax({
		url : '${pageContext.request.contextPath}/admin/freeboard/deleteFreeboardComment.do',
	    type: 'post',
	    data: {'freeboard_num': freeboard_num},
	    success : function(data){
	    	commentList(freeboard_num);//댓글 삭제후 목록 출력 
	    }	
	});
}

$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});

</script>



</html>