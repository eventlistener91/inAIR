<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.6/Chart.bundle.min.js"></script>
<style type="text/css">

#title{
	text-align: center;
}

.buttons{
	border: none;
	width: 100px;
	height: 50px;
	font-size: 16px;
}

li{
	margin-bottom: 20px;
}

#cancel{
	background-color: #8e8e8e;
	color: white;
	margin-right: 15px;
}

#confirm{
	background-color: #4271d7;
	color: white;
}

.li_titles{
	display: block;
}


<!--                                                                                                            -->
#aiDiv {
	background-color: #1d213c;
	height: 800px;
	width: 100%;
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
	margin: 10px;
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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
var i = 2; // 로딩이미지 돌리기위한 변수
var objPopup; // 자식창을 담을 변수

$(function(){
	
	// ai모의면접 확인 버튼 클릭 이벤트
	$('#confirm').click(function(){
		if(!$('#AI_OK').is(':checked')){
			alert("동의를 하셔야 진행할 수 있습니다.");
		} else {
			var url = "/AIIMT/AIIMTForm.do";
			var popupWidth = 1920; // 팝업창 가로크기
			var popupHeight = 950; // 팝업창 세로 크기
	
			var popupX = (screen.availWidth / 2) - (popupWidth / 2); // 팝업창 x축위치
			var popupY = (screen.availHeight / 2) - (popupHeight / 2); // 팝업창 y축위치
			var options = "width=" + popupWidth + ", height=" + popupHeight + ", left=" + popupX + ", top=" + popupY; // 팝업창 옵션 세팅
			
			objPopup = window.open(url, 'AI모의면접', options); // 팝업창을 열고 팝업창을 담을 전역변수 초기화
			LoadingWidthMask(); // 팝업창을 띄우고 부모창 막기
		}
	});
	
	// 로딩화면 이미지 돌리기 (0.2초마다 이미지를 바꿉니다.)
	setInterval(function(){
		i++;
		if(i==13){
			i=2;
		}
		$('#loadingImg').attr("src", "${pageContext.request.contextPath}/images/loadingImgs/loading" + i + ".png");
	}, 200);
	
});

// 자식창 종료 이벤트 (body에 closePopup()함수 실행시 콜백)
function closePopup(){
	if(objPopup != null) {
		objPopup.close();
	}
}

// ai모의면접 진행시 부모창 막기
function LoadingWidthMask() {
	deleteWordArrayFromSession();
	var maskHeight = $(document).height();
	var maskWidth = window.document.body.clientWidth;
	
	var mask = '';
	mask += "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'>";
	mask += "</div>";
	
	var img = '';
	img += "<div style='background-color: white; width: 600px; height: 300px; display:inline-block; position: absolute; z-index: 9001; top: 350px; left:650px; margin: auto; border: 1px solid black;'>";
	img += " <img src='${pageContext.request.contextPath}/images/loadingImgs/loading1.png' id='loadingImg' style=' width:128px; height:128px; display: block; margin: auto; margin-top: 20px; margin-bottom: 20px;'/>";
	img += " <b style='color: black; font-size: 32px; margin-left: 40px; margin-top: 30px;'>AI모의면접이 진행중입니다. (종료:F5)</b>";
	img += "</div>";
	
	$('body').append(mask);
	$('body').append(img);
	$('#mask').css({'width' : maskWidth, 'height' : maskHeight, 'opacity' : '0.3'});
	$('#mask').css({'display' : 'inline-block'});
}

//에이잭스를 이용해서 세션에 저장된 word_array 삭제하는 함수
function deleteWordArrayFromSession() {
	$.ajax({
		url : "${pageContext.request.contextPath}/AIIMT/deleteWordArrayFromSession.do",
		error : function(result) {
			alert("세션에 word_array를 삭제하는 데 오류가 발생했습니다. 오류코드 : " + result.status);
		}
	});
}

