<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="google-signin-client_id" content="429193550282-0vtvu8m5avrb1ucklkh7r1comiqkpp37.apps.googleusercontent.com">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>inAIR</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

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

<script src="${pageContext.request.contextPath}/js/commons.js"></script>
<script src="${pageContext.request.contextPath}/js/validation.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/rsa/jsbn.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/rsa/prng4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/rsa/rng.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/rsa/rsa.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/animsition/js/animsition.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/bootstrap/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/select2/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/daterangepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/countdowntime/countdowntime.js"></script>

<style type="text/css">

b{
	font-size: 12px;
}

h4{
	margin-bottom: 10px;
}

p{
	color: red;
	font-size: 12px;
}

table{
	border-collapse: separate;
	border-spacing: 0 10px;
}

#slideBtn{
	cursor: pointer;
}

#backBtn{
	cursor: pointer;
}

#refreshCaptchaBTN{
	cursor: pointer;
}

.loginBtns{
	height: 80px;
	padding-left: 50px;
}

.loginTarget{
	line-height: 80px;
	font-size: 25px;
}

#indvdlBtn{
	cursor: pointer;
	background-color: white;
	border-top: 1px solid #999999;
	border-left: 1px solid #999999;
	border-bottom: 2px solid #7185e8;
}

#comMemBtn{
	cursor: pointer;
	background-color: #7185e8;
}

#loginTargetIndvdl{
	color: #999999;
}

#loginTagetComMem{
	color: white;
}

.toolTip {
	position: relative;
	display: inline-block;
	cursor: pointer;
}

.toolTip .toolTipText {
	visibility: hidden;
	width: 300px;
	background-color: #555;
	color: #fff;
	text-align: center;
	border-radius: 6px;
	padding: 5px 0;
	position: absolute;
	z-index: 1;
	bottom: 125%;
	left: 50%;
	margin-left: -60px;
	opacity: 0;
	transition: opacity 0.3s;
}

.toolTip .toolTipText::after {
	content: "";
	position: absolute;
	top: 100%;
	left: 20%;
	margin-left: -5px;
	border-width: 5px;
	border-style: solid;
	border-color: #555 transparent transparent transparent;
}

.toolTip:hover .toolTipText {
	visibility: visible;
	opacity: 1;
}

.tel_certification_input, .mail_certification_input {
	display: none;
}

</style>

<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}";
var telCertificationKey = "";
var mailCertificationKey = "";

var corpNameCheck = false;
var bizrNoCheck = false;
var jurirNoCheck = false;
var comSelngCheck = false;
var comProfitCheck = false;
var comIdCheck = false;
var comPassCheck = false;
var comPassPassCheck = false;
var comTelCheck = false;
var comMailCheck = false;
var indutyCheck = false;

var telCertificationCheck = false;
var mailCertificationCheck = false;

var corpCode = "";

