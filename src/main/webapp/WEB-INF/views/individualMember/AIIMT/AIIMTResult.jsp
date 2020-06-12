<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jqcloud-1.0.4.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jqcloud.css" />
<style type="text/css">
html {
	background-color: #1d213c;
	height: 950px;
	width: 1920px;
}

body {
	width: 100%;
	height: 100%;
	margin: 0px;
}

.content {
  	display: inline-block;  
  	width: 450px;  
  	height: 450px;  
  	background-color: black;  
}

.title {
	color: white;
	display: inline-block;
}

.body_parts{
	width: 50%;
	height: 100%;
}

#word_cloud{
	background-color: black;
	width: 920px;
	height: 345px;
}

#Voice_piechart{
	background-color: black;
	width: 920px;
	height: 345px;
}

.charts{
 	border-top: 1px solid black; 
 	border-bottom: 1px solid black; 
 	margin-bottom: -3px;
}

</style>
<script type="text/javascript">

Chart.defaults.global.defaultFontColor = '#E0E0E0';
Chart.defaults.scale.gridLines.color = '#9E9E9E';
Chart.defaults.scale.gridLines.ZeroLineColor = '#9E9E9E';

var voice_calm	 	= parseFloat(${aIIMTResultInfo.voice_calm});
var voice_anger 	= parseFloat(${aIIMTResultInfo.voice_anger});
var voice_happiness = parseFloat(${aIIMTResultInfo.voice_happiness});
var voice_sadness	= parseFloat(${aIIMTResultInfo.voice_sadness});
var voice_vitality	= parseFloat(${aIIMTResultInfo.voice_vitality});

var face_anger		= parseFloat(${aIIMTResultInfo.face_anger});
var face_contempt	= parseFloat(${aIIMTResultInfo.face_contempt}); 
var face_disgust	= parseFloat(${aIIMTResultInfo.face_disgust});  
var face_fear		= parseFloat(${aIIMTResultInfo.face_fear});
var face_happiness	= parseFloat(${aIIMTResultInfo.face_happiness});
var face_neutral	= parseFloat(${aIIMTResultInfo.face_neutral});
var face_sadness	= parseFloat(${aIIMTResultInfo.face_sadness});
var face_surprise	= parseFloat(${aIIMTResultInfo.face_surprise});

var voicePositive	= parseFloat(${aIIMTResultInfo.voicePositive});
var voiceNegative	= parseFloat(${aIIMTResultInfo.voiceNegative});
var voiceNeutrality = parseFloat(${aIIMTResultInfo.voiceNeutrality});

var word_array = [];

$(function(){
	
	
	var data 			= ${wordArrayResult};
	$.each(data, function(index, item){
		var element = {text : item.text, weight : item.weight};
		
		word_array.push(element);
	});
	
	// 목소리 차트 생성
	createVoiceBarchart();
	createVoiceRadarchart();
	
	// 얼굴 차트 생성
	createFaceBarchart();
	createFaceRadarchart();
	
	// 목소리 도넛차트 생성
	createVoiceDoughnutchart();
	
	// 단어 구름 생성
	createWordcloud();
});

// 단어 구름
function createWordcloud(){
	$('#word_cloud').jQCloud(word_array);
}

// 목소리 파이차트
function createVoiceDoughnutchart() {
	var ctx = document.getElementById('voiceDoughnutchart');
	var myChart = new Chart(ctx, {
		type : 'doughnut',
		data : {
			labels : ['긍정', '부정', '중립'],
			datasets : [{
				data : [voicePositive, voiceNegative, voiceNeutrality],
				backgroundColor : [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
				]
			}]
		},
		options : {
			cutoutPercentage : 50
		}
	})
}

