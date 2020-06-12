<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="adminURL" value="/admin"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
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
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/rsa/jsbn.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/rsa/prng4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/rsa/rng.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/rsa/rsa.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script type="text/javascript">
		$(function(){
	    	if('${param.message}' != ''){
	        	alert(decodeURI('${param.message}').replace(/\+/gi, " "));
	        }
			
			
			$('#adminLoginBTN').click(function(){
				var admin_id = $('input[name=id]').val();
				var admin_pass = $('input[name=pass]').val();
				
				var publicExponent = '${publicKeyMap["publicExponent"]}';
	    		var publicModulus ='${publicKeyMap["publicModulus"]}';
	    		
	 			var rsaOBJ = new RSAKey();
	 			rsaOBJ.setPublic(publicModulus,publicExponent);
	    		
	    		var encryptID = rsaOBJ.encrypt(admin_id);
	    		var encryptPWD = rsaOBJ.encrypt(admin_pass);
	    		
	    		var $adminId = $('<input type="hidden" name="admin_id" value="'+ encryptID +'"/>');
	    		var $adminPass = $('<input type="hidden" name="admin_pass" value="'+ encryptPWD +'"/>');
			
				$('form[name=adminLoginForm]').append($adminId);
				$('form[name=adminLoginForm]').append($adminPass);
				
				$('form[name=adminLoginForm]').submit();
			});
		});
	</script>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50">
				<form class="login100-form validate-form" action="${adminURL}/login/loginCheckAdmin.do" method="post" name="adminLoginForm">
					<span class="login100-form-title p-b-33">
						관리자 로그인
					</span>
					<div class="wrap-input100 validate-input" >
						<input class="input100" type="text" name="id" placeholder="Id">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					<div class="wrap-input100 rs1 validate-input" >
						<input class="input100" type="password" name="pass" placeholder="Password">
						<span class="focus-input100-1"></span>
						<span class="focus-input100-2"></span>
					</div>
					<div class="container-login100-form-btn m-t-20">
						<button class="login100-form-btn" id="adminLoginBTN">
							로그인
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/bootStrap3/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootStrap3/vendor/animsition/js/animsition.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootStrap3/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/bootStrap3/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootStrap3/vendor/select2/select2.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootStrap3/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootStrap3/vendor/daterangepicker/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath}/bootStrap3/vendor/countdowntime/countdowntime.js"></script>
	<script src="${pageContext.request.contextPath}/bootStrap3/js/main.js"></script>
</body>
</html>