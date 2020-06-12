<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="google-signin-client_id" content="429193550282-0vtvu8m5avrb1ucklkh7r1comiqkpp37.apps.googleusercontent.com">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>inAIR</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="https://apis.google.com/js/platform.js" async defer></script>
<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/css/util.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/css/main.css">

<script src="${pageContext.request.contextPath}/js/commons.js"></script>
<script src="${pageContext.request.contextPath}/js/validation.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/rsa/jsbn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/rsa/prng4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/rsa/rng.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/rsa/rsa.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/animsition/js/animsition.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/bootstrap/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/select2/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/daterangepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/countdowntime/countdowntime.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

<style type="text/css">

#backBtn{
	cursor: pointer;
}

#refreshCaptchaBTN{
	cursor: pointer;
}

.joinBtns{
	height: 80px;
	padding-left: 50px;
}

.joinTarget{
	line-height: 80px;
	font-size: 25px;
}

#indvdlBtn{
	cursor: pointer;
	background-color: #7185e8;
}

#comMemBtn{
	cursor: pointer;
	background-color: white;
	border-top: 1px solid #999999;
	border-right: 1px solid #999999;
	border-bottom: 2px solid #7185e8;
}

#joinTargetIndvdl{
	color: white;
}

#joinTagetComMem{
	color: #999999;
}

</style>

<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";
var captchaKey = "${captchaKey}";
var mailKey = "";
var clientMailKey = "";
var telKey = "";
var clientTelKey = "";

var idFlag = false;
var passFlag = false;
var passCheckFlag = false;
var nameFlag = false;
var birFlag = false;
var genderFlag = false;
var telFlag = false;
var mailFlag = false;
var adresFlag = false;
var detailAdresFlag = false;
var academicFlag = false;
var proFlag = false;
var captchaFlag = false;

var mailCertification = false;
var telCertification = false;

var isSocial = false;
var naverSocialIsPass = "${naverSocialIsPass}";
var googleSocialIsPass = "${googleSocialIsPass}";

