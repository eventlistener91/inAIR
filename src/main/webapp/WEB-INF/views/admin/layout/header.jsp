<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="adminURL" value="/admin"></c:url>
<c:url var="individualMemberURL" value="/individualMember"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/fullcalendar.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/maruti-style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/maruti-media.css" class="skin-color" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/uniform.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/select2.css" />

	
		
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

	<style>
		#content{
			min-height:768px;
		}
	</style>
	<script type="text/javascript">
		var contextPath = "${pageContext.request.contextPath}";
		$(function(){
			if('${param.message}' != ''){
	        	alert(decodeURI('${param.message}').replace(/\+/gi, " "));
            }
		});
	</script>
</head>
<body>
	<!--Header-part-->
	<div id="header">
	  <h1><a href="dashboard.html">Admin</a></h1>
	</div>
	<!--close-Header-part--> 
	
	<!--top-Header-messaages-->
	<div class="btn-group rightzero"> <a class="top_message tip-left" title="Manage Files"><i class="icon-file"></i></a> <a class="top_message tip-bottom" title="Manage Users"><i class="icon-user"></i></a> <a class="top_message tip-bottom" title="Manage Comments"><i class="icon-comment"></i><span class="label label-important">5</span></a> <a class="top_message tip-bottom" title="Manage Orders"><i class="icon-shopping-cart"></i></a> </div>
	<!--close-top-Header-messaages--> 
	
	<!--top-Header-menu-->
	<div id="user-nav" class="navbar navbar-inverse">
	  <ul class="nav">
	    <li class=""><a title="" href="${adminURL}/login/logout.do"><i class="icon icon-share-alt"></i><span class="text">Logout</span></a></li>
	  </ul>
	</div>
	<!--close-top-Header-menu-->
	
	<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> 관리자메뉴 </a><ul>
	    <li class="active"><a href="${adminURL}/main/mainView.do"><i class="icon icon-home"></i> <span> 통계관리 </span></a> </li>
	    <li> <a href="${adminURL}/memberManagement/individualMemberHome.do"><i class="icon icon-signal"></i> <span> 회원관리</span></a> 
    	  <ul>
	        <li><a href="${adminURL}/memberManagement/individualMemberHome.do">개인회원관리</a></li>
	        <li><a href="${adminURL}/memberManagement/individualDeleteMember.do">탈퇴한 개인회원관리</a></li>
	        <li><a href="${adminURL}/memberManagement/companyMemberHome.do">기업회원관리</a></li>
	        <li><a href="${adminURL}/memberManagement/companyDeleteMemberList.do">탈퇴한 기업회원관리</a></li>
	      </ul>
	    </li>
	    
	    <li class="submenu"><a href=""><i class="icon icon-th-list"></i><span>항목관리</span></a>
	      <ul>
	        <li><a href="${adminURL}/ItemManagement/itemManagementHome.do">언어항목</a></li>
	        <li><a href="${adminURL}/ItemManagement/itemSalaryManagement.do">급여항목</a></li>
	        <li><a href="${adminURL}/ItemManagement/itemClsfManagement.do">직급항목</a></li>
	        <li><a href="${adminURL}/ItemManagement/employList.do">고용형태항목</a></li>
	        <li><a href="${adminURL}/ItemManagement/IndvdlDropManagement.do">탈퇴사유항목</a></li>
	        <li><a href="${adminURL}/ItemManagement/itemUpProManagement.do">상위직종/하위직종</a></li>
	        <li><a href="${adminURL}/ItemManagement/inDustyItemManagement.do">상위업종/하위업종</a></li>
	      </ul>
	    </li>
	    <li class="submenu"><a href=""><i class="icon icon-th-list"></i><span> 게시판관리 </span></a>
	      <ul>
	        <li><a href="${adminURL}/freeboard/adminFreeboardHome.do">자유게시판</a></li>
	        <li><a href="${adminURL}/noticeboard/adminNoticeboardHome.do">공지사항 </a></li>
	        <li><a href="${adminURL}/resboard/adminResboardHome.do">자료실</a></li>
	        <li><a href="${adminURL}/mentorboard/adminMentorboardHome.do">멘토멘티게시판</a></li>
	      </ul>
	    </li>
	  </ul>
	</div>
</body>
</html>