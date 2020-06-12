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
            <div class="sidebar-box bg-white p-4 ftco-animate fadeInUp ftco-animated">
              <div class="categories">
              	<div style="text-align: right;"><a href="/myPage/myPageCertification.do"><span class="icon-settings"></span></a></div>
              	<div class="img" style="text-align: center;">
              		<c:forEach items="${indvdlMemInfo.pictures}" var="fileitem" varStatus="stat">
              			<c:if test="${!empty indvdlMemInfo.pictures}">
							<img src="/files/${fileitem.idpic_file_savename }" alt="증명사진" style="width: 100px; height: 100px;" >
						</c:if>
					</c:forEach>
              	</div>
                <h5 class="heading-5" style="text-align: center;">${indvdlMemInfo.indvdl_name } 님</h5>
                <div style="text-align: center;">${indvdlMemInfo.indvdl_id }</div>
                <br>
                <a href="/myPage/myPageHome.do"><h5 class="heading-sidebar">입사지원현황</h5></a>
                <hr>
                <a href="/myPage/myProfile.do"><h5 class="heading-sidebar">Profile 관리</h5></a>
                <hr>
                <a href="/myPage/recentJobOffer.do"><h5 class="heading-sidebar">최근 본 공고</h5></a>
                <hr>
                <a href="#"><h5 class="heading-sidebar">개인정보관리</h5></a>
                	<li></li>
	                <li style="border-bottom: none;"><a href="/myPage/myPageCertification.do">&nbsp;&nbsp; 개인정보 수정 </a></li>
	                <c:if test="${empty LOGIN_INDVDLMEMINFO.indvdl_social }">
	                	<li style="border-bottom: none;"><a href="/myPage/passwordChange.do">&nbsp;&nbsp; 비밀번호 변경 </a></li>
	                </c:if>
	                <li style="border-bottom: none;"><a href="/myPage/memberDropOut.do">&nbsp;&nbsp; 개인회원 탈퇴 </a></li>
              </div>
            </div>
         
</body>
</html>