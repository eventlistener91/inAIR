<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
var naver_id_login = new naver_id_login("${naverSocialID }", "http://localhost/individualMember/join/callback.do");
 
naver_id_login.get_naver_userprofile("naverSignInCallback()");
 
function naverSignInCallback() {
	var gender = naver_id_login.getProfileData('gender');
	var name = naver_id_login.getProfileData('name');
	var mail = naver_id_login.getProfileData('email');
	
	$.ajax({
		url : "${pageContext.request.contextPath}/individualMember/join/mailCheck.do",
		data : {"indvdl_mail" : mail},
		dataType : "json",
		type : "post",
		error : function(result) {
			alert("에러가 발생했습니다. 관리자에게 문의해주세요.");
		},
		success : function(result) {
			if (result.resultFlag != "true") {
				alert("이미 회원가입한 이력이 존재합니다.");
				self.close();
			} else {
				opener.parent.naverLoginFunction(gender, name, mail);
				self.close();
			}
		}
	});
}
</script>
</body>
</html>