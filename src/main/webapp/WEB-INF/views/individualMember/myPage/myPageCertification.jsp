<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인정보 수정-회원 재인증</title>
<script src="${pageContext.request.contextPath}/js/validation.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		
		var mailFlag = true;
		var telFlag = true;
		
		var mailKey = "";
		var telKey = "";
		
		$('#mailTable').hide();
		
		//로그인한 회원 비밀번호 가져오기
		var login_indvdl_pass = '';
		$.ajax({
			url : '/myPage/getLoginCommemInfo.do'
				,data : { 'indvdl_id' : '${LOGIN_INDVDLMEMINFO.indvdl_id }' }
				,dataType : 'json'
				,type : 'post'
				,error : function(result){
							alert(result.status);
							alert('개인정보 수정화면에 오류가있습니다.');
						}
				,success : function(result){
								login_indvdl_pass = result.indvdl_pass;
						   }
		});
		
		// inAIR로 가입한 회원인 경우 - 비밀번호 인증
		$('#confirmBtn').click(function(){
			var indvdl_pass = $('input[name=indvdl_pass]').val();
			
			if ( login_indvdl_pass == indvdl_pass ) {
				location.href = "/myPage/myPageUpdateForm.do?indvdl_id=${LOGIN_INDVDLMEMINFO.indvdl_id }";
			} else {
				alert('비밀번호가 일치하지 않습니다.');
			}
		});
		
		// 소셜로 가입한 회원인 경우 - 휴대폰 인증
		$('#handphoneBtn').click(function(){
			$('#mailTable').hide();
			$('#handphoneTable').show();
			$(this).css("background", "#35829c");
			$(this).css("color", "white")
			$('#mailBtn').css("background", "none");
			$('#mailBtn').css("color", "black");
		});
		
		// 소셜로 가입한 회원인 경우 - 메일 인증
		$('#mailBtn').click(function(){
			$('#handphoneTable').hide();
			$('#mailTable').show();
			$(this).css("background", "#35829c");
			$(this).css("color", "white");
			$('#handphoneBtn').css("background", "none");
			$('#handphoneBtn').css("color", "black");
		});
		
		// 휴대폰 문자 인증
		$('#telSend').click(function(){
			if (!$('#indvdl_tel').val().validationTEL()){
				telFlag = false;
				$('#telNormal').text("형식에 맞지 않는 번호입니다.");
			} else {
				$('#telNormal').text("");
				
				var arrayTelNum = $('#indvdl_tel').val().split("-");
				var telNum = "";
				
				$.each(arrayTelNum, function(index, item) {
					telNum += item;
				});
				
				$.ajax({
					url : '/myPage/telCheck.do'
					,data : {'indvdl_tel' : telNum}
					,dataType : 'json'
					,type : 'post'
					,error : function(result) {
							talFlag = false;
							alert(result.status);
							alert("문자 전송에 실패했습니다. 관리자에게 문의해주세요.");
						}
					,success : function(result) {
							if ( result.resultFlag != "true") {
								talFlag = false;
								$('#telNormal').text("회원가입시 입력했던 휴대폰 번호와 다릅니다. 다시 입력해주세요.");
							} else {
								talFlag = true;
								
								alert("[" + telNum + "]으로 인증문자를 발송했습니다.");
								telKey = result.randomString;
							}
						}
				});
			}
		});
		
		$('#telKeyCheck').click(function(){
			if ( telKey != $('#telCertification').val() ) {
				$('#telCertificationCheck').text("인증번호가 틀렸습니다.");
				return false;
			} else {
				location.href = "/myPage/myPageUpdateForm.do?indvdl_id=${LOGIN_INDVDLMEMINFO.indvdl_id }";
			}
			
		});
		
		// 이메일 인증
		$('#mailSend').click(function(){
			if ( !$('#indvdl_mail').val().validationMail() ){
				mailFlag = false;
				$('#mailNormal').text("회원가입시 입력했던 이메일 주소와 다릅니다. 다시 입력해주세요.");
			} else {
				$('#mailNormal').text("");
				
				$.ajax({
					url : '/myPage/mailCheck.do'
					,data : {'indvdl_mail' : $('#indvdl_mail').val()}
					,dataType : 'json'
					,type : 'post'
					,error : function(result){
								mailFlag = false;
							}
					,success : function(result){
						if ( result.resultFlag != "true" ) {
							mailFlag = false;
							$('#mailNormal').text("없는 이메일 계정입니다. 다시 입력해주세요.");
						} else {
							mailFlag = true;
							
							alert("[" + $('#indvdl_mail').val() + "]으로 인증메일을 전송했습니다.");
							mailKey = result.randomString;
							
						}
					}
				});
			}
		});
		
		$('#mailKeyCheck').click(function(){
			if ( mailKey != $('#mailCertification').val() ) {
				$('#mailCertificationCheck').text("인증번호가 틀렸습니다.");
				return false;
			} else {
				location.href = "/myPage/myPageUpdateForm.do?indvdl_id=${LOGIN_INDVDLMEMINFO.indvdl_id }";
			}
			
		});
		
	});
