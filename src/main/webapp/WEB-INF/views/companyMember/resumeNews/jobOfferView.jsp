<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<c:url var="individualMemberURL" value="/individualMember/jobOffer"></c:url>
<!DOCTYPE>
<html>
<head>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.informationBtn{ 
		line-height:90px;
 		width:25%; float:right; 
 		text-align:center;
 		color:#fdab44;
 		border-radius:6px;
 		font-size:25px !important;
 	} 
 	.informationBtn:hover{ 
 		background-color:#fdab44 !important; 
 		color:#fff !important; 
 	} 
 	.iconStyle{
 		float:left;
 		font-size:40px;
 		color:red;
 	}
 	.divStyle{
 		clear:both; margin-left:5%;
 	}
 	.tableStyle{
 		clear:both; font-size:18px; margin-left:4%;
 	}
 	.joWlfareTableStyle{
 		clear:both; font-size:18px; margin-left:4%; width:100%;
 	}
 	.joCnTableStyle{
 		clear:both; font-size:18px; margin-left:4%; width:100%;
 	}
 	.firstStyle{
 		vertical-align:text-top;
 	}
 	.joWlfareFirstTdStyle{
 		vertical-align:text-top;
 		width:12%;
 		font-weight:bold;
 	}
 	.joCnFirstTdStyle{
 		vertical-align:text-top;
 		width:10%;
 		font-weight:bold;
 	}
 	.secondStyle{
 		padding-left:2%;
	    width:91% !important;
 	}
 	.joWlfareSecondTdStyle{
	    width:91% !important;
 	}
 	.joCnSecondTdStyle{
	    width:91% !important;
 	}
 	.joWlfareSecondETCTdStyle{
 		padding-left: 12.1%;
 	}
 	.joCnSecondETCTdStyle{
 		padding-left: 12.1%;
 	}
 	.marginTop{
 		margin-top:5%;
 	}
 	.companyTable{
 		margin-top:4%; font-size:15px;
 	}
 	.chartsDivStyle{
 		width:48%; float:left; border:1px solid #ced4da;
 	}
 	.btn{
 		border:1px solid #ced4da !important;
 	}
