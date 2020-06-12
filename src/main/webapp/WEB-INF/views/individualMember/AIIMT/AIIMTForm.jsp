<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="charset=UTF-8">
<title>AI 모의면접</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/annyang.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jqcloud-1.0.4.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jqcloud.css" />
<script src="https://cdn.rawgit.com/mattdiamond/Recorderjs/08e7abd9/dist/recorder.js"></script>
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

#showCondition,#barchart_icon,#radarchart_icon {
	cursor: pointer;
}

#head {
	height: 30px;
}

#myProgress {
	margin-top: -5px;
	width: 100%;
	background-color: #8a8889;
}

#myBar {
	width: 0%;
	height: 5px;
	background-color: #ff0000;
}

.voice_element {
	color: white;
}

.analysisProgress {
	display: inline-block;
	background-color: black;
	width: 100%;
}

.analysisBar {
	background-color: #5fbad5;
	height: 10px;
	width: 0%;
}

.face_element {
	color: white;
}

.percentage {
	margin-left: 5px;
	color: white;
	font-size: 10px;
}

#webcam {
	background-color: black;
}

#message {
	font-size: 18px;
	color: white;
	margin-left: 40px;
	background: none;
	font-weight: bold;
	height: 50px;
	resize: none;
	width: 840px;
	border: none;
	margin-top: 50px;
}

.btn_icon {
	position: absolute;
	top: 23px;
	left: 18px;
}

.content_div {
	background-color: black;
}

.content_div_wrapper {
	margin: 20px;
	height: 910px;
}

.label_key {
	color: white;
}

.label_value {
	color: white;
}

.title {
	color: white;
}

cavas {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	margin-bottom: -3px;
	display: inline-block;
}

#top_x_div svg>g>rect {
	fill: #000;
}

.radarchart_result {
	display: none;
}
</style>
<script type="text/javascript">

var MSAzureKey = "${ms_azure_key}";
Chart.defaults.global.defaultFontColor = '#E0E0E0';
Chart.defaults.scale.gridLines.color = '#9E9E9E';
Chart.defaults.scale.gridLines.ZeroLineColor = '#9E9E9E';

var stream;
var video;
var gainNode;
var clientSentences = "";
var camTestResult;

var registedFaceId = "";
var compareFaceId = "";
var faceCompareResult;

// 얼굴분석 바,레이더 차트 엘리먼트
var face_anger = 0;
var face_contempt = 0;
var face_disgust = 0;
var face_fear = 0;
var face_happiness = 0;
var face_neutral = 0;
var face_sadness = 0;
var face_surprise = 0;

// 목소리 바,레이더 차트 분석 엘리먼트
var voice_calm = 0;
var voice_anger = 0;
var voice_happiness = 0;
var voice_sadness = 0;
var voice_vitality = 0;

// 목소리 도넛차트 엘리먼트
var voicePositive = 1;
var voiceNegative = 1;
var voiceNeutrality = 1;

var faceBarchart;
var faceRadarchart;
var voiceBarchart;
var voiceRadarchart;

var voiceDoughnutchart;

var faceBarchartConfig;
var faceRadarChartConfig;
var voiceBarchartConfig;
var voiceRadarchartConfig;

var voiceDoughnutchartConfig;

var word_array = [];

var AudioContext = window.AudioContext || window.webkitAudioContext;
var audioContext;
var gumStream;
var rec;
var input;
	
var stream;
var video;
var gainNode;
var clientSentences = "";
var camTestResult;

var registedFaceId = "";
var compareFaceId = "";
var faceCompareResult;

// 얼굴분석 바,레이더 차트 엘리먼트
var face_anger;
var face_contempt;
var face_disgust;
var face_fear;
var face_happiness;
var face_neutral;
var face_sadness;
var face_surprise;

// 목소리 바,레이더 차트 분석 엘리먼트
var voice_calm;
var voice_anger;
var voice_happiness;
var voice_sadness;
var voice_vitality;

// 목소리 도넛차트 엘리먼트
var voicePositive;
var voiceNegative;
var voiceNeutrality;

var faceBarchart;
var faceRadarchart;
var voiceBarchart;
var voiceRadarchart;

var voiceDoughnutchart;

var faceBarchartConfig;
var faceRadarChartConfig;
var voiceBarchartConfig;
var voiceRadarchartConfig;

var voiceDoughnutchartConfig;

var word_array = [];

var AudioContext = window.AudioContext || window.webkitAudioContext;
var audioContext;
var gumStream;
var rec;
var input;
	
// 결과 창에 보낼 변수
var set_face_anger;
var set_face_contempt;
var set_face_disgust;
var set_face_fear;
var set_face_happiness;
var set_face_neutral;
var set_face_sadness;
var set_face_surprise;

//결과 창에 보낼 변수
var set_voice_calm;
var set_voice_anger;
var set_voice_happiness;
var set_voice_sadness;
var set_voice_vitality;
	
