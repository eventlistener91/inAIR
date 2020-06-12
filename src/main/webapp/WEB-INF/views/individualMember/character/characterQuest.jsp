<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="individualMemberURL" value="/individualMember"></c:url> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인성 역량 검사</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function() {
	
	var answerSum1 = 0;
	var answerSum2 = 0;
	var answerSum3 = 0;
	var answerSum4 = 0;
	var answerSum5 = 0;
	var answerSum6 = 0;
	var char_element_num = null;
	
	$('.char').click(function(){
		char_element_num = $(this).find('td:eq(0) input').val();
		var charAnswer = parseInt($(this).find("input[type='radio']:checked").val()); 
		
		if ( !isNaN(charAnswer) ) {
			if (char_element_num == "1") {
				answerSum1 += charAnswer;
			}
			if (char_element_num == "2") {
				answerSum2 += charAnswer;
			}
			if (char_element_num == "3") {
				answerSum3 += charAnswer;
			}
			if (char_element_num == "4") {
				answerSum4 += charAnswer;
			}
			if (char_element_num == "5") {
				answerSum5 += charAnswer;
			}
			if (char_element_num == "6") {
				answerSum6 += charAnswer;
			}
		}
	});
	
	$('form[name=characterForm]').submit(function() {						
		$(this).attr("action", "/character/insertCharacterResult.do");
		$(this).append('<input type="hidden" name="indvdl_id" value="${LOGIN_INDVDLMEMINFO.indvdl_id }"/>');
		
		// 각 인성 요인의 합산에 따라 레벨(낮음, 보통, 높음)을 나눠주고,
		// char_deta 테이블의 레벨에 따른 설명을 char_result 테이블에 저장하기 
			
		if (answerSum1 < 31 ) {	// 낮음
			$(this).append('<input type="hidden" name="char_detail_lev01" value="1"/>');
			$(this).append('<input type="hidden" name="char_score01" value="' + answerSum1 + '"/>');
		} else if (answerSum1 < 71 ) { // 보통
			$(this).append('<input type="hidden" name="char_detail_lev01" value="2"/>');
			$(this).append('<input type="hidden" name="char_score01" value="' + answerSum1 + '"/>');
		} else if (answerSum1 < 101) { // 높음
			$(this).append('<input type="hidden" name="char_detail_lev01" value="3"/>');
			$(this).append('<input type="hidden" name="char_score01" value="' + answerSum1 + '"/>');
		}
			
		if (answerSum2 < 31 ) {	// 낮음
			$(this).append('<input type="hidden" name="char_detail_lev02" value="1"/>');
			$(this).append('<input type="hidden" name="char_score02" value="' + answerSum2 + '"/>');
		} else if (answerSum2 < 71 ) { // 보통
			$(this).append('<input type="hidden" name="char_detail_lev02" value="2"/>');
			$(this).append('<input type="hidden" name="char_score02" value="' + answerSum2 + '"/>');
		} else if (answerSum2 < 101) { // 높음
			$(this).append('<input type="hidden" name="char_detail_lev02" value="3"/>');
			$(this).append('<input type="hidden" name="char_score02" value="' + answerSum2 + '"/>');
		}
			
		if (answerSum3 < 31 ) {	// 낮음
			$(this).append('<input type="hidden" name="char_detail_lev03" value="1"/>');
			$(this).append('<input type="hidden" name="char_score03" value="' + answerSum3 + '"/>');
		} else if (answerSum3 < 71 ) { // 보통
			$(this).append('<input type="hidden" name="char_detail_lev03" value="2"/>');
			$(this).append('<input type="hidden" name="char_score03" value="' + answerSum3 + '"/>');
		} else if (answerSum3 < 101) { // 높음
			$(this).append('<input type="hidden" name="char_detail_lev03" value="3"/>');
			$(this).append('<input type="hidden" name="char_score03" value="' + answerSum3 + '"/>');
		}
	
		if (answerSum4 < 31 ) {	// 낮음
			$(this).append('<input type="hidden" name="char_detail_lev04" value="1"/>');
			$(this).append('<input type="hidden" name="char_score04" value="' + answerSum4 + '"/>');
		} else if (answerSum4 < 71 ) { // 보통
			$(this).append('<input type="hidden" name="char_detail_lev04" value="2"/>');
			$(this).append('<input type="hidden" name="char_score04" value="' + answerSum4 + '"/>');
		} else if (answerSum4 < 101) { // 높음
			$(this).append('<input type="hidden" name="char_detail_lev04" value="3"/>');
			$(this).append('<input type="hidden" name="char_score04" value="' + answerSum4 + '"/>');
		}
			
		if (answerSum5 < 31 ) {	// 낮음
			$(this).append('<input type="hidden" name="char_detail_lev05" value="1"/>');
			$(this).append('<input type="hidden" name="char_score05" value="' + answerSum5 + '"/>');
		} else if (answerSum5 < 71 ) { // 보통
			$(this).append('<input type="hidden" name="char_detail_lev05" value="2"/>');
			$(this).append('<input type="hidden" name="char_score05" value="' + answerSum5 + '"/>');
		} else if (answerSum5 < 101) { // 높음
			$(this).append('<input type="hidden" name="char_detail_lev05" value="3"/>');
			$(this).append('<input type="hidden" name="char_score05" value="' + answerSum5 + '"/>');
		}

		if (answerSum6 < 31 ) {	// 낮음
			$(this).append('<input type="hidden" name="char_detail_lev06" value="1"/>');
			$(this).append('<input type="hidden" name="char_score06" value="' + answerSum6 + '"/>');
		} else if (answerSum6 < 71 ) { // 보통
			$(this).append('<input type="hidden" name="char_detail_lev06" value="2"/>');
			$(this).append('<input type="hidden" name="char_score06" value="' + answerSum6 + '"/>');
		} else if (answerSum6 < 101) { // 높음
			$(this).append('<input type="hidden" name="char_detail_lev06" value="3"/>');
			$(this).append('<input type="hidden" name="char_score06" value="' + answerSum6 + '"/>');
		}
		
		return true;
		
	});
});

	
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/fullcalendar.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/maruti-style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap2/css/maruti-media.css" class="skin-color" />
</head>
<body style="background-color:white;" class="characterBody">
	<section class="ftco-section bg-light">
		<div class="container">
			<form name='characterForm' method='post'>
				<div>
					<h3>인성역량검사</h3>
					<div class="widget-box">
						<div class="widget-content nopadding">
							<table class="table table-bordered data-table">
								<thead>
					                <tr>
					                	<th>번호</th>
										<th>질문</th>
										<th style="width: 80px">매우 그렇다</th>
										<th style="width: 80px">그렇다</th>
										<th style="width: 80px">약간 그렇다</th>
										<th style="width: 80px">약간 아니다</th>
										<th style="width: 80px">아니다</th>
										<th style="width: 80px">매우 아니다</th>
					                </tr>
				                </thead>
				                <tbody>
					              	<tr class="gradeX">
					                	<c:forEach items="${charQuestList}" var="charQuest">
										<tr class="char">
											<td><input type="hidden" value="${charQuest.char_element_num }">${charQuest.char_num }</td>
											<td>${charQuest.char_quest }</td>
											<td class="center" style="text-align: center"><input type="radio" name="answer${charQuest.char_num }" value="${charQuest.char_answer1 }"></td>
											<td class="center" style="text-align: center"><input type="radio" name="answer${charQuest.char_num }" value="${charQuest.char_answer2 }"></td>
											<td class="center" style="text-align: center"><input type="radio" name="answer${charQuest.char_num }" value="${charQuest.char_answer3 }"></td>
											<td class="center" style="text-align: center"><input type="radio" name="answer${charQuest.char_num }" value="${charQuest.char_answer4 }"></td>
											<td class="center" style="text-align: center"><input type="radio" name="answer${charQuest.char_num }" value="${charQuest.char_answer5 }"></td>
											<td class="center" style="text-align: center"><input type="radio" name="answer${charQuest.char_num }" value="${charQuest.char_answer6 }"></td>
										</tr>
										</c:forEach>
					                </tr>
				                </tbody>
				            </table>
						</div>
						<div class="widget-title">
							<span style="float:right; padding:2px 40px">
				          		<button type="submit" class="btn btn-primary" >제출하기</button>
				          	</span>
				        </div>
					</div>
				</div>
			</form>
		</div>
	</section>
<script src="${pageContext.request.contextPath}/bootstrap2/js/excanvas.min.js"></script> 
<script src="${pageContext.request.contextPath}/bootstrap2/js/jquery.min.js"></script> 
<script src="${pageContext.request.contextPath}/bootstrap2/js/jquery.ui.custom.js"></script> 
<script src="${pageContext.request.contextPath}/bootstrap2/js/bootstrap.min.js"></script> 
<script src="${pageContext.request.contextPath}/bootstrap2/js/jquery.flot.min.js"></script> 
<script src="${pageContext.request.contextPath}/bootstrap2/js/jquery.flot.resize.min.js"></script> 
<script src="${pageContext.request.contextPath}/bootstrap2/js/jquery.peity.min.js"></script> 
<script src="${pageContext.request.contextPath}/bootstrap2/js/fullcalendar.min.js"></script> 
<script src="${pageContext.request.contextPath}/bootstrap2/js/maruti.js"></script> 
<script src="${pageContext.request.contextPath}/bootstrap2/js/maruti.dashboard.js"></script> 
<script src="${pageContext.request.contextPath}/bootstrap2/js/maruti.chat.js"></script> 
</body>
</html>