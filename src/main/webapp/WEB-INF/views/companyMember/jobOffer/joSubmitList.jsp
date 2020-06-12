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
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<h2 style="margin-bottom: 30px;">지원자 목록</h2>
				<table class="table" id="joSubmitTable">
					<thead>
						<tr style="text-align: center;">
							<th>지원자</th>
							<th>생년월일</th>
							<th>성별</th>
							<th>전화번호</th>
							<th>이력서</th>
							<c:if test="${jobOfferInfo.jo_aireqst eq 'Y' }">
								<th>AI 진행 여부</th>
								<th>AI 제출 여부 </th>
							</c:if>
							<th>합격 여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${joSubmitList }" var="joSubmitList">
							<c:forEach items="${joSubmitList.resumeList }" var="resume">
								<tr style="text-align: center;">
									<td>${resume.indvdlMemInfo.indvdl_name }</td>
									<td>${resume.indvdlMemInfo.indvdl_bir }</td>
									<td>${resume.indvdlMemInfo.indvdl_gend }</td>
									<td>${resume.indvdlMemInfo.indvdl_tel }</td>
									<td><a href="/companyMember/jobOffer/resumeView.do?resume_num=${resume.resume_num }"><input type="button" value="이력서"/></a></td>
									<c:if test="${jobOfferInfo.jo_aireqst eq 'Y' }">
										<td>
											<c:choose>
												<c:when test="${joSubmitList.ai_posbl eq 'N' }">
													<a href="/companyMember/jobOffer/aiPassIndvdlMem.do?submit_num=${joSubmitList.submit_num }&jo_num=${joSubmitList.jo_num}"><input type="button" id="ai_posbl1" value="통과" style="margin-right: 10px;"></a>
													<a href="/companyMember/jobOffer/aiFailIndvdlMem.do?submit_num=${joSubmitList.submit_num }&jo_num=${joSubmitList.jo_num}"><input type="button" id="ai_posbl2"  value="탈락"></a>
												</c:when>
												<c:when test="${joSubmitList.ai_posbl eq 'P' }">
													<span style="color: #35829c;">통과</span>
												</c:when>
												<c:when test="${joSubmitList.ai_posbl eq 'F' }">
													<span style="color: #e3510f">탈락</span>
												</c:when>
											</c:choose>
										</td>
										<td>
											<input type="button" id="ai_execut1" value="제출" style="margin-right: 10px;">
											<input type="button" id="ai_execut2" value="미제출">
										</td>
									</c:if>
									<td>
										<c:choose>
											<c:when test="${empty joSubmitList.pass_at }">
												<a href="/companyMember/jobOffer/finalPassIndvdlMem.do?submit_num=${joSubmitList.submit_num }&jo_num=${joSubmitList.jo_num}"><input type="button" id="pass_at1" value="합격" style="margin-right: 10px;"></a>
												<a href="/companyMember/jobOffer/finalFailIndvdlMem.do?submit_num=${joSubmitList.submit_num }&jo_num=${joSubmitList.jo_num}"><input type="button" id="pass_at2" value="불합격"></a>
											</c:when>
											<c:when test="${joSubmitList.pass_at eq 'Y' }">
												<span style="color: #35829c;">합격</span>
											</c:when>
											<c:when test="${joSubmitList.pass_at eq 'N' }">
												<span style="color: #e3510f">불합격</span>
											</c:when>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
</html>