$(function(){
	
	init(); // 페이지가 로딩되자마자 웹캠과 마이크를 킨다.
	
 	startMikeTest(); // ai모의면접 마이크 테스트 함수 시작

 	createVoiceDoughnutchart('voice_doughnutchart');
	createVoiceBarchart('voice_barchart');
	createVoiceRadarchart('voice_radarchart');
	createFaceBarchart('face_barchart');
	createFaceRadarchart('face_radarchart');
	
	// 바차트 아이콘 눌렀을때
	$('#barchart_icon').click(function(){
		$('.wrapper_content_barchart_result').css('display', 'none');
		$('.wrapper_content_radarchart_result').css('display', 'block');
	});
	
	// 레이다차트 아이콘 눌렀을때
	$('#radarchart_icon').click(function(){
		$('.wrapper_content_barchart_result').css('display', 'block');
		$('.wrapper_content_radarchart_result').css('display', 'none');
	});
	
	// startMikeTest()에서 사용자가 마이크를통해 말한게 바뀌면 실행되는 이벤트
	$('#sttResult').change(function(){
		if($('#sttResult').val().trim() != "안녕하세요 만나서 반갑습니다"){
			$('#message').css("color", "red");
			$('#message').text("\"안녕하세요! 만나서 반갑습니다.\"라고 다시한번 말씀해주세요");
		} else {
			$('#message').css("color", "white");
			$('#message').text("음성이 정확하게 인식되었습니다.");
			annyang.abort();
			startCamTest();
		}
	});
	
	finishInterview();
	
});

//면접끝나고 실행 함수 면접결과로 이동한다.
function finishInterview(){
	video.src = "";
	gainNode.gain.value = 0;
	
	$("#message").text("5초뒤 결과화면으로 이동됩니다.");
	setTimeout(function(){
		var $frm 			= $('<form method="post" action="${pageContext.request.contextPath}/AIIMT/resultAIIMT.do" />');
		
		var $face_anger 	= $('<input type="hidden" name="face_anger" value="' + set_face_anger + '"/>');
		var $face_contempt  = $('<input type="hidden" name="face_contempt" value="' + set_face_contempt + '"/>');
		var $face_disgust   = $('<input type="hidden" name="face_disgust" value="' + set_face_disgust + '"/>');
		var $face_fear	    = $('<input type="hidden" name="face_fear" value="' + set_face_fear + '"/>');
		var $face_happiness = $('<input type="hidden" name="face_happiness" value="' + set_face_happiness + '"/>');
		var $face_neutral 	= $('<input type="hidden" name="face_neutral" value="' + set_face_neutral + '"/>');
		var $face_sadness 	= $('<input type="hidden" name="face_sadness" value="' + set_face_sadness + '"/>');
		var $face_surprise 	= $('<input type="hidden" name="face_surprise" value="' + set_face_surprise + '"/>');
		
		var $voice_calm		 = $('<input type="hidden" name="voice_calm" value="' + set_voice_calm + '"/>');
		var $voice_anger	 = $('<input type="hidden" name="voice_anger" value="' + set_voice_anger + '"/>');
		var $voice_happiness = $('<input type="hidden" name="voice_happiness" value="' + set_voice_happiness + '"/>');
		var $voice_sadness	 = $('<input type="hidden" name="voice_sadness" value="' + set_voice_sadness + '"/>');
		var $voice_vitality	 = $('<input type="hidden" name="voice_vitality" value="' + set_voice_vitality + '"/>');
		
		var $voicePositive	 = $('<input type="hidden" name="voicePositive" value="' + voicePositive + '"/>');
		var $voiceNegative	 = $('<input type="hidden" name="voiceNegative" value="' + voiceNegative + '"/>');
		var $voiceNeutrality = $('<input type="hidden" name="voiceNeutrality" value="' + voiceNeutrality + '"/>');
		
		$('body').append($frm);
		for (var i = 0; i < word_array.length; i++){
			var $wordArrayText = $('<input type="hidden" name="wordArrayResult['+i+'].text" value="' + word_array[i].text + '"/>');
			var $wordArrayWeight = $('<input type="hidden" name="wordArrayResult['+i+'].weight" value="' + word_array[i].weight + '"/>');
			
			$frm.append($wordArrayText);
			$frm.append($wordArrayWeight);
		}
		
		$frm.append($face_anger);
		$frm.append($face_contempt);
		$frm.append($face_disgust);
		$frm.append($face_fear);
		$frm.append($face_happiness);
		$frm.append($face_neutral);
		$frm.append($face_sadness);
		$frm.append($face_surprise);
		
		$frm.append($voice_calm);
		$frm.append($voice_anger);
		$frm.append($voice_happiness);
		$frm.append($voice_sadness);
		$frm.append($voice_vitality);
		
		$frm.append($voicePositive);
		$frm.append($voiceNegative);
		$frm.append($voiceNeutrality);
		
		$frm.submit();
	}, 5000);
}