$(function(){
	
	if(naverSocialIsPass == "true") {
		naverLoginFunction("${indvdl_gender}", "${indvdl_name}", "${indvdl_mail}");
	}
	
	if(googleSocialIsPass == "true") {
		googleLoginFunction("${indvdl_mail}", "${indvdl_name}");
	}
	
	// 생년월일 년세팅
	$('#indvdl_birYear').append(getYearsOptions(new Date()));
	
	// 생년월일 월세팅
	$('#indvdl_birMonth').append(getMonthOptions());
	
	// 일이 바뀌때 이벤트
	$('#indvdl_birDay').change(function(){
		if($('#indvdl_birMonth').val() != "" && $('#indvdl_birYear').val() != "" && $('#indvdl_birDay').val() != ""){
			$('#birCheckResult').text("");
			birFlag = true;
		}
	});
	
	// 월이 바뀌면 일이 세팅되는 이벤트
	$('#indvdl_birMonth').change(function(){
		if($('#indvdl_birYear').val() != ""){
			$('#indvdl_birDay option').remove();
			
			var lastDates = getLastDate(new Date($('#indvdl_birYear').val() + '-' + $('#indvdl_birMonth').val()));
			for (var i = 1; i <= lastDates; i++) {
				$('#indvdl_birDay').append('<option value ="' + i + '">' + i + '</option>');
			}
		} 
		
		if($('#indvdl_birMonth').val() == ""){
			birFlag = false;
			$('#birCheckResult').text("필수 정보입니다.");
		}
		
		if($('#indvdl_birMonth').val() != "" && $('#indvdl_birYear').val() != "" && $('#indvdl_birDay').val() != ""){
			$('#birCheckResult').text("");
			birFlag = true;
		}
	});
	
	// 년이 바뀌면 일이 세팅되는 이벤트
	$('#indvdl_birYear').change(function(){
		if($('#indvdl_birMonth').val() != ""){
			$('#indvdl_birDay option').remove();
			
			var lastDates = getLastDate(new Date($('#indvdl_birYear').val() + '-' + $('#indvdl_birMonth').val()));
			for (var i = 1; i <= lastDates; i++) {
				$('#indvdl_birDay').append('<option value ="' + i + '">' + i + '</option>');
			}
		}
		if($('#indvdl_birYear').val() == ""){
			birFlag = false;
			$('#birCheckResult').text("필수 정보입니다.");
		}
		
		if($('#indvdl_birMonth').val() != "" && $('#indvdl_birYear').val() != "" && $('#indvdl_birDay').val() != ""){
			$('#birCheckResult').text("");
			birFlag = true;
		}
	});
	
	// 성별 바뀔때 이벤트
	$('#indvdl_gender').change(function(){
		if($('#indvdl_gender').val() != ""){
			$("#genderCheckResult").text("");
			genderFlag = true;
		} else {
			$("#genderCheckResult").text("필수 정보입니다.");
			genderFlag = false;
		}
	});
	
	// 학력 바뀔때 이벤트
	$('#indvdl_academic').change(function(){
		if($('#indvdl_academic').val() != ""){
			$('#academicCheckResult').text("");
			academicFlag = true;
		} else {
			$('#academicCheckResult').text("필수 정보입니다.");
			academicFlag = false;
		}
	});
	
	// 상위 직종 선택하면 하위직종 옵션 세팅 이벤트
	$('#indvdl_hopeUpPro').change(function(){
		if($('#indvdl_hopeUpPro').val() != ""){
			$('#indvdl_hopeLowPro option').remove();
			getLowPROList($('#indvdl_hopeUpPro').val(), '#indvdl_hopeLowPro');
			$("#hopeProCheckResult").text("");
			proFlag = true;
		} else {
			$('#indvdl_hopeLowPro option').remove();
			$('#indvdl_hopeLowPro').append("<option value='' >하위직종</option>");
			$("#hopeProCheckResult").text("필수 정보입니다.");
			proFlag = false;
		}
		
		if($('#indvdl_hopeUpPro').val() != "" && $('#indvdl_hopeLowPro').val() != ""){
			$("#hopeProCheckResult").text("");
			proFlag = true;
		}
	});
	
	// 하위 직종 바뀔때 이벤트
	$('#indvdl_hopeLowPro').change(function(){
		if($('#indvdl_hopeUpPro').val() != "" && $('#indvdl_hopeLowPro').val() != ""){
			proFlag = true;
		}
	});
	
	// 우편번호 검색 버튼 이벤트
	$('#searchZipBTN').click(function(){
		var url = "/individualMember/join/zipSearchForm.do";
		var options = 'width=700px, height=600px, resizable=no, scrollbars=no, copyhistory=no';
		
		window.open(url, '우편번호 검색', options);
	});
	
	// 메일인증 버튼 이벤트 & 정규식
	$('#mailCheckBTN').click(function(){
		if (!$('#indvdl_mail').val().validationMail()){
			mailFlag = false;
			$('#MailCheckResult').text("형식에 맞지 않는 메일입니다.");
		} else {
			$('#MailCheckResult').text("");
			
			$.ajax({
				url : "${pageContext.request.contextPath}/individualMember/join/mailCheck.do",
				data : {"indvdl_mail" : $('#indvdl_mail').val()},
				dataType : "json",
				type : "post",
				error : function(result){
					mailFlag = false;
					alert("메일을 보내는데 실패했습니다. 관리자에게 문의해주세요.");
				},
				success : function(result){
					if (result.resultFlag != "true") {
						mailFalg = false;
						$('#mailKeyLabel').empty();
						$('#mailKeyTr').empty();
						
						$('#MailCheckResult').text("이미 중복된 메일입니다.");
					} else {
						mailFlag = true;
						$('#mailKeyLabel').empty();
						$('#mailKeyTr').empty();
						
						alert("[" + $('#indvdl_mail').val() + "]으로 인증메일을 전송했습니다.");
						mailKey = result.randomString;
						var mailKeyLabel = "<td colspan='4'><label for='mailKey' style='font-size: 12px; margin-top: 10px;'><b>인증번호를 입력해주세요.</b></label></td>";
						var mailKeyDiv = "<td colspan='3'>" +
										 "<div class='wrap-input100 validate-input'>" +
										 "<input type='text' id='mailKey' name='mailKey' class='input100' style='height: 40px;'>" +
										 "<span class='focus-input100-1'></span>" +
										 "<span class='focus-input100-2'></span>" +
										 "</div>";
						$('#mailKeyLabel').append(mailKeyLabel);
						$('#mailKeyTr').append(mailKeyDiv);
						
						$('#indvdl_mail').attr("disabled", "disabled");
						$('#indvdl_mail').css("background-color", "#f0f0f0");
					}
				}
			});
		}
	});
	
	// 문자인증 버튼 이벤트 & 정규식 이벤트
	$('#telCheckBTN').click(function(){
		if (!$('#indvdl_tel').val().validationTEL()){
			telFlag = false;
			$('#TELCheckResult').text("형식에 맞지 않는 번호입니다.");
		} else {
			$('#TELCheckResult').text("");
			var arrayTelNum = $('#indvdl_tel').val().split("-");
			var telNum = "";
			
			$.each(arrayTelNum, function(index, item){
				telNum += item;
			})
			
			$('#indvdl_tel').val(telNum);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/individualMember/join/telCheck.do",
				data : {"indvdl_tel" : telNum},
				dataType : "json",
				type : "post",
				error : function(result) {
					telFlag = false;
					alert(result.status);
					alert("문자 전송에 실패했습니다. 관리자에게 문의해주세요.");
				},
				success : function(result) {
					telFlag = true;
					$('#telKeyLabel').empty();
					$('#telKeyTr').empty();
					
					alert("[" + telNum + "]으로 인증문자를 발송했습니다.");
					telKey = result.randomString;
					var telKeyLabel = "<td colspan='4'><label for='telKey' style='font-size: 12px; margin-top: 10px;'><b>인증번호를 입력해주세요.</b></label></td>";
					var telKeyDiv = "<td colspan='3'>" +
									"<div class='wrap-input100 validate-input'>" + 
									"<input type='text' id='telKey' name='telKey' class='input100' style='height:40px;'>" + 
									"<span class='focus-input100-1'></span>" + 
									"<span class='focus-input100-2'></span>" + 
									"</div>";
					$('#telKeyLabel').append(telKeyLabel);
					$('#telKeyTr').append(telKeyDiv);
					
					$('#indvdl_tel').attr("disabled", "disabled");
					$('#indvdl_tel').css("background-color", "#f0f0f0");
				}
			});
		}
	});
	
	// 아이디 중복검사 포커스 아웃 이벤트
	$('#indvdl_id').focusout(function(){
		if(!$('#indvdl_id').val().validationID()){
			idFlag = false;
			$('#IDCheckResult').css("color", "red");
			$('#IDCheckResult').text("4~15자의 영문 소문자, 대문자와 숫자만 사용 가능합니다.");
		} else {
			$.ajax({ 
				url : "${pageContext.request.contextPath}/individualMember/join/IDDuplCheck.do",
				data : {"indvdl_id" : $('#indvdl_id').val()},
				dataType : "json",
				type : "post",
				error : function(result){
					idFlag = false;
					alert("아이디 중복검사 도중 문제가 발생했습니다. 관리자에게 문의해주세요.");
				},
				success : function(result){
					if (eval(result.flag)){ // 입력한 아이디가 존재하지 않을 때
						idFlag = true;
						$('#IDCheckResult').css("color", "#08a600");
						$('#IDCheckResult').text("멋진 아이디네요!");
					} else { // 입력한 아이디가 존재할 때
						idFlag = false;
						$('#IDCheckResult').css("color", "red");
						$('#IDCheckResult').text("이미 사용중이거나 탈퇴한 아아디입니다.");
					}
				}
			});
		}
	});
	
	// 비밀번호 정규식 포커스 아웃 이벤트
	$('#indvdl_pass').focusout(function(){
		if(!$('#indvdl_pass').val().validationPWD()){
			passFlag = false;
			$('#PWCheckResult').text("4~14자의 영문 소문자, 대문자와 숫자만 사용가능합니다.");
		} else {
			passFlag = true;
			$('#PWCheckResult').text("");
		}
	});
	
	// 비밀번호 확인 포커스 아웃 이벤트
	$('#indvdl_passCheck').focusout(function(){
		if($('#indvdl_passCheck').val() != ""){
			if($('#indvdl_pass').val() != $('#indvdl_passCheck').val()){
				passCheckFlag = false;
				$('#lockImg').attr("src", "${pageContext.request.contextPath}/images/unLock.png");	
				$('#PWCheckCheckResult').text("비밀번호가 일치하지 않습니다.");
			} else {
				passCheckFlag = true;
				$('#lockImg').attr("src", "${pageContext.request.contextPath }/images/Lock.png");	
				$('#PWCheckCheckResult').text("");
			}
		} else {
			$('#lockImg').attr("src", "${pageContext.request.contextPath}/images/unLock.png");	
			$('#PWCheckCheckResult').text("필수 정보입니다.");
			passCheckFlag = false;
		}
	});
	
	// 이름 정규식 포커스 아웃 이벤트
	$('#indvdl_name').focusout(function(){
		if(!$('#indvdl_name').val().validationNM()){
			nameFlag = false;
			$('#nameCheckResult').text("1~15자의 영문 소문자, 대문자나 1~5 한글만 사용가능합니다.");
		} else {
			nameFlag = true;
			$('#nameCheckResult').text("");
		}
	});
	
	// 상세주소 포커스 아웃 이벤트
	$('#indvdl_detailAdres').focusout(function(){
		if($('#indvdl_detailAdres').val() == "") {
			detailAdresFlag  = false;
			$('#detailAdresCheckResult').text("필수 정보입니다.");
		} else {
			detailAdresFlag = true;
			$('#detailAdresCheckResult').text("");
		}
	});
	
	// 캡차문자입력 포커스 아웃 이벤트
	$('#captchaCheck').focusout(function(){
		if($('#captchaCheck').val() != ""){
			$('#captchaResult').text("");
			captchaFlag = true;
		} else {
			$('#captchaResult').text("필수 정보입니다.");
			captchaFlag = false;
		}
	});

	// 동적으로 생성된 input 값을 가져오기
	$(document).ready(function(){
		$(document).on("focusout", "#telKey", function(event){
			clientTelKey = $(this).val();
		})
	});
	
	// 동적으로 생성된 input 값을 가져오기
	$(document).ready(function(){
		$(document).on("focusout", "#mailKey", function(event){
			clientMailKey = $(this).val();
		})
	});
	
	// 가입하기 이벤트
	$('#submit').click(function(){
		
		if ($('#indvdl_id').val() == ""){
			idFlag = false;
			$('#IDCheckResult').text("필수 정보입니다.");
		}
		if (isSocial == false) {
			if($('#indvdl_pass').val() == ""){
				passFlag = false;
				$('#PWCheckResult').text("필수 정보입니다.");
			}
			if($('#indvdl_passCheck').val() == "" || $('#indvdl_passCheck').val() != $('#indvdl_pass').val()){
				passCheckFlag = false;
				$('#PWCheckCheckResult').text("필수 정보입니다.");
			}
		}
		if($('#indvdl_name').val() == ""){
			nameFlag = false;
			$('#nameCheckResult').text("필수 정보입니다.");
		}
		if($('#indvdl_birYear').val() == "" || $('#indvdl_birMonth').val() == "" || $('#indvdl_birDay').val() == ""){
			birFlag = false;
			$('#birCheckResult').text("필수 정보입니다.");
		}
		if($('#indvdl_gender').val() == ""){
			genderFlag = false;
			$('#genderCheckResult').text("필수 정보입니다.");
		}
		if($('#indvdl_tel').val() == ""){
			telFlag = false;
			$('#TELCheckResult').text("필수 정보입니다.");
		}
		if($('#indvdl_mail').val() == ""){
			mailFlag = false;
			$('#MailCheckResult').text("필수 정보입니다.");
		}
		if($('#indvdl_adres').val() == ""){
			adresFlag = false;
			$('#adresCheckResult').text("필수 정보입니다.");
		}
		if($('#indvdl_detailAdres').val() == ""){
			detailAdresFlag = false;
			$('#detailAdresCheckResult').text("필수 정보입니다.");
		}
		if($('#indvdl_academic').val() == ""){
			academicFlag= false;
			$('#academicCheckResult').text("필수 정보입니다.");
		}
		if($('#indvdl_hopeUpPro').val() == "" || $('#indvdl_hopeLowPro').val() == ""){
			upProFlag = false;
			$('#hopeProCheckResult').text("필수 정보입니다.");
		}
		if(isSocial == false) {
			if($('#captchaCheck').val() == ""){
				captchaFlag = false;
				$('#captchaResult').text("필수 정보입니다.");
			}
		}
		
		if(idFlag && passFlag && passCheckFlag && nameFlag && birFlag && genderFlag &&
				telFlag && mailFlag && adresFlag && detailAdresFlag && academicFlag &&
				proFlag && captchaFlag){
			
			if(telKey != clientTelKey){
				telCertification = false;
				$('#TELCheckResult').text("문자 인증번호가 틀렸습니다.");
			} else {
				telCertification = true;
			}
			
			if(mailKey != clientMailKey){
				$('#MailCheckResult').text("메일 인증번호가 틀렸습니다.");
				mailCertification = false;
			} else {
				mailCertification = true;
			}
			
			if($('#captchaCheck').val() != ""){
				$.ajax({
					url : "${pageCotext.request.contextPath}/individualMember/join/captchaCheck.do",
					data : {"value" : $('#captchaCheck').val(), "key" : captchaKey},
					dataType : "json",
					type : "post",
					error : function(result){
						alert("캡차 인증에 실패했습니다. 관리자에게 문의해주세요.");
					},
					success : function(result){
						if(result.result == false){
							refreshCaptcha();
							$('#captchaResult').text("캡차 인증번호가 틀렸습니다.");
						} else {
							$('#captchaResult').text("");
							
							if(mailCertification && telCertification) {
								
								var publicExponent = '${publicKeyMap.publicExponent}';
								var publicModulus = '${publicKeyMap.publicModulus}';
								var rsaOBJ = new RSAKey();
								
								rsaOBJ.setPublic(publicModulus, publicExponent);
								var encryptPW = rsaOBJ.encrypt($('#indvdl_pass').val());
								
								$('input[name=indvdl_id]').val($('#indvdl_id').val());
								$('input[name=indvdl_name]').val($('#indvdl_name').val());
								$('input[name=indvdl_pass]').val(encryptPW);
								$('input[name=indvdl_bir]').val($('#indvdl_birYear').val() + $('#indvdl_birMonth').val() + $('#indvdl_birDay').val());
								$('input[name=indvdl_tel]').val($('#indvdl_tel').val());
								$('input[name=indvdl_mail]').val($('#indvdl_mail').val());
								$('input[name=indvdl_gend]').val($('#indvdl_gender').val());
								$('input[name=indvdl_adres1]').val($('#indvdl_adres').val());
								$('input[name=indvdl_adres2]').val($('#indvdl_detailAdres').val());
								$('input[name=fin_acdmcr_num]').val($('#indvdl_academic').val());
								$('input[name=hopepro_num]').val($('#indvdl_hopeLowPro').val());
								
								$('form[name=joinFrm]').submit();
							}
						}
					}
				});
			}
			
		}
	});
	
});

