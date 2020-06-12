<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="comMemMyPageURL" value="/companyMember/myPage"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		var com_pass = '';
		$.ajax({
			url : '${comMemMyPageURL}/getLoginCommemInfo.do'
				,data : { 'com_id' : '${LOGIN_COMMEMINFO.com_id}' }
				,dataType : 'json'
				,type : 'post'
				,error : function(result){
							alert(result.status);
							alert('개인정보 수정화면에 오류가있습니다.');
						}
				,success : function(result){
								com_pass = result.com_pass;
						   }
		});
		
		$('form[name=passwordChangeForm]').submit(function(){
			
			if ( $('input[name=com_prePass]').val() != com_pass ) {
				alert('현재 비밀번호가 올바르지 않습니다.');
				return false;
			}
			
			if ( $('input[name=com_pass]').val() != $('input[name=com_passCheck]').val() ) {
				alert('비밀번호와 확인 비밀번호가 일치하지 않습니다.');
				return false;
			}
			
			$(this).attr("action", "${comMemMyPageURL}/passwordCheck.do");
			$(this).append('<input type="hidden" name="com_id" value="${LOGIN_COMMEMINFO.com_id }"/>');
			
			return true;
			
		});
	});
</script>
</head>
<body>
	<section class="ftco-section bg-light">
		<div class="container">
			<form name="passwordChangeForm" method="post">
				<div class="col-md-13 order-md-last d-flex" style="clear:both;">
					<div class="bg-white p-5 contact-form" id="personalData" style="width:100%;">
						<h2>비밀번호 변경</h2>									
						<br>
						<p style="text-align: center; margin-bottom: 0"><strong style="color: black;">4~15자의 영문 대문자, 소문자, 숫자를 조합하여 비밀번호를 사용하실 수 있습니다.</strong></p>
						<p style="text-align: center; margin-bottom: 0">개인정보 보호를 위해 <strong style="color: black;">6개월마다 주기적으로 비밀번호를 변경</strong>해 사용하는 것이 안전합니다.</p>
						<p style="color: red; text-align: center; font-size: 14px;">※여러 사이트에 동일한 비밀번호를 사용하면 도용되기 쉬우므로 비밀번호를 주기적으로 변경해 주는 것이 안전합니다.</p>
						<br>
						<div style="margin-left: 120px; margin-right: 120px;">
							<table class="table">
							    <tbody>
							    	<tr>
							    		<td style="text-align: center">현재 비밀번호</td>
							    		<td><input type="password" name="com_prePass" style="border:none;"></td>
							    	</tr>
							    	<tr>
							    		<td style="text-align: center">비밀번호</td>
							    		<td><input type="password" name="com_pass" style="border:none;"></td>
							    	</tr>
							    	<tr>
							    		<td style="text-align: center">비밀번호 확인</td>
							    		<td><input type="password" name="com_passCheck" style="border:none;"></td>
							    	</tr>
							  	</tbody>
							</table>
						</div>
						<p style="text-align: center; margin-bottom: 0">inAIR에서는 개인정보를 보호하기 위한 안전한 비밀번호만 사용할 수 있습니다.</p>
						<br>
						<div style="text-align: center;">
							<span style="text-align: center;"><button type="submit" id="confirmBtn" style="width: 200px; font-size: 20px; background-color: #6b80f1; color: white; border: none;">확인</button></span>
							<span style="text-align: center;"><button type="reset" style="width: 200px; font-size: 20px; background-color: #6b80f1; color: white; border: none;">다시입력</button></span>
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>	
</body>
</html>