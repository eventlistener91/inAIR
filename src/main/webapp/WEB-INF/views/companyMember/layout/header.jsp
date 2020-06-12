<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<c:url var="comMemURL" value="/companyMember"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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


	<title>header</title>
	<style type="text/css">
		ul {
			list-style: none;
		}
		
		#memLi {
			font-size: 30px;
			color: white;
			float: left;
		}
		
		.tag-cloud-link > a {
			font-size: 15px;
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
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container-fluid px-md-4	">
	      <a class="navbar-brand" href="${comMemURL}/mainView.do">inAIR</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="${comMemURL}/resumeNews/resumeNewsHome.do" class="nav-link">구인소식란</a></li>
	          <li class="nav-item"><a href="${comMemURL}/jobOffer/jobOfferHome.do" class="nav-link">구인공고관리</a></li>
	          <li class="nav-item"><a href="/resboard/resboardHome.do" class="nav-link">자료실</a></li>
	          <li class="nav-item"><a href="${comMemURL}/applicant/applicantHome.do" class="nav-link">지원자관리</a></li>
	          <li class="nav-item"><a href="${comMemURL}/myPage/myPageHome.do" class="nav-link">기업정보관리</a></li>
	        </ul>
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item" id="memLi"><a href="#" class="nav-link">${LOGIN_COMMEMINFO.com_id } 님</a></li>
	          <li class="nav-item" id="memLi"><a href="${comMemURL}/login/logout.do" class="nav-link">로그아웃</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
	<div class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
	  <div class="overlay"></div>
	  <div class="container">
	    <div class="row no-gutters slider-text align-items-end justify-content-start">
	      <div class="col-md-12 ftco-animate text-center mb-5">
	        <p class="breadcrumbs mb-0"><span class="mr-1" style="font-size: 20px;">${contentTitle }</p>
	        <h1 class="mb-3 bread">${active }</h1>
	      </div>
	    </div>
	  </div>
	</div>
</body>
    <!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
</html>