</script>
</head>
<body style="position: relative;" onunload="closePopup();">
	<section class="ftco-section bg-light">
		<div class="container">
			<div id="title"><h3>AI 모의면접 설명</h3></div>
			
			<div>
				<img src="${pageContext.request.contextPath }/images/sample.png">
			</div>
			
			<div style="margin-top: 20px; background-color: #e0e0e0; padding: 20px;">
				<h2 style="text-align: center; margin-top: 20px; margin-bottom: 20px;">원활한 AI모의면접을 위해 AI모의면접 화면을 설명해드리겠습니다.</h3>
				<table style="width: 100%; color: black; text-align: center;">
					<tr style="border-top: 1px solid #cecece; border-bottom: 1px solid #cecece; text-indent: 20px;">
						<td style="padding: 15px;">
							Video
						</td>
						<td style="padding: 15px;">
							웹캠으로부터 전달받은 영상입니다. 화면에 두명 이상의 얼굴이 있어서는 안됩니다. <br>면접자님 한분만 정위치 해주세요.
						</td>
					</tr>
					<tr style="border-top: 1px solid #cecece; border-bottom: 1px solid #cecece; text-indent: 20px; padding: 20px;">
						<td style="padding: 15px;">
							Voice Graph
						</td>
						<td style="padding: 15px;">
							마이크로부터 음성을 전달받고 음성의 크기 그래프로 나타냅니다.
						</td>
					</tr>
					<tr style="border-top: 1px solid #cecece; border-bottom: 1px solid #cecece; text-indent: 20px;">
						<td style="padding: 15px;">
							Voice Analysis
						</td>
						<td style="padding: 15px;">
							마이크로부터 음성을 전달받고 음성의 크기 그래프로 나타냅니다. <br>레이더차트와 바차트를 제공합니다.
						</td>
					</tr>
					<tr style="border-top: 1px solid #cecece; border-bottom: 1px solid #cecece; text-indent: 20px;">
						<td style="padding: 15px;">
							Face Analysis
						</td>
						<td style="padding: 15px;">
							웹캠으로부터 얼굴을 감지해 감정변화를 추출하여 그래프로 나타냅니다. <br>레이더차트와 바차트를 제공합니다.
						</td>
					</tr>
					<tr style="border-top: 1px solid #cecece; border-bottom: 1px solid #cecece; text-indent: 20px;">
						<td style="padding: 15px;">
							Word Cloud
						</td>
						<td style="padding: 15px;">
							면접중 면접자님이 많이 사용하신 단어를 추출해 단어 구름형태로 나타냅니다. <br>많이 사용 할수록 단어의 크기가 커집니다.
						</td>
					</tr>
				</table>
			</div>
			
			<div style="margin-top: 20px; background-color: #e0e0e0; padding: 20px;">
				<p style="color: white; background-color: #3498db; text-align: center;">정보 활용 동의</p>
				<h3 style="padding-left: 10px; text-align: center; margin-top: 10px;">영상 녹화 및 음성녹음에 관한 동의</h3>
				<ul style="margin-left: 200px; margin-top: 20px;">
					<li style="color: black;">1. 응시 데이터는 온라인 AI검사에 필수적이니 수집항목으로 해당 정보를 응시자로부터<br>제공받지 못하면 온라인 AI검사를 진행 할 수 없습니다.</li>
					<li style="color: black;">2. 온라인 AI검사 과정에서 수집된 개인 정보는 결과 분석을 위한 목적 이외에는 <br> 사용되지 않습니다.</li>
				</ul>
				
				<div style="text-align: center;">
					<input type="checkbox" value="" id="AI_OK" style="margin-right: 5px;"><span style="color: black;">본인은 위 내용을 잘 읽어 보았으며 내용에 동의합니다.</span>
				</div>
				
				<button id="confirm" style="border: none; margin-top: 20px; text-align: center; width: 100%;">동의 및 온라인 면접 시작하기</button>
			</div>
							
		</div>
	</section>
</body>
</html>