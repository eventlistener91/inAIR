<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8"> 
<head>
        <title>Maruti Admin</title><meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/maruti-login.css" />
    </head>
    <body>
        <div id="loginbox">          
            <form name="passsearch" id="passsearch"action="${pageContext.request.contextPath }/individualMember/login/emailPassSend.do" style="background-color:white">
				<p class="normal_text">e-로움 비밀번호를 잊어버리셨나요?</p>
                    <div class="controls">
                        <div class="main_input_box">
                             <input style="margin-left: 5px" type="text" placeholder="아이디" id="indvdl_id" name="indvdl_id"/></br>
                           
                        	 <input style="margin-left: 5px"type="email" placeholder="회원가입할때 입력하신 이메일 주소를 입력해주세요" id="indvdl_mail" name="indvdl_mail"/>
                        </div>
                    </div>
                <div class="form-actions">
                    <span class="pull-left"><a href="${pageContext.request.contextPath }/login/loginForm.do" class="flip-link btn btn-inverse" id="to-login">&laquo; Back to login</a></span>
                      <span class="pull-left"><input type="button" onClick="location.href='${pageContext.request.contextPath }/individualMember/login/idSearchView.do'" class="btn btn-info"  value="ID찾기" style="margin-left:10px;"/></span>
                    <span class="pull-right"><input type="submit"  class="btn btn-info" value="비밀번호찾기" id="btnsearch"/></span>
                </div>
            </form>
        </div>  
        <script src="${pageContext.request.contextPath}/bootstrap2/js/jquery.min.js"></script>  
        <script src="${pageContext.request.contextPath}/bootstrap2/js/maruti.login.js"></script> 
    </body>
</html>

