<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="google-signin-client_id" content="429193550282-0vtvu8m5avrb1ucklkh7r1comiqkpp37.apps.googleusercontent.com">
<title>우편번호 검색</title>

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

<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="${pageContext.request.contextPath}/js/commons.js"></script>
<script src="${pageContext.request.contextPath}/js/validation.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/animsition/js/animsition.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/bootstrap/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/select2/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/daterangepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/countdowntime/countdowntime.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">

p{
	font-size: 12px;
}

table{
	border-collapse: separate;
	border-spacing: 0 10px;
}

}
</style>
<script type="text/javascript">
$(function(){
	
});
</script>
</head>
<body style="position: absolute;">
	
	<div class="limiter" style="position: relative;">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50" style="width: 600px;">
				<div class="login100-form">
					<span class="login100-form-title p-b-33">
						기업 세부정보 입력
					</span>
					
					<table>
						<tr>
							<td width="20%"></td>
							<td width="35%" style="text-indent: 70px;">
								<b>남성</b>
							</td width="10%">
							<td></td>
							<td width="35%" style="text-indent: 70px;">
								<b>여성</b>
							</td>
						</tr>
						<tr>
							<td>
								<p>정규직 수</p>
							</td>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="text" id="m_rgllbr_co" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
							<td></td>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="text" id="f_rgllbr_co" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<p>계약직 수</p>
							</td>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="text" id="m_cnttk_co" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
							<td></td>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="text" id="f_cnttk_co" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<p>직원수 합계</p>
							</td>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="text" id="m_sm" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
							<td></td>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="text" id="f_sm" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<p>연간 급여 총액</p>
							</td>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="text" id="m_fyer_salary_totamt" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
							<td></td>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="text" id="f_fyer_salary_totamt" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<p>1인 평균 급여액</p>
							</td>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="text" id="m_jan_salary_am" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
							<td></td>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="text" id="f_jan_salary_am" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
						</tr>
					</table>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>