$(function(){
	
	// 기업명검색 포커스아웃 이벤트
	$('#corp_name').focusout(function(){
		if($('#corp_name').val().trim() != ""){
			$.ajax({
				url : "${pageContext.request.contextPath}/companyMember/join/searchCompany.do",
				data : {"corp_name" : $('#corp_name').val()},
				dataType : "json",
				type : "post",
				error : function(result){
					alert("에러가 발생했습니다. 관리자에게 문의해주세요. 에러코드 : " + result.status);
				},
				success : function(result) {
					if (result[0].resultFlag == "true") {
						corpNameCheck = true;
						$('#corp_nameSearchResult').empty();
						var htmls = "";
						
						$.each(result, function(index, item){
							if(index > 0){
								htmls += "<option value='" + item.corp_code + "'>" + item.corp_name + "</option>"
							}
						});
						
						$('#extraInfo').css("display", "none");
						$('#corp_nameSearchResult').append(htmls);
						
						ajaxComNameSearch($('#corp_nameSearchResult').val());
						corpCode = $('#corp_nameSearchResult').val();
					} else {
						corpNameCheck = false;
						bizrNoCheck = false;
						jurirNoCheck = false;
						$('#corp_nameSearchResult').empty();
						$('#corp_nameSearchResult').append("<option value=''>검색결과가 없습니다.</option>");
						
						$('#extraInfo').css("display", "none");
						$('#ceo_nm').val("");
						$('#phn_no').val("");
						$('#jurir_no').val("");
						$('#bizr_no').val("");
						$('#bizr_no').prop("disabled", true);
						$('#jurir_no').prop("disabled", true);
						
						corpCode = "";
					}
				}
			});
		} else {
			corpCode = "";
			corpNameCheck = false;
			$('.toolTip').css("display", "none");
			
			$('#corp_nameSearchResult').empty();
			$('#corp_nameSearchResult').append("<option value=''>입력해주세요.</option>");
			
			$('#extraInfo').css("display", "none");
			$('#ceo_nm').val("");
			$('#phn_no').val("");
			$('#jurir_no').val("");
			$('#bizr_no').val("");
			$('#bizr_no').prop("disabled", true);
			$('#jurir_no').prop("disabled", true);
		}
	});	
	
	// 검색된 기업명 클릭 이벤트
	$('#corp_nameSearchResult').change(function(){
		if ($('#corp_nameSearchResult').val() != ""){
			corpNameCheck = true;
			ajaxComNameSearch($('#corp_nameSearchResult').val());
			corpCode = $('#corp_nameSearchResult').val();
		} else {
			corpCode = "";
			corpNameCheck = false;
		}
	});
	
	// 기업 세부정보 입력폼 출력 버튼 클릭 이벤트
	$('.toolTip').click(function(){
		$('#extraInfo').css("display", "block");
		$('.toolTip').css("display", "none");
		$('#m_rgllbr_co').focus();
	});
	
	// 아이디 포커스 아웃 이벤트(아이디 중복체크)
	$('#com_id').focusout(function(){
		if(!$('#com_id').val().validationID()){
			comIdCheck = false;
			$('#id_check_result').css("color", "red");
			$('#id_check_result').text("4~15자의 영문 소문자, 대문자와 숫자만 사용 가능합니다.");
		} else {
			$.ajax({
				url : "${pageContext.request.contextPath}/companyMember/join/IDDuplCheck.do",
				data : {"com_id" : $('#com_id').val()},
				dataType : "json",
				type : "post",
				error : function(result) {
					alert("아이디 중복검사 도중 에러가 발생했습니다. 관리자에게 문의해주세요. 오류코드 : " + result.status);
				},
				success : function(result) {
					if(eval(result.flag)) {
						comIdCheck = true;
						$('#id_check_result').css("color", "#08a600");
						$('#id_check_result').text("멋진 아이디네요!");
					} else {
						comIdCheck = false;
						$('#id_check_result').css("color", "red");
						$('#id_check_result').text("이미 사용중이거나 탈퇴한 아이디입니다.");
					}
				}
			});
		}
	});
	
	// 비밀번호 포커스 아웃 이벤트
	$('#com_pass').focusout(function(){
		if(!$('#com_pass').val().validationPWD()){
			comPassCheck = false;
			$('#com_pass_check_result').text("4~14자의 영문 소문자, 대문자와 숫자만 사용가능합니다.");
		} else {
			comPassCheck = true;
			$('#com_pass_check_result').text("");
		}
	});
	
	// 비밀번호 확인 포커스 아웃 이벤트
	$('#com_pass_check').focusout(function(){
		if($('#com_pass_check').val() != "") {
			if($('#com_pass').val() != $('#com_pass_check').val()) {
				comPassPassCheck = false;
				$('#lockImg').attr("src", "${pageContext.request.contextPath}/images/unLock.png");
				$('#com_pass_check_check_result').text("비밀번호가 일치하지 않습니다.");
			} else {
				comPassPassCheck = true;
				$('#lockImg').attr("src", "${pageContext.request.contextPath}/images/Lock.png");
				$('#com_pass_check_check_result').text("");
			}
		} else { 
			$('#lockImg').attr("src", "${pageContext.request.contextPath}/images/unLock.png");
			$('#com_pass_check_check_result').text("필수 정보입니다.");
			comPassPassCheck = false;
		}
	});
	
	// 문자인증 버튼 이벤트 & 정규식
	$('#com_tel_check_btn').click(function(){
		if(!$('#com_tel').val().validationTEL()){
			comTelCheck = false;
			$('#com_tel_check_result').text("형식에 맞지 않는 번호입니다.");
		} else {
			$('#com_tel_check_result').text("");
			
			var arrayTelNum = $('#com_tel').val().split("-");
			var telNum = "";
			
			$.each(arrayTelNum, function(index, item){
				telNum += item;
			});
			
			$('#com_tel').val(telNum);
			
			$.ajax({
				url : "${pageContext.request.contextPath}/companyMember/join/telCheck.do",
				data : {"com_tel" : telNum},
				dataType : "json",
				type : "post",
				error : function(result) {
					alert("문자 전송에 실패했습니다. 관리자에게 문의해주세요. 에러코드 : " + result.status);
				},
				success : function(result) {
					comTelCheck = true;
					alert("[" + telNum + "]으로 인증문자를 발송했습니다.");
					telCertificationKey = result.randomString;
					
					$('.tel_certification_input').css("display", "inline-block");
					$('#com_tel').attr("disabled", "disabled");
					$('#com_tel').css("background-color", "#f0f0f0");
				}
			});
		}
	});
	
	// 메일인증 버튼 이벤트& 정규식
	$('#com_mail_check_btn').click(function(){
		if (!$('#com_mail').val().validationMail()){
			$('#com_mail_check_result').text("형식에 맞지 않는 이메일입니다.");
			comMailCheck = false;
		} else {
			$('#com_mail_check_result').text("");
			
			$.ajax({
				url : "${pageContext.request.contextPath}/companyMember/join/mailCheck.do",
				data : {"com_mail" : $('#com_mail').val()},
				dataType : "json",
				type : "post",
				error : function(result) {
					alert("메일을 보내는데 실패했습니다. 관리자에게 문의해주세요. 오류코드 : " + result.status);
				}, 
				success : function(result) {
					if(result.resultFlag != "true") {
						comMailCheck = false;
						$('#com_mail_check_result').text("이미 중복된 메일입니다.");
					} else {
						comMailCheck = true;
						alert("[" + $('#com_mail').val() + "]으로 인증메일을 전송했습니다.");
						mailCertificationKey = result.randomString;
						
						$('.mail_certification_input').css("display", "inline-block");
						$('#com_mail').attr("disabled", "disabled");
						$('#com_mail').css("background-color", "#f0f0f0"); 
					}
				}
			});
		}
	});
	
	// 상위 업종 선택하면 하위업종 옵션 세팅 이벤트
	$('#up_induty_name').change(function(){
		if ($('#up_induty_name').val() != "") {
			$('#low_induty_name option').remove();
			getLowIndustryList($('#up_induty_name').val(), '#low_induty_name');
			$('#indutyCheckResult').text("");
			indutyCheck = true;
		} else {
			$('#low_induty_name option').remove();
			$('#low_induty_name').append("<option value=''>하위업종</option>");
			$('#indutyCheckResult').text("필수 정보입니다.");
			indutyCheck = false;
		}
	});
	
	// 추가정보입력 화살표눌를때 이벤트
	$('#slideBtn').click(function(){
		if($('#slideBtn').attr("src") == "${pageContext.request.contextPath }/images/upPointer.png"){
			$('#slideBtn').attr("src", "${pageContext.request.contextPath}/images/downPointer.png");
			$('#extraInfoForm').slideUp();
			
			$('#m_rgllbr_co').val("");
			$('#f_rgllbr_co').val("");
			$('#m_cnttk_co').val("");
			$('#f_cnttk_co').val("");
			$('#m_sm').val("");
			$('#f_sm').val("");
			$('#m_fyer_salary_totamt').val("");
			$('#f_fyer_salary_totamt').val("");
			$('#m_jan_salary_am').val("");
			$('#f_jan_salary_am').val("");
		} else {
			$('#slideBtn').attr("src", "${pageContext.request.contextPath}/images/upPointer.png");
			$('#extraInfoForm').slideDown();
		}
	});
	
	// 사업자 등록번호 포커스 아웃 이벤트
	$('#bizr_no').focusout(function(){
		if(!$('#bizr_no').val().validationBizrNo()){
			bizrNoCheck = false;
			$('#bizr_no_check_result').text("사업자등록번호는 숫자10자리로 이루어져 있습니다.");
		} else {
			bizrNoCheck = true;
			$('#bizr_no_check_result').text("");
		}
	});
	
	// 법인 등록번호 포커스 아웃 이벤트
	$('#jurir_no').focusout(function(){
		if(!$('#jurir_no').val().validationJurirNo()){
			jurirNoCheck = false;
			$('#jurir_no_check_result').text("법인등록번호는 숫자 13자리로 일루어져 있습니다.");
		} else {
			jurirNoCheck = true;
			$('#jurir_no_check_result').text("");
		}
	});
	
	// 연매출 키업 이벤트
	$('#com_selng').on("keyup", function(){
		var flag = commas(this);
		if (flag) {
			comSelngCheck = true;
			$('#com_selng_check_result').text("");
		} else {
			comSelngCheck = false;
			$('#com_selng_check_result').text("숫자만 입력 가능 합니다.");
			$('#com_selng').val("");
		}
	});
	
	// 연매출 포커스 아웃 이벤트
	$('#com_selng').focusout(function(){
		if($('#com_selng').val() == "") {
			comSelngCheck = false;
			$('#com_selng_check_result').text("필수 항목입니다.");
		} else {
			var flag = commas(this);
			if (flag) {
				comSelngCheck = true;
				$('#com_selng_check_result').text("");
			} else {
				comSelngCheck = false;
				$('#com_selng_check_result').text("숫자만 입력 가능 합니다.");
				$('#com_selng').val("");
			}
		}
	});
	
	// 순이익 키업 이벤트
	$('#com_profit').on("keyup", function(){
		var flag = commas(this);
		if (flag) {
			comProfitCheck = true;
			$('#com_profit_check_result').text("");
		} else {
			comProfitCheck = false;
			$('#com_profit_check_result').text("숫자만 입력 가능합니다.");
			$('#com_profit').val("");
		}
	});
	
	// 순이익 포커스 아웃 이벤트
	$('#com_profit').focusout(function(){
		if($('#com_profit').val() == "") {
			$('#com_profit_check_result').text("필수 항목입니다.");
		} else {
			var flag = commas(this);
			if (flag) {
				comProfitCheck = true;
				$('#com_profit_check_result').text("");
			} else {
				comProfitCheck = false;
				$('#com_profit_check_result').text("숫자만 입력 가능합니다.");
				$('#com_profit').val("");
			}
		}
	});
	
	// 남성 정규직 수 키업 이벤트
	$('#m_rgllbr_co').on("keyup", function(){
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#m_rgllbr_co').val("");
		}
	});
	
	// 남성 정규직 수 포커스 아웃 이벤트
	$('#m_rgllbr_co').focusout(function(){
		$('#extraInfoResult').text("필수 항목입니다.");
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#m_rgllbr_co').val("");
		}
	});
	
	// 남성 계약직 수 키업 이벤트
	$('#m_cnttk_co').on("keyup", function(){
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#m_cnttk_co').val("");
		}
	});
	
	// 남성 계약직 수 포커스 아웃 이벤트
	$('#m_cnttk_co').focusout(function(){
		$('#extraInfoResult').text("필수 항목입니다.");
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#m_cnttk_co').val("");
		}
	});
	
	// 남성 직원 합계수 키업 이벤트
	$('#m_sm').on("keyup", function(){
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#m_sm').val("");
		}
	});
	
	// 남성 직원 합계수 포커스 아웃 이벤트
	$('#m_sm').focusout(function(){
		$('#extraInfoResult').text("필수 항목입니다.");
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#m_sm').val("");
		}
	});
	
	// 남성  연간 급여 총액 키업 이벤트
	$('#m_fyer_salary_totamt').on("keyup", function(){
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#m_fyer_salary_totamt').val("");
		}
	});
	
	// 남성 연간 급여 총액 포커스 아웃 이벤트
	$('#m_fyer_salary_totamt').focusout(function(){
		$('#extraInfoResult').text("필수 항목입니다.");
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#m_fyer_salary_totamt').val("");
		}
	});
	
	// 남성 1인 평균 급여액 수 키업 이벤트
	$('#m_jan_salary_am').on("keyup", function(){
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#m_jan_salary_am').val("");
		}
	});
	
	// 남성 1인 평균 급여액 포커스 아웃 이벤트
	$('#m_jan_salary_am').focusout(function(){
		$('#extraInfoResult').text("필수 항목입니다.");
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#m_jan_salary_am').val("");
		}
	});
	
	// 여성 정규직 수 키업 이벤트
	$('#f_rgllbr_co').on("keyup", function(){
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#f_rgllbr_co').val("");
		}
	});
	
	// 여성 정규직 수 포커스 아웃 이벤트
	$('#f_rgllbr_co').focusout(function(){
		$('#extraInfoResult').text("필수 항목입니다.");
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#f_rgllbr_co').val("");
		}
	});
	
	// 여성 계약직 수 키업 이벤트
	$('#f_cnttk_co').on("keyup", function(){
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#f_cnttk_co').val("");
		}
	});
	
	// 여성 계약직 수 포커스 아웃 이벤트
	$('#f_cnttk_co').focusout(function(){
		$('#extraInfoResult').text("필수 항목입니다.");
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#f_cnttk_co').val("");
		}
	});
	
	// 여성 직원 합계수 키업 이벤트
	$('#f_sm').on("keyup", function(){
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#f_sm').val("");
		}
	});
	
	// 여성 직원 합계수 포커스 아웃 이벤트
	$('#f_sm').focusout(function(){
		$('#extraInfoResult').text("필수 항목입니다.");
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#f_sm').val("");
		}
	});
	
	// 여성  연간 급여 총액 키업 이벤트
	$('#f_fyer_salary_totamt').on("keyup", function(){
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#f_fyer_salary_totamt').val("");
		}
	});
	
	// 여성 연간 급여 총액 포커스 아웃 이벤트
	$('#f_fyer_salary_totamt').focusout(function(){
		$('#extraInfoResult').text("필수 항목입니다.");
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#f_fyer_salary_totamt').val("");
		}
	});
	
	// 여성 1인 평균 급여액 수 키업 이벤트
	$('#f_jan_salary_am').on("keyup", function(){
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#f_jan_salary_am').val("");
		}
	});
	
	// 여성 1인 평균 급여액 수 포커스 아웃 이벤트
	$('#f_jan_salary_am').focusout(function(){
		var flag = commas(this);
		if (flag) {
			$('#extraInfoResult').text("");
		} else {
			$('#extraInfoResult').text("숫자만 입력 가능합니다.");
			$('#f_jan_salary_am').val("");
		}
	});
	
	// 
	
	// 최종 회원가입 버튼 이벤트
	$('#submit').click(function(){
		// 기업회원 서브밋 부분
		// 아이디 회사명 비밀번호 연락처 연매출 순이익 메일 주소1 주소2 사업장등록일 기업회원정보제공?? 하위업종번호 고유번호
		if ($('#corp_name').val() == "") {
			corpNameCheck = false;
			$('#corp_name_check_result').text("필수 정보입니다.");
		}
		
		if (corpNameCheck == true){
			if ($('#bizr_no').val() == "") {
				bizrNoCheck = false;
				$('#bizr_no_check_result').text("필수 정보입니다.");
			}
			
			if ($('#jurir_no').val() == "") {
				jurirNoCheck = false;
				$('#jurir_no_check_result').text("필수 정보입니다.");
			}
			
			if ($('#com_selng').val() == "") {
				comSelngCheck = false;
				$('#com_selng_check_result').text("필수 정보입니다.");
			}
			
			if ($('#com_profit').val() == "") {
				comProfitCheck = false;
				$('#com_profit_check_result').text("필수 정보입니다.");
			}
		}
		
		if ($('#com_id').val() == "") {
			comIdCheck = false;
			$('#id_check_result').text("필수 정보입니다.");
		}
		
		if ($('#com_pass').val() == "") {
			comPassCheck = false;
			$('#com_pass_check_result').text("필수 정보입니다.");
		}
		
		if ($('#com_pass_check').val() == "" || $('#com_pass').val() != $('#com_pass_check').val()) {
			comPassPassCheck = false;
			$('#com_pass_check_check_result').text("필수 정보입니다.");
		}
		
		if ($('#com_tel').val() == "") {
			comTelCheck = false;
			$('#com_tel_check_result').text("필수 정보입니다.");
		}
		
		if ($('#com_mail').val() == "") {
			comMailCheck = false;
			$('#com_mail_check_result').text("필수 정보입니다.");
		}
		
		if ($('#low_induty_name').val() == "") {
			indutyCheck =false;
			$('#indutyCheckResult').text("필수 정보입니다.");
		}
		
		if (corpNameCheck && bizrNoCheck && jurirNoCheck && comSelngCheck &&
				comProfitCheck && comIdCheck && comPassCheck && comPassPassCheck &&
				comTelCheck && comMailCheck && indutyCheck) {
			
			if ($('#com_tel_certification_input').val() !=telCertificationKey) {
				telCertificationCheck = false;
				$('#com_tel_check_result').text("문자 인증번호가 틀렸습니다.");
			} else {
				telCertificationCheck = true;
			}
			
			if($('#com_mail_certification_input').val() != mailCertificationKey) {
				mailCertificationCheck = false;
				$('#com_mail_check_result').text("메일 인증번호가 틀렸습니다.");
			} else {
				mailCertificationCheck = true;
			}
			
			if (telCertificationCheck && mailCertificationCheck) {
				var publicExponent = '${publicKeyMap.publicExponent}';
				var publicModulus = '${publicKeyMap.publicModulus}';
				var rsaOBJ = new RSAKey();
				
				rsaOBJ.setPublic(publicModulus, publicExponent);
				var encrytPW = rsaOBJ.encrypt($('#com_pass').val());
				
				$('input[name=corp_code]').val(corpCode);
				
				$('input[name=com_id]').val($('#com_id').val());
				$('input[name=com_pass]').val(encrytPW);
				$('input[name=com_selng]').val($('#com_selng').val());
				$('input[name=com_profit]').val($('#com_profit').val());
				$('input[name=com_mail]').val($('#com_mail').val());
				$('input[name=com_tel]').val($('#com_tel').val());
				$('input[name=lwinduty_num]').val($('#low_induty_name').val());
				
				$('input[name=m_sexdstn]').val('남');
				$('input[name=m_rgllbr_co]').val($('#m_rgllbr_co').val());
				$('input[name=m_cnttk_co]').val($('#m_cnttk_co').val());
				$('input[name=m_sm]').val($('#m_sm').val());
				$('input[name=m_fyer_salary_totamt]').val($('#m_fyer_salary_totamt').val());
				$('input[name=m_jan_salary_am]').val($('#m_jan_salary_am').val());
				
				$('input[name=f_sexdstn]').val('여');
				$('input[name=f_rgllbr_co]').val($('#f_rgllbr_co').val());
				$('input[name=f_cnttk_co]').val($('#f_cnttk_co').val());
				$('input[name=f_sm]').val($('#f_sm').val());
				$('input[name=f_fyer_salary_totamt]').val($('#f_fyer_salary_totamt').val());
				$('input[name=f_jan_salary_am]').val($('#f_jan_salary_am').val());
				
				$('form[name=joinFrm]').submit();
			}
			
		}
	});
	
});