// 캡차 이미지 재생성
function refreshCaptcha () {
	$.ajax({
		url : "${pageContext.request.contextPath}/individualMember/join/refreshCaptcha.do",
		type : "post",
		dataType : "json",
		error : function(result) {
			alert(result.status);
			alert("캡차 이미지 생성에 실패했습니다. 관리자에게 문의해주세요.");
		},
		success : function(result) {
			captchaKey = result.captchaKey;
			$("#captchaIMG").attr("src", "/captchaImgs/" + result.captchaImageName);
		}
	});
}

// 주소 입력 flag 변경 함수
function changeAdresFlag () {
	adresFlag = true;
	$('#adresCheckResult').text("");
}

// 네이버 로그인 연동버튼 클릭시 이벤트
function naverLoginFunction (gender, name, mail) {
	
	idFlag = true;
	passFlag = true;
	passCheckFlag = true;
	nameFlag = true;
	birFlag = true;
	genderFlag = true;
	telFlag = true;
	mailFlag = true;
	adresFlag = true;
	detailAdresFlag = true;
	academicFlag = true;
	proFlag = true;
	captchaFlag = true;

	mailCertification = true;
	telCertification = true;
	
	isSocial = true;
	
	$('#socialButtons').css("display", "none");
	
	$('#indvdl_mail').val(mail);
	$('#indvdl_name').val(name);
	
	if(gender == "M") {
		$('#indvdl_gender').val("남성");
	} else {
		$('#indvdl_gender').val("여성");
	}
	
	$('.indvdl_nameTr').css("display", "none");
	$('.indvdl_passTr').css("display", "none");
	$('.indvdl_passCheckTr').css("display", "none");
	$('.indvdl_genderTr').css("display", "none");
	$('.indvdl_mailTr').css("display", "none");
	$('.captchaTr').css("display", "none");
	
	$('input[name=indvdl_social]').val("N");
	
}