</script>
</head>
<body>
<div class="col-md-13 order-md-last d-flex" style="clear:both;">
<div class="bg-white p-5 contact-form" id="personalData" style="width:100%;">
	<c:if test="${empty LOGIN_INDVDLMEMINFO.indvdl_social}">
	<div>
		<h2>개인정보 수정</h2>
		<br>
		<p style="text-align: center; margin-bottom: 0">회원님의 정보를 안전하게 보호가 위해 <strong style="color: black;">비밀번호를 다시 한 번 입력</strong>해주시기 바랍니다.</p>
		<p style="color: red; text-align: center; font-size: 14px;">※타인에게 노출되지 않도록 주의해 주세요.</p>
		<br>
		<h3 style="text-align: center; margin-bottom: 20px;">비밀번호 재확인</h3>
		<div style="margin: 0px 120px;">
		<table class="table">
		    <tbody>
		    	<tr>
		    		<td style="text-align: center">아이디</td>
		    		<td>${LOGIN_INDVDLMEMINFO.indvdl_id }</td>
		    	</tr>
		    	<tr>
		    		<td style="text-align: center">비밀번호</td>
		    		<td><input type="password" name="indvdl_pass" value="indvdl_pass" style="border:none;"></td>
		    	</tr>
		  	</tbody>
		</table>
		</div>
		<br>
		<div style="text-align: center;"><button type="submit" id="confirmBtn" style="width: 200px; font-size: 20px; background-color: #35829c; color: white; border: none;">회원확인</button></div>
	</div>
	</c:if>
	
	<c:if test="${!empty LOGIN_INDVDLMEMINFO.indvdl_social }">
		<h2>개인정보 수정</h2>
		<br>
		<p style="text-align: center; margin-bottom: 0">회원님의 정보를 안전하게 보호가 위해 <strong style="color: black;">휴대폰 또는 이메일 인증</strong>을 해주시기 바랍니다.</p>
		<p style="text-align: center; font-size: 14px;">※해외거주자 등 국내 휴대폰 번호가 없는 분은 이메일 인증을 이용해주세요.</p>
		<br>
		<div style="text-align: center;">
			<button type="button" id="handphoneBtn" style="width: 250px; border: none; background-color: #35829c; color: white;">휴대폰인증</button>
			<button type="button" id="mailBtn" style="width: 250px; border: none; background-color: white;">이메일 인증</button>
		</div>
		<br>
		<div style="margin-left: 120px; margin-right: 120px;">
			<table class="table" id="handphoneTable">
			    <tbody >
			    	<tr>
			    		<td style="text-align: center">휴대폰 번호</td>
			    		<td>
			    			<div class="wrap-input100 validate-input">
								<input type="text" id="indvdl_tel">
								<span class="focus-input100-1"></span>
								<span class="focus-input100-2"></span>
								<span class="tagcloud" style="margin-left: 15px;">
									<a href="#" class="tag-cloud-link" id="telSend">인증번호 발송</a>
								</span>
							</div>
							<div id="telNormal"></div>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td style="text-align: center">인증번호</td>
			    		<td>
			    			<input type="text" name="telCertification" id="telCertification" val="telCertification">
			    			<span class="tagcloud" style="margin-left: 15px;">
								<a href="#" class="tag-cloud-link" id="telKeyCheck"> 확인</a>
							</span>
							<div id="telCertificationCheck"></div>
			    		</td>
			    	</tr>
			  	</tbody>
			</table>
			
			<table class="table" id="mailTable">
			    <tbody >
			    	<tr>
			    		<td style="text-align: center">이메일 주소</td>
			    		<td>
			    			<div class="wrap-input100 validate-input">
								<input type="text" id="indvdl_mail">
								<span class="focus-input100-1"></span>
								<span class="focus-input100-2"></span>
								<span class="tagcloud" style="margin-left: 15px;">
									<a href="#" class="tag-cloud-link" id="mailSend">인증번호 발송</a>
								</span>
							</div>
							<div id="mailNormal"></div>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td style="text-align: center">인증번호</td>
			    		<td>
			    			<input type="text" name="mailCertification" id="mailCertification" val="mailCertification">
			    			<span class="tagcloud" style="margin-left: 15px;">
								<a href="#" class="tag-cloud-link" id="mailKeyCheck">확인</a>
							</span>
							<div id="mailCertificationCheck"></div>
			    		</td>
			    	</tr>
			  	</tbody>
			</table>
			
		</div>
		
	</c:if>
</div>
</div>
</body>
</html>