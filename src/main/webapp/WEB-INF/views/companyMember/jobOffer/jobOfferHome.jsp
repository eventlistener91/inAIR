<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:url var="companyMemberURL" value="/companyMember/jobOffer"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.selecBoxStyle{
		width:20%;
    	float:left;
	}
</style>
<script type="text/javascript">
	$(function(){
		$('#jo_aireqst > option[value="${jo_aireqst}"]').attr("selected","selected");
		$('#joOfferStatus > option[value="${joOfferStatus}"]').attr("selected","selected");
		
		$('#jobOfferInsertFormBTN').click(function(){
			location.href = "${companyMemberURL}/jobOfferSelectInsertForm.do";
		});
	});
	
	function deleteJobOffer(jo_num){
		var result = confirm("선택하신 구인공고를 정말 삭제하시겠습니까?")
		if(result){
			location.href = "${companyMemberURL}/deleteJobOffer.do?jo_num="+jo_num;
		}else{
			return false;
		}
	}
	
	function selectJobOffer(){
		$('form[name="selectJobOfferHomeForm"]').submit();
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
		           				구인글 등록현황
		           				<a class="btn btn-primary icon-pencil" id="jobOfferInsertFormBTN" style="margin-left:20px;"> 구인글 등록</a>
	           				</h2>
         				</div>
	       			</div>
	       			<form action="${companyMemberURL}/jobOfferHome.do?" name="selectJobOfferHomeForm">
	       				<select class="ftco-animate form-control selecBoxStyle" id="jo_aireqst" name="jo_aireqst" onchange="selectJobOffer();">
	       					<option value="">채용유형</option>
	       					<option value="all">전체</option>
	       					<option value="Y">AI면접 채용공고</option>
	       					<option value="N">일반채용공고</option>
	       				</select>
	       				<select class="ftco-animate form-control selecBoxStyle" id="joOfferStatus" name="joOfferStatus" onchange="selectJobOffer();">
	       					<option>채용상태</option>
	       					<option value="0">진행중</option>
	       					<option value="1">대기중</option>
	       					<option value="2">마감</option>
	       				</select>
	       			</form>
					<div class="row" style="clear:both; margin-top:10%;">
						<c:if test="${empty jobOfferList}">
							<label class="ftco-animate" style="text-align:center; width:100%; color:red;">해당되는 구인글이 없습니다. 지금 구인글을 등록해보세요!</label>
						</c:if>
						<c:if test="${!empty jobOfferList}">
							<c:forEach items="${jobOfferList}" var="jobOfferInfo">
								<div class="col-md-12 ftco-animate">
						            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
						              <div class="one-third mb-4 mb-md-0" style="margin-right:15%;">
						                <div class="job-post-item-header align-items-center">
						                	<span class="subadge">등록일 : ${jobOfferInfo.jo_rgsde}</span>
						                	<span class="subadge" style="margin-left:3%;">마감일 : ${jobOfferInfo.jo_clos}</span>
						                	<c:if test="${jobOfferInfo.jo_finish eq 'Y' }">
							            		<span style="margin-left: 340px; font-size: 20px; color: red;">완료된 공고입니다</span>
							            	</c:if>
						                	<c:if test="${jobOfferInfo.jo_aireqst eq 'Y' }">
						                		<div >
							                		<span class="flaticon-team" style="color:red; float:left; margin-top:1%; margin-right:2%;"></span>
								                	<span class="subadge">AI면접 시작일 : ${jobOfferInfo.jo_aistart}</span>
								                	<span class="subadge" style="margin-left:3%;">AI면접 마감일 : ${jobOfferInfo.jo_aiend}</span>
						                		</div>
						                	</c:if>
						                  	<h2 class="mr-3 text-black" style="margin-top:10px;"><a href="${companyMemberURL}/jobOfferView.do?jo_num=${jobOfferInfo.jo_num}">${jobOfferInfo.jo_sj}</a></h2>
						                </div>
						                <div class="job-post-item-body d-block d-md-flex">
						                	<c:forEach items="${jobOfferInfo.recruitmentFieldList}" var="recruitmentFieldInfo" varStatus="status">
						                		<c:if test="${status.first}">
								                  	<div class="mr-3"><span class="icon-layers"></span> ${recruitmentFieldInfo.recruitment_field_name}</div>
								                  	<div class="mr-3"><span class="${(recruitmentFieldInfo.recruitment_field_personnel eq 1)? 'icon-user' : 'icon-users' }"></span> ${recruitmentFieldInfo.recruitment_field_personnel}명 모집</div>
								                  	<div class="mr-3"><span class="icon-tags"></span> ${recruitmentFieldInfo.recruitment_field_career}</div>
						                		</c:if>
						                	</c:forEach>
						                </div>
						              </div>
						              <div class="one-forth ml-auto d-flex align-items-center mt-2 md-md-0">
						              	<div style="margin-left:50%;">
							                <a href="#" class="icon text-center d-flex justify-content-center align-items-center icon mr-2" onclick="deleteJobOffer(${jobOfferInfo.jo_num});">
							                	<span class="icon-remove"></span>
							                </a>
						                </div>
						              </div>
						            </div>
			          			</div><!-- end -->
		          			</c:forEach>
						</c:if>
	        		</div>
	      		</div>
			</div>
		</div>
	</section>
</body>
</html>