<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="col-md-13 order-md-last d-flex" style="clear:both;">
	<div class="bg-white p-5 contact-form" id="personalData" style="width:100%;">
		<h2>최근 본 공고</h2>
		<div class="row" style="clear:both;">
			<c:forEach items="${recentJoList}" var="recentJo">
				<div class="col-md-12 ftco-animate">
		            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
		              <div class="one-third mb-4 mb-md-0" style="width:100%">
		                <div class="job-post-item-header align-items-center">
		                	<span class="subadge">등록일 : ${recentJo.jo_inquire_rgsde.split(" ")[0]}</span>
		                	<span class="subadge" style="margin-left:3%;">마감일 : ${recentJo.jo_inquire_clos.split(" ")[0]}</span>
		                  	<h4 class="mr-3 text-black" style="margin-top:10px;"><a href="/individualMember/jobOffer/jobOfferView.do?jo_num=${recentJo.jo_num}" style="color: black;">${recentJo.jo_inquire_sj}</a></h4>
		                </div>
		              </div>
		            </div>
       			</div><!-- end -->
   			</c:forEach>
   		</div>
		
		
	</div>
</div>
</body>
</html>