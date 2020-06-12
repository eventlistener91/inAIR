<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/validation.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
	p { margin-bottom: 0px;}
	#explainDiv { margin: 10px 10px 10px 15px;
				  color: black; }
</style>
<script type="text/javascript">
$(function() {
	
	var mailFlag = true;
	var telFlag = true;
	
	var mailKey = "";
	var telKey = "";
	
	$('#dropOutSelect').hide();
	$('#mailTable').hide();
	$('#dropOutETC').hide();
	
	$('#indvdl_drop').change(function() {
		if( $('#indvdl_drop').val() == '기타' ) {
			$('#dropOutETC').show();
		} else {
			$('#dropOutETC').hide();
		}
	});
	
	// inAIR로 가입한 회원인 경우 - 비밀번호 인증
	$('#confirmBtn').click(function(){
		var indvdl_pass = $('input[name=indvdl_pass]').val();
		var ectSelected = $('#etcDiv option:selected').val();
		
		if ( "${LOGIN_INDVDLMEMINFO.indvdl_pass }" == indvdl_pass ) {
			
			$('#confirmBtn').hide();
			$('#dropOutSelect').show();
			
			if ( ectSelected == '기타') {
				$('#etcDiv').show();
			} else {
				$('#etcDiv').hide();
			}
			
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
							alert(telKey);
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
			$('#confirmBtn').hide();
			$('#dropOutSelect').show();
			
			if ( ectSelected == '기타') {
				$('#etcDiv').show();
			} else {
				$('#etcDiv').hide();
			}
		}
		
	});
	
	// 이메일 인증
	$('#mailSend').click(function(){
		if ( !$('#indvdl_mail').val().validationMail() ){
			mailFlag = false;
			$('#mailNormal').text("형식에 맞지 않는 메일 주소입니다.");
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
						$('#mailNormal').text("회원가입시 입력했던 이메일 주소과 다릅니다. 다시 입력해주세요.");
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
			
			$('#confirmBtn').hide();
			$('#dropOutSelect').show();
			
			if ( ectSelected == '기타') {
				$('#etcDiv').show();
			} else {
				$('#etcDiv').hide();
			}
		}
	});

	$('form[name=dropOutForm]').submit(function() {
			
		location.href = '/myPage/sessionRemove.do';
		
		var indvdl_secsn = $('select[name=indvdl_drop] option:selected').val();
		var etc = $('#dropOutETC').val();
		
		if ( indvdl_secsn == '기타') {
			indvdl_secsn = '[기타] ' + etc;
		}
		
		$(this).attr("action", "/myPage/memberDelete.do");
		$(this).append('<input type="hidden" name="indvdl_id" value="${LOGIN_INDVDLMEMINFO.indvdl_id }"/>');
		$(this).append('<input type="hidden" name="indvdl_secsn" value="' + indvdl_secsn + '"/>');
	});
	
});
</script>
</head>
<body>
<form name="dropOutForm" method="post">
	<div class="col-md-13 order-md-last d-flex" style="clear:both;">
	<div class="bg-white p-5 contact-form" id="personalData" style="width:100%;">
		<h2>개인회원 탈퇴</h2>
		<hr>
		<p><h5 style="margin-bottom: 30px;">개인회원 탈퇴 전, 안내 사항을 꼭 확인해주세요.</h5></p>
		
		<div id="explainDiv">
			<b>탈퇴 아이디 복구 불가</b>
			<p>탈퇴 후에는 아이디와 데이터 복구가 불가능합니다.</p>
			<p>신중하게 선택하시기 바랍니다.</p>	
		</div>
		<div id="explainDiv">
			<b>서비스 이용 기록 삭제 안내</b>
			<p>이력서, 입사지원 현황 등 취업에 필요한 서비스 이용 기록이 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</p>
			<p>필요한 데이터는 미리 백업을 해두시기 바랍니다.</p>
		</div>
		<div id="explainDiv">
			<b>등록한 게시글 삭제 불가 안내</b>
			<p>삭제를 원하는 게시글은 반드시 회원 탈퇴 전 삭제하시기 바랍니다.</p>
			<p>탈퇴 후에는 게시글을 임의로 삭제해드릴 수 없습니다.</p>
		</div>
		<br>
		<div>
			<br>
			<c:if test="${empty LOGIN_INDVDLMEMINFO.indvdl_social}">
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
				<div style="text-align: center;">
					<button type="button" id="confirmBtn" style="width: 200px; font-size: 20px; background-color: #6b80f1; color: white; border: none;">인증하기</button>
				</div>
			</c:if>
			
			<c:if test="${!empty LOGIN_INDVDLMEMINFO.indvdl_social }">
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
				    			<input type="text" name="telCertification" id="telCertification">
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
				
<!-- 				<div> -->
<!-- 					<div style="text-align: center;"><button type="button" style="width: 200px; font-size: 20px; background-color: #6b80f1; color: white; border: none;" id="confirm">인증하기</button></div> -->
<!-- 				</div> -->
				
			</div>
			</c:if>
			<br>
		</div>
		
		<div id="dropOutSelect" style="margin: 0px 120px;">
			<table class="table" style="border-bottom: 1px solid #F8F9FA;">
				<tr>
					<td style="text-align: center; width: 147px; height: 55px;">탈퇴사유</td>
					<td>
						<div>
							<select id="indvdl_drop" name="indvdl_drop" style="width: 272px; height: 32px;">
								<option value="">선택하세요.</option>
								<c:forEach items="${dropOutList}" var="dropOut">
									<option value="${dropOut.indvdl_secsn}">${dropOut.indvdl_secsn}
									</option>
								</c:forEach>
							</select>
							<input type="text" id="dropOutETC" name="dropOutETC" style="width: 272px; margin-top: 20px;"/>
						</div>
					</td>
				</tr>
			</table>
			
			<div>
				<div style="text-align: center;">
					<button type="submit" style="width: 200px; font-size: 20px; background-color: #6b80f1; color: white; border: none;" id="dropOutBtn">탈퇴하기</button>
				</div>
			</div>
			
		</div>
	</div>	
	</div>
</form>
</body>
</html>