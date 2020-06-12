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
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
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

<style type="text/css">

#backBtn{
	cursor: pointer;
}

.loginBtns{
	height: 40px;
	padding-left: 110px;
}

.loginTarget{
	line-height: 40px;
	font-size: 12px;
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

#loginTargetIndvdl{
	color: white;
}

#loginTargetComMem{
	color: #999999;
}

</style>

<script type="text/javascript">
var loginTarget = "I";
$(function(){
	
	// 개인 로그인 버튼 클릭 이벤트
	$('#indvdlBtn').click(function(){
		$('#socialBtns').show();
		$('#comMemBtn').css("background-color", "white")
					   .css("border-top", "1px solid #999999")
					   .css("border-right", "1px solid #999999")
					   .css("border-bottom", "2px solid #7185e8");
		$('#indvdlBtn').css("background-color", "#7185e8");
		$('#loginTargetIndvdl').css("color", "white");
		$('#loginTargetComMem').css("color", "#999999");
		
		$('#signUp').attr("href", "${pageContext.request.contextPath}/individualMember/join/joinForm.do");
		$('#member_id').val("");
		$('#member_pass').val("");
		$('#loginFeedback').text("");
		
		loginTarget = "I";
	});
	
	// 기업 로그인 버튼 클릭 이벤트
	$('#comMemBtn').click(function(){
		$('#socialBtns').hide();
		$('#indvdlBtn').css("background-color", "white")
		   			   .css("border-top", "1px solid #999999")
		   			   .css("border-left", "1px solid #999999")
		   			   .css("border-bottom", "2px solid #7185e8");
		$('#comMemBtn').css("background-color", "#7185e8");
		$('#loginTargetIndvdl').css("color", "#999999");
		$('#loginTargetComMem').css("color", "white");
		
		$('#signUp').attr("href", "${pageContext.request.contextPath}/companyMember/join/joinForm.do");
		$('#member_id').val("");
		$('#member_pass').val("");
		$('#loginFeedback').text("");
		
		loginTarget = "C";
	});
	
	
	
	// 로그인 버튼 눌렀을 때
	$('#login').click(function(){
		if (loginTarget == "I"){
			if($('#member_id').val() == "" || $('#member_pass').val() == "") {
				$('#loginFeedback').text("아이디나 비밀번호를 입력해주세요.");
				return false;
			}
			
			var publicExponent = '${publicKeyMap.publicExponent}';
			var publicModulus = '${publicKeyMap.publicModulus}';
			
			var rsaOBJ = new RSAKey;
			rsaOBJ.setPublic(publicModulus, publicExponent);
			
			var encryptID = rsaOBJ.encrypt($('#member_id').val());
			var encryptPW = rsaOBJ.encrypt($('#member_pass').val());
			
			$.ajax({
				url : "${pageContext.request.contextPath}/individualMember/login/loginCheck.do",
				data : {"indvdl_id" : encryptID, "indvdl_pass" : encryptPW},
				dataType : "json",
				type : "post",
				error : function(result){
					alert("로그인도중 에러가 발생했습니다. 관리자에게 문의해주세요. 에러코드 : " + result.status);
				},
				success : function(result){
					if(result.resultFlag == "true"){
						location.href="${pageContex.request.contextPath}/individualMember/mainView.do";
					} else {
						$('#loginFeedback').text("아이디나 비밀번호가 맞지 않습니다.");
					}
				}
			});
		} else {
			if($('#member_id').val() == "" || $('#member_pass').val() == "") {
				$('#loginFeedback').text("아이디나 비밀번호를 입력해주세요.");
				return false;
			}
			
			var publicExponent = '${publicKeyMap.publicExponent}';
			var publicModulus = '${publicKeyMap.publicModulus}';
			
			var rsaOBJ = new RSAKey;
			rsaOBJ.setPublic(publicModulus, publicExponent);
			
			var encryptID = rsaOBJ.encrypt($('#member_id').val());
			var encryptPW = rsaOBJ.encrypt($('#member_pass').val());
			
			$.ajax({
				url : "${pageContext.request.contextPath}/companyMember/login/loginCheck.do",
				data : {"com_id" : encryptID, "com_pass" : encryptPW},
				dataType : "json",
				type : "post",
				error : function(result) {
					alert("로그인 도중 에러가 발생했습니다. 관리자에게 문의해주세요. 에러코드 : " + result.status);
				},
				success : function(result) {
					if (result.resultFlag == "true") {
						location.href="${pageContext.request.contextPath}/companyMember/mainView.do";
					} else {
						$('#loginFeedback').text("아이디나 비밀번호가 맞지 않습니다.");
					}
				}
			});
		}	
		
	});
	
});

// 구글 로그인 함수
function onSignIn (googleUser) {
	signOut();
	var profile = googleUser.getBasicProfile();
	
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "post");
	form.setAttribute("action", "${pageContext.request.contextPath}/individualMember/login/socialLoginCheck.do");
	form.setAttribute("name", "googleForm");
	
	document.body.appendChild(form);
	
	var $mail = $('<input type="hidden" name="indvdl_mail" value="' + profile.getEmail() + '"/>');
	var $name = $('<input type="hidden" name="indvdl_name" value="' + profile.getName() + '"/>');
	var $target = $('<input type="hidden" name="loginTarget" value="G"/>');
	
	$('form[name=googleForm]').append($mail);
	$('form[name=googleForm]').append($name);
	$('form[name=googleForm]').append($target);
	
	form.submit();
}