// 목소리 바차트
function createVoiceBarchart(){
	var ctx = document.getElementById('voice_barchart_result');
	var myChart = new Chart(ctx, {
		type: 'bar',
		data :{
			labels : ['차분', '분노', '행복', '슬픔', '활기'],
			datasets : [{
				label : "음성 감정 분석",
				data : [voice_calm, voice_anger, voice_happiness, voice_sadness, voice_vitality],
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
		options :{
			scales : {
				yAxes :[{
					ticks :{
						beingAtZero : true,
						min : 0,
						max : 100
					}
				}]
			}
		}
	})
}

// 목소리 레이더 차트
function createVoiceRadarchart(){
	var ctx = document.getElementById('voice_radarchart_result');
	var myChart = new Chart(ctx, {
		type: 'radar',
		data :{
			labels : ['차분', '분노', '행복', '슬픔', '활기'],
			datasets : [{
				label : "점수",
				data : [voice_calm, voice_anger, voice_happiness, voice_sadness, voice_vitality],
				lineTension : 0.1,
				backgroundColor : 'rgba(178, 223, 219, 0.2)',
				borderColor : '#009688',
				pointBackgroundColor : '#004D40',
				pointBorderColor : '#fff',
				pointHoverBackgroundColor : '#fff',
				pointHoverBorderColor : 'rgba(255, 99, 132, 1)'
			}]
		},
		options :{
			responsive : false,
			tooltips : {
				enable : true,
				mode : 'label'
			},
			legend : {
				display : false
			},
			scale : {
				gridLines : {
					color : '#9E9E9E'
				},
				angleLines : {
					color : '#9E9E9E'
				},
				reverse : false,
				ticks : {
					showLabelBackdrop : false,
					min : 0,
					max : 100
				}
			},
			scaleOverride : false,
			scaleSteps : 5,
			scaleStepWidth : 20,
			scaleStartValue : 100
		}
	})
}

// 얼굴 바차트
function createFaceBarchart(){
	var ctx = document.getElementById('face_barchart_result');
	var myChart = new Chart(ctx, {
		type: 'bar',
		data :{
			labels : ['분노', '경멸', '혐오', '공포', '행복', '중립', '슬픔', '놀람'],
			datasets : [{
				label : "얼굴 감정 분석",
				data : [face_anger, face_contempt, face_disgust, face_fear, face_happiness, face_neutral, face_sadness, face_surprise],
				backgroundColor : [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(255, 159, 64, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(121, 94, 12, 0.2)',
					'rgba(194, 74, 231, 0.2)'
				],
				borderColor : [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(255, 159, 64, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(121, 94, 12, 1)',
					'rgba(194, 74, 231, 1)'
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
						max : 100
					}
				}]
			}
		}
	})
}

// 얼굴 레이더 차트
function createFaceRadarchart(){
	var ctx = document.getElementById('face_radarchart_result');
	var myChart = new Chart(ctx, {
		type: 'radar',
		data :{
			labels : ['분노', '경멸', '혐오', '공포', '행복', '중립', '슬픔', '놀람'],
			datasets : [{
				label : '점수',
				data : [face_anger, face_contempt, face_disgust, face_fear, face_happiness, face_neutral, face_sadness, face_surprise],
				lineTension : 0.1,
				backgroundColor: "rgba(178, 223, 219,0.2)",
				borderColor : '#009688',
				pointBackgroundColor : '#004D40',
				pointBorderColor : '#fff',
				pointHoverBackgroundColor : '#fff',
				pointHoverBorderColor : 'rgba(255, 99, 132, 1)',
			}]
		},
		options : {
			responsive : false,
			tooltips : {
				enable : true,
				mode : 'label'
			},
			legend : {
				display : false
			},
			scale : {
				gridLines : {
					color : '#9E9E9E'
				},
				angleLines : {
					color : '#9E9E9E'
				},
				reverse : false,
				ticks : {
					showLabelBackdrop : false,
					min : 0,
					max : 100
				}
			},
			scaleOverride : false,
			scaleSteps : 5,
			scaleStepWidth : 20,
			scaleStartValue : 100
		}
	})
}


</script>
</head>
<body>
<div style="clear: both;">

		<h2 style="color: white; text-align: center; margin: 10px 0 10px 0;">AI모의 면접 결과입니다.</h2>
		<div class="body_parts" style="float: left;">
			<div class="contents_wrapper">
			
				<div>
					<div>
						<h3 class="title">Voice Analysis Result</h3>
						<h3 class="title" style="margin-left: 280px;">Voice Analysis Result</h3>
					</div>
					<div class="content" style="margin-right: 14px;">
						<canvas id="voice_barchart_result" class="charts"  width="450px" height="450px"></canvas>
					</div>
					<div class="content">
						<canvas id="voice_radarchart_result" class="charts"  width="450px" height="450px"></canvas>
					</div>
				</div>

				<div>
					<h3 class="title">Voice Analysis Result</h3>
					<div id="Voice_piechart">
						<canvas id="voiceDoughnutchart" width="920px" height="330px"></canvas>
					</div>
				</div>

			</div>
		</div>
		
		<div class="body_parts" style="float: right;">
			<div class="contents_wrapper">
			
				<div>
					<div>
						<h3 class="title">Face Analysis Result</h3>
						<h3 class="title" style="margin-left: 280px; ">Face Analysis Result</h3>
					</div>
					<div class="content" style="margin-right: 14px; width: 450px; height: 450px;">
						<canvas id="face_barchart_result" class="charts" width="450px" height="450px"></canvas>
					</div>
					<div class="content">
						<canvas id="face_radarchart_result" class="charts" width="450px" height="450px"></canvas>
					</div>
				</div>

				<div>
					<h3 class="title">Word Cloud Result</h3>
					<div id="word_cloud"></div>
				</div>

			</div>
		</div>
		
	</div>
</body>
</html>