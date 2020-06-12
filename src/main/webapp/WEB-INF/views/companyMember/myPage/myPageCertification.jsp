<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="comMemURL" value="/companyMember/myPage"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인정보 수정-회원 재인증</title>
<script src="${pageContext.request.contextPath}/js/validation.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function() {
		var com_pass = '';
		$.ajax({
			url : '${comMemURL}/getLoginCommemInfo.do'
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
		
		// inAIR로 가입한 회원인 경우 - 비밀번호 인증
		$('#confirmBtn').click(function(){
			var com_passCheck = $('input[name=com_passCheck]').val();
			
			if ( com_pass == com_passCheck ) {
				location.href = "${comMemURL}/myPageUpdateForm.do";
			} else {
				alert('비밀번호가 일치하지 않습니다.');
			}
			
		});
	});
</script>
</head>
<body>
	<section class="ftco-section bg-light">
		<div class="container">
			<div>
				<h2>기업정보 수정</h2>
				<br>
				<p style="text-align: center; margin-bottom: 0">회원님의 정보를 안전하게 보호가 위해 <strong style="color: black;">비밀번호를 다시 한 번 입력</strong>해주시기 바랍니다.</p>
				<p style="color: red; text-align: center; font-size: 14px;">※타인에게 노출되지 않도록 주의해 주세요.</p>
				<br>
				<h3 style="text-align: center; margin-bottom: 20px;">비밀번호 재확인</h3>
				<table class="table">
				    <tbody>
				    	<tr>
				    		<td style="text-align: center">아이디</td>
				    		<td>${LOGIN_COMMEMINFO.com_id}</td>
				    	</tr>
				    	<tr>
				    		<td style="text-align: center">비밀번호</td>
				    		<td><input type="password" name="com_passCheck" value="com_pass" style="border:none;"></td>
				    	</tr>
				  	</tbody>
				</table>
				<br>
				<div style="text-align: center;"><button type="submit" id="confirmBtn" style="width: 200px; font-size: 20px; background-color: #6b80f1; color: white; border: none;">비밀번호확인</button></div>
			</div>
		</div>
	</section>		
</body>
</html>