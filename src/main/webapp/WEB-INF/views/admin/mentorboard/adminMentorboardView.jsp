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
			var mentor_num = "${mentorInfo.mentor_num}";
			if('${LOGIN_ADMININFO.admin_id}'==''){
				alert('권한이 없습니다.');
				return false;
			}
			
			

		});
	});
</script>
	
</head>
<body>
	<div id="content">
		  <div id="content-header">
			    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>회원관리</a> <a href="#" class="current">개인회원 상세정보</a> </div>
			    <h1>멘토멘티 상세정보</h1>
		  </div>
	  <div class="container-fluid" style="padding-right:20%; padding-left:20%;">
	   	 <div class="row-fluid" style="height:95%;">
	    	<div class="span6" style="justify-content:center; width:100%; align-items:center;">
		        <div class="widget-box" style="width:100%">	        
			       <div class="widget-title">
			        	<h5>멘토멘티</h5>
			       </div>
			       <div class="widget-content nopadding" style="height:100%;">
						   <form name="updateForm" action="" method="post" class="form-horizontal" style="height:100%;">
						      <div class="control-group" style="height:15%; padding-left:10%;">
						          <label class="control-label"> 아이디 :</label>
						          <div class="controls">
						           	 <span class="help-block" style="margin-top:5px;">${mentorInfo.indvdl_id}</span>
						           	 <input type="hidden" id="notice_num" name="notice_num" />
						          </div>
						      </div>
						      
						      <div class="control-group" style="height:15%; padding-left:10%;">
						          <label class="control-label"> 작성일 :</label>
						          <div class="controls">
						            	<span class="help-block" style="margin-top:5px;">${mentorInfo.mentor_rgsde}</span>
						          </div>
						      </div>
						      
						      <div class="control-group" style="height:15%; padding-left:10%;">
						          <label class="control-label"> 제목 :</label>
						          <div class="controls">
						            	<span class="help-block" style="margin-top:5px;">${mentorInfo.mentor_sj}</span>
						          </div>
						      </div>
						     
						      <div class="control-group" style="height:15%; padding-left:10%;">
						          <label class="control-label"> 내용 : </label>
						          <div class="controls">
						            	<span class="help-block" style="margin-top:5px;">${mentorInfo.mentor_cn}</span>
						          </div>
						      </div>
						      
						    </div><!-- end widget-content nopadding -->
						    <div style="margin-left:95%;margin-top:1%">	
						    	<c:if test="${!empty LOGIN_ADMININFO.admin_id}">
						    		<button type="button" class="btn btn-info" id="deleteBTN">삭제</button>
						    	</c:if>
						    </div>
					    </form>
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
var mentor_num = '${mentorInfo.mentor_num}';
//댓글 그룹 번호
var mentor_group = '${mentorInfo.mentor_group}';
//이력서 경력 사항 
var mentor_lowpro_name = '${mentor_lowpro_name}';


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
	               a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px; margin-left: '+result.mentorList[i].mentor_depth*20+'px;">';
	               a += '<a class="commentLowpro'+result.mentorList[i].mentor_num+'"> <a style="color:green">'+result.mentorList[i].mentor_lowpro_name+'</a>';
	               a += '<div class="commentInfo'+result.mentorList[i].mentor_num+'">'+'댓글번호 : '+result.mentorList[i].rnum+' / 작성자 : '+result.mentorList[i].indvdl_id;	             
	               a += '<a  onclick="commentUpdate('+result.mentorList[i].mentor_num+',\''+result.mentorList[i].mentor_cn+'\',\''+result.mentorList[i].indvdl_id+'\');"> </a>';
	               if("${LOGIN_ADMININFO.admin_id}"!==""){
	               a += '<a  onclick="commentDelete('+result.mentorList[i].mentor_num+');"> 삭제 </a> ';
	               }
	               a += '<a onclick="commentReplyInsert('+result.mentorList[i].mentor_num+',\''+result.mentorList[i].mentor_depth+'\',\''+result.mentorList[i].mentor_sn+'\',\''+mentor_lowpro_name+'\');"> </a> </div>';
	               a += '<div class="commentContent'+result.mentorList[i].mentor_num+'"> <p> 내용 : '+result.mentorList[i].mentor_cn +'</p>';
	               a += '</div></div>';
	               a += '<div class="commentReplyContent'+result.mentorList[i].mentor_num+'"></div>'	               
	           	}
	           $(".commentList").append(a);
	       }
	   });

}

//댓글 삭제 
function commentDelete(mentor_num) {
	if(confirm('정말 삭제하시겠습니까?')){
	$.ajax({
		url : '${pageContext.request.contextPath}/mentorboard/deleteMentorboard.do',
	    type: 'post',
	    data: {'mentor_num': mentor_num},
	    success : function(data){
	    	commentList(mentor_num);//댓글 삭제후 목록 출력 
	    }	
	});
	}
	
	
}

$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});

</script>
</html>