</style>
<script type="text/javascript">
	$(function(){
		//지원자 통계
		
		//성별 통계
		var gendChartsElement = document.getElementById("gendCharts");
		var gendChartsTotalCount = ${joSubmitGenderChartsInfo.fcount} + ${joSubmitGenderChartsInfo.mcount};
		if(gendChartsTotalCount == 0){
			gendChartsTotalCount = 5;
		}
		new Chart(gendChartsElement, {
		    type: 'polarArea',
		    data: {
			    labels: ['여성','남성'],
		    	datasets: [{
						backgroundColor: ['rgba(178, 223, 219,0.2)', 'rgba(54, 162, 235, 0.2)'],
		        		data: [${joSubmitGenderChartsInfo.fcount}, ${joSubmitGenderChartsInfo.mcount}],
						borderColor : ['#009688', 'rgba(54, 162, 235, 1)'],
		    	}]
			},
			options:{
	            scale:{
	                ticks: {
	                    min: 0,
	                    max: gendChartsTotalCount
	                }
	            }

	        }
		});
		
		//연봉
		var salaryTotalCount = ${joSubmitSalaryChartsInfo.salaryscope1} + ${joSubmitSalaryChartsInfo.salaryscope2} + ${joSubmitSalaryChartsInfo.salaryscope3} + ${joSubmitSalaryChartsInfo.salaryscope4} + ${joSubmitSalaryChartsInfo.salaryscope5};
		var salaryChartsElement = document.getElementById("salaryCharts");
		var myBarChart = new Chart(salaryChartsElement, {
			type : 'bar',
			data : {
				labels : ['2,200미만', '2,200 ~ 2,600', '2,600 ~ 3,000', '3,000 ~ 4,000', '4,000이상'],
				datasets : [{
					label : '연봉별 현황',
					data : [${joSubmitSalaryChartsInfo.salaryscope1}, 
					        ${joSubmitSalaryChartsInfo.salaryscope2},
					        ${joSubmitSalaryChartsInfo.salaryscope3},
					        ${joSubmitSalaryChartsInfo.salaryscope4},
					        ${joSubmitSalaryChartsInfo.salaryscope5}],
					backgroundColor : [
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(255, 159, 64, 0.2)'
					],
					borderColor : [
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(255, 159, 64, 1)'
					],
					borderWidth : 1
				}]
			},
			options : {
				scales : {
					yAxes : [{
						ticks : {
							beginAtZero : true,
							min : 0,
							max : salaryTotalCount
						}
					}]
				}
			}
		});
		
		//연령 
		var ageChartsElement = document.getElementById("ageCharts");
		var ageTotalCount = ${joSubmitAgeChartsInfo.agescope1} + ${joSubmitAgeChartsInfo.agescope2}
					        + ${joSubmitAgeChartsInfo.agescope3} + ${joSubmitAgeChartsInfo.agescope4} 
					        + ${joSubmitAgeChartsInfo.agescope5};
		var myBarChart = new Chart(ageChartsElement, {
			type : 'bar',
			data : {
				labels : ['20대', '30대', '40대', '50대', '60대'],
				datasets : [{
					label : '연령별 현황',
					data : [${joSubmitAgeChartsInfo.agescope1}, 
					        ${joSubmitAgeChartsInfo.agescope2},
					        ${joSubmitAgeChartsInfo.agescope3},
					        ${joSubmitAgeChartsInfo.agescope4},
					        ${joSubmitAgeChartsInfo.agescope5}],
					backgroundColor : [
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(255, 159, 64, 0.2)'
					],
					borderColor : [
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(255, 159, 64, 1)'
					],
					borderWidth : 1
				}]
			},
			options : {
				scales : {
					yAxes : [{
						ticks : {
							beginAtZero : true,
							min : 0,
							max : ageTotalCount
						}
					}]
				}
			}
		});
		
		//최종학력
		var finalAcademicChartsElement = document.getElementById("finalAcademicCharts");
		var finalAcademicTotalCount = ${joSubmitFinalAcademicChartsInfo.fin_acdmcr1} + ${joSubmitFinalAcademicChartsInfo.fin_acdmcr2}
        							  + ${joSubmitFinalAcademicChartsInfo.fin_acdmcr3} + ${joSubmitFinalAcademicChartsInfo.fin_acdmcr4}
        							  + ${joSubmitFinalAcademicChartsInfo.fin_acdmcr5};
		var myBarChart = new Chart(finalAcademicChartsElement, {
			type : 'bar',
			data : {
				labels : ['고등학교 졸업', '대학 2~3년제 졸업', '대학교 4년제 졸업', '박사 이상', '기타'],
				datasets : [{
					label : '학력별 현황',
					data : [${joSubmitFinalAcademicChartsInfo.fin_acdmcr1}, 
					        ${joSubmitFinalAcademicChartsInfo.fin_acdmcr2},
					        ${joSubmitFinalAcademicChartsInfo.fin_acdmcr3},
					        ${joSubmitFinalAcademicChartsInfo.fin_acdmcr4},
					        ${joSubmitFinalAcademicChartsInfo.fin_acdmcr5}],
					backgroundColor : [
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(255, 159, 64, 0.2)'
					],
					borderColor : [
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(255, 159, 64, 1)'
					],
					borderWidth : 1
				}]
			},
			options : {
				scales : {
					yAxes : [{
						ticks : {
							beginAtZero : true,
							min : 0,
							max : finalAcademicTotalCount
						}
					}]
				}
			}
		});
		
	});

	function joSubmitResumeList(){
		if(${empty LOGIN_INDVDLMEMINFO}){
			alert('공고 지원은 로그인 후 이용 가능합니다.');
			return false;
		}else{
			var joNum = ${jobOfferInfo.jo_num};
			$.ajax({
				url : '/individualMember/jobOffer/joSubmitResumeListCheck.do'
				,data : { 'jo_num' : joNum }
				,dataType : 'json'
				,type : 'post'
				,error : function(result){
							alert(result.status);
							alert('공고 지원에 실패했습니다.');
						}
				,success : function(result){
								if( result.resultFlag == "false"){
									alert('이미 지원하신 공고입니다.');
								}else{
									pop();								
								}
						   }
			});
		}
	}
	
	function pop(){
		window.open("${individualMemberURL}/joSubmitResumeList.do?jo_num=${jobOfferInfo.jo_num}", '_blank', 'width=960px, height=680px, scrollbars=yes'); return false;
	}