// 마이크와 테스트 시작 함수
function startMikeTest(){
	var message = [
		"안녕하세요! [inAIR]입니다.",
		"AI모의면접을 시작하기 전에 마이크와 웹캠 장치 테스트를 시작하겠습니다.",
		"먼저 마이크 테스트를 시작하겠습니다.",
		"마이크에 \"안녕하세요. 만나서 반갑습니다.\"라고 천천히 또박또박 말씀해주세요."
	];
	
	var i = 1;
	$("#message").text(message[0]);
	var interval = setInterval(function(){
		if( i == 4) {
			clearInterval(interval);
			annyangStart("test");
		}
		
		$("#message").text(message[i]);
		i++;
	}, 3000);
}

// 웹캠 테스트 시작 함수
function startCamTest(){
	var message = [
		"다음은 웹캠 테스트를 진행하겠습니다.",
		"화면에 면접자님의 얼굴만 나오도록 정위치 해주시길 바랍니다."
	];
	
	var i = 0;
	var interval = setInterval(function(){
		if(i == 2) {
			clearInterval(interval);
			autoCapture();
		}
		
		$("#message").text(message[i]);
		i++;
	}, 3000);
}

// 웹캠 면접자 캡쳐 함수
function autoCapture(){
	var interval = setInterval(function(){
		camCapture();
		
		if(camTestResult == 0){
			$('#message').css("color", "red");
			$('#message').text("얼굴이 인식되지 않았습니다. 면접자님의 얼굴을 정위치 해주시길 바랍니다.");
		} else if (camTestResult == 2){
			$('#message').css("color", "red");
			$('#message').text("다수의 얼굴이 인식되었습니다. 면접자님의 얼굴만 정위치 해주시길 바랍니다.");
		} else if (camTestResult == 1){
			clearInterval(interval);
			$('#message').css("color", "white");
			$('#message').text("면접자님의 얼굴을 인식함과 동시에 등록에 성공했습니다.");
			finishTest();
		}
	}, 1000);
}

// 면접전 테스트 끝함수
function finishTest(){
	var message = [
		"모든 테스트를 통과했습니다.",
		"이제 5초후에 본격적으로 AI모의면접을 시작하겠습니다."
	];
	
	var i = 0;
	
	$('#message').text(message[i]);
	var interval = setInterval(function(){
		$('#message').text(message[i]);
		if(i == 2){
			// 얼굴 분석 인터벌
			startFaceAnalysis();
			
			// 목소리 분석 인터벌
			startVoiceAnalysis();
			audioGraph();
			mainStart();
			clearInterval(interval);
		}
		i++;
	}, 5000);
	
}

// 면접 질문 실행 함수
var mainCount = 0;
var tempCount = 0; 
function mainStart(){
	
	// 최초 한번만 실행
	if (tempCount == 0) {
		recorde();
	}
	
	var message = [
        "Q1. 당신의 강점을 말씀해주세요. (30초)",
		"쉬는 시간입니다. (5초)",
		"Q2. 직무에 필요한 역량이 뭐라고 생각하나요? (30초)",
		"쉬는 시간입니다. (5초)",
		"Q3. 당신에게 부족한 인재상은 무엇입니까? (30초)",
		"쉬는 시간입니다. (5초)",
		"Q4. 인생에서 가장 중요하게 생각하는 가치란 무엇입니까? (30초)",
		"쉬는 시간입니다. (5초)",
		"Q5. 앞으로 원하는 삶은 어떤 삶입니까? (30초)",
		"모든면접이 완료되었습니다. 수고하셨습니다."
	];
	
	$('#myBar').css('width', '0%');
	
	if(mainCount == 9) {
		$('#message').text(message[mainCount]);
		move(20);
		setTimeout(function(){
			finishInterview();
		}, 5000);
	} else if(mainCount%2 != 0) {
		$('#message').text(message[mainCount]);
		move(20);
		setTimeout(function(){
			mainCount++;
			mainStart();
		}, 5000);
	} else if(mainCount%2 == 0) {
		$('#message').text(message[mainCount]);
		move(3.332);
		setTimeout(function(){
			mainCount++;
			mainStart();
		}, 30000);
	}
}

function recorde(){
	tempCount++;
	// 음성 녹음 시작
	startRecorde();
	
	var interval = setInterval(function(){
		// 음성녹음 중지후 서버로 전송
		stopRecorde();
		
		// 음성녹음 시작
		startRecorde();
	}, 5000);
}