// 구글 로그아웃 함수
function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
	auth2.signOut().then(function(){
		console.log("User signed out");
	});
	
	auth2.disconnect();
}

// 숨겨진 구글 버튼 클릭 함수
function google_id_loginClick(){
	$('.abcRioButtonContentWrapper').click();
}

// 네이버 로그인 콜백 함수
function naverCallback(gender, name, mail) {
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "post");
	form.setAttribute("action", "${pageContext.request.contextPath}/individualMember/login/socialLoginCheck.do");
	form.setAttribute("name", "naverForm");
	
	document.body.appendChild(form);
	
	var $gender = $('<input type="hidden" name="indvdl_gender" value="' + gender + '"/>');
	var $name = $('<input type="hidden" name="indvdl_name" value="' + name + '"/>');
	var $mail = $('<input type="hidden" name="indvdl_mail" value="' + mail + '"/>');
	var $target = $('<input type="hidden" name="loginTarget" value="N"/>');
	
	$('form[name=naverForm]').append($gender);
	$('form[name=naverForm]').append($name);
	$('form[name=naverForm]').append($mail);
	$('form[name=naverForm]').append($target);
	
	form.submit();
}
</script>
</head>
<body>
	<div class="limiter">
		<div id="naver_id_login" style="display: none;"></div>
		<div class="g-signin2" data-onsuccess="onSignIn" style="display: none;"></div>
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50" style="width: 600px;">
				<div class="login100-form">
					<b id="backBtn" onclick="javascript:location.href='${pageContext.request.contextPath}/individualMember/mainView.do';">inAIR</b>
					<span class="login100-form-title p-b-33">
						inAIR 로그인
					</span>
					
					<table style="width: inherit;">
						<tbody>
						
							<tr>
								<td>
									<div id="indvdlBtn" class="loginBtns">
										<b id="loginTargetIndvdl" class="loginTarget">개인</b>
									</div>
								</td>
								<td>
									<div id="comMemBtn" class="loginBtns">
										<b id="loginTargetComMem" class="loginTarget">기업</b>
									</div>
								</td>
							</tr>
							
							<tr>
								<td colspan="2">
									<hr>
								</td>
							</tr>
							
							<tr id="socialBtns">
								<td style="border: 1px solid #999999;">
									<div onclick="document.getElementById('naver_id_login_anchor').click();">
										<img src="${pageContext.request.contextPath }/images/naver.png" style="cursor: pointer; width: 245px;">
									</div>
								</td>
								<td style="border: 1px solid #999999;">
									<div onclick="google_id_loginClick();">
										<img src="${pageContext.request.contextPath }/images/google.png" style="cursor: pointer; width: 245px;">
									</div>
								</td>
							</tr>
							
						</tbody>
					</table>
					
					<table>
						<tbody>
						
							<tr>
								<td>
									<label for="member_id" style="font-size: 12px; margin-top: 30px;">아이디</label>
								</td>
							</tr>
							<tr>
								<td>
									<div class="wrap-input100 validate-input">
										<input type="text" id="member_id" class="input100" style="height: 30px; width: 300px;">
										<span class="focus-input100-1"></span>
										<span class="focus-input100-2"></span>
									</div>
								</td>
								<td rowspan="3">
									<button id="login" style=" border: 1px solid #999999; height: 90px; width: 150px; margin-left: 40px;">로그인</button>
								</td>
							</tr>
							
							<tr>
								<td>
									<label for="member_pass" style="font-size: 12px;">비밀번호</label>
								</td>
							</tr>
							<tr>
								<td>
									<div class="wrap-input100 validate-input">
										<input type="password" id="member_pass" class="input100" style="height: 30px; width: 300px;">
										<span class="focus-input100-1"></span>
										<span class="focus-input100-2"></span>
									</div>
								</td>
							</tr>
							
							<tr>
								<td>
									<p id="loginFeedback" style="font-size: 12px; color: red; margin-top: 10px;"></p>
								</td>
							</tr>
						</tbody>
					</table>
					
					<div class="text-center p-t-45 p-b-4">
						<span class="txt1">
							잊어버리셧나요?
						</span>
							
						<p style="display: inline-block;">
							<a href="${pageContext.request.contextPath }/individualMember/login/idSearchView.do" class="txt2 hov1">아이디</a>
							/
							<a href="${pageContext.request.contextPath }/individualMember/login/passSearch.do" class="txt2 hov1">비밀번호</a>
						</p>
					</div>

					<div class="text-center">
						<span class="txt1">
							아이디가 없으세요?
						</span>

						<a href="${pageContext.request.contextPath}/individualMember/join/joinForm.do" class="txt2 hov1" id="signUp">
							회원가입하기
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var naver_id_login = new naver_id_login("${naverSocialID}" , "http://localhost/individualMember/login/callback.do");
	var state = naver_id_login.getUniqState();
	
	naver_id_login.setDomain("http://123.0.0.1/individualMember/login/loginForm.do");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
</script>
</html>