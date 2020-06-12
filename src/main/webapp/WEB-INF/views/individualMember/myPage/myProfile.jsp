<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	button:active { 
		background-color:#a6c7ff; }
	.btn {
		 border-style: solid; 
		 border-width: 1.5px; 
		 border-color: #a6c7ff; 
		 color: black; 
		 padding: 5px 10px; 
		 font-weight: normal;
		 float: right;
	}
	.portBtn {
		border: none;
		background-color: white;
	}
</style>
<script type="text/javascript">
	$(function() {
		$('#academicTable').hide();
		$('#carrerTable').hide();
		$('#selfintroductionTable').hide();
		$('#characterTable').hide();
		$('#etcTable').hide();
		$('#characterDiv').hide();
		
		// 버튼 클릭
		$('#informaiton').click(function(){
			$('#informaitonTable').show();
			$('#academicTable').hide();
			$('#carrerTable').hide();
			$('#selfintroductionTable').hide();
			$('#characterTable').hide();
			$('#etcTable').hide();
			$('#characterDiv').hide();
		});
		$('#academic').click(function(){
			$('#informaitonTable').hide();
			$('#academicTable').show();
			$('#carrerTable').hide();
			$('#selfintroductionTable').hide();
			$('#characterTable').hide();
			$('#etcTable').hide();
			$('#characterDiv').hide();
		});
		$('#carrer').click(function(){
			$('#informaitonTable').hide();
			$('#academicTable').hide();
			$('#carrerTable').show();
			$('#selfintroductionTable').hide();
			$('#characterTable').hide();
			$('#etcTable').hide();
			$('#characterDiv').hide();
		});
		$('#selfintroduction').click(function(){
			$('#informaitonTable').hide();
			$('#academicTable').hide();
			$('#carrerTable').hide();
			$('#selfintroductionTable').show();
			$('#characterTable').hide();
			$('#etcTable').hide();
			$('#characterDiv').hide();
		});
		$('#character').click(function(){
			$('#informaitonTable').hide();
			$('#academicTable').hide();
			$('#carrerTable').hide();
			$('#selfintroductionTable').hide();
			$('#characterTable').show();
			$('#etcTable').hide();
			$('#characterDiv').show();
		});
		$('#etc').click(function(){
			$('#informaitonTable').hide();
			$('#academicTable').hide();
			$('#carrerTable').hide();
			$('#selfintroductionTable').hide();
			$('#characterTable').hide();
			$('#etcTable').show();
			$('#characterDiv').hide();
		});
		
	});
</script>
</head>
<body>
<form name="passwordChangeForm" method="post">
	<div class="col-md-13 order-md-last d-flex" style="clear:both;">
	<div class="bg-white p-5 contact-form" id="personalData" style="width:100%;">
		<h2>나의 Profile</h2>									
		<p style="font-size: 16px;">· Profile이란? 취업 활동 경쟁력을 높일 수 있도록, 나의 이력 및 역량을 등록/관리하는 서비스입니다.</p>
		<br>
		
		<div style="text-align: center">
			<button type="button" id="informaiton" style="width: 110px; border: none;">기본정보</button>
			<button type="button" id="academic" style="width: 110px; border: none;">학력사항</button>
			<button type="button" id="carrer" style="width: 110px; border: none;">경력사항</button>
			<button type="button" id="selfintroduction" style="width: 110px; border: none;">자기소개서</button>
			<button type="button" id="character" style="width: 110px; border: none;">인성검사</button>
			<button type="button" id="etc" style="width: 110px; border: none;">포트폴리오</button>
		</div>
		<br>
		<br>
		
		<!-- 기본정보 테이블 -->
		<table class="table" id="informaitonTable">
			<tr>
				<td rowspan="2">
					<c:forEach items="${indvdlMemInfo.pictures}" var="fileitem" varStatus="stat">
						<img src="/files/${fileitem.idpic_file_savename }" alt="증명사진" style="width: 130px; height: 200px;" >
					</c:forEach>
				</td>
				<td colspan="2">
					<span>
						<strong style="font-size: 30px;">${indvdlMemInfo.indvdl_name}</strong>
						 &nbsp;&nbsp;${indvdlMemInfo.indvdl_gend}, &nbsp; ${indvdlMemInfo.indvdl_bir.substring(0,4)}
					</span>
				</td>
			</tr>
			<tr>
				<td style="line-height: 220%;">
					<ul>
						<li>·&nbsp; 이메일</li>
						<li>·&nbsp; 휴대폰</li>
						<li>·&nbsp; 주소</li>
					</ul>
				</td>
				<td style="line-height: 220%;">
					<ul>
						<li>${indvdlMemInfo.indvdl_mail}<li>
						<li>${indvdlMemInfo.indvdl_tel}<li>
						<li>${indvdlMemInfo.indvdl_adres1} ${indvdlMemInfo.indvdl_adres2}<li>
					</ul>
				</td>
			</tr>
		</table>
		
		<!-- 학력사항 테이블 -->
		<div id="academicTable">
			<table class="table">
				<c:if test="${empty resumeList }">
					<div style="text-align: center; color: black;">등록된 이력서가 없습니다. 이력서를 입력해주세요.<br><br> </div>
					<a href="/individualMember/resumeInsertForm.do" class="btn">등록하기</a>
				</c:if>
			
				<c:forEach items="${resumeList}" var="resumeInfo" >
					<c:if test="${!empty resumeInfo.academicDetaList }">
						<thead>
							<th colspan="4"><strong style="font-size: 24px;">${resumeInfo.resume_sj }</strong></th>  
						</thead>				
						<c:forEach items="${resumeInfo.academicDetaList}" var="academicInfo" varStatus="index">
							<c:if test="${!empty academicInfo.det_acdmcr_school }">
								<tbody>
									<tr>
										<td rowspan="2">
											${academicInfo.det_acdmcr_entsch } ~ ${academicInfo.det_acdmcr_grdtn }
										</td>
										<td colspan="2">
											<strong style="font-size: 20px;">${academicInfo.det_acdmcr_school }</strong>&nbsp;&nbsp;
										</td>
									</tr>
									<tr>
										<c:if test="${!empty academicInfo.det_acdmcr_subjct }">
										<td style="line-height: 220%;">
											<ul>
												<li>·&nbsp; 전공 계열</li>
												<li>·&nbsp; 전공 학과</li>
											</ul>
										</td>
										<td style="line-height: 220%; border-bottom-color: gray;">
											<ul>
												<li>${academicInfo.det_acdmcr_major }</li>
												<li>${academicInfo.det_acdmcr_subjct }</li>
											</ul>
										</td>
										</c:if>						
									</tr>
								</tbody>
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
			</table>
		</div>
		
		<!-- 경력사항 테이블 -->
		<div id="carrerTable">
		<table class="table">
			<c:if test="${empty resumeList }">
				<div style="text-align: center; color: black;">등록된 이력서가 없습니다. 이력서를 입력해주세요.<br><br> </div>
				<a href="/individualMember/resumeInsertForm.do" class="btn">등록하기</a>
			</c:if>
			<c:forEach items="${resumeList}" var="resumeInfo"  varStatus="index">
				<c:if test="${!empty resumeInfo.careerInfoList }">
					<thead>
						<th colspan="4"><strong style="font-size: 24px;">${resumeInfo.resume_sj }</strong></th>
					</thead>		
				</c:if>
				<c:forEach items="${resumeInfo.careerInfoList}" var="careerInfo">
					<tbody>
						<tr>
							<td rowspan="2">
								${careerInfo.com_encpn } ~ ${careerInfo.com_retire }
							</td>
							<td colspan="2">
								<strong style="font-size: 20px;">${careerInfo.com_name }</strong>
							</td>
						</tr>
						<tr>
							<td style="line-height: 220%;">
								<ul>
									<li>·&nbsp; 직급/직책</li>
									<li>·&nbsp; 직종</li>
									<li>·&nbsp; 연봉</li>
								</ul>
							</td>
							<td style="line-height: 220%;">
								<ul>
									<li>
										<c:forEach items="${positionList }" var="positionInfo">
											<c:if test="${careerInfo.clsf_num eq positionInfo.clsf_num}">${positionInfo.clsf_name }</c:if>
										</c:forEach>
									</li>
									<li>
										<c:forEach items="${careerInfo.lowproList}" var="lowProInfo">
											<c:if test="${careerInfo.lowpro_num eq lowProInfo.lowpro_num }">${lowProInfo.lowpro_name }</c:if>
										</c:forEach>
									</li>
									<li>
										${careerInfo.salary }
									</li>
								</ul>
							</td>
						</tr>
					</tbody>
				</c:forEach>
			</c:forEach>
		</table>
		</div>

		<!-- 자기소개서 테이블 -->
		<div id="selfintroductionTable">
			<c:if test="${empty resumeList }">
				<div style="text-align: center; color: black;">등록된 이력서가 없습니다. 이력서를 입력해주세요.<br><br> </div>
				<a href="/individualMember/resumeInsertForm.do" class="btn">등록하기</a>
			</c:if>
			<table class="table table-hover">
				<c:forEach items="${resumeList}" var="resumeInfo" >
				<c:forEach items="${resumeInfo.selfIntroductionList}" var="selfInfo" varStatus="index">
				<tr>
					<td>
						<span style="color: gray;">수정 ${resumeInfo.resume_rgsde.split(" ")[0] } </span>
					</td>
					<td>
						<a href="/myPage/selfIntroductionForm.do?resume_num=${resumeInfo.resume_num }" style="color: black;"><strong style="font-size: 20px;"> ${resumeInfo.resume_sj }</strong></a>
					</td>
				</tr>
				</c:forEach>
				</c:forEach>
			</table>
		</div>
		
		<!-- 인성검사 -->
		<table class="table table-hover" id="characterTable">
		    <thead>
		      <tr>
		      	<th>응시일</th>
		        <th>검사명</th>
		        <th>응시상태</th>
		        <th>바로가기</th>
		      </tr>
		    </thead>
		    <tbody id="characterTbody">
		    	<c:forEach items="${charList }" var="charList">
			    	<c:if test="${LOGIN_INDVDLMEMINFO.indvdl_id eq charList.indvdl_id}">
				    	<tr id="characterTr">
				    		<td>${charList.char_date.split(" ")[0] }</td>
				    		<td>인성검사</td>
				    		<td>응시 완료</td>
				    		<td><div class="tagcloud"><a href="/character/characterResultView.do?char_num=${charList.char_num}" onclick="window.open(this.href, '_blank', 'width=960px, height=800px, scrollbars=yes'); return false;" class="tag-cloud-link">결과보기</a></div></td>
				    	</tr>
			    	</c:if>
		    	</c:forEach>
		  	</tbody>
	  	</table>
		
		<div id="characterDiv">
			<span style="float: right; margin-top: 10px;">
				<a href="/character/characterQuest.do" style="border-style: solid; border-width: 1.5px; border-color: #a6c7ff; color: black; padding: 5px 10px; font-weight: normal">검사하기</a>
			</span>
		</div>
		
		<!-- 포트폴리오 -->
		<table class="table" id="etcTable">
		    <tbody id="characterTbody">
		    	<c:forEach items="${resumeList}" var="resumeInfo" >
			    	<c:forEach items="${resumeInfo.portfolioList}" var="portfolioInfo">	
	       				<tr>
	       					<td>
	       						<input type="button" class="portBtn" value="${portfolioInfo.port_filename}" onclick="javascript:location.href='/individualMember/portfolioDownload.do?port_filesavename=${portfolioInfo.port_filesavename}&port_filename=${portfolioInfo.port_filename}'" />
	       					</td>
	       				</tr>
	     			</c:forEach>
     			</c:forEach>
		  	</tbody>
		</table>
	</div>
	</div>
</form>
</body>
</html>