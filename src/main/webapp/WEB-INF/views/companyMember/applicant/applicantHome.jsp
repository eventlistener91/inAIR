<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	$('#applicantTable tr').click(function() {
		location.href = '/companyMember/jobOffer/joSubmitList.do?jo_num=${jobOfferList[0].jo_num }';
	});
});
</script>
</head>
<body>
<section class="ftco-section bg-light">
	<div class="container">
		<div class="row">
			<h2 style="margin-bottom: 30px;">지원자 목록</h2>
			<table class="table table-hover" id="applicantTable">
				<thead style="text-align: center;">
					<tr>
						<th>공고제목</th>
						<th>등록일</th>
						<th>마감일</th>
						<th>구인완료</th>
					</tr>
				</thead>
				
				<tbody style="text-align: center;">
					<c:forEach items="${jobOfferList }" var="jobOfferList">
							<tr style="cursor: pointer;">
								<td>${jobOfferList.jo_sj }</td>
								<td>${jobOfferList.jo_rgsde }</td>
								<td>${jobOfferList.jo_clos }</td>
								<td>${jobOfferList.jo_finish eq 'N' ? '구인중' : '구인완료' }</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</section>
</body>
</html>