// 얼굴분석 인터벌 시작 함수
function startFaceAnalysis(){
	var anaysisFaceInterval = setInterval(function(){
		camCapture();
		if (camTestResult == 0) {
			$('#face_recognize_error_message').text("면접자님의 얼굴을 인식하지 못했습니다.");	
			$('#face_comparer_error_message').text("");
		} else if (camTestResult == 2){
			$('#face_recognize_error_message').text("다수의 얼굴을 인식했습니다.");	
			$('#face_comparer_error_message').text("");
		} else if (camTestResult == 1){
			$('#face_recognize_error_message').text("");	
			var total = face_anger + face_contempt + face_disgust + face_fear + face_happiness + face_neutral + face_sadness + face_surprise;
			
			set_face_anger 		= Math.floor(((face_anger/total) 	 * 100)*100)/100;
			set_face_contempt 	= Math.floor(((face_contempt/total)  * 100)*100)/100;
			set_face_disgust 	= Math.floor(((face_disgust/total) 	 * 100)*100)/100;
			set_face_fear 		= Math.floor(((face_fear/total) 	 * 100)*100)/100;
			set_face_happiness 	= Math.floor(((face_happiness/total) * 100)*100)/100;
			set_face_neutral 	= Math.floor(((face_neutral/total) 	 * 100)*100)/100;
			set_face_sadness	= Math.floor(((face_sadness/total) 	 * 100)*100)/100;
			set_face_surprise	= Math.floor(((face_surprise/total)  * 100)*100)/100;
			
			var valueArray = [set_face_anger, set_face_contempt, set_face_disgust,
			                  set_face_fear, set_face_happiness, set_face_neutral,
			                  set_face_sadness, set_face_surprise];
			
			var faceBarchartDataset = faceBarchartConfig.data.datasets;
			var faceRadarchartDataset = faceRadarchartConfig.data.datasets;
			
			for (var i = 0; i < faceBarchartDataset.length; i++){
				var data = faceBarchartDataset[i].data;
				for (var j = 0; j < data.length; j++) {
					data[j] = valueArray[j];
				}
			}
			
			for (var i = 0; i < faceRadarchartDataset.length; i++){
				var data = faceRadarchartDataset[i].data;
				for (var j = 0; j < data.length; j++) {
					data[j] = valueArray[j];
				}
			}
			
			faceBarchart.update();
			faceRadarchart.update();
			
		}
	}, 1000);
}

// 목소리 분석 함수
var flag = true;
function startVoiceAnalysis(){
	annyangStart("start");
	setInterval(function(){
		if(clientSentences != ""){
			
			analysisVoiceToPiechart(clientSentences);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/AIIMT/sttProcessor.do",
				data : {"clientSentences" : clientSentences},
				dataType : "json",
				type : "post",
				error : function(result){
					clientSentences = "";
					alert("STT 도중 에러가 발생했습니다. 에러코드 : " + result.status);
				},
				success : function(result){
					clientSentences = "";
					word_array = [];
					
					if(result.flag == "true") {
						
						$.each(result.result, function(index, item){
							var element = {text : item.word, weight : item.count};
							
							word_array.push(element);  
						});
						
						$('#word_cloud').empty();
						$('#word_cloud').jQCloud(word_array);
					}
				}
			});
		}
	}, 10000);
}

// 클라이언트 음성 감정분석 긍정|중립|부정 문장을 받으면 그 문장을 해석합니다.
function analysisVoiceToPiechart(sentence){
   $.ajax({
      url : "http://api.adams.ai/datamixiApi/omAnalysis",
      dataType : "json",
      data : {"query" : sentence, "type" : "0", "key" : '${adams_key}'},
      type : "get",
      error : function(result) {
         alert("stt결과를 분석하는데 오류가 발생했습니다. 오류코드 : " + result.status);
      },
      success : function(result) {
    	  
   		  if (result.return_object.label == "긍정") {
			  voicePositive++;
		  } else if (result.return_object.label == "중립") {
		   	  voiceNeutrality++;
		  } else if (result.return_object.label == "부정") {
		      voiceNegative++;
		  }
    	  
         voiceDoughnutchartUpdate();
      }
   });
}

function voiceDoughnutchartUpdate(){
   var valueArray = [voicePositive, voiceNegative, voiceNeutrality];
   
   var voiceDoughnutchartDataset = voiceDoughnutchartConfig.data.datasets;
   
   for (var i = 0; i < voiceDoughnutchartDataset.length; i++){
      var data = voiceDoughnutchartDataset[i].data;
      for (var j = 0; j < data.length; j++) {
         data[j] = valueArray[j];
      }
   }

   voiceDoughnutchart.update();
}


// 화면에 웹캠화면 보여주는 함수 (async를 해야 동기화가 되어 try-catch에서 에러를 잡을 수 있다.)
async function init() {
	
	var constraints = {
			video : true
		};
	
	try {
		stream = await navigator.mediaDevices.getUserMedia(constraints);
		handleSuccess(stream);
	} catch (e) {
		handleError(e);
	}
	audioGraph();
}

