<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">   
<head>
        <title>Maruti Admin</title><meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/maruti-login.css" />
    </head>
    <body>
        <div id="loginbox">            
            <form id="loginform" name="loginform" class="form-vertical" action="${pageContext.request.contextPath }/individualMember/login/loginCheck.do" style="background-color:white">
				 <div class="control-group normal_text"> <h3>임시비밀번호가 발송되었습니다.</h3></div>
                <div class="form-actions">
                    <span class="pull-left"><a href="${pageContext.request.contextPath }/individualMember/login/idSearchView.do" class="flip-link btn btn-inverse">뒤로가기</a></span>
                    <span class="pull-right"><input href="${pageContext.request.contextPath }/login/loginForm.do" type="button" class="btn btn-success" value="로그인화면으로" id="btn" /></span>
                </div>
            </form>
        </div>
        <script src="${pageContext.request.contextPath}/bootstrap2/js/jquery.min.js"></script>  
        <script src="${pageContext.request.contextPath}/bootstrap2/js/maruti.login.js"></script> 
    </body>

</html>
