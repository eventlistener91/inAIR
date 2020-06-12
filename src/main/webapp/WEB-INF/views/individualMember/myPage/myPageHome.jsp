<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
	li {
		font-size: 15px;
	}
</style>
</head>
<body>
	<div style="clear:both;">
		<div class="bg-white p-5 contact-form" style="width:100%;">
	     	<h3 class="mb-3">입사지원현황</h3>
	     	<br>
	     	<table class="table table-hover" style="width: 770px;">
				<thead>
				  <tr style="text-align: center;">
				    <th>공고</th>
				    <th>합격여부</th>
				    <th>AI면접여부</th>
				    <th>공고</th>
				    <th>이력서</th>
				  </tr>
				</thead>
				<tbody id="fboardListTBY">
					<c:forEach items="${joSubmitList }" var="joSubmit">
						<c:forEach items="${joSubmit.resumeList }" var="resume">
							<tr>
								<td>${joSubmit.jobOfferInfo.jo_sj }</td>
								<td style="text-align: center;">
									<c:choose>
										<c:when test="${joSubmit.pass_at eq 'Y'}">
											<span style="color: #35829c">합격</span>
										</c:when>
										<c:when test="${joSubmit.pass_at eq 'N'}">
											<span style="color: #e3510f">불합격</span>
										</c:when>
										<c:when test="${empty joSubmit.pass_at}">
											<span>준비중</span>
										</c:when>
									</c:choose>
								</td>
								<td style="text-align: center;">
									<c:choose>
										<c:when test="${joSubmit.ai_posbl eq 'P' }">
											<span style="color: #35829c">통과</span>
										</c:when>
										<c:when test="${joSubmit.ai_posbl eq 'F' }">
											<span style="color: #e3510f">탈락</span>
										</c:when>
										<c:when test="${joSubmit.ai_posbl eq 'N' }">
											<span>미신청</span>
										</c:when>
									</c:choose>
								</td>
								<td>
									<div class="tagcloud"><a href="/individualMember/jobOffer/jobOfferView.do?jo_num=${joSubmit.jo_num}" class="tag-cloud-link">공고</a></div>
								</td>
								<td>
									<div class="tagcloud"><a href="/myPage/resumeView.do?resume_num=${joSubmit.resume_num }" class="tag-cloud-link">이력서</a></div>
								</td>
							</tr>
						</c:forEach>
					</c:forEach>
				</tbody>	
			</table>
	     
	<!--             <div class="tag-widget post-tag-container mb-5 mt-5"> -->
	<!--               <div class="tagcloud"> -->
	<!--                 <a href="#" class="tag-cloud-link">Life</a> -->
	<!--                 <a href="#" class="tag-cloud-link">Sport</a> -->
	<!--                 <a href="#" class="tag-cloud-link">Tech</a> -->
	<!--                 <a href="#" class="tag-cloud-link">Travel</a> -->
	<!--               </div> -->
	<!--             </div> -->
		</div>
    </div>
</body>
</html>