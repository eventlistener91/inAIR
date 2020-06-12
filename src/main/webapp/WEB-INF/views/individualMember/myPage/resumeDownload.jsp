<%-- <%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%@ page language="java" contentType="application/vnd.ms-word; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@ page language="java" contentType="application/hwp; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.iconStyle{
 		float:left;
 		font-size:40px;
 		color:red;
 	}
 	.divStyle{
 		clear:both; margin-left:5%;
 	}
 	.tableStyle{
 		font-size:19px;
 	}
 	.firstStyle{
 		vertical-align:text-top;
 	}
 	.secondStyle{
 		padding-left:2%;
	    width:19% !important;
 	}
 	.marginTop{
 		margin-top:5%;
 	}
 	.chartsDivStyle{
 		width:48%; float:left; border:1px solid #ced4da;
 	}
</style>
</head>
<body>
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="col-md-13 order-md-last d-flex" style="clear:both; margin-bottom:4%;">
				<div class="bg-white p-5 contact-form" style="width:100%; text-align:left;">
		           	<h1 style="width:100%; text-align:center; float:left; margin-bottom:5%;">${resumeInfo.resume_sj}</h1>
					<div class="divStyle marginTop">
		           		<c:set var="indvdlMemInfo" value="${resumeInfo.indvdlMemInfo}"></c:set>
		           		<table class="table tableStyle" style="width:90%;">
		           			<tbody>
		           				<tr>
		           					<td rowspan='4' style="text-align:center; padding-top:3%;"> 
			            			</td>
		           					<td class="secondStyle" style="padding-left:5%;">이름</td>
		           					<td class="secondStyle">${indvdlMemInfo.indvdl_name}</td>
		           					<td class="secondStyle">생년월일</td>
		           					<td class="secondStyle">${indvdlMemInfo.indvdl_bir}</td>
		           				</tr>
		           				<tr>
		           					<td class="secondStyle" style="padding-left:5%;">연락처</td>
		           					<td class="secondStyle">${indvdlMemInfo.indvdl_tel}</td>
		           					<td class="secondStyle">성별</td>
		           					<td class="secondStyle">${indvdlMemInfo.indvdl_gend}</td>
		           				</tr>
		           				<tr>
		           					<td class="secondStyle" style="padding-left:5%;">이메일</td>
		           					<td class="secondStyle" colspan="3">${indvdlMemInfo.indvdl_mail}</td>
		           				</tr>
		           				<tr>
		           					<td class="secondStyle" style="padding-left:5%;">주소</td>
		           					<td class="secondStyle" colspan="3">${indvdlMemInfo.indvdl_adres1} ${indvdlMemInfo.indvdl_adres2}</td>
		           				</tr>
		           				<tr>
		           					<td></td>
		           					<td class="secondStyle" style="padding-left:5%;">희망직종</td>
		           					<td class="secondStyle" colspan="3">
		           						<c:forEach items="${resumeInfo.lowproList}" var="lowproInfo">
			           						<c:forEach items="${upProList}" var="upProInfo">
			           							<c:if test="${(lowproInfo.lowpro_num eq resumeInfo.lowpro_num) && (lowproInfo.uppro_num eq upProInfo.uppro_num)}">
			           								${upProInfo.uppro_name} &nbsp; &nbsp; > &nbsp;  
			           							</c:if>
			           						</c:forEach>
		           						</c:forEach>
		           						<c:forEach items="${resumeInfo.lowproList}" var="lowproInfo">
		           							<c:if test="${lowproInfo.lowpro_num eq resumeInfo.lowpro_num}"> &nbsp; ${lowproInfo.lowpro_name}</c:if>
		           						</c:forEach>
		           					</td>
		           				</tr>
		           				<tr>
		           					<td></td>
		           					<td class="secondStyle" style="padding-left:5%;">희망연봉</td>
		           					<td class="secondStyle" colspan="3">
		           						<c:forEach items="${salaryList}" var="salaryInfo">
		           							<c:if test="${salaryInfo.salary_num eq resumeInfo.salary_num}">${salaryInfo.salary_scope}</c:if>
		           						</c:forEach>
		           					</td>
		           				</tr>
		           			</tbody>
		           		</table>
		           	</div>
		           	<div class="divStyle marginTop">
		           		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
		           		<h3 style="float:left;">학력사항</h3>
	            		<table class="table" style="width:90%">
	            			<tbody style="text-align:center;">
	            				<tr>
	            					<td><b>재학기간</b></td>
	            					<td><b>학교명</b></td>
	            					<td><b>전공</b></td>
	            					<td><b>학과</b></td>
	            				</tr>
	           					<c:forEach items="${resumeInfo.academicDetaList}" var="academicDetaInfo">
		            				<tr>
		            					<td>${academicDetaInfo.det_acdmcr_entsch} ~ ${academicDetaInfo.det_acdmcr_grdtn}</td>
		            					<td>${academicDetaInfo.det_acdmcr_school}</td>
		            					<td>${academicDetaInfo.det_acdmcr_major}</td>
		            					<td>${academicDetaInfo.det_acdmcr_subjct}</td>
		            				</tr>
	           					</c:forEach>
	            			</tbody>
	            		</table>
		           	</div>
		           	<div class="divStyle marginTop">
		           		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
		           		<h3 style="float:left;">경력사항</h3>
	            		<table class="table" style="width:90%">
	            			<tbody style="text-align:center;">
	            				<tr>
	            					<td><b>재직기간</b></td>
	            					<td><b>직장명</b></td>
	            					<td><b>담당업무</b></td>
	            					<td><b>보유기술</b></td>
	            				</tr>
	           					<c:forEach items="${resumeInfo.careerInfoList}" var="careerInfo">
		            				<tr>
		            					<td>${careerInfo.com_encpn} ~ ${careerInfo.com_retire}</td>
		            					<td>${careerInfo.com_name}</td>
		            					<td>${careerInfo.job}</td>
		            					<td>${careerInfo.tchnlgy}</td>
		            				</tr>
	           					</c:forEach>
	            			</tbody>
	            		</table>
		           	</div>
		           	<c:if test="${!empty resumeInfo.cerificatieList}">
			           	<div class="divStyle marginTop">
			           		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
			           		<h3 style="float:left;">자격증 내역</h3>
		            		<table class="table" style="width:90%">
		            			<tbody style="text-align:center;">
		            				<tr>
		            					<td><b>자격증 명</b></td>
		            					<td><b>발행처</b></td>
		            					<td><b>취득일</b></td>
		            				</tr>
		           					<c:forEach items="${resumeInfo.cerificatieList}" var="cerificatieInfo">
			            				<tr>
			            					<td>${cerificatieInfo.crqfc_name}</td>
			            					<td>${cerificatieInfo.crqfc_pblshr}</td>
			            					<td>${cerificatieInfo.crqfc_acqdt}</td>
			            				</tr>
		           					</c:forEach>
		            			</tbody>
		            		</table>
			           	</div>
		           	</c:if>
		           	<c:if test="${!empty resumeInfo.winningPrizeList}">
			           	<div class="divStyle marginTop">
			           		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
			           		<h3 style="float:left;">수상 내역</h3>
		            		<table class="table" style="width:90%">
		            			<tbody style="text-align:center;">
		            				<tr>
		            					<td><b>자격증 명</b></td>
		            					<td><b>발행처</b></td>
		            					<td><b>취득일</b></td>
		            				</tr>
		           					<c:forEach items="${resumeInfo.winningPrizeList}" var="winningPrizeInfo">
			            				<tr>
			            					<td>${winningPrizeInfo.wnpz_name}</td>
			            					<td>${winningPrizeInfo.cnfer_instt}</td>
			            					<td>${winningPrizeInfo.acqdt}</td>
			            				</tr>
		           					</c:forEach>
		            			</tbody>
		            		</table>
			           	</div>
		           	</c:if>
		           	<c:if test="${!empty resumeInfo.lstcsListList}">
			           	<div class="divStyle marginTop">
			           		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
			           		<h3 style="float:left;">어학 내역</h3>
		            		<table class="table" style="width:90%">
		            			<tbody style="text-align:center;">
		            				<tr>
		            					<td><b>어학시험명</b></td>
		            					<td><b>점수</b></td>
		            					<td><b>급수</b></td>
		            					<td><b>취득일</b></td>
		            				</tr>
		           					<c:forEach items="${resumeInfo.lstcsListList}" var="lstcsListInfo">
			            				<tr>
			            					<td>${lstcsListInfo.lang_test_name}</td>
			            					<td>${lstcsListInfo.score}</td>
			            					<td>${lstcsListInfo.grad}</td>
			            					<td>${lstcsListInfo.acqdt}</td>
			            				</tr>
		           					</c:forEach>
		            			</tbody>
		            		</table>
			           	</div>
		           	</c:if>
		           	<c:if test="${!empty resumeInfo.selfIntroductionList}">
			           	<div class="divStyle marginTop">
			           		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
			           		<h3 style="float:left;">자기소개서</h3>
           					<c:forEach items="${resumeInfo.selfIntroductionList}" var="selfIntroductionInfo">
			            		<table class="table" style="width:90%">
			            			<tbody style="text-align:center;">
			            				<tr>
			            					<td><b>${selfIntroductionInfo.selfintro_qestn}</b></td>
			            				</tr>
			            				<tr>
			            					<td style="text-align:left;">
<!-- 				            					<pre> -->
					            					${selfIntroductionInfo.selfintro_answer}
<!-- 				            					</pre> -->
			            					</td>
			            				</tr>
			            			</tbody>
			            		</table>
           					</c:forEach>
			           	</div>
		           	</c:if>
		           	<c:if test="${!empty resumeInfo.portfolioList}">
			           	<div class="divStyle marginTop">
			           		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
		           			<h3 style="float:left;">포트폴리오 및 기타자료</h3>
           					<c:forEach items="${resumeInfo.portfolioList}" var="portfolioInfo">	
	            				<div>${portfolioInfo.port_filename}</div>
           					</c:forEach>
			           	</div>
		           	</c:if>
	           	</div>
			</div>
		</div>
	</section>
</body>
</html>