// 오디오 볼륨 그래프 생성 함수
function audioGraph() {
	var audioCtx = new (window.AudioContext || window.webkitAudioContext)();
	var voiceSelect = "off";
	var source;
	
	var analyser = audioCtx.createAnalyser();
	analyser.minDecibels = -90;
	analyser.maxDecibels = -10;
	analyser.soomthingTimeContstant = 0.85;

	var distortion = audioCtx.createWaveShaper();
	gainNode = audioCtx.createGain();
	var biquadFilter = audioCtx.createBiquadFilter();
	var convolver = audioCtx.createConvolver();
	
	function makeDistortionCurve(amount) {
		var k = typeof amount === 'number' ? amount : 50,
			n_samples = 44100,
			curve = new Float32Array(n_samples),
			deg = Math.PI / 180,
			i = 0,
			x;
		for ( ; i < n_samples; ++i ) {
			x = i * 2 / n_samples - 1;
			curve[i] = ( 3 + k ) * x * 20 * deg / ( Math.PI + k * Math.abs(x) );
		}
		return curve;
	};
	
	var soundSource;
	
	ajaxRequest = new XMLHttpRequest();
	
	ajaxRequest.open('GET', 'https://mdn.github.io/voice-change-o-matic/audio/concert-crowd.ogg', true);
	
	ajaxRequest.responseType = 'arraybuffer';
	
	ajaxRequest.onload = (function(){
		var audioData = ajaxRequest.response;
		
		audioCtx.decodeAudioData(audioData, function(buffer){
			soundSource = audioCtx.createBufferSource();
			convolver.buffer = buffer;
		}, function(e){ console.log("Error with decoding audio data" + e.err);});
	});
	
	ajaxRequest.send();
	
	var canvas = document.querySelector('.visualizer');
	var canvasCtx = canvas.getContext("2d");
	
	var intendedWidth = 640;
	canvas.setAttribute('width', intendedWidth);
	
	var visualSelect = 'frequencybars';
	
	var drawVisual;
	
	if (navigator.mediaDevices.getUserMedia) {
		var constraints = {audio: true};
		navigator.mediaDevices.getUserMedia (constraints)
			.then(
				function(stream) {
					source = audioCtx.createMediaStreamSource(stream);
					source.connect(distortion);
					distortion.connect(biquadFilter);
					biquadFilter.connect(gainNode);
					convolver.connect(gainNode);
					gainNode.connect(analyser);
					analyser.connect(audioCtx.destination);
					
					visualize();
					voiceChange();
				})
		        .catch( function(err) { console.log('The following gUM error occured: ' + err);})
	} else {
		console.log('getUserMedia not supported on your browser!');
	}
	
	function visualize() {
		WIDTH = canvas.width;
		HEIGHT = canvas.height;
		
		var visualSetting = visualSelect;
		
		if(visualSetting === "frequencybars") {
			analyser.fftSize = 256;
			var bufferLengthAlt = analyser.frequencyBinCount;
			var dataArrayAlt = new Uint8Array(bufferLengthAlt);
			
			canvasCtx.clearRect(0, 0, WIDTH, HEIGHT);
			
			var drawAlt = function() {
				drawVisual = requestAnimationFrame(drawAlt);
				
				analyser.getByteFrequencyData(dataArrayAlt);
				
				canvasCtx.fillStyle = 'rgb(0, 0, 0)';
				canvasCtx.fillRect(0, 0, WIDTH, HEIGHT);
				
				var barWidth = (WIDTH / bufferLengthAlt) * 2.5;
				var barHeight;
				var x = 0;
				
				for(var i = 0; i < bufferLengthAlt; i++) {
					barHeight = dataArrayAlt[i];
					
					canvasCtx.fillStyle = 'rgb(' + (barHeight+100) + ',50,50)';
					canvasCtx.fillRect(x,HEIGHT-barHeight/2,barWidth,barHeight/2);
					
					x += barWidth + 1;
				}
			};
			
			drawAlt();
		}
	}
	
	function voiceChange() {
		distortion.oversample = '4x';
		biquadFilter.gain.setTargetAtTime(0, audioCtx.currentTime, 0)
		
		var voiceSetting = voiceSelect.value;
	}
}

// 비디오 태그에 영상 재생하는 함수
function handleSuccess(stream) {
	video = document.querySelector('video');
	
	video.srcObject = stream;
	video.play();
}

// 웹캠화면 try-catch 처리 함수
function handleError(error){
	if (error.name == 'ConstraintNotSatisfiedError') {
		alert("웹캠 장치 환경이 적합하지 않습니다.");
		studyUpdateClose();
	} else if (error.name == 'PermissionDeniedError') {
		alert("웹캠에 대한 액세스가 거부되었습니다.");
		studyUpdateClose();
	} else {
		alert("장치가 올바르게 연결되어 있지 않거나 작동하지 않습니다.");
		studyUpdateClose();
	}
}

// ai면접 창 진행률 이동 함수
function move(value) {
	var elem = document.getElementById("myBar");
	var width = 0;
	var id = setInterval(frame, 1000);
	function frame() {
		if (width >= 100) {
			clearInterval(id);
		} else {
			width += value;
			elem.style.width = width + "%";
		}
	}
}

// 부모창 새로고침
function studyUpdateClose(){
	opener.document.location.reload();
}

