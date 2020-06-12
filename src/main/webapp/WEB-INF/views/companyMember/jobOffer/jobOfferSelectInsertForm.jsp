<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="companyMemberURL" value="/companyMember/jobOffer"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.mainCenterStyle{
		width: 25%; float: left;
	}
	.sectionStyle{
		height:350px; color: #fff;
	}
	.sectionStyle:hover{
		box-shadow: 5px 5px 5px 5px gray;
	}
</style>
</head>
<body>
	<section class="ftco-section bg-light">
		<div class="container" style="text-align:center;">
			<h3>${companyVo.corp_name}님,</h3>
			<h2 style="color:rgba(0, 0, 0, 0.5); margin-bottom:5%;">어떤 채용공고를 등록하시겠습니까?</h2>
			<div class="main-center-category" style="width: 25%; display: inline-block;">
				<a href="${companyMemberURL}/aiJobOfferInsertForm.do">
					<div class="top-category text-center services-section sectionStyle job-post-item" >
						<h3 style="margin-bottom:100px;  color:#fff; margin-top:15px;">AI면접 채용 공고 등록</h3>
						<span class="flaticon-team" style="font-size: 130px;"></span>
					</div>
				</a>
			</div>
			<div class="main-center-category" style="width: 25%; display: inline-block; margin-left: 80px;">
				<a href="${companyMemberURL}/jobOfferInsertForm.do" >
					<div class="top-category text-center services-section sectionStyle">
						<h3 style="margin-bottom:100px; color:#fff; margin-top:15px;">일반 채용 공고 등록</h3>
						<span class="flaticon-employees" style="font-size: 130px;"></span>
					</div>
				</a>
			</div>
		</div>
	</section>

</body>
</html>