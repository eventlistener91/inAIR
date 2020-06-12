<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
var naver_id_login = new naver_id_login("${naverSocialID}", "http://localhost/individualMember/login/callback.do");

naver_id_login.get_naver_userprofile("naverSignInCallback()");

function naverSignInCallback() {
	var gender = naver_id_login.getProfileData('gender');
	var name = naver_id_login.getProfileData('name');
	var mail = naver_id_login.getProfileData('email');
	
	opener.parent.naverCallback(gender, name, mail);
	self.close();
}
</script>
</body>
</html>