<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="individualMemberURL" value="/individualMember/jobOffer"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inair.css">
    
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#joSubmitResumeListTable tbody tr').click(function(){
				var resumeNum =  $(this).children().eq(0).val();
				
				var result = confirm("선택하신 이력서로 지원하시겠습니까?")
				if(result){
					location.href = "${individualMemberURL}/insertJoSubmit.do?resume_num="+ resumeNum +"&jo_num=${jo_num}";
					alert("지원이 완료되었습니다.");
					opener.document.location.reload();
					self.close();
				}else{
					return false;
				}
			});
		});
	</script>
</head>
<body>
	<div>
	  	<h2 style="margin:5% 0 2% 2%; float:left;">이력서 리스트</h2>
		<label class="icon-check" style="margin: 7% 0 0 2%;">공고에 지원할 이력서를 선택하세요.</label>
  		<table class="table" id="joSubmitResumeListTable">
  			<thead>
				<th>수정일</th>
				<th>제목</th>
				<th>희망급여</th>
				<th>희망근무지역</th>
			</thead>
			<tbody>
				<c:forEach items="${joSubmitResumeList}" var="joSubmitResumeInfo">
					<tr>
						<input type="hidden" name="resume_num" value="${joSubmitResumeInfo.resume_num}"/>
						<td>${joSubmitResumeInfo.resume_rgsde}</td>
						<td>${joSubmitResumeInfo.resume_sj}</td>
						<td>${joSubmitResumeInfo.salaryString}</td>
						<td>${joSubmitResumeInfo.resume_hope_area}</td>
					</tr>
				</c:forEach>
			</tbody>
  		</table>
  		<label class="icon-asterisk" style="margin: 7% 0 0 2%;">입사지원 시 결과 발표 내용은 기업측에 2년간 보관됩니다.</label>
  	</div>
	
	<script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
  	<script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
  	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  	<script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
  	<script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
  	<script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
  	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
  	<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
  	<script src="${pageContext.request.contextPath}/js/aos.js"></script>
  	<script src="${pageContext.request.contextPath}/js/jquery.animateNumber.min.js"></script>
  	<script src="${pageContext.request.contextPath}/js/scrollax.min.js"></script>
  	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  	<script src="${pageContext.request.contextPath}/js/google-map.js"></script>
  	<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>