// 연매출과 순이익에 숫자만 입력받고 콤마 넣는 함수
function commas(t) {
	var x = t.value;			
	x = x.replace(/,/gi, '');
	
	var regexp = /^[0-9]*$/;
	
	if(!regexp.test(x)){ 
		$(t).val(""); 
		return false;
	} else {
		x = x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");			
		$(t).val(x);	
		return true;
	}
}

function ajaxComNameSearch(corp_code) {
	$.ajax({
		url : "${pageContext.request.contextPath}/companyMember/join/getCompanyInfo.do",
		data : {"corp_code" : corp_code},
		dataType : "json",
		type : "post",
		error : function(result) {
			alert("에러가 발생했습니다. 관리자에게 문의해주세요. 에러코드 : " + result.status);
		},
		success : function(result) {
			
			$.ajax({
				url : "${pageContext.request.contextPath}/companyMember/join/corpCodeDuplCheck.do",
				data : {"corp_code" : corp_code},
				dataType : "json",
				type : "post",
				error : function(result){
					alert("에러가 발생했습니다. 관리자에게 문의해주세요. 에러코드 : " + result.status);
				},
				success : function(result) {
					if (result.flag == "true") {
						$('#corp_name_check_result').text("");
						corpNameCheck = true;
					} else {
						$('#corp_name_check_result').text("이미 회원가입한 기업입니다.");
						corpNameCheck = false;
					}
				}
			})
			
			$('#ceo_nm').val("");
			$('#phn_no').val("");
			$('#jurir_no').val("");
			$('#bizr_no').val("");
			
			if(result.ceo_nm != ""){
				$('#ceo_nm').val(result.ceo_nm);
				$('#ceo_nm').prop("disabled", true);
			} else {
				$('#ceo_nm').prop("disabled", false);
			}
			
			if(result.phn_no != "") {
				$('#phn_no').val(result.phn_no);
				$('#phn_no').prop("disabled", true);
			} else {
				$('#phn_no').prop("disabled", false);
			}
			
			if(result.jurir_no != ""){
				$('#jurir_no').val(result.jurir_no);
				$('#jurir_no').prop("disabled", true);
				jurirNoCheck = true;
			} else {
				jurirNoCheck = false;
				$('#jurir_no').prop("disabled", false);
			}
			
			if (result.bizr_no != "") {
				$('#bizr_no').val(result.bizr_no);
				$('#bizr_no').prop("disabled", true);
				bizrNoCheck = true;
			} else {
				bizrNoCheck = false;
				$('#bizr_no').prop("disabled", false);
			}
			
			if(eval(result.isExistDetailInfo)){
				$('.toolTip').css("display", "none");
				
				$('#m_rgllbr_co').val("");
				$('#f_rgllbr_co').val("");
				$('#m_cnttk_co').val("");
				$('#f_cnttk_co').val("");
				$('#m_sm').val("");
				$('#f_sm').val("");
				$('#m_fyer_salary_totamt').val("");
				$('#f_fyer_salary_totamt').val("");
				$('#m_jan_salary_am').val("");
				$('#f_jan_salary_am').val("");
				
				$('#extraInfo').css("display", "none");
			} else {
				$('.toolTip').css("display", "inline-block");
			}
		}
	});
}
</script>

