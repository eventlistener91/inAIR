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
			<h2>인성역량검사</h2>
			
			<div style="margin-left: 850px; margin-top: -20px;">
				<c:if test="${!empty LOGIN_INDVDLMEMINFO}">
					<a href="/character/characterQuest.do" class="btn btn-primary py-2" style="margin-bottom: 20px;">검사하기</a>
		   		</c:if>
				<c:if test="${empty LOGIN_INDVDLMEMINFO}">
					<a href="${pageContext.request.contextPath }/login/login.do" class="btn btn-primary py-2">검사하기</a>
		   		</c:if>
	   		</div>
			
			<div style="text-align: center; margin-top: 30px; margin-bottom: 30px;">
				<img alt="" src="${pageContext.request.contextPath }/images/characterText.png">
				<br><br>
				<strong style="color: black; font-size: 20px;">응시 전 유의사항</strong>
				<div style="color: black;">본 검사는 개인의 성격 특성을 파악하기 위해 실시하는 것이며, 별도의 정답이 없는 검사입니다.</div>
				<div style="color: black;">제시된 문항을 읽고 해당 문항이 평소 자신의 모습에 얼마나 부합하는지 응답해주시면 됩니다.</div>
			</div>
			
			<div class="row" style="text-align: center;">
			   	<div>
					<c:forEach items="${charList }" var="charList">
					   	<c:if test="${LOGIN_INDVDLMEMINFO.indvdl_id eq charList.indvdl_id}">
					            <div class="job-post-item p-4 d-block d-lg-flex align-items-center" style="margin-left:40px; width: 800px;">
					            	<div class="one-third mb-4 mb-md-0">
						                <div class="job-post-item-header align-items-center">
						                  <span style="color: black; font-size: 20px; padding-right: 30px;">${charList.char_date.split(" ")[0] }</span>
						                  <strong style="color: black; font-size: 25px; width: 125px;">인성검사</strong>
						                </div>
					              	</div>
						          	<div class="one-forth ml-auto d-flex align-items-center">
					            		<a href="/character/characterResultView.do?char_num=${charList.char_num}" 
						              		onclick="window.open(this.href, '_blank', 'width=960px, height=800px, scrollbars=yes'); return false;"
						              		class="btn btn-primary py-2"
						              		style="width: 125px;;">결과보기
					              		</a>
						    		</div>
								</div>
						</c:if>
					</c:forEach>
        		</div>
        	</div>
		</div>
	</section>
</body>
</html>