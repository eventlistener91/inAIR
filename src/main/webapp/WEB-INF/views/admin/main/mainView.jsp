<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>
<c:url var="adminURL" value="/admin"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
	//지원자 통계
	//성별 통계
	var gendChartsElement = document.getElementById("gendCharts");
	var gendChartsTotalCount = ${indvdlmentInfo.fcount} + ${indvdlmentInfo.mcount};
	
	new Chart(gendChartsElement, {
	    type: 'polarArea',
	    data: {
		    labels: ['여성','남성'],
	    	datasets: [{
					backgroundColor: ['rgba(178, 223, 219,0.2)', 'rgba(54, 162, 235, 0.2)'],
	        		data: [${indvdlmentInfo.fcount}, ${indvdlmentInfo.mcount}],
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
	
	//근무형태 통계
	var workChartsElement = document.getElementById("workCharts");
	var workChartsTotalCount = ${resumeInfo.ingcount} + ${resumeInfo.endcount}+${resumeInfo.workcount};
	
	new Chart(workChartsElement, {
	    type: 'polarArea',
	    data: {
		    labels: ['취업준비중','퇴사','재직중'],
	    	datasets: [{
					backgroundColor: ['rgba(178, 223, 219,0.2)', 'rgba(54, 162, 235, 0.2)','rgba(255, 0, 0, 0.6)'],
	        		data: [${resumeInfo.ingcount}, ${resumeInfo.endcount},${resumeInfo.workcount}],
					borderColor : ['#009688', 'rgba(54, 162, 235, 1)','rgba(255, 0, 0, 0.6)'],
	    	}]
		},
		options:{
            scale:{
                ticks: {
                    min: 0,
                    max: workChartsTotalCount
                }
            }

        }

	});
	//연령별 통계
	var ageChartsElement = document.getElementById("ageCharts");
	var ageTotalCount = ${indvdlAgeInfo.agescope1} + ${indvdlAgeInfo.agescope2}
				        + ${indvdlAgeInfo.agescope3} + ${indvdlAgeInfo.agescope4} 
				        + ${indvdlAgeInfo.agescope5};
	var myBarChart = new Chart(ageChartsElement, {
		type : 'bar',
		data : {
			labels : ['20대', '30대', '40대', '50대', '60대'],
			datasets : [{
				label : '연령별 현황',
				data : [${indvdlAgeInfo.agescope1}, 
				        ${indvdlAgeInfo.agescope2},
				        ${indvdlAgeInfo.agescope3},
				        ${indvdlAgeInfo.agescope4},
				        ${indvdlAgeInfo.agescope5}],
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
	
	
	//탈퇴사유 통계
	var indvdlDropChartsElement = document.getElementById("indvdlDropCharts");
	var indvdlDropTotalCount = ${indvdlDropInfo.indvdldrop1} + ${indvdlDropInfo.indvdldrop2} + ${indvdlDropInfo.indvdldrop3}
				       		   + ${indvdlDropInfo.indvdldrop4} + ${indvdlDropInfo.indvdldrop5} + ${indvdlDropInfo.indvdldrop6} 
				       		   + ${indvdlDropInfo.indvdldrop7} + ${indvdlDropInfo.indvdldrop8} + ${indvdlDropInfo.indvdldrop9}
				       		   + ${indvdlDropInfo.indvdldrop10} ;
	var myBarChart = new Chart(indvdlDropChartsElement, {
		type : 'pie',
		data : {
			labels : ['구직완료', '한시 사용 목적 아이디', '서비스 기능 불만', '개인정보 및 보안 우려', '더이상 이용 안함','아이디 변경/재가입을 위해','타 사이트의 유사서비스 이용','찾고자 하는 정보가 없음','이용 불편','기타'],
			datasets : [{
				label : '탈퇴사유 현황',
				data : [ ${indvdlDropInfo.indvdldrop1}, 
				         ${indvdlDropInfo.indvdldrop2},
				         ${indvdlDropInfo.indvdldrop3},
				         ${indvdlDropInfo.indvdldrop4},
				         ${indvdlDropInfo.indvdldrop5},
				         ${indvdlDropInfo.indvdldrop6}, 
				         ${indvdlDropInfo.indvdldrop7},
				         ${indvdlDropInfo.indvdldrop8},
				         ${indvdlDropInfo.indvdldrop9},
				         ${indvdlDropInfo.indvdldrop10}],
				backgroundColor : [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(255, 159, 64, 0.2)',
					'rgba(255, 0, 0, 0.3)',
					'rgba(0, 255, 0, 0.3)',
					'rgba(0, 0, 255, 0.3)',
					'rgba(192, 192, 192, 0.3)',
					'rgba(255, 255, 0, 0.3)'
				],
				borderColor : [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(255, 159, 64, 1)',
					'rgba(255, 0, 0, 1)',
					'rgba(0, 255, 0, 1)',
					'rgba(0, 0, 255, 1)',
					'rgba(192, 192, 192, 1)',
					'rgba(255, 255, 0, 1)'
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
						max : indvdlDropTotalCount
					}
				}]
			}
		}
	});
	
	
	//탈퇴사유 통계
	var indvdlFinAcadmcrChartsElement = document.getElementById("FinAcadmcrDropCharts");
	var indvdlFinAcadmcrTotalCount = ${indvdlFinAcadmcrInfo.finacdmcr1} + ${indvdlFinAcadmcrInfo.finacdmcr2} + ${indvdlFinAcadmcrInfo.finacdmcr3}
				       		   + ${indvdlFinAcadmcrInfo.finacdmcr4} + ${indvdlFinAcadmcrInfo.finacdmcr5} + ${indvdlFinAcadmcrInfo.finacdmcr6} 
				       		   + ${indvdlFinAcadmcrInfo.finacdmcr7} + ${indvdlFinAcadmcrInfo.finacdmcr8};
	var myBarChart = new Chart(indvdlFinAcadmcrChartsElement, {
		type : 'polarArea',
		data : {
			labels : ['초등학교졸업', '중학교졸업', '학력무관', '고등학교졸업', '대학졸업(2,3년)','대학교졸업(4년)','박사졸업','대학졸업'],
			datasets : [{
				label : '탈퇴사유 현황',
				data : [ ${indvdlFinAcadmcrInfo.finacdmcr1}, 
				         ${indvdlFinAcadmcrInfo.finacdmcr2},
				         ${indvdlFinAcadmcrInfo.finacdmcr3},
				         ${indvdlFinAcadmcrInfo.finacdmcr4},
				         ${indvdlFinAcadmcrInfo.finacdmcr5},
				         ${indvdlFinAcadmcrInfo.finacdmcr6}, 
				         ${indvdlFinAcadmcrInfo.finacdmcr7},
				         ${indvdlFinAcadmcrInfo.finacdmcr8}],
				backgroundColor : [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(255, 159, 64, 0.2)',
					'rgba(255, 0, 0, 0.3)',
					'rgba(0, 255, 0, 0.3)',
					'rgba(0, 0, 255, 0.3)'
				],
				borderColor : [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(255, 159, 64, 1)',
					'rgba(255, 0, 0, 1)',
					'rgba(0, 255, 0, 1)',
					'rgba(0, 0, 255, 1)'

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
						max : indvdlFinAcadmcrTotalCount
					}
				}]
			}
		}
	});
	
	
	//근무형태 통계
	var boardChartElement = document.getElementById("FinBoardCharts");
	var boardChartsTotalCount = ${indvdlboardchartInfo.adminboard1} + ${indvdlboardchartInfo.adminboard2}+${indvdlboardchartInfo.adminboard3}+${indvdlboardchartInfo.adminboard4};
	
	new Chart(boardChartElement, {
	    type: 'polarArea',
	    data: {
		    labels: ['공지사항','자유게시판','멘토게시판','자료실'],
	    	datasets: [{
					backgroundColor: ['rgba(178, 223, 219,0.2)', 'rgba(54, 162, 235, 0.2)','rgba(255, 0, 0, 0.6)','rgba(0, 255, 0, 0.3)'],
	        		data: [${indvdlboardchartInfo.adminboard1}, ${indvdlboardchartInfo.adminboard2},${indvdlboardchartInfo.adminboard3},${indvdlboardchartInfo.adminboard4}],
					borderColor : ['#009688', 'rgba(54, 162, 235, 1)','rgba(255, 0, 0, 0.6)','rgba(0, 255, 0, 1)'],
	    	}]
		},
		options:{
            scale:{
                ticks: {
                    min: 0,
                    max: boardChartsTotalCount
                }
            }

        }

	});
	
	
	
	
	
	
	
	
	
	
	
});
</script>
<body style="background:#fff;">
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
  <div class="container-fluid">
   	<div class="quick-actions_homepage">
    <ul class="quick-actions">
          <li> <a href="${adminURL}/main/mainView.do"> <i class="icon-graph"></i> 통계관리 </a> </li>
          <li> <a href="${adminURL}/memberManagement/individualMemberHome.do"> <i class="icon-people"></i> 회원관리 </a> </li>
          <li> <a href="${adminURL}/ItemManagement/itemManagementHome.do"> <i class="icon-cabinet"></i> 항목관리</a> </li>
          <li> <a href="${adminURL}/freeboard/adminFreeboardHome.do"> <i class="icon-pdf"></i> 게시판관리 </a> </li>
        </ul>
   </div>
   <div class="row-fluid">
      <div class="widget-box">
        <div class="widget-content">
          <div class="row-fluid">
          	<div style="display:flex">
	           <div class="chartsDivStyle" style="margin-bottom:4%;width:30%;height:50%">
	           		<p style="display: flex;justify-content: center;">남녀성비</p>
		            <canvas id="gendCharts"></canvas>
		        </div>
	           <div class="chartsDivStyle" style="margin-bottom:4%;width:30%;height:50%">
		            <p style="display: flex;justify-content: center;">회원연령</p>
		            <canvas id="ageCharts"></canvas>
		        </div>
	           <div class="chartsDivStyle" style="margin-bottom:4%;width:30%;height:50%">
		            <p style="display: flex;justify-content: center;">회원현재근무형태</p>
		            <canvas id="workCharts"></canvas>
		        </div>
	       	</div>
          </div>
        </div>
      </div>
    </div>
   

    <div class="row-fluid">
      <div class="widget-box">
        <div class="widget-content">
          <div class="row-fluid">
             <div style="display:flex">
	           <div class="chartsDivStyle" style="margin-bottom:4%;width:30%;height:50%">
		             <p style="display: flex;justify-content: center;">회원탈퇴사유</p>
		            <canvas id="indvdlDropCharts"></canvas>
		        </div>
	           <div class="chartsDivStyle" style="margin-bottom:4%;width:30%;height:50%">
		          <p style="display: flex;justify-content: center;">회원학력</p>
		            <canvas id="FinAcadmcrDropCharts"></canvas>
		        </div>
		         <div class="chartsDivStyle" style="margin-bottom:4%;width:30%;height:50%">
		            <p style="display: flex;justify-content: center;">게시글 현황</p>
		            <canvas id="FinBoardCharts"></canvas>
		        </div>
	       	</div>
          </div>
        </div>
      </div>
    </div>
    
</div>
</body>
</html>