// 구글 로그인 연동버튼 클릭시 폼변경 함수
function googleLoginFunction (mail, name) {
	idFlag = true;
	passFlag = true;
	passCheckFlag = true;
	nameFlag = true;
	birFlag = true;
	genderFlag = true;
	telFlag = true;
	mailFlag = true;
	adresFlag = true;
	detailAdresFlag = true;
	academicFlag = true;
	proFlag = true;
	captchaFlag = true;

	mailCertification = true;
	telCertification = true;
	
	isSocial = true;
	$('#socialButtons').css("display", "none");
	
	$('#indvdl_mail').val(mail);
	$('#indvdl_name').val(name);
	
	$('.indvdl_nameTr').css("display", "none");
	$('.indvdl_mailTr').css("display", "none");
	$('.indvdl_passTr').css("display", "none");
	$('.indvdl_passCheckTr').css("display", "none");
	$('.captchaTr').css("display", "none");
	
	$('input[name=indvdl_social]').val("G");
}

// 구글 로그인 연동버튼 클릭시 함수
function onSignIn (googleUser) {
	signOut();
	var profile = googleUser.getBasicProfile();
	
	$.ajax({
		url : "${pageContext.request.contextPath}/individualMember/join/mailCheck.do",
		data : {"indvdl_mail" : profile.getEmail()},
		dataType : "json",
		type : "post",
		error : function(result) {
			alert(result.status + "에러가 발생했습니다. 관리자에게 문의해주세요.");
		},
		success : function(result) {
			if(result.resultFlag != "true") {
				alert("이미 회원가입한 이력이 존재합니다.");
			} else {
				idFlag = true;
				passFlag = true;
				passCheckFlag = true;
				nameFlag = true;
				birFlag = true;
				genderFlag = true;
				telFlag = true;
				mailFlag = true;
				adresFlag = true;
				detailAdresFlag = true;
				academicFlag = true;
				proFlag = true;
				captchaFlag = true;

				mailCertification = true;
				telCertification = true;
				
				isSocial = true;
				$('#socialButtons').css("display", "none");
				
				$('#indvdl_mail').val(profile.getEmail());
				$('#indvdl_name').val(profile.getName());
				
				$('.indvdl_nameTr').css("display", "none");
				$('.indvdl_mailTr').css("display", "none");
				$('.indvdl_passTr').css("display", "none");
				$('.indvdl_passCheckTr').css("display", "none");
				$('.captchaTr').css("display", "none");
				
				$('input[name=indvdl_social]').val("G");
			}
		}
	});
}

