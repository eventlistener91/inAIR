<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:url var="individualMemberURL" value="/individualMember"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('#resumeInsertFormBTN').click(function(){
			if(${fn:length(resumeList)} >= 10){
				alert('이력서 등록은 10개까지 가능합니다.');
			}else{
				location.href = "${individualMemberURL}/resumeInsertForm.do";
			}
		});
	});

	function deleteResume(resume_num){
		var result = confirm("선택하신 이력서를 정말 삭제하시겠습니까?")
		if(result){
			location.href = "${individualMemberURL}/deleteResume.do?resume_num="+resume_num;
		}else{
			return false;
		}
	}
	
</script>
</head>
<body>
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 pr-lg-4">
					<div class="row justify-content-center pb-3">
         				<div class="col-md-12 heading-section ftco-animate">
	           				<h2 class="mb-4">
		           				이력서 등록현황
		           				<a class="btn btn-primary icon-pencil" id="resumeInsertFormBTN" style="margin-left:20px;"> 이력서 등록</a>
	           				</h2>
	           				<div style="float:left; margin-top:2%;" class="subheading" >이력서 등록은 10개까지 가능합니다.</div>
         				</div>
	       			</div>
					<div class="row">
						<c:forEach items="${resumeList}" var="resumeInfo">
							<div class="col-md-12 ftco-animate">
					            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
					              <div class="one-third mb-4 mb-md-0" style="margin-right:15%;">
					                <div class="job-post-item-header align-items-center">
					                	<span class="subadge">수정일 : ${resumeInfo.resume_rgsde}</span>
					                  <h2 class="mr-3 text-black"><a href="${individualMemberURL}/resumeView.do?resume_num=${resumeInfo.resume_num}">${resumeInfo.resume_sj}</a></h2>
					                </div>
					                <div class="job-post-item-body d-block d-md-flex">
					                  <div class="mr-3"><span class="icon-layers"></span> ${resumeInfo.salaryString}</div>
					                  <div class="mr-3"><span class="icon-my_location"></span> ${resumeInfo.resume_hope_area}</div>
					                  <div class="mr-3"><span class="icon-university"></span> ${resumeInfo.fin_acdmcrString}</div>
					                </div>
					              </div>
					              <div class="one-forth ml-auto d-flex align-items-center mt-2 md-md-0">
					              	<div>
						                <a href="${individualMemberURL}/resumeUpdateForm.do?resume_num=${resumeInfo.resume_num}" class="icon text-center d-flex justify-content-center align-items-center icon mr-2 ">
						                	<span class="icon-pencil-square-o"></span>
						                </a>
					                </div>
					              	<div>
						                <a href="#" class="icon text-center d-flex justify-content-center align-items-center icon mr-2" onclick="deleteResume(${resumeInfo.resume_num});">
						                	<span class="icon-remove"></span>
						                </a>
					                </div>
					              </div>
					            </div>
		          			</div>
	          			</c:forEach>
	        		</div>
	      		</div>
			</div>
		</div>
	</section>
</body>
</html>