</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50" style="width: 600px;">
				<div class="login100-form">
					<b id="backBtn" style="font-size: 16px;" onclick="javascript:location.href='${pageContext.request.contextPath}/individualMember/mainView.do';">inAIR</b>
					<span class="login100-form-title p-b-33">
						inAIR 기업회원 가입
					</span>
					
					<table style="width: inherit;">
						<tbody>
							<tr>
								<td>
									<div id="indvdlBtn" class="loginBtns" onclick="javascript:location.href='${pageContext.request.contextPath}/individualMember/join/joinForm.do'">
										<b id="loginTargetIndvdl" class="loginTarget">개인회원가입</b>
									</div>
								</td>
								<td>
									<div id="comMemBtn" class="loginBtns" onclick="javascript:location.href='${pageContext.request.contextPath}/companyMember/join/joinForm.do'">
										<b id="loginTagetComMem" class="loginTarget">기업회원가입</b>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					
					<br>
					
					<h4>필수 입력사항<b style="color: red;">*</b></h4>
					<table style="width: inherit;">
						<tr>
							<td>
								<label for="corp_name" style="font-size: 12px;">기업명</label>
								<div class="toolTip" style="display: none;">
									<img src="${pageContext.request.contextPath }/images/ExclamationMark.png" style="height: 15px; width: 15px;">
								 	<span class="toolTipText">세부기업정보가 조회되지 않습니다. <br>클릭하여 세부기업정보를 입력해주세요.<br><span style="color: red;">(필수는 아니지만 기업조회때 사용됩니다.)</span></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td width="45%">
								<div class="wrap-input100 validate-input">
									<input type="text" id="corp_name" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
							<td width="10%;"></td>
							<td width="45%">
								<select id="corp_nameSearchResult" style="width: 100%; height: 40px; border-color: #e6e6e6; padding-left: 20px;">
									<option value="">입력해주세요.</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td colspan="3">
								<p id="corp_name_check_result" class="validation_check_result"></p>
							</td>
						</tr>
					</table>
					
					<hr>
					
					<table>
						<tr>
							<td>
								<label for="ceo_nm" style="font-size: 12px;">대표자명</label>
							</td>
							<td></td>
							<td>
								<label for="phn_no" style="font-size: 12px;">전화번호</label>
							</td>
						</tr>
						<tr>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="text" id="ceo_nm" class="input100" style="height: 40px;" disabled>
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
							<td></td>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="text" id="phn_no" class="input100" style="height: 40px;" disabled>
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<label for="bizr_no" style="font-size: 12px;">사업자등록번호</label>
							</td>
							<td></td>
							<td>
								<label for="jurir_no" style="font-size: 12px;">법인등록번호</label>
							</td>
						</tr>
						<tr>
							<td width="45%">
								<div class="wrap-input100 validate-input">
									<input type="text" id="bizr_no" class="input100" style="height: 40px;" disabled>
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
							<td width="10%"></td>
							<td width="45%">
								<div class="wrap-input100 validate-input">
									<input type="text" id="jurir_no" class="input100" style="height: 40px;" disabled>
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<p id="bizr_no_check_result" class="validation_check_result"></p>
							</td>
							<td></td>
							<td>
								<p id="jurir_no_check_result" class="validation_check_result"></p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label for="com_selng" style="font-size: 12px;">연매출</label>
							</td>
							<td></td>
							<td>
								<label for="com_profit" style="font-size: 12px;">당기 순이익</label>
							</td>
						</tr>
						<tr>
							<td>
								<div class="wrap-input100 validate-input" style="position: relative;">
									<p style="position: absolute; color:black; top: 25%; left: 200px;">원</p>
									<input type="text" id="com_selng" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
							<td></td>
							<td>
								<div class="wrap-input100 validate-input" style="position: relative;">
									<p style="position: absolute; color:black; top: 25%; left: 200px;">원</p>
									<input type="text" id="com_profit" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<p id="com_selng_check_result" class="validation_check_result"></p>
							</td>
							<td></td>
							<td>
								<p id="com_profit_check_result" class="validation_check_result"></p>
							</td>
						</tr>
					</table>
						
					<table style="width: inherit;">
						<tr>
							<td>
								<label style="font-size: 12px;">회사업종</label>
							</td>
						</tr>
						
						<tr>
							<td width="30%">
								<select id="up_induty_name" class="input100" style="height: 40px; border-color: #e6e6e6; padding-left: 20px;">
									<option value="" >상위업종</option>
									<c:forEach items="${upIndutyList}" var="upIndutyInfo">
										<option value="${upIndutyInfo.upinduty_num}">${upIndutyInfo.upinduty_name}</option>
									</c:forEach>
								</select>
							</td>
							<td width="5%">
							</td>
							<td width="65%">
								<select id="low_induty_name" class="input100" style="height: 40px; border-color: #e6e6e6; padding-left: 20px;">
									<option value="" >하위업종</option>
								</select>
							</td>
						</tr>
						
						<tr>
							<td colspan="5">
								<p id="indutyCheckResult" style="font-size: 12px; color:red;"></p>
							</td>
						</tr>
					</table>
					
					<hr>
					
					<table style="width: inherit;">
						<tr>
							<td>
								<label for="com_id" style="font-size: 12px;">아이디</label>
							</td>
						</tr>
						<tr>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="text" id="com_id" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<p id="id_check_result" class="validation_check_result"></p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label for="com_pass" style="font-size: 12px;">비밀번호</label>
							</td>
						</tr>
						<tr>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="password" id="com_pass" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td colspan="3">
								<p id="com_pass_check_result" class="validation_check_result"></p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label for="com_pass_check" style="font-size: 12px;">비밀번호 재확인</label>
							</td>
						</tr>
						<tr>
							<td>
								<div class="wrap-input100 validate-input" style="position: relative;">
									<img src="${pageContext.request.contextPath }/images/unLock.png" id="lockImg" style="position: absolute; z-index: 1; top: 30%; left: 270px;">
									<input type="password" id="com_pass_check" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<p id="com_pass_check_check_result" class="validation_check_result"></p>
							</td>
						</tr>
						
						<tr>
							<td colspan="3">
								<hr>
							</td>
						</tr>
						
						<tr>
							<td>
								<label for="com_tel" style="font-size: 12px;">연락처</label>
							</td>
						</tr>
						<tr>
							<td>
								<div class="wrap-input100 validate-input">
									<input type="text" id="com_tel" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
							<td></td>
							<td>
								<div class="wrap-input100" id="com_tel_check_btn">
									<button class="input100" style="height: 40px;">문자인증 받기</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<p id="com_tel_check_result" class="validation_check_result"></p>
							</td>
						</tr>
						<tr class="tel_certification_input">
							<td>
								<b>인증번호를 입력해주세요.</b>
							</td>
						</tr>
						<tr class="tel_certification_input">
							<td colspan="2">
								<div class="wrap-input100 validate-input">
									<input type="text" id="com_tel_certification_input" class="input100" style="height: 40px;">
									<span class='focus-input100-1'></span>
									<span class='focus-input100-2'></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<p id="com_tel_check_result" class="validation_check_result"></p>
							</td>
						</tr>
						
						<tr>
							<td>
								<label for="com_mail" style="font-size: 12px;">메일</label>
							</td>
						</tr>
						<tr>
							<td width="60%">
								<div class="wrap-input100 validate-input">
									<input type="text" id="com_mail" class="input100" style="height: 40px;">
									<span class="focus-input100-1"></span>
									<span class="focus-input100-2"></span>
								</div>
							</td>
							<td width="10%"></td>
							<td width="30%">
								<div class="wrap-input100" id="com_mail_check_btn">
									<button class="input100" style="height: 40px;">메일인증 받기</button>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<p id="com_mail_check_result" class="validation_check_result"></p>
							</td>
						</tr>
						<tr class="mail_certification_input">
							<td>
								<b>인증번호를 입력해주세요.</b>
							</td>
						</tr>
						<tr class="mail_certification_input">
							<td colspan="2">
								<div class="wrap-input100 validate-input">
									<input type="text" id="com_mail_certification_input" class="input100" style="height: 40px;">
									<span class='focus-input100-1'></span>
									<span class='focus-input100-2'></span>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>
								<p id="com_mail_check_result" class="validation_check_result"></p>
							</td>
						</tr>
					</table>
					
					<br><hr><br>
					
					<div style="width: inherit; display: none;" id="extraInfo">
						<h4 style="display: inline-block;">기업정보 추가입력사항</h4>
						<img src="${pageContext.request.contextPath }/images/upPointer.png" id="slideBtn" style="width: 18px; height: 18px; float: right; display: inline-block;">
						<div style="width: inherit;" id="extraInfoForm">
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
										<p style="color: black;">정규직 수</p>
									</td>
									<td>
										<div class="wrap-input100 validate-input" style="position: relative;">
											<p style="position: absolute; color:black; top: 25%; left: 150px;">명</p>
											<input type="text" id="m_rgllbr_co" class="input100" style="height: 40px;">
											<span class="focus-input100-1"></span>
											<span class="focus-input100-2"></span>
										</div>
									</td>
									<td></td>
									<td>
										<div class="wrap-input100 validate-input" style="position: relative;">
											<p style="position: absolute; color:black; top: 25%; left: 150px;">명</p>
											<input type="text" id="f_rgllbr_co" class="input100" style="height: 40px;">
											<span class="focus-input100-1"></span>
											<span class="focus-input100-2"></span>
										</div>
									</td>
								</tr>
								
								<tr>
									<td>
										<p style="color: black;">계약직 수</p>
									</td>
									<td>
										<div class="wrap-input100 validate-input" style="position: relative;">
											<p style="position: absolute; color:black; top: 25%; left: 150px;">명</p>
											<input type="text" id="m_cnttk_co" class="input100" style="height: 40px;">
											<span class="focus-input100-1"></span>
											<span class="focus-input100-2"></span>
										</div>
									</td>
									<td></td>
									<td>
										<div class="wrap-input100 validate-input" style="position: relative;">
											<p style="position: absolute; color:black; top: 25%; left: 150px;">명</p>
											<input type="text" id="f_cnttk_co" class="input100" style="height: 40px;">
											<span class="focus-input100-1"></span>
											<span class="focus-input100-2"></span>
										</div>
									</td>
								</tr>
								
								<tr>
									<td>
										<p style="color: black;">직원수 합계</p>
									</td>
									<td>
										<div class="wrap-input100 validate-input" style="position: relative;">
											<p style="position: absolute; color:black; top: 25%; left: 150px;">명</p>
											<input type="text" id="m_sm" class="input100" style="height: 40px;">
											<span class="focus-input100-1"></span>
											<span class="focus-input100-2"></span>
										</div>
									</td>
									<td></td>
									<td>
										<div class="wrap-input100 validate-input" style="position: relative;">
											<p style="position: absolute; color:black; top: 25%; left: 150px;">명</p>
											<input type="text" id="f_sm" class="input100" style="height: 40px;">
											<span class="focus-input100-1"></span>
											<span class="focus-input100-2"></span>
										</div>
									</td>
								</tr>
								
								<tr>
									<td>
										<p style="color: black;">연간 급여 총액</p>
									</td>
									<td>
										<div class="wrap-input100 validate-input" style="position: relative;">
											<p style="position: absolute; color:black; top: 25%; left: 150px;">원</p>
											<input type="text" id="m_fyer_salary_totamt" class="input100" style="height: 40px;">
											<span class="focus-input100-1"></span>
											<span class="focus-input100-2"></span>
										</div>
									</td>
									<td></td>
									<td>
										<div class="wrap-input100 validate-input" style="position: relative;">
											<p style="position: absolute; color:black; top: 25%; left: 150px;">원</p>
											<input type="text" id="f_fyer_salary_totamt" class="input100" style="height: 40px;">
											<span class="focus-input100-1"></span>
											<span class="focus-input100-2"></span>
										</div>
									</td>
								</tr>
								
								<tr>
									<td>
										<p style="color: black;">1인 평균 급여액</p>
									</td>
									<td>
										<div class="wrap-input100 validate-input" style="position: relative;">
											<p style="position: absolute; color:black; top: 25%; left: 150px;">원</p>
											<input type="text" id="m_jan_salary_am" class="input100" style="height: 40px;">
											<span class="focus-input100-1"></span>
											<span class="focus-input100-2"></span>
										</div>
									</td>
									<td></td>
									<td>
										<div class="wrap-input100 validate-input" style="position: relative;">
											<p style="position: absolute; color:black; top: 25%; left: 150px;">원</p>
											<input type="text" id="f_jan_salary_am" class="input100" style="height: 40px;">
											<span class="focus-input100-1"></span>
											<span class="focus-input100-2"></span>
										</div>
									</td>
								</tr>
								
								<tr>
									<td colspan="3">
										<p id="extraInfoResult"></p>
									</td>
								</tr>
							</table>
						</div>
					</div>

					<div class="container-login100-form-btn m-t-20">
						<button id="submit" class="login100-form-btn">가입하기</button>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<form action="${pageContext.request.contextPath }/companyMember/join/join.do" method="post" name="joinFrm">
		<input type="hidden" name="corp_code" value="" />
		
		<input type="hidden" name="com_id" value="" />
		<input type="hidden" name="com_pass" value="" />
		<input type="hidden" name="com_selng" value="" />
		<input type="hidden" name="com_profit" value="" />
		<input type="hidden" name="com_mail" value="" />
		<input type="hidden" name="com_tel" value="" />
		<input type="hidden" name="lwinduty_num" value="" />
		
		<input type="hidden" name="m_sexdstn" value="" />
		<input type="hidden" name="m_rgllbr_co" value="" />
		<input type="hidden" name="m_cnttk_co" value="" />
		<input type="hidden" name="m_sm" value="" />
		<input type="hidden" name="m_fyer_salary_totamt" value="" />
		<input type="hidden" name="m_jan_salary_am" value="" />
		
		<input type="hidden" name="f_sexdstn" value="" />
		<input type="hidden" name="f_rgllbr_co" value="" />
		<input type="hidden" name="f_cnttk_co" value="" />
		<input type="hidden" name="f_sm" value="" />
		<input type="hidden" name="f_fyer_salary_totamt" value="" />
		<input type="hidden" name="f_jan_salary_am" value="" />
	</form>
</html>