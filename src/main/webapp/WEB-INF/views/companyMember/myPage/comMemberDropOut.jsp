<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="comMemURL" value="/companyMember/myPage"></c:url>
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
	
	$('#dropOutSelect').hide();
	$('#mailTable').hide();
	$('#dropOutETC').hide();
	
	var com_pass = '';
	$.ajax({
		url : '${comMemURL}/getLoginCommemInfo.do'
			,data : { 'com_id' : '${LOGIN_COMMEMINFO.com_id}' }
			,dataType : 'json'
			,type : 'post'
			,error : function(result){
						alert(result.status);
						alert('기업회원 탈퇴화면에 오류가있습니다.');
					}
			,success : function(result){
							com_pass = result.com_pass;
					   }
	});
	
	
	$('#com_secsn').change(function() {
		if( $('#com_secsn').val() == '기타' ) {
			$('#dropOutETC').show();
		} else {
			$('#dropOutETC').hide();
		}
	});
	
	// inAIR로 가입한 회원인 경우 - 비밀번호 인증
	$('#confirmBtn').click(function(){
		var com_passCheck = $('input[name=com_pass]').val();
		var ectSelected = $('#etcDiv option:selected').val();
		
		if ( com_passCheck == com_pass ) {
			
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
	
	$('form[name=dropOutForm]').submit(function() {
			
		var com_secsn = $('select[name=com_secsn] option:selected').val();
		var etc = $('#dropOutETC').val();
		
		if ( com_secsn == '기타') {
			com_secsn = '[기타] ' + etc;
			$(this).append('<input type="hidden" name="com_secsn" value="' + com_secsn + '"/>');
		}
		
		$(this).attr("action", "${comMemURL}/comMemberDelete.do");
		$(this).append('<input type="hidden" name="com_id" value="${LOGIN_COMMEMINFO.com_id }"/>');
		
		return true;
	});
	
});
</script>
</head>
<body>
	<section class="ftco-section bg-light">
		<div class="container">
			<form name="dropOutForm" method="post">
				<div class="col-md-13 order-md-last d-flex" style="clear:both;">
				<div class="bg-white p-5 contact-form" id="personalData" style="width:100%;">
					<h2>기업회원 탈퇴</h2>
					<hr>
					<p><h5 style="margin-bottom: 30px;">기업회원 탈퇴 전, 안내 사항을 꼭 확인해주세요.</h5></p>
					<div id="explainDiv">
						<b>탈퇴 아이디 복구 불가</b>
						<p>탈퇴 후에는 아이디와 데이터 복구가 불가능합니다.</p>
						<p>신중하게 선택하시기 바랍니다.</p>	
					</div>
					<div id="explainDiv">
						<b>서비스 이용 기록 삭제 안내</b>
						<p>구인정보, 지원자 현황 등 서비스 이용 기록이 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</p>
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
						<div style="margin: 0px 120px;">
							<table class="table">
							    <tbody>
							    	<tr>
							    		<td style="text-align:right; width: 50%;">아이디</td>
							    		<td>${LOGIN_COMMEMINFO.com_id }</td>
							    	</tr>
							    	<tr>
							    		<td style="text-align:right;">비밀번호</td>
							    		<td><input type="password" name="com_pass" value="com_pass" style="border:none;"></td>
							    	</tr>
							  	</tbody>
							</table>
						</div>
						<div style="text-align: center;">
							<button type="button" id="confirmBtn" style="width: 200px; font-size: 20px; background-color: #6b80f1; color: white; border: none;">인증하기</button>
						</div>
						<br>
					</div>
					<div id="dropOutSelect" style="margin: 0px 120px;">
						<table class="table" style="border-bottom: 1px solid #F8F9FA;">
							<tr>
								<td style="text-align: right;width: 50%;">탈퇴사유</td>
								<td>
									<div>
										<select id="com_secsn" name="com_secsn" style="width: 272px; height: 32px;">
											<option value="">선택하세요.</option>
											<c:forEach items="${dropOutList}" var="dropOut">
												<option value="${dropOut.com_secsn}">${dropOut.com_secsn}
												</option>
											</c:forEach>
										</select>
										<input type="text" id="dropOutETC" name="dropOutETC" value="dropOutETC" style="width: 272px; margin-top: 20px;"/>
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
		</div>	
	</section>
</body>
</html>