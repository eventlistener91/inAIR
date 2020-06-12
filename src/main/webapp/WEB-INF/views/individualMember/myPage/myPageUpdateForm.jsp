<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	select {
		height: 51px;
		width: 80px;
		border: none;
		text-align-last: center;
	}
	td {
		padding-bottom: 15px;
	}
</style>
<script type="text/javascript">
$(function() {
	// 생일
	var year = '${indvdlMemInfo.indvdl_bir}'.substring(0, 4);
	var month = '${indvdlMemInfo.indvdl_bir}'.substring(4, 6);
	var day = '${indvdlMemInfo.indvdl_bir}'.substring(6, 8);
	
	$('select[name=indvdl_birYear] option').each(function(){
		if ( $(this).val() == year ) {
			$(this).attr("selected", "selected");
		}
	});
	$('select[name=indvdl_birMonth] option').each(function(){
		if ( $(this).val() == month ) {
			$(this).attr("selected", "selected");
		}
	});
	$('select[name=indvdl_birDay] option').each(function(){
		if ( $(this).val() == day ) {
			$(this).attr("selected", "selected");
		}
	});	
	
	// 휴대폰 번호
	var telFront = '${indvdlMemInfo.indvdl_tel}'.substring(0,3);
	var telMid = '${indvdlMemInfo.indvdl_tel}'.substring(3,7);
	var telBack = '${indvdlMemInfo.indvdl_tel}'.substring(7,11);
	
	$('select[name=indvdl_telFront] option').each(function(){
		if ( $(this).val() == telFront ) {
			$(this).attr("selected", "selected");
		}
	});
	$('input[name=telMid]').val(telMid);
	$('input[name=telBack]').val(telBack);
	
	$('form[name=myPageUpdateForm]').submit(function() {
		var indvdl_bir = $('#indvdl_birYear option:selected').val() + $('#indvdl_birMonth option:selected').val() + $('#indvdl_birDay option:selected').val();
		var indvdl_tel = $('#telFront option:selected').val() + $('input[name=telMid]').val() + $('input[name=telBack]').val();
		$(this).attr("action", "/myPage/updateIndvdlMem.do");
		$(this).append('<input type="hidden" name="indvdl_id" value="${indvdlMemInfo.indvdl_id }"/>');
		$(this).append('<input type="hidden" name="indvdl_bir" value="' + indvdl_bir + '"/>');
		$(this).append('<input type="hidden" name="indvdl_tel" value="' + indvdl_tel + '"/>');
	});
});

</script>
</head>
<body>
<form name="myPageUpdateForm" method="post" enctype="multipart/form-data">
<div class="col-md-13 order-md-last d-flex" style="clear:both;">
	<div class="bg-white p-5 contact-form" id="personalData" style="width:100%;">
		<h2>개인정보 수정</h2>
		<br>
		<hr style="color: black;">
		<table style="width:100%;">
			<tr>
				<td rowspan="7" style="width: 180px;">
					<c:forEach items="${indvdlMemInfo.pictures}" var="fileitem" varStatus="stat">
              			<c:if test="${!empty indvdlMemInfo.pictures}">
							<img src="/files/${fileitem.idpic_file_savename }" alt="증명사진" style="width: 150px; height: 150px;" >
							<input type="hidden" name="idpic_file_num" value="${fileitem.idpic_file_num }" />
						</c:if>
					</c:forEach>
					<span><input type="file" id="idPicture" name="idPicture"/></span>
					<br>
					<input type="text" class="form-control" style="width: 150px; text-align-last: center;" name="indvdl_name" value="${indvdlMemInfo.indvdl_name}">
				</td>
			</tr>
           	<tr>
           		<td>생년월일</td>
           		<td>
           			<select name="indvdl_birYear" id="indvdl_birYear">
           				<c:forEach begin="1900" end="2006" var="i">
							<option value="${i }"> ${i }</option>          						
           				</c:forEach>
           			</select>
           			<select name="indvdl_birMonth" id="indvdl_birMonth">
           				<c:forEach begin="1" end="12" var="i">
           					<c:choose>
           						<c:when test="${i < 10 }">
									<option value="${0}${i}"> ${i }</option>  
								</c:when>
								<c:otherwise>
									<option value="${i }"> ${i } </option>
								</c:otherwise> 						
							</c:choose>
           				</c:forEach>
           			</select>
           			<select name="indvdl_birDay" id="indvdl_birDay">
           				<c:forEach begin="1" end="31" var="i">
           					<c:choose>
           						<c:when test="${i < 10 }">
									<option value="${0}${i}"> ${i }</option>  
								</c:when>
								<c:otherwise>
									<option value="${i }"> ${i } </option>
								</c:otherwise> 						
							</c:choose>
           				</c:forEach>
           			</select>
           		</td>
           	</tr>
           	<tr>
           		<td>성별</td>
           		<td>
           			<input type="radio" name="indvdl_gend" value="여성" ${indvdlMemInfo.indvdl_gend == '여성'? 'checked' : ''} >여성
           			<input type="radio" name="indvdl_gend" value="남성" ${indvdlMemInfo.indvdl_gend == '남성'? 'checked' : ''} style="margin-left:5%;" >남성
           		</td>
           		<td></td>
           	</tr>
           	<tr>
           		<td>이메일</td>
           		<td>
		           	<input type="text" class="form-control" name="indvdl_mail" value="${indvdlMemInfo.indvdl_mail}">
           		</td>
           		<td></td>
           	</tr>
           	<tr>
           		<td>휴대폰</td>
           		<td>
           			<table>
           				<tr>
           					<td>
		           				<select name="telFront" id="telFront">
			           				<option value="010">010</option>
			           				<option value="011">011</option>
			           				<option value="016">016</option>
			           				<option value="017">017</option>
			           				<option value="018">018</option>
			           				<option value="019">019</option>
			           			</select>
           					</td>
           					<td>
		           				<input type="text" class="form-control" style="width: 120px; margin-left: 19px;" name="telMid" >
           					</td>
           					<td>
			           			<input type="text" class="form-control" style="width: 120px; margin-left: 19px;" name="telBack" >
           					</td>
           				</tr>
           			</table>
<%-- 		           	<input type="text" class="form-control" name="indvdl_tel" value="${indvdlMemInfo.indvdl_tel}" > --%>
           		</td>
           		<td></td>
           	</tr>
           	<tr>
           		<td>주소</td>
           		<td>
		           	<input type="text" class="form-control" name="indvdl_adres1" value="${indvdlMemInfo.indvdl_adres1}" >
           		</td>
           		<td></td>
           	</tr>
           	<tr>
           		<td>상세주소</td>
           		<td>
		           	<input type="text" class="form-control" name="indvdl_adres2" value="${indvdlMemInfo.indvdl_adres2}" >
           		</td>
           		<td></td>
           	</tr>
		</table>
		<br>
		<div style="text-align: center;"><button type="submit" id="confirmBtn" style="width: 200px; font-size: 20px; background-color: #6b80f1; color: white;">수정완료</button></div>
	</div>
</div>
</form>	
</body>
</html>