// 구글 로그인 로그아웃
function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.disconnect();
}

function google_id_loginClick() {
	$('.abcRioButtonContentWrapper').click();	
}

</script>
</head>
<body>
	<div class="limiter">
		<div id="naver_id_login" style="display: none;">
		</div>
		<div class="g-signin2" data-onsuccess="onSignIn" style="display: none;">
		</div>
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50" style="width: 600px;">
				<div class="login100-form">
					<b id="backBtn" onclick="javascript:location.href='${pageContext.request.contextPath}/individualMember/mainView.do';">inAIR</b>
					<span class="login100-form-title p-b-33">
						inAIR 개인회원 가입
					</span>
					<table style="width: inherit;">
						<tbody>
							<tr>
								<td>
									<div id="indvdlBtn" class="joinBtns" onclick="javascript:location.href='${pageContext.request.contextPath}/individualMember/join/joinForm.do'">
										<b id="joinTargetIndvdl" class="joinTarget">개인회원가입</b>
									</div>
								</td>
								<td>
									<div id="comMemBtn" class="joinBtns" onclick="javascript:location.href='${pageContext.request.contextPath}/companyMember/join/joinForm.do'">
										<b id="joinTagetComMem" class="joinTarget">기업회원가입</b>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<br>
								</td>
							</tr>
							<tr id="socialButtons">
								<td style=" border: 1px solid #999999;">
									<div onclick="document.getElementById('naver_id_login_anchor').click();">
										<img src="${pageContext.request.contextPath }/images/naver.png"  style="cursor: pointer; width: 245px;">
									</div>
								</td>
								<td style=" border: 1px solid #999999;">
									<div onclick="google_id_loginClick();">
										<img src="${pageContext.request.contextPath }/images/google.png" id="googleBTN" style="cursor: pointer; width: 245px;">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<br>
					<table style="width: inherit;">
						<tbody>
							<tr>
								<td>
									<label for="indvdl_id" style="font-size: 12px;">아이디</label>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<div class="wrap-input100 validate-input">
										<input type="text" id="indvdl_id" class="input100" style="height: 40px;">
										<span class="focus-input100-1"></span>
										<span class="focus-input100-2"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<p id="IDCheckResult" style="font-size: 12px; color:red;"></p>
								</td>
							</tr>
							
							<tr class="indvdl_passTr">
								<td>
									<label for="indvdl_pass" style="font-size: 12px; margin-top: 10px;">비밀번호</label>
								</td>
							</tr>
							<tr class="indvdl_passTr">
								<td colspan="4">
									<div class="wrap-input100 validate-input">
										<input type="password" id="indvdl_pass" class="input100" style="height: 40px;">
										<span class="focus-input100-1"></span>
										<span class="focus-input100-2"></span>
									</div>
								</td>
							</tr>
							<tr class="indvdl_passTr">
								<td colspan="5">
									<p id="PWCheckResult" style="font-size: 12px; color:red;"></p>
								</td>
							</tr>
							
							<tr class="indvdl_passCheckTr">
								<td>
									<label for="indvdl_passCheck" style="font-size: 12px; margin-top: 10px;">비밀번호 재확인</label>
								</td>
							</tr>
							<tr class="indvdl_passCheckTr">
								<td colspan="4">
									<div class="wrap-input100 validate-input" style="position: relative;">
										<img src="${pageContext.request.contextPath }/images/unLock.png" id="lockImg" style="position: absolute; z-index: 1; top: 30%; left: 320px;">
										<input type="password" id="indvdl_passCheck" class="input100" style="height: 40px;">
										<span class="focus-input100-1"></span>
										<span class="focus-input100-2"></span>
									</div>
								</td>
							</tr>
							<tr class="indvdl_passCheckTr">
								<td colspan="5">
									<p id="PWCheckCheckResult" style="font-size: 12px; color:red;"></p>
								</td>
							</tr>
							
							<tr>
								<td colspan="5">
									<hr style="margin-top: 30px;">
								</td>
							</tr>
							
							<tr class="indvdl_nameTr">
								<td>
									<label for="indvdl_name" style="font-size: 12px;">이름</label>
								</td>
							</tr>
							<tr class="indvdl_nameTr">
								<td colspan="5">
									<div class="wrap-input100 validate-input">
										<input type="text" id="indvdl_name" class="input100" style="height: 40px;">
										<span class="focus-input100-1"></span>
										<span class="focus-input100-2"></span>
									</div>
								</td>
							</tr>
							<tr class="indvdl_nameTr">
								<td colspan="5">
									<p id="nameCheckResult" style="font-size: 12px; color:red;"></p>
								</td>
							</tr>
							
							<tr>
								<td>
									<label style="font-size: 12px; margin-top: 10px;">생년월일</label>
								</td>
							</tr>
							<tr>
								<td width="30%">
									<select name="indvdl_birYear" id="indvdl_birYear" style="width: 100%; height: 40px; border-color: #e6e6e6; padding-left: 20px;">
										<option value="" >년</option>
									</select>
								</td>
								<td width="5%">
								</td>
								<td width="30%">
									<select name="indvdl_birMonth" id="indvdl_birMonth" style="width: 100%; height: 40px; border-color: #e6e6e6; padding-left: 20px;">
										<option value="" >월</option>
									</select>
								</td>
								</td>
								<td width="5%">
								</td>
								<td width="30%">
									<select name="indvdl_birDay" id="indvdl_birDay" style="width: 100%; height: 40px; border-color: #e6e6e6; padding-left: 20px;">
										<option value="" >일</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<p id="birCheckResult" style="font-size: 12px; color:red;"></p>
								</td>
							</tr>
							
							<tr class="indvdl_genderTr">
								<td>
									<label for="indvdl_gender" style="font-size: 12px; margin-top: 10px;">성별</label>
								</td>
							</tr>
							<tr class="indvdl_genderTr">
								<td colspan="5">
									<select name="indvdl_gender" id="indvdl_gender" class="input100" style="height: 40px; border-color: #e6e6e6; padding-left: 20px;">
										<option value="" >성별</option>
										<option value="남성">남성</option>
										<option value="여성">여성</option>
									</select>
								</td>
							</tr>
							<tr class="indvdl_genderTr">
								<td colspan="5">
									<p id="genderCheckResult" style="font-size: 12px; color:red;"></p>
								</td>
							</tr>
							
							<tr>
								<td colspan="5">
									<hr style="margin-top: 30px;">
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="indvdl_tel" style="font-size: 12px;">연락처</label>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<div class="wrap-input100 validate-input">
										<input type="text" id="indvdl_tel" class="input100" style="height: 40px;">
										<span class="focus-input100-1"></span>
										<span class="focus-input100-2"></span>
									</div>
								</td>
								<td>
								</td>
								<td>
									<div class="wrap-input100" id="telCheckBTN">
										<button class="input100" style="height: 40px;">문자인증 받기</button>
									</div>
								</td>
							</tr>
							<tr id="telKeyLabel">
							
							</tr>
							<tr id="telKeyTr">
							
							</tr>	
							<tr>
								<td colspan="5">
									<p id="TELCheckResult" style="font-size: 12px; color:red;"></p>
								</td>
							</tr>
							
							<tr class="indvdl_mailTr">
								<td>
									<label for="indvdl_mail" style="font-size: 12px; margin-top: 10px;">메일</label>
								</td>
							</tr>
							<tr class="indvdl_mailTr">
								<td colspan="3">
									<div class="wrap-input100 validate-input">
										<input type="text" id="indvdl_mail" class="input100" style="height: 40px;">
										<span class="focus-input100-1"></span>
										<span class="focus-input100-2"></span>
									</div>
								</td>
								<td class="indvdl_mailTr">
								</td>
								<td class="indvdl_mailTr">
									<div class="wrap-input100 validate-input" id="mailCheckBTN">
										<button class="input100" style="height: 40px;">메일인증 받기</button>
									</div>
								</td>
							</tr>
							<tr id="mailKeyLabel">
							
							</tr>
							<tr id="mailKeyTr">
							
							</tr>	
							<tr>
								<td colspan="5">
									<p id="MailCheckResult" style="font-size: 12px; color:red;"></p>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="indvdl_adres" style="font-size: 12px; margin-top: 10px;">주소</label>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<div class="wrap-input100 validate-input">
										<input type="text" id="indvdl_adres" class="input100" style="height: 40px; background-color: #f0f0f0;" disabled>
										<span class="focus-input100-1"></span>
										<span class="focus-input100-2"></span>
									</div>
								</td>
								<td>
								</td>
								<td>
									<div class="wrap-input100 validate-input" id="searchZipBTN">
										<button class="input100" style="height: 40px;">우편번호 검색</button>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<p id="adresCheckResult" style="font-size: 12px; color:red;"></p>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="indvdl_detailAdres" style="font-size: 12px; margin-top: 10px;">상세주소</label>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<div class="wrap-input100 validate-input">
										<input type="text" id="indvdl_detailAdres" class="input100" style="height: 40px;">
										<span class="focus-input100-1"></span>
										<span class="focus-input100-2"></span>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<p id="detailAdresCheckResult" style="font-size: 12px; color:red;"></p>
								</td>
							</tr>
							
							<tr>
								<td colspan="5">
									<hr style="margin-top: 30px;">
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="indvdl_academic" style="font-size: 12px;">최종학력</label>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<select id="indvdl_academic" class="input100" style="height: 40px; border-color: #e6e6e6;  padding-left: 20px;">
										<option value="" >최종학력</option>
										<c:forEach items="${finalAcademicList}" var="finalAcademicInfo">
											<option value="${finalAcademicInfo.fin_acdmcr_num }" >${finalAcademicInfo.fin_acdmcr }</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<p id="academicCheckResult" style="font-size: 12px; color:red;"></p>
								</td>
							</tr>
							
							<tr>
								<td colspan="5">
									<label style="font-size: 12px; margin-top: 10px;">희망직종 <p style="color: #bfbfbf; display: inline;">(구인글 알림서비스때 사용됩니다.)</p></label>
								</td>
							</tr>
							<tr>
								<td colspan="1">
									<select id="indvdl_hopeUpPro" class="input100" style="height: 40px; border-color: #e6e6e6; padding-left: 20px;">
										<option value="" >상위직종</option>
										<c:forEach items="${upProList}" var="upProInfo">
											<option value="${upProInfo.uppro_num}">${upProInfo.uppro_name}</option>
										</c:forEach>
									</select>
								</td>
								<td>
								</td>
								<td colspan="3">
									<select id="indvdl_hopeLowPro" class="input100" style="height: 40px; border-color: #e6e6e6; padding-left: 20px;">
										<option value="" >하위직종</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<p id="hopeProCheckResult" style="font-size: 12px; color:red;"></p>
								</td>
							</tr>
							
							<tr class="captchaTr">
								<td colspan="4">
									<label for="captchaIMG" style="font-size: 12px; margin-top: 40px;"><b>아래의 이미지를 보이는대로 입력해주세요.</b></label>
								</td>
								<td>
									<img onclick="javascript:refreshCaptcha();" src="${pageContext.request.contextPath}/images/refresh.png" id="refreshCaptchaBTN" style="width: 32px; height: 32px; margin-top: 30px; float: right;">
								</td>
							</tr>
							<tr class="captchaTr">
								<td colspan="5">
									<img src="/captchaImgs/${captchaImageName }" name="captchaIMG" id="captchaIMG" style="width: 100%; height: 200px;">
								</td>
							</tr>
							<tr class="captchaTr">
								<td colspan="5">
									<div class="wrap-input100 validate-input" style="margin-top: 5px;">
										<input type="text" id="captchaCheck" placeholder="자동입력 방지문자" class="input100" style="height: 40px;">
										<span class="focus-input100-1"></span>
										<span class="focus-input100-2"></span>
									</div>
								</td>
							</tr>
							<tr class="captchaTr">
								<td colspan="5">
									<p id="captchaResult" style="font-size: 12px; color:red;"></p>
								</td>
							</tr>
							<tr>
								<td colspan="5">
									<p id="certificationResult" style="font-size: 12px; color:red;"></p>
								</td>
							</tr>
							
						</tbody>
					</table>
					
					<div class="container-login100-form-btn m-t-20">
						<button id="submit" class="login100-form-btn">가입하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form action="${pageContext.request.contextPath}/individualMember/join/join.do" method="post" name="joinFrm">
		<input type="hidden" name="indvdl_id" value="" />
		<input type="hidden" name="indvdl_pass" value="" />
		<input type="hidden" name="indvdl_name" value="" />
		<input type="hidden" name="indvdl_bir" value="" />
		<input type="hidden" name="indvdl_tel" value="" />
		<input type="hidden" name="indvdl_mail" value="" />
		<input type="hidden" name="indvdl_gend" value="" />
		<input type="hidden" name="indvdl_adres1" value="" />
		<input type="hidden" name="indvdl_adres2" value="" />
		<input type="hidden" name="indvdl_social" value="" />
		<input type="hidden" name="fin_acdmcr_num" value="" />
		<input type="hidden" name="hopepro_num" value="" />
	</form>
</body>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("${naverSocialID}", "http://localhost/individualMember/join/callback.do"); // 로그인한 다음페이지
	var state = naver_id_login.getUniqState();
	
	naver_id_login.setDomain("http://123.0.0.1/individualMember/join/joinForm.do"); // 현재 페이지주소
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
	
</script>
</html>