// 안녕 실행 함수
function annyangStart(target) {
	annyang.start({autoRestart : false, continuous : true})
	var recognition = annyang.getSpeechRecognizer();
	var final_transcript = '';
	recognition.onresult = function(event) {
		for (var i = event.resultIndex; i < event.results.length; i++) {
			if (event.results[i].isFinal) {
				final_transcript = event.results[i][0].transcript;
			}
		}
		
		if(target == "test"){
			changeInputHiddenValue(final_transcript);
		} else if(target == "start"){
			clientSentences += final_transcript;
		}
	}
}

// 인풋 타입 히든 친구 값 변경 하는 함수 (이걸써야 인풋히든친구 값이 변경할때 채인지 함수가 실행됨)
function changeInputHiddenValue(value) {
	$('#sttResult').val(value).trigger('change');
}

// 웹캠 영상 자동으로 캡처하는 함수 그리고 캡처후 이미지를 서버로 전송하는 함수
function camCapture() {
	var video = document.getElementById('webcam');
	var canvas = document.getElementById('cam_capture_image');
	var context = canvas.getContext('2d');
	
	canvas.width = video.clientWidth;
	canvas.height = video.clientHeight;
	context.drawImage(video, 0, 0, video.clientWidth, video.clientHeight);
	
	uploadCanvas();
}

// 캔버스 이미지를 서버로 전송하기
function uploadCanvas(){
	var canvas = document.getElementById('cam_capture_image');
	var canvasImgStr = canvas.toDataURL('image/png', 1.0);
	
	// 캔버스의 이미지를 업로드 함
	$.ajax({
		url : "${pageContext.request.contextPath}/AIIMT/canvasDownload.do",
		data : {"strImg" : canvasImgStr},
		type : "post",
		dataType : "text",
		error : function(result){
			alert("캔버스 이미지를 서버로 전송하는 도중에러가 발생했습니다. 에러코드 = " + result.status);
		},
		success : function(result){
			faceAnalysis(result);
		}
	});
}

// 얼굴 분석 함수
function faceAnalysis(imgSaveName) {
	var uriBase = "https://ddit.cognitiveservices.azure.com/face/v1.0/detect";
	var params = {"returnFaceId" : "true",
				  "returnFaceLandmarks" : "false",
				  "returnFaceAttributes" : "age,gender,headPose,smile,facialHair,glasses,emotion,hair,makeup,occlusion,accessories,blur,exposure,noise"};
	$.ajax({
		url : uriBase + "?" + $.param(params),
		beforeSend : function(xhrObj) {
			xhrObj.setRequestHeader("Content-Type", "application/json");
			xhrObj.setRequestHeader("Ocp-Apim-Subscription-key", MSAzureKey);
		},
		
		type : "post",
		data : '{"url": ' + '"' + 'http://1.212.157.149/AIIMTFaces/' + imgSaveName + '"}',
	}).done(function(data){
		if (data.length > 1) { // 다수의 얼굴이 잡혔을때
			camTestResult = 2;
		} else if (data.length == 0) { // 얼굴이 잡히지 않았을때
			camTestResult = 0;
		} else { // 한사람의 얼굴만 잡혔을때
			if(registedFaceId == ""){
				registedFaceId = data[0].faceId;
			}
			compareFaceId = data[0].faceId;
			camTestResult = 1;
			
			$.each(data, function(index, item){
				face_anger += parseFloat(item.faceAttributes.emotion.anger);
				face_contempt += parseFloat(item.faceAttributes.emotion.contempt);
				face_disgust += parseFloat(item.faceAttributes.emotion.disgust);
				face_fear += parseFloat(item.faceAttributes.emotion.fear);
				face_happiness += parseFloat(item.faceAttributes.emotion.happiness);
				face_neutral += parseFloat(item.faceAttributes.emotion.neutral);
				face_sadness += parseFloat(item.faceAttributes.emotion.sadness);
				face_surprise += parseFloat(item.faceAttributes.emotion.surprise);
			});
			
			if(registedFaceId != "" && compareFaceId != ""){
				faceComparer();
			}
		}
	}).fail(function(jqXHR, textStatus, errorThrown){
		var errorString = (errorThrown === "") ? "Error. " : errorThrown + " (" + jqXHR.status + "): ";
		errorString += (jqXHR.responseText === "") ? "" : (jQuery.parseJSON(jqXHR.responseText).message) ? jQuery.parseJSON(jqXHR.responseText).message : jQuery.parseJSON(jqXHR.responseText).error.message;
		alert("얼굴 분석 도중 에러가 발생했습니다 에러코드 : " + errorString);
	});
	
}

