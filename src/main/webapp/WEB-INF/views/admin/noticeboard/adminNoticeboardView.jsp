 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
	  .cke_bottom
    {
        display: none !important;
    }
	</style>
	<script type="text/javascript">
	$(function(){
		$('#deleteBTN').click(function(){
			if(confirm('정말 삭제하시겠습니까?')){
				location.href = '/admin/noticeboard/noticeDelete.do?notice_num='+${noticeTotalInfo.notice_num };
				   return true;
				}
		});
		$('#listBTN').click(function(){
			if(confirm('목록으로 가시겠습니까?')){
				location.href = '/admin/noticeboard/adminNoticeboardHome.do';
				return true;
			}
		})
		
	});
	</script>
</head>
<body>
	<div id="content">
		  <div id="content-header">
			    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>회원관리</a> <a href="#" class="current">개인회원 상세정보</a> </div>
			    <h1>공지사항 상세정보</h1>
		  </div>
	  <div class="container-fluid" style="padding-right:20%; padding-left:20%;">
	   	 <div class="row-fluid" style="height:95%;">
	    	<div class="span6" style="justify-content:center; width:100%; align-items:center;">
		        <div class="widget-box" style="width:100%">	        
			       <div class="widget-title">
			        	<h5>공지사항</h5>
			       </div>
			       <div class="widget-content nopadding" style="height:100%;">
				      <form name="updateForm" action="/admin/noticeboard/noticeUpdateForm.do" method="post" class="form-horizontal" style="height:100%;">
				         <div class="control-group" style="height:15%; padding-left:10%;">
				             <label class="control-label"> 아이디 :</label>
				             <div class="controls">
				              	 <span class="help-block" style="margin-top:5px;">${noticeTotalInfo.admin_id }</span>
				              	 <input type="hidden" id="notice_num" name="notice_num" value="${noticeTotalInfo.notice_num }"/>
				             </div>
				         </div>
				         <div class="control-group" style="height:15%; padding-left:10%;">
				             <label class="control-label"> 작성일 :</label>
				             <div class="controls">
				               	<span class="help-block" style="margin-top:5px;">${noticeTotalInfo.notice_rgsde }</span>
				             </div>
				         </div>
				         <div class="control-group" style="height:15%; padding-left:10%;">
				             <label class="control-label"> 제목 :</label>
				             <div class="controls">
				               	<span class="help-block" style="margin-top:5px;">${noticeTotalInfo.notice_sj }</span>
				             </div>
				         </div>
				        
				         <div class="control-group" style="height:15%; padding-left:10%;">
				             <label class="control-label"> 내용 : </label>
				             <div class="controls">
				               	<span class="help-block" style="margin-top:5px;">${noticeTotalInfo.notice_cn }</span>
				             </div>
				         </div>
			       </div><!-- end widget-content nopadding -->
			       <div style="margin-left:85%;margin-top:1%">
			       		<c:if test="${LOGIN_ADMININFO.admin_id eq noticeTotalInfo.admin_id}">
			       			<button type="button"class="btn btn-info" id="listBTN">목록</button>
			       			<button type="submit"class="btn btn-info" id="updateBTN">수정</button>
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
</script>



</html>