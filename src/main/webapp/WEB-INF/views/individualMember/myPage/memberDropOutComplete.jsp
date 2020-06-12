<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	p {
		margin-bottom: 0px;
	}
</style>
<script type="text/javascript">
	$(function() {
		var day = new Date();
		$('#today').text(day.toLocaleString());
	});
</script>
</head>
<body>
<div class="col-md-13 order-md-last d-flex" style="clear:both;">
	<div class="bg-white p-5 contact-form" id="personalData" style="width:100%;">
		<p><strong style="font-size: 30px; color: #35829c">inAIR</strong> <strong style="font-size: 30px;"> 탈퇴 완료 안내</strong></p>
		<br>
		<div>
			<b style="font-size: 25px;">${LOGIN_INDVDLMEMINFO.indvdl_name }님</b> <b style="font-size: 25px; color: #35829c">inAIR 탈퇴</b><span style="font-size: 25px;">가 완료되었습니다.</span>
			<p>그동안 inAIR을 사랑해주신 <b>회원님</b>께 깊은 감사 드리며, 다시 뵙게 되는 그날에는 더 나은 서비스로 보답하겠습니다.
			   inAIR은 구직자 모두가 취업에 성공하는 그날까지 더욱더 노력하겠습니다.</p>
			<p>감사합니다.</p>
		</div>
		<br><br>
		<div style="margin: 0px 120px;">
			<table class="table">
				<tr>
					<td style="text-align: center">아이디</td>
					<td>${LOGIN_INDVDLMEMINFO.indvdl_id }</td>
				</tr>
				<tr>
					<td style="text-align: center">탈퇴일</td>
					<td id="today"></td>
				</tr>
			</table>
		</div>
		
		<div style="text-align: center;">
			<button type="button" style="width: 200px; font-size: 20px; background-color: #6b80f1; color: white; border: none;">
				<a href="/myPage/sessionRemove.do" style="color: white;">inAIR 바로가기</a>
			</button>
		</div>
	</div>
</div>
</body>
</html>