// 면접자 얼굴 비교 함수
function faceComparer(){
	$.ajax({
		url : "https://ddit.cognitiveservices.azure.com/face/v1.0/findsimilars",
		beforeSend : function(xhrObj) {
			xhrObj.setRequestHeader("Content-type", "application/json");
			xhrObj.setRequestHeader("Ocp-apim-subscription-key", MSAzureKey);
		},
		type : "post",
		data : '{"faceId" : ' + '"' + registedFaceId + '", "faceIds" : ' + '[' + '"' + compareFaceId + '"' + ']' + '}'
	})
	.done(function(data) {
		faceCompareResult = parseFloat(data[0].confidence);
		
		if(faceCompareResult < 0.7) {
			$('#face_comparer_error_message').text("등록된 면접자님의 얼굴과 다릅니다!");
		} else if (faceCompareResult >= 0.6){
			$('#face_comparer_error_message').text("");
		}
	})
	.fail(function(data) {
		alert("얼굴 비교 도중 에러가 발생했습니다. 에러코드 : " + data.status);
	})
}        

// 녹음 시작 함수
function startRecorde(){
	navigator.mediaDevices.getUserMedia({audio : true, video : false }).then(function(stream){
		audioContext = new AudioContext();
		gumStream = stream;
		input = audioContext.createMediaStreamSource(stream);
		rec = new Recorder(input, {numChannels : 1});
		rec.record();
	})
}

// 녹음 종료 함수 (종료하자마자 서버로 데이터를 보냅니다.)
function stopRecorde(){
	rec.stop();
	gumStream.getAudioTracks()[0].stop();
	rec.exportWAV(blobTransfer);
}

  
// blob를 ajax를 통해 서버로 보내는 함수
function blobTransfer(blob){
	var reader = new FileReader();
	var base64data;
	
	reader.readAsDataURL(blob);
	reader.onloadend = function() {
		base64data = reader.result;
		$.ajax({
			url : "${pageContext.request.contextPath}/AIIMT/voiceDataTransfer.do",
			data : { "base64data" : base64data},
			dataType : "json",
			type : "post",
			error : function(result) {
				alert("음성 파일을 서버로 보내는데 실패했습니다. 오류코드 : " + result.status);
			},
			success : function(result) {
				if(result.error == 0){
					voice_calm += parseInt(result.calm);
					voice_anger += parseInt(result.anger);
					voice_happiness += parseInt(result.joy);
					voice_sadness += parseInt(result.sorrow);
					voice_vitality += parseInt(result.energy);
					
					voiceAnalysis();
				}
			}
		});
	}
}

function voiceAnalysis() {
	var total = voice_calm + voice_anger + voice_happiness + voice_sadness + voice_vitality;
	
	set_voice_calm  	= Math.floor(((voice_calm/total) 	  * 100) * 100) / 100;
	set_voice_anger 	= Math.floor(((voice_anger/total) 	  * 100) * 100) / 100;
	set_voice_happiness = Math.floor(((voice_happiness/total) * 100) * 100) / 100;
	set_voice_sadness 	= Math.floor(((voice_sadness/total)   * 100) * 100) / 100;
	set_voice_vitality	= Math.floor(((voice_vitality/total)  * 100) * 100) / 100;
	
	var valueArray = [set_voice_calm, set_voice_anger, set_voice_happiness, set_voice_sadness, set_voice_vitality];
	
	var voiceBarchartDataset = voiceBarchartConfig.data.datasets;
	var voiceRadarchartDataset = voiceRadarchartConfig.data.datasets;
	
	for (var i =0; i < voiceBarchartDataset.length; i++) {
		var data = voiceBarchartDataset[i].data;
		for (var j = 0; j < data.length; j++) {
			data[j] = valueArray[j];
		}
	}
	
	for (var i = 0; i < voiceRadarchartDataset.length; i++) {
		var data = voiceRadarchartDataset[i].data;
		for (var j = 0; j < data.length; j++) {
			data[j] = valueArray[j];
		}
	}
	
	voiceBarchart.update();
	voiceRadarchart.update();
}

//------------------------------------------------------------ 차트 부분 ------------------------------------------------------------

// word cloud 생성 함수
function createWordCloud(key, value){
	word_array.push({"text" : key, "weight" : value});
	$('#word_cloud').jQCloud(word_array);
}

