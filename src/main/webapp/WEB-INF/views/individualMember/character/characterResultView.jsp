<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="individualMemberURL" value="/individualMember"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>
<script type="text/javascript">
	$(function() {
		
		$('#charElement1').text('정직겸손성');
		$('#charElement2').text('정서안전성');
		$('#charElement3').text('외향성');
		$('#charElement4').text('원만성');
		$('#charElement5').text('성실성');
		$('#charElement6').text('개방성');
		
		for(var i = 1; i <= 6; i++) {
			var score = parseInt($('#charScore' + i).text());
			if( score < 31 ) {
				$('#charLevel' + i).text('낮음');
			} else if ( score < 71 ) {
				$('#charLevel' + i).text('보통');
			} else if ( score < 101 ) {
				$('#charLevel' + i).text('높음');
			}
		}
		
		// radar chart - chart.js
		var ctx = document.getElementById('myChart');
		var myChart = new Chart(ctx, {
		    type: 'radar',
		    data: {
		        labels: ['정직겸손성', '정서안전성', '외향성', '원만성', '성실성', '개방성'],
		        datasets: [
		            {
			            label: '내 점수',
			            data: [parseInt($('#charScore1').text()), parseInt($('#charScore2').text()), parseInt($('#charScore3').text()), 
			                   parseInt($('#charScore4').text()), parseInt($('#charScore5').text()), parseInt($('#charScore6').text())],
			            backgroundColor: 'rgba(255, 99, 132, 0.2)',
			            borderWidth: 1
		         	},
		         	{
						label: '평균 점수',
						data: [parseInt(${charScoreAVG[0].scoreAVG}), parseInt(${charScoreAVG[1].scoreAVG}), parseInt(${charScoreAVG[2].scoreAVG}),
						       parseInt(${charScoreAVG[3].scoreAVG}), parseInt(${charScoreAVG[4].scoreAVG}), parseInt(${charScoreAVG[5].scoreAVG}),],
						backgroundColor: 'rgba(66, 135, 245, 0.2)',
			            borderWidth: 1
		         	}
		        ]
		    },
		    options : {
		    	scale: {
		            ticks: {
		                suggestedMin: 50,
		                suggestedMax: 100
		            }
		        }
			}
		 });
	});
	
	 google.charts.load("current", {packages:["corechart"]});
	 google.charts.setOnLoadCallback(drawChart);
	 function drawChart() {
		 for(var i = 1; i <=6; i++) {
			 var data = google.visualization.arrayToDataTable([
							['Element', '내 점수', { role: 'style' } ],
		                    ['내 점수', parseInt($('#charScore' + i).text()), '#5e8ad1'],
		                   ]);
	
		      var view = new google.visualization.DataView(data);
		      view.setColumns([0, 1,
		                       { calc: "stringify",
		                         sourceColumn: 1,
		                         type: "string",
		                         role: "annotation" },
		                       2]);
	
		      var options = {
		    	        width: 900,
		    	        height: 100,
		    	        legend: { position: 'none' },
		    	        bar: { groupWidth: '75%' },
		    	        hAxis: {
		    	        	ticks: [0, 30, 70, 100]
		    	        },
		    	        isStacked: true
		    	      };
		      var chart = new google.visualization.BarChart(document.getElementById("barchart_values" + i));
		      chart.draw(view, options);
		 }
	  }

</script>
<style type="text/css">
	.form-control {
		width: 1000px;
		height: 900px;
	}
	label {
		width: 250px;
		padding: 0 20px;
	}
	#div-1 {
		text-align: center;
	}
	#myChart {
		width: 100px;
		height: 100px;
	}
	.container {
		padding: 20px 50px;
		line-height: 2em;
	}
</style>
</head>
<body>
	<div class="container">
         <h2 class="mb-5">인성검사 결과</h3>
<%-- 	 ${LOGIN_INDVDLMEMINFO.indvdl_name } --%>
		 <div style="width: 400px; height: 400px; margin: auto;"><canvas id="myChart" width="400" height="400"></canvas></div>
         <form action="#" class="p-5 bg-light">
         	<br>
         	<hr color="gray">
           	<c:forEach items="${charResultList }" var="charResult">
           	<br>
           	<div class="form-group">
             	<div id="div-1">
	             	<label style="font-size: 12px; color: gray;">인성요인</label><label style="color: black; font-size: 24px;" id="charElement${charResult.char_element_num }"></label>
	             	<label style="font-size: 12px; color: gray;">등급</label><label style="color: blue; font-size: 24px;" id="charLevel${charResult.char_element_num }"></label>
	             	<label style="font-size: 12px; color: gray;">점수</label><label style="color: black; font-size: 24px;" id="charScore${charResult.char_element_num }">${charResult.char_score }</label>
            	</div>
	            <div id="barchart_values${charResult.char_element_num }" style="width: 900px; height: 150px;"></div> <!-- 그래프 -->
	            <div style="color: black;"> ${charResult.char_res }</div>
	            <br>
             <hr color="gray">
           </div>
           </c:forEach>
         </form>
   	</div>
</body>
</html>