</script>
</head>
<body>
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="col-md-13 order-md-last d-flex" style="clear:both; margin-bottom:4%;">
				<div class="bg-white p-5 contact-form" style="width:100%; text-align:left;">
	            	<c:if test="${jobOfferInfo.jo_aireqst eq 'Y' }">
	            		<label style="font-size:30px; margin-left:3%; margin-top:3;">AI면접 진행 구인공고</label>
	            	</c:if>
	            	<c:if test="${jobOfferInfo.jo_aireqst eq 'Y' }">
	            		<span class="flaticon-team" style="font-size:100px; color:red; float:left; margin-top:1%; margin-right:2%;"></span>
	            	</c:if>
	            	<h1 style="${(jobOfferInfo.jo_aireqst eq 'N')? 'line-height:90px; width:100%;': 'width:88%;'} float:left; margin-bottom:3%; text-align: center;">${jobOfferInfo.jo_sj}</h1>
	            	<div class="divStyle marginTop">
	            		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
	            		<h3 style="float:left;">모집부분 및 자격요건</h3>
	            		<c:forEach items="${jobOfferInfo.recruitmentFieldList}" var="recruitmentFieldInfo" varStatus="status">
		            		<table class="tableStyle" style="width:90%">
		            			<tbody>
			            			<c:if test="${!status.first}">
			            				<tr>
				            				<td colspan="2">
					            				<hr/>
				            				</td>
			            				</tr>
			            			</c:if>
		            				<tr>
		            					<td class="firstStyle"><b>모집분야</b></td>
		            					<td class="secondStyle">${recruitmentFieldInfo.recruitment_field_name}</td>
		            				</tr>
		            				<tr>
		            					<td class="firstStyle"><b>모집인원</b></td>
		            					<td class="secondStyle">${recruitmentFieldInfo.recruitment_field_personnel}명</td>
		            				</tr>
		            				<tr>
		            					<td rowspan="2" class="firstStyle"><b>자격요건</b></td>
		            					<td class="secondStyle">${recruitmentFieldInfo.recruitment_field_career}</td>
		            				</tr>
		            				<tr>
		            					<td class="secondStyle">직급 : ${recruitmentFieldInfo.clsfString}</td>
		            				</tr>
		            				<tr>
		            					<td class="firstStyle"><b>담당업무</b></td>
		            					<td class="secondStyle">${recruitmentFieldInfo.recruitment_field_job}</td>
		            				</tr>
		            				<c:if test="${!empty recruitmentFieldInfo.recruitment_field_department}">
		            					<tr>
			            					<td class="firstStyle"><b>근무부서</b></td>
			            					<td class="secondStyle">${recruitmentFieldInfo.recruitment_field_department}</td>
		            					</tr>
		            				</c:if>
		            			</tbody>
		            		</table>
	            		</c:forEach>
	            	</div>
	            	<div class="divStyle marginTop">
	            		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
	            		<h3 style="float:left;">지원자격</h3>
	            		<table class="tableStyle">
	            			<tbody>
	            				<tr>
	            					<td class="firstStyle"><b>학력</b></td>
	            					<td class="secondStyle">${jobOfferInfo.finAcdmcrString}</td>
	            				</tr>
	            			</tbody>
	            		</table>
	            	</div>
	            	<div class="divStyle marginTop">
	            		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
	            		<h3 style="float:left;">접수기간</h3>
	            		<table class="tableStyle">
	            			<tbody>
	            				<tr>
	            					<td class="firstStyle"><b>접수기간</b></td>
	            					<td class="secondStyle">${jobOfferInfo.jo_rgsde} ~ ${jobOfferInfo.jo_clos}</td>
	            				</tr>
	            			</tbody>
	            		</table>
	            	</div>
	            	<c:if test="${jobOfferInfo.jo_aireqst eq 'Y' }">
		            	<div class="divStyle marginTop">
		            		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
		            		<h3 style="float:left;">AI면접 진행기간</h3>
		            		<table class="tableStyle">
		            			<tbody>
		            				<tr>
		            					<td style="width:20%;"><b>AI면접 진행기간</b></td>
		            					<td class="secondStyle">${jobOfferInfo.jo_aistart} ~ ${jobOfferInfo.jo_aiend}</td>
		            				</tr>
		            			</tbody>
		            		</table>
		            	</div>
	            	</c:if>
	            	<div class="divStyle marginTop">
	            		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
	            		<h3 style="float:left;">담당자 정보</h3>
	            		<table class="tableStyle">
	            			<tbody>
	            				<tr>
	            					<td class="firstStyle" style="width:20%;"><b>담당자 이름</b></td>
	            					<td class="secondStyle">${jobOfferInfo.jo_manager_name}</td>
	            				</tr>
	            				<c:if test="${!empty jobOfferInfo.jo_manager_tel}">
	            					<tr>
		            					<td class="firstStyle"><b>담당자 연락처</b></td>
		            					<td class="secondStyle">${jobOfferInfo.jo_manager_tel}</td>
	            					</tr>
	            				</c:if>
	            				<c:if test="${!empty jobOfferInfo.jo_manager_mail}">
	            					<tr>
		            					<td class="firstStyle"><b>담당자 이메일</b></td>
		            					<td class="secondStyle">${jobOfferInfo.jo_manager_mail}</td>
	            					</tr>
	            				</c:if>
	            			</tbody>
	            		</table>
	            	</div>
	            	<div class="divStyle marginTop">
	            		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
	            		<h3 style="float:left;">근무조건 및 근무환경</h3>
	            		<table class="tableStyle">
	            			<tbody>
	            				<tr>
	            					<td class="firstStyle"><b>급여</b></td>
	            					<td class="secondStyle">${jobOfferInfo.salaryString}</td>
	            				</tr>
	            				<tr>
	            					<td class="firstStyle"><b>고용형태</b></td>
	            					<td class="secondStyle">${jobOfferInfo.emplymString}</td>
	            				</tr>
	            				<tr>
	            					<td class="firstStyle"><b>근무 요일</b></td>
	            					<td class="secondStyle">${jobOfferInfo.jo_work_day}</td>
	            				</tr>
	            				<tr>
	            					<td class="firstStyle"><b>근무 시간</b></td>
	            					<td class="secondStyle">${jobOfferInfo.jo_work_time}</td>
	            				</tr>
	            				<tr>
	            					<td class="firstStyle"><b>근무지</b></td>
	            					<td class="secondStyle">${jobOfferInfo.jo_adres1} ${jobOfferInfo.jo_adres2}</td>
	            				</tr>
	            			</tbody>
	            		</table>
	            	</div>
	            	<div class="divStyle marginTop">
	            		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
	            		<h3 style="float:left;">복리후생</h3>
	            		${jobOfferInfo.jo_wlfare}
	            	</div>
	            	<div class="divStyle marginTop">
	            		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
	            		<h3 style="float:left;">기타참고사항</h3>
	            		${jobOfferInfo.jo_cn}
	            	</div>
	            	<c:if test="${!empty jobOfferFileList}">
		            	<div class="divStyle marginTop">
		            		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
		            		<h3 style="float:left;">첨부파일</h3>
		            		<div style="clear:both;">
			            		<c:forEach items="${jobOfferFileList}" var="jobOfferFileInfo">
			            			<input type="button" class="btn" value="${jobOfferFileInfo.jo_file_name}" onclick="javascript:location.href='${individualMemberURL}/jobOfferFileDownload.do?jo_file_savename=${jobOfferFileInfo.jo_file_savename}&jo_file_name=${jobOfferFileInfo.jo_file_name}'" >
			            		</c:forEach>
		            		</div>
		            	</div>
	            	</c:if>
	            	<div class="divStyle marginTop">
	            		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
	            		<h3 style="float:left;">지원자 통계</h3>
	            		<div style="clear:both;">
	            			<div class="bg-light" style="height:150px; width:300px; margin-bottom:4%;">
		            			<div class="desc">
					                <h5 style="margin-bottom:0; margin-left:60px;">
					                	<label class="icon-users" style="margin:20px;"></label>
					                	지원자 수
					                </h5>
					                <strong style="float:left;margin-left: 130px;font-size:50px;margin-top:0;line-height:50px;">${fn:length(joSubmitList)}</strong>
					                <h5 style="float:left; margin-top:3px; line-height:50px; margin-left:10px;"> 명</h5>
				              	</div>
	            			</div>
	            		</div>
	            		<div class="chartsDivStyle" style="margin-bottom:4%;">
	            			<canvas id="gendCharts"></canvas>
	            		</div>
	            		<div class="chartsDivStyle" style="margin-left:4%;">
	            			<canvas id="salaryCharts"></canvas>
	            		</div>
	            		<div class="chartsDivStyle" style="clear:both; margin-bottom:4%;">
	            			<canvas id="ageCharts"></canvas>
	            		</div>
	            		<div class="chartsDivStyle" style="margin-left:4%;">
	            			<canvas id="finalAcademicCharts"></canvas>
	            		</div>
	            	</div>
	            	<div class="divStyle marginTop">
	            		<c:set var="companyInfo" value="${companyMemVo.companyVo}"></c:set>
	            		<label class="icon-check-square-o iconStyle" style="float:left;"></label>
	            		<h3 style="float:left;">기업정보</h3>
	            		<table class="table companyTable">
							<tbody>
								<tr>
									<td rowspan="7" style="width:39%; text-align:center; padding-top:3%;">
										<c:if test="${!empty comProfileInfo}">
											<img src="/files/${comProfileInfo.com_file_savename }" alt="기업프로필사진" style="width:235px; height:165px; margin-top:15%;">
										</c:if>
									</td>
									<td colspan="2"><b>${companyInfo.corp_name}</b></td>
								</tr>
								<tr>
									<td>대표자 명</td>
									<td>${companyInfo.ceo_nm}</td>
								</tr>
								<tr>
									<td>대표 전화</td>
									<td>${companyInfo.phn_no}</td>
								</tr>
								<tr>
									<td>업종</td>
									<td>${companyMemVo.upinduty_name} ${companyMemVo.lwinduty_name}</td>
								</tr>
								<tr>
									<td>매출액</td>
									<td>${companyMemVo.com_selng}원</td>
								</tr>
								<tr>
									<td>홈페이지</td>
									<td>${companyInfo.hm_url}</td>
								</tr>
								<tr>
									<td>기업주소</td>
									<td>${companyInfo.adres}</td>
								</tr>
							</tbody>
						</table>
	            	</div>
	            </div>
        	</div>
		</div>
	</section>
</body>
</html>