// 음성 분석 바차트
function createVoiceBarchart(target){
	var ctx = document.getElementById(target);
	voiceBarchartConfig = {
		type : 'bar',
		data : {
			labels : ['차분', '분노', '행복', '슬픔', '활기'],
			datasets : [{
				label : '음성 감정 분석',
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
	};
	
	voiceBarchart = new Chart(ctx, voiceBarchartConfig);
}

// 얼굴 분석 바 차트
function createFaceBarchart(target){
	var ctx = document.getElementById(target);
	faceBarchartConfig = {
		type : 'bar',
		data : {
			labels : ['분노', '경멸', '혐오', '공포', '행복', '중립', '슬픔', '놀람'],
			datasets : [{
				label : '얼굴 감정 분석',
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
	};
	
	faceBarchart = new Chart(ctx, faceBarchartConfig);
}

// 음성 분석 레이다 차트
function createVoiceRadarchart(target){
	var ctx = document.getElementById(target);
	voiceRadarchartConfig = {
		type : 'radar',
		data : {
			labels : ['차분', '분노', '행복', '슬픔', '활기'],
			datasets : [{
				label : '점수',
				data : [voice_calm, voice_anger, voice_happiness, voice_sadness, voice_vitality],
				lineTension : 0.1,
				backgroundColor: "rgba(178, 223, 219,0.2)",
				borderColor : '#009688',
				pointBackGroundColor : '#004D40',
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
	};
	
	voiceRadarchart = new Chart(ctx, voiceRadarchartConfig);
}

// 얼굴분석 레이다차트
function createFaceRadarchart(target){
	var ctx = document.getElementById(target);
	faceRadarchartConfig = {
		type : 'radar',
		data : {
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
			scalStartValue : 100
		}
	};
	
	faceRadarchart = new Chart(ctx, faceRadarchartConfig);
}

// 목소리 분석 도넛차트
function createVoiceDoughnutchart(target){
	var ctx = document.getElementById(target);
	voiceDoughnutchartConfig = {
		type : 'doughnut',
		data : {
			labels : ['긍정', '부정', '중립'],
			datasets : [{
				data : [voicePositive, voiceNegative, voiceNeutrality],
				backgroundColor : [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)'
				]
			}]
		},
		options : {
			cutoutPercentage : 50
		}
	};
	
	voiceDoughnutchart = new Chart(ctx, voiceDoughnutchartConfig);
}

//------------------------------------------------------------ 차트 부분 ------------------------------------------------------------

</script>
</head>
<body>
<body onBeforeUnload="studyUpdateClose()">
	<div style="clear: both;">
		<div style="float: left; width: 50%; height: 100%;">
			<div class="content_div_wrapper" style="margin: 20px;">
				<b id="test" style="color: red;"></b>
				<h3 class="title" style="display: inline-block;">Video</h3>
				<b id="face_recognize_error_message"
					style="color: red; margin-left: 10px;"></b> <b
					id="face_comparer_error_message"
					style="color: red; margin-left: 10px;"></b>
				<div class="content_div" style="height: 560px; margin-bottom: 10px;">
					<video id="webcam" width="920px" height="450px"></video>
					<div id="myProgress">
						<div id="myBar"></div>
					</div>
					<div class="content_div" style="height: 186px;">
						<textarea rows="1" cols="80" id="message"
							style="text-align: center;" disabled></textarea>
					</div>
				</div>
				<div class="content_div"
					style="height: 210px; background-color: #1d213c; clear: both;">
					<div style="display: inline-block; width: 455px;">
						<h3 class="title">Voice Graph</h3>
						<canvas class="visualizer"
							style="width: 455px; height: 228px; background-color: black;"></canvas>
					</div>
					<div style="display: inline-block; width: 455px;">
						<h3 class="title">Voice Analysis</h3>
						<div
							style="width: 457px; height: 228px; display: inline-block; background-color: black;">
							<canvas id="voice_doughnutchart"
								style="width: 457px; height: 228px; display: inline-block;"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="float: right; width: 50%; height: 100%;">
			<div class="content_div_wrapper">
				<div class="wrapper_content_barchart_result">
					<div>
						<h3 class="title" style="display: inline-block;">Voice
							Analysis</h3>
						<h3 class="title"
							style="display: inline-block; margin-left: 345px;">Face
							Analysis</h3>
						<img src="${pageContext.request.contextPath }/images/barchart.png"
							id="barchart_icon"
							style="width: 32px; height: 32px; float: right;">
					</div>
					<div
						style="display: inline-block; width: 450px; height: 450px; margin-right: 14px; background-color: black;">
						<canvas id="voice_barchart" width="450px" height="450px"></canvas>
					</div>
					<div
						style="display: inline-block; width: 450px; height: 450px; background-color: black;">
						<canvas id="face_barchart" width="450px" height="450px"></canvas>
					</div>
				</div>

				<div class="wrapper_content_radarchart_result"
					style="display: none;">
					<div>
						<h3 class="title" style="display: inline-block;">Voice
							Analysis</h3>
						<h3 class="title"
							style="display: inline-block; margin-left: 345px;">Face
							Analysis</h3>
						<img
							src="${pageContext.request.contextPath }/images/radarchart.png"
							id="radarchart_icon"
							style="width: 32px; height: 32px; float: right;">
					</div>
					<div
						style="display: inline-block; width: 450px; height: 450px; margin-right: 14px; background-color: black;">
						<canvas id="voice_radarchart" width="450px" height="450px"></canvas>
					</div>
					<div
						style="display: inline-block; width: 450px; height: 450px; background-color: black;">
						<canvas id="face_radarchart" width="450px" height="450px"></canvas>
					</div>
				</div>

				<div>
					<h3 class="title">Word Cloud</h3>
					<div id="word_cloud"
						style="background-color: black; width: 920px; height: 345px;">
					</div>
				</div>

			</div>
		</div>
	</div>
	<input type="hidden" id="sttResult" value="">
	<canvas id="cam_capture_image" style="display: none;"></canvas>
</body>
</html>
