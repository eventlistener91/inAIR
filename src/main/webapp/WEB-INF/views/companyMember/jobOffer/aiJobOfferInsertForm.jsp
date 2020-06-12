<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="comMemJobOfferURL" value="/companyMember/jobOffer"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.tdWidth{
		width:20%;
	}
	.itemPlus{
			width:26%; 
			float:right; 
			margin-top:15px;
			margin-bottom:6%;
	}
	.itemPlus:hover{
		background-color:silver !important;
		color:#fff !important;
	}
	.secondDiv{
		padding: 0px 48px 48px 48px !important;
	}
	.deleteBTNStyle{
		width:16%; float:right; 
		margin-right:10%;
	    text-align:center;
	    line-height:37px;
	}
	.btnStyle:hover{		
		background-color:#007bff !important;
		color:#fff !important;
	}
</style>
<script type="text/javascript">
	$(function(){
		// 시도주소를 세팅하는 부분
		$('#joAdres1').append(getSido());
		
		var recruitmentFieldTemp = 1;
		$('#recruitmentFieldPlusBTN').click(function(){
			if($('#recruitmentFieldTable1').css('display') == 'none'){
				$('#recruitmentFieldTable1').css('display', 'block');
			}else{
				var addDiv = document.getElementById('recruitmentFieldTable1');
				var addTable = addDiv.cloneNode(true);
				recruitmentFieldTemp = parseInt(recruitmentFieldTemp) + 1;
				recruitmentFieldTemp = String(recruitmentFieldTemp);
				//테이블 ID
				addTable.id = 'recruitmentFieldTable' + recruitmentFieldTemp;
				//삭제버튼
				addTable.children[0].id = 'recruitmentFieldDeleteBTN' + recruitmentFieldTemp;
				//모집분야 명
				addTable.children[1].children[0].children[0].children[1].children[0].name = "recruitmentFieldList["+ recruitmentFieldTemp +"].recruitment_field_name";
				//모집분야 경력
				addTable.children[1].children[0].children[1].children[1].children[0].name = "recruitmentFieldList["+ recruitmentFieldTemp +"].careerhistory_num";
				addTable.children[1].children[0].children[1].children[1].children[0].id = "career"+ recruitmentFieldTemp +"_0";
				addTable.children[1].children[0].children[1].children[1].children[1].name = "recruitmentFieldList["+ recruitmentFieldTemp +"].careerhistory_num";
				addTable.children[1].children[0].children[1].children[1].children[1].id = "career"+ recruitmentFieldTemp +"_1";
				addTable.children[1].children[0].children[1].children[1].children[2].name = "recruitmentFieldList["+ recruitmentFieldTemp +"].careerhistory_num";
				addTable.children[1].children[0].children[1].children[1].children[2].id = "career"+ recruitmentFieldTemp +"_2";
				//모집분야 인원 수 
				addTable.children[1].children[0].children[2].children[1].children[0].name = "recruitmentFieldList["+ recruitmentFieldTemp  +"].recruitment_field_personnel";
				//모집분야 직급
				addTable.children[1].children[0].children[3].children[1].children[0].name = "recruitmentFieldList["+ recruitmentFieldTemp +"].clsf_num";
				//모집분야 담당 업무
				addTable.children[1].children[0].children[4].children[1].children[0].name = "recruitmentFieldList["+ recruitmentFieldTemp  +"].recruitment_field_job"
				//모집분야 근무부서
				addTable.children[1].children[0].children[5].children[1].children[0].name = "recruitmentFieldList["+ recruitmentFieldTemp   +"].recruitment_field_department";
				
				if(addTable.children[1].children[0].children[1].children[1].children[2].nextElementSibling != null){
					var deleteElement = addTable.children[1].children[0].children[1].children[1].children[2].nextElementSibling
					deleteElement.parentNode.removeChild(deleteElement);
				}
				
				if(addTable.children[1].children[0].children[1].children[1].children[2].nextElementSibling != null){
					var deleteElement = addTable.children[1].children[0].children[1].children[1].children[2].nextElementSibling
					deleteElement.parentNode.removeChild(deleteElement);
				}
				
				if(addTable.children[1].children[0].children[1].children[1].children[2].nextElementSibling != null){
					var deleteElement = addTable.children[1].children[0].children[1].children[1].children[2].nextElementSibling
					deleteElement.parentNode.removeChild(deleteElement);
				}
				
				$('#recruitmentFieldDiv').append(addTable);
				
			}
		});
		
		$('#listBTN').click(function(){
			location.href = "${comMemJobOfferURL}/jobOfferHome.do";
		});
		
		$('#submitBTN').click(function(){
			if($('input[name=jo_manager_name]').val() == '' ){
				alert('담당자 이름을 입력하세요.');
				return false;
			}
			
			for(var i=0; i< parseInt(recruitmentFieldTemp)+1; i++){
				if(document.getElementById('recruitmentFieldTable'+i)){
					if(i == 1){
						if($('#recruitmentFieldTable1').css('display') == 'block'){
							if($('input[name="recruitmentFieldList['+ i +'].recruitment_field_name"]').val() == ''){
								alert('모집분야 명을 입력하세요.');
								return false;
							}
							
							if($('input[name="recruitmentFieldList['+ i +'].recruitment_field_personnel"]').val() == ''){
								alert('모집분야 인원수를 입력하세요.');
								return false;
							}
							
							if($('input[name="recruitmentFieldList['+ i +'].clsf_num"]').val() == ''){
								alert('모집분야 직급을 선택하세요.');
								return false;
							}
							
							if($('input[name="recruitmentFieldList['+ i +'].recruitment_field_job"]').val() == ''){
								alert('모집분야 담당업무를 선택하세요.');
								return false;
							}
							
							var recruitment_field_career = '';
							if($('input:radio[id="career'+ i +'_1"]').is(':checked')){
								recruitment_field_career += '신입';
							}
							
							if($('input:radio[id="career'+ i +'_2"]').is(':checked')){
								recruitment_field_career += ' 경력';
								if(document.getElementById('career'+ i +'_2_1')){
									recruitment_field_career += ' ' + $('#career'+ i +'_2_1').val();
								}
							}
							
							if($('input:radio[id="career'+ i +'_3"]').is(':checked')){
								recruitment_field_career += ' 경력무관';
								if($('input:checkbox[id="career'+ i +'_3_2"]').is(':checked')){
									recruitment_field_career += ' 신입포함';
								}
							}
							
							var $recruitmentFieldCareer = $('<input type="hidden" name="recruitmentFieldList['+ i +'].recruitment_field_career" value="'+ recruitment_field_career +'"/>');
							$('#recruitmentFieldTable'+i).append($recruitmentFieldCareer);
						}else{
							
						}
					}else{
						if($('input[name="recruitmentFieldList['+ i +'].recruitment_field_name"]').val() == ''){
							alert('모집분야 명을 입력하세요.');
							return false;
						}
						
						if($('input[name="recruitmentFieldList['+ i +'].recruitment_field_personnel"]').val() == ''){
							alert('모집분야 인원수를 입력하세요.');
							return false;
						}
						
						if($('input[name="recruitmentFieldList['+ i +'].clsf_num"]').val() == ''){
							alert('모집분야 직급을 선택하세요.');
							return false;
						}
						
						if($('input[name="recruitmentFieldList['+ i +'].recruitment_field_job"]').val() == ''){
							alert('모집분야 담당업무를 선택하세요.');
							return false;
						}
						
						var recruitment_field_career = '';
						if($('input:radio[id="career'+ i +'_1"]').is(':checked')){
							recruitment_field_career += '신입';
						}
						
						if($('input:radio[id="career'+ i +'_2"]').is(':checked')){
							recruitment_field_career += ' 경력';
							if(document.getElementById('career'+ i +'_2_1')){
								recruitment_field_career += ' ' + $('#career'+ i +'_2_1').val();
							}
						}
						
						if($('input:radio[id="career'+ i +'_3"]').is(':checked')){
							recruitment_field_career += ' 경력무관';
							if($('input:checkbox[id="career'+ i +'_3_2"]').is(':checked')){
								recruitment_field_career += ' 신입포함';
							}
						}
						
						var $recruitmentFieldCareer = $('<input type="hidden" name="recruitmentFieldList['+ i +'].recruitment_field_career" value="'+ recruitment_field_career +'"/>');
						$('#recruitmentFieldTable'+i).append($recruitmentFieldCareer);
					}
				}
			}
			
			var jo_wlfare = "<table class='joWlfareTableStyle'><tbody class='joWlfareTbodyStyle'>";
			var jo_cn = "<table class='joCnTableStyle'><tbody class='joCnTbodyStyle'>";
			for(var i=0; i<9; i++){
				if($('#joWlfare_'+i).is(':checked')){
					if(i == 0){
						jo_wlfare += "<tr class='joWlfareTrStyle'>"; 
						jo_wlfare += "<td class='joWlfareFirstTdStyle'>지원금&보험</td>";
						jo_wlfare += "<td class='joWlfareSecondTdStyle'>"; 
						jo_wlfare += $('#jo_wlfare_'+i).val();
						jo_wlfare += "</td>"; 
						jo_wlfare += "</tr>"; 
					}else if(i == 1){
						jo_wlfare += "<tr class='joWlfareTrStyle'>"; 
						jo_wlfare += "<td class='joWlfareFirstTdStyle'>급여제도</td>";
						jo_wlfare += "<td class='joWlfareSecondTdStyle'>"; 
						jo_wlfare += $('#jo_wlfare_'+i).val();
						jo_wlfare += "</td>"; 
						jo_wlfare += "</tr>"; 
					}else if(i == 2){
						jo_wlfare += "<tr class='joWlfareTrStyle'>"; 
						jo_wlfare += "<td class='joWlfareFirstTdStyle'>출산&육아</td>";
						jo_wlfare += "<td class='joWlfareSecondTdStyle'>"; 
						jo_wlfare += $('#jo_wlfare_'+i).val();
						jo_wlfare += "</td>"; 
						jo_wlfare += "</tr>"; 
					}else if(i == 3){
						jo_wlfare += "<tr class='joWlfareTrStyle'>"; 
						jo_wlfare += "<td class='joWlfareFirstTdStyle'>선물</td>";
						jo_wlfare += "<td class='joWlfareSecondTdStyle'>"; 
						jo_wlfare += $('#jo_wlfare_'+i).val();
						jo_wlfare += "</td>"; 
						jo_wlfare += "</tr>";  
					}else if(i == 4){
						jo_wlfare += "<tr class='joWlfareTrStyle'>"; 
						jo_wlfare += "<td class='joWlfareFirstTdStyle'>교육&생활</td>";
						jo_wlfare += "<td class='joWlfareSecondTdStyle'>"; 
						jo_wlfare += $('#jo_wlfare_'+i).val();
						jo_wlfare += "</td>"; 
						jo_wlfare += "</tr>"; 
					}else if(i == 5){
						jo_wlfare += "<tr class='joWlfareTrStyle'>"; 
						jo_wlfare += "<td class='joWlfareFirstTdStyle'>근무환경</td>";
						jo_wlfare += "<td class='joWlfareSecondTdStyle'>"; 
						jo_wlfare += $('#jo_wlfare_'+i).val();
						jo_wlfare += "</td>"; 
						jo_wlfare += "</tr>"; 
					}else if(i == 6){
						jo_wlfare += "<tr class='joWlfareTrStyle'>"; 
						jo_wlfare += "<td class='joWlfareFirstTdStyle'>리프레시</td>";
						jo_wlfare += "<td class='joWlfareSecondTdStyle'>"; 
						jo_wlfare += $('#jo_wlfare_'+i).val();
						jo_wlfare += "</td>"; 
						jo_wlfare += "</tr>"; 
					}else if(i == 7){
						jo_wlfare += "<tr class='joWlfareTrStyle'>"; 
						jo_wlfare += "<td class='joWlfareFirstTdStyle'>출퇴근</td>";
						jo_wlfare += "<td class='joWlfareSecondTdStyle'>"; 
						jo_wlfare += $('#jo_wlfare_'+i).val();
						jo_wlfare += "</td>"; 
						jo_wlfare += "</tr>"; 
					}else if(i == 8){
						jo_wlfare += "<tr class='joWlfareTrStyle'>"; 
						jo_wlfare += "<td colspan='2' class='joWlfareSecondETCTdStyle'>"; 
						jo_wlfare += $('#jo_wlfare_'+i).val();
						jo_wlfare += "</td>"; 
						jo_wlfare += "</tr>"; 
					}
				}
				
				if($('#joCn_'+i).is(':checked')){
					if(i == 0){
						jo_cn += "<tr class='joCnTrStyle'>"; 
						jo_cn += "<td class='joCnFirstTdStyle'>우대사항</td>";
						jo_cn += "<td class='joCnSecondTdStyle'>"; 
						jo_cn += $('#jo_cn_'+i).val();
						jo_cn += "</td>"; 
						jo_cn += "</tr>"; 
					}else if(i == 1){
						jo_cn += "<tr class='joCnTrStyle'>"; 
						jo_cn += "<td class='joCnFirstTdStyle'>접수방법</td>";
						jo_cn += "<td class='joCnSecondTdStyle'>"; 
						jo_cn += $('#jo_cn_'+i).val();
						jo_cn += "</td>"; 
						jo_cn += "</tr>"; 
					}else if(i == 2){
						jo_cn += "<tr class='joCnTrStyle'>"; 
						jo_cn += "<td class='joCnFirstTdStyle'>전형절차</td>";
						jo_cn += "<td class='joCnSecondTdStyle'>"; 
						jo_cn += $('#jo_cn_'+i).val();
						jo_cn += "</td>"; 
						jo_cn += "</tr>"; 
					}else if(i == 3){
						jo_cn += "<tr class='joCnTrStyle'>"; 
						jo_cn += "<td class='joCnFirstTdStyle'>제출서류</td>";
						jo_cn += "<td class='joCnSecondTdStyle'>"; 
						jo_cn += $('#jo_cn_'+i).val();
						jo_cn += "</td>"; 
						jo_cn += "</tr>"; 
					}else if(i == 4){
						jo_cn += "<tr class='joCnTrStyle'>"; 
						jo_cn += "<td class='joCnFirstTdStyle'>유의사항</td>";
						jo_cn += "<td class='joCnSecondTdStyle'>"; 
						jo_cn += $('#jo_cn_'+i).val();
						jo_cn += "</td>"; 
						jo_cn += "</tr>";
					}else if(i == 5){
						jo_cn += "<tr class='joCnTrStyle'>"; 
						jo_cn += "<td class='joCnFirstTdStyle'></td>";
						jo_cn += "<td class='joCnSecondTdStyle'>"; 
						jo_cn += $('#jo_cn_'+i).val();
						jo_cn += "</td>"; 
						jo_cn += "</tr>"; 
					}else if(i == 6){
						jo_cn += "<tr class='joCnTrStyle'>" 
						jo_cn += "<td colspan='2' class='joCnSecondETCTdStyle'>" 
						jo_cn += $('#jo_cn_'+i).val();
						jo_cn += "</td>"; 
						jo_cn += "</tr>"; 
					}
				}
			}
			
			jo_wlfare += "</tbody></table>";
			jo_cn += "</tbody></table>";
			
			
			var $joWlfare = $('<input type="hidden" name="jo_wlfare" value="'+ jo_wlfare +'" />');
			var $joCn = $('<input type="hidden" name="jo_cn" value="'+ jo_cn +'" />');
			
			$('#insertJobOfferForm').append($joWlfare);
			$('#insertJobOfferForm').append($joCn);
			
			if($('input[name=jo_resde]').val() == '' ){
				alert('등록일을 입력하세요.');
				return false;
			}

			if($('input[name=jo_clos]').val() == '' ){
				alert('마감일을 입력하세요.');
				return false;
			}

			//근무요일
			if($('#joWorkDay').val() == '' ){
				alert('근무요일을 선택하세요.');
				return false;
			}else{
				if($('#joWorkDay').val() != '1' ){
					var $joWorkDay = $('<input type="hidden" name="jo_work_day" value="'+ $('#joWorkDay').val() +'"/>');
					$('#insertJobOfferForm').append($joWorkDay);
				}
			}
			
			//근무시간
			if($('#joWorkTime').val() == '' ){
				alert('근무시간을 선택하세요.');
				return false;
			}else{
				if($('#joWorkTime').val() != '1' ){
					var $joWorkDay = $('<input type="hidden" name="jo_work_time" value="'+ $('#joWorkTime').val() +'"/>');
					$('#insertJobOfferForm').append($joWorkDay);
				}
			}
			
			//근무지 
			if($('select[name=jo_adres1]').val() == '' ){
				alert('근무지를 선택하세요.');
				return false;
			}
			
			if($('select[name=jo_adres2]').val() == '' ){
				alert('근무지를 선택하세요.');
				return false;
			}
			
			if($('select[name=lowpro_num]').val() == '' ){
				alert('공고 대표 직종을 선택하세요.');
				return false;
			}
			
			if($('select[name=salary_num]').val() == '' ){
				alert('급여를 선택하세요.');
				return false;
			}
			
			if($('select[name=emplym_num]').val() == '' ){
				alert('고용형태를 선택하세요.');
				return false;
			}
			
			if($('input[name=jo_sj]').val() == '' ){
				alert('공고 제목을 입력하세요.');
				return false;
			}
			
			if($('#agreeCheckbox').is(":checked") == false){
				alert('지원 접수 위임을 동의해주세요.');
				return false;
			}
			
			var $comId = $("<input type='hidden' name='com_id' value='${LOGIN_COMMEMINFO.com_id}'/>");
			var $joAireqst = $('<input type="hidden" name="jo_aireqst" value="Y" />');
			$('#insertJobOfferForm').append($comId);
			$('#insertJobOfferForm').append($joAireqst);
		
			return true;
		});
	});
	
	function elementDeleteBTN(btnId){
		if(btnId == 'recruitmentFieldDeleteBTN1'){
			$("#recruitmentFieldTable1").css("display", "none");
		}else{
			var btnIdElement = document.getElementById(btnId);
			var deleteDiv = btnIdElement.parentNode;
			deleteDiv.remove();
		}
	}
	
	function selectCareer(thisId){
		if($('#'+thisId).val() == 1){
			if(document.getElementById(thisId).nextElementSibling.nextElementSibling.nextElementSibling != null){
				var deleteElement = document.getElementById(thisId).nextElementSibling.nextElementSibling.nextElementSibling
				deleteElement.parentNode.removeChild(deleteElement);
			}
			
			if(document.getElementById(thisId).nextElementSibling.nextElementSibling.nextElementSibling != null){
				var deleteElement = document.getElementById(thisId).nextElementSibling.nextElementSibling.nextElementSibling
				deleteElement.parentNode.removeChild(deleteElement);
			}
			
			if(document.getElementById(thisId).nextElementSibling.nextElementSibling.nextElementSibling != null){
				var deleteElement = document.getElementById(thisId).nextElementSibling.nextElementSibling.nextElementSibling
				deleteElement.parentNode.removeChild(deleteElement);
			}
		}else if($('#'+thisId).val() == 2){
			if(document.getElementById(thisId).nextElementSibling.nextElementSibling != null){
				var deleteElement = document.getElementById(thisId).nextElementSibling.nextElementSibling
				deleteElement.parentNode.removeChild(deleteElement);
			}
			
			if(document.getElementById(thisId).nextElementSibling.nextElementSibling != null){
				var deleteElement = document.getElementById(thisId).nextElementSibling.nextElementSibling
				deleteElement.parentNode.removeChild(deleteElement);
			}

			var thisIdElement = document.getElementById(thisId);
			var appendElement = thisIdElement.parentNode;
			
			var $addInputText = $('<input type="text" id="'+ thisId +'_1" style="margin-left:3%;" placeholder="경력 연수를 입력하세요."/>');
			$(appendElement).append($addInputText);
		}else if($('#'+thisId).val() == 3){
			if(document.getElementById(thisId).nextElementSibling != null){
				var deleteElement = document.getElementById(thisId).nextElementSibling
				deleteElement.parentNode.removeChild(deleteElement);
			}

			var thisIdElement = document.getElementById(thisId);
			var appendElement = thisIdElement.parentNode;

			var $addInputText = $('<input type="checkbox" id="'+ thisId +'_2" style="margin-left:3%;" />');
			var $addText = $('<label id="'+ thisId +'_3">신입포함여부를 선택하세요.</label>');
			$(appendElement).append($addInputText);
			$(appendElement).append($addText);
		}
	}
	
	function selectWorkDay(thisId){
		if($('#'+thisId).val() == 1){
			var $addInputText = $('<input type="text" class="form-control" id="joWorkDayInput" name="jo_work_day" placeholder="근무요일을 입력해주세요."/>');
			var thisIdElement = document.getElementById(thisId);
			var nextElement = thisIdElement.parentNode.nextElementSibling;
			$(nextElement).append($addInputText);
		}else{
			$('#joWorkDayInput').remove();
		}
	}
	
	function selectWorkTime(thisId){
		if($('#'+thisId).val() == 1){
			var $addInputText = $('<input type="text" class="form-control" id="joWorkTimeInput" name="jo_work_time" placeholder="근무시간을 입력해주세요."/>');
			var thisIdElement = document.getElementById(thisId);
			var nextElement = thisIdElement.parentNode.nextElementSibling;
			$(nextElement).append($addInputText);
		}else{
			$('#joWorkTimeInput').remove();
		}
	}
	
	//근무지역 selectBox 변경 함수 
	function selectSearchAddr(thisId){
		var gugun = getGugun($('#'+thisId).val());
		var thisIdElement = document.getElementById(thisId);
		var searchAddr2Id = thisIdElement.parentNode.nextElementSibling.children[0].id;
		
		$('#'+searchAddr2Id).empty();
		$('#'+searchAddr2Id).append('<option value="">선택해주세요.</option>');
		for(var i = 1; i < gugun.length; i++){
			$('#'+searchAddr2Id).append('<option value="' + gugun[i] + '">' + gugun[i] + '</option>');
		}
	}
	
	//직종 selectBox 변경 함수
	function selectLowPROFunction(thisId){
		var thisIdElement = document.getElementById(thisId);
		var thisIdNextElementId = thisIdElement.parentNode.parentNode.childNodes[5].firstElementChild.id;
		$('#' + thisIdNextElementId).empty();
		if($('#'+thisId+' option:selected').val() == '0'){
			var changeOption = $('<option value="0">선택해주세요.</option>');
			$('#'+thisIdNextElementId).append(changeOption);
		}else{
			getLowPROList($('#'+thisId+' option:selected').val(), '#' + thisIdNextElementId);
		}
	}
</script>
</head>
<body>
	<section class="ftco-section bg-light">
		<form id="insertJobOfferForm" action="${comMemJobOfferURL}/insertJobOffer.do" method="post" enctype="multipart/form-data">
			<div class="container" style="text-align:center;">
			<div style="margin-top:5%; float:left;"><label class="form-group icon-star" style="color:red; line-height:250%;"></label>필수사항 입니다.</div>
				<h2 style="clear:both; float:left; margin-right:5%;">기업 대표 정보</h2>
				<div style="float:left; margin-top:1%; margin-bottom:1%;" class="icon-person">기업정보는 기업정보관리에서 수정 가능합니다. 기업정보관리에서 정보 수정시 구인공고글에 자동으로 업데이트됩니다.</div>
				<div class="col-md-13 order-md-last d-flex" style="clear:both; margin-bottom:4%;">
					<div class="bg-white p-5 contact-form" style="width:100%; text-align:left;">
		            	<table style="width:100%;">
		            		<tr>
		            			<td class="tdWidth">
					            	기업 명칭
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" value="${companyVo.corp_name}" disabled >
		            			</td>
		            			<td rowspan='4' style="width:20%; height:100%; margin-left:10%;"> 
									<img src="/files/${comProfile.com_file_savename}" alt="기업프로필사진" style="width:130px; height:130px; margin-left:20%;" >
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
					            	기업 주소
		            			</td>
		            			<td>
		            				<input type="text" class="form-control" value="${companyVo.adres}" disabled>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
					            	기업 홈페이지주소 
		            			</td>
		            			<td>
					              	<input type="text" class="form-control" value="${companyVo.hm_url}" disabled>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
					            	기업 대표 연락처
		            			</td>
		            			<td>
					              	<input type="text" class="form-control" value="${companyVo.phn_no}" disabled>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
					            	기업 대표 팩스번호
		            			</td>
		            			<td>
					              	<input type="text" class="form-control" value="${companyVo.fax_no}" disabled>
		            			</td>
		            		</tr>
		            	</table>
		            </div>
	        	</div>	
				<h2 style="clear:both; float:left; margin-right:5%;">기업 정보</h2>
				<div style="float:left; margin-top:2%;" class="icon-person">기업정보는 기업정보관리에서 수정 가능합니다. 기업정보관리에서 정보 수정시 구인공고글에 자동으로 업데이트됩니다.</div>
				<div class="col-md-13 order-md-last d-flex" style="clear:both;">
					<div class="bg-white p-5 contact-form" style="width:100%; text-align:left; margin-bottom:4%;">
		            	<table style="width:100%;">
		            		<tr>
		            			<td class="tdWidth">
					            	<label class="form-group icon-star" style="color:red;"></label>기업 연락처
		            			</td>
		            			<td>
					              	<input type="text" class="form-control" value="${LOGIN_COMMEMINFO.com_tel}" disabled>
		            			</td>
		            			<td style="width:10%;"></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	기업 연매출
		            			</td>
		            			<td>
		            				<input type="text" class="form-control" value="${LOGIN_COMMEMINFO.com_selng}" disabled>
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	기업 순이익
		            			</td>
		            			<td>
					              	<input type="text" class="form-control" value="${LOGIN_COMMEMINFO.com_profit}" disabled>
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>기업 이메일
		            			</td>
		            			<td>
					              	<input type="text" class="form-control" value="${LOGIN_COMMEMINFO.com_mail}" disabled>
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>기업 업종
		            			</td>
		            			<td>
					              	<input type="text" class="form-control" style="width:50%; float:left;" value="${industryInfo.upinduty_name}" disabled><!-- 상위업종 -->
					              	<input type="text" class="form-control" style="width:50%; float:left;" value="${industryInfo.lwinduty_name}" disabled><!-- 하위업종 -->
				            	</td>
		            			<td></td>
		            		</tr>
		            	</table>
		            </div>
	        	</div>	
				<h2 style="clear:both; float:left; margin-right:5%;">기업 추가 정보</h2>
				<div style="float:left; margin-top:1%; margin-bottom:1%;" class="icon-person">기업정보는 기업정보관리에서 수정 가능합니다. 기업정보관리에서 정보 수정시 구인공고글에 자동으로 업데이트됩니다.</div>
				<div class="col-md-13 order-md-last d-flex" style="clear:both;">
					<div class="bg-white p-5 contact-form" style="width:100%; text-align:left; margin-bottom:4%;">
		            	<table style="width:100%;">
		            		<thead style="text-align:center;">
		            			<th></th>
		            			<th>여성</th>
		            			<th>남성</th>
		            		</thead>
		            		<tbody>
			            		<tr>
			            			<td>
						            	정규직 수
			            			</td>
			            			<td>
						            	<input type="text" class="form-control" value="${companyInfofirst.rgllbr_co}" disabled >
			            			</td>
			            			<td>
			            				<input type="text" class="form-control" value="${companyInfosecond.rgllbr_co}" disabled >
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
						            	계약직 수
			            			</td>
			            			<td>
						              	<input type="text" class="form-control" value="${companyInfofirst.cnttk_co}" disabled>
			            			</td>
			            			<td>
			            				<input type="text" class="form-control" value="${companyInfosecond.cnttk_co}" disabled >
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
						            	직원 수 합계
			            			</td>
			            			<td>
			            				<input type="text" class="form-control" value="${companyInfofirst.sm}" disabled>
			            			</td>
			            			<td>
			            				<input type="text" class="form-control" value="${companyInfosecond.sm}" disabled >
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
						            	연간 급여 총액
			            			</td>
			            			<td>
						              	<input type="text" class="form-control" value="${companyInfofirst.fyer_salary_totamt}" disabled>
			            			</td>
			            			<td>
			            				<input type="text" class="form-control" value="${companyInfosecond.fyer_salary_totamt}" disabled >
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
						            	1인 평균 급여액
			            			</td>
			            			<td>
						              	<input type="text" class="form-control" value="${companyInfofirst.jan_salary_am}" disabled>
			            			</td>
			            			<td>
			            				<input type="text" class="form-control" value="${companyInfosecond.jan_salary_am}" disabled >
			            			</td>
			            		</tr>
		            		</tbody>
		            	</table>
		            </div>
	        	</div>	
	        	<h2 style="clear:both; float:left; margin-right:5%;">담당자 정보</h2>
				<div class="col-md-13 order-md-last d-flex" style="clear:both;">
					<div class="bg-white p-5 contact-form" style="width:100%; text-align:left; margin-bottom:10%;">
		            	<table style="width:100%;">
		            		<tr>
		            			<td class="tdWidth">
					            	<label class="form-group icon-star" style="color:red;"></label>담당자 이름
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" name="jo_manager_name">
		            			</td>
		            			<td style="width:10%;"></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	담당자 연락처
		            			</td>
		            			<td>
					              	<input type="text" class="form-control" name="jo_manager_tel">
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	담당자 이메일
		            			</td>
		            			<td>
		            				<input type="text" class="form-control" name="jo_manager_mail">
		            			</td>
		            			<td></td>
		            		</tr>
		            	</table>
		            </div>
	        	</div>
	        	<div id="recruitmentFieldDiv">
		        	<h2 style="clear:both; float:left; margin-right:5%;">모집 분야</h2>
					<div class="col-md-13 order-md-last d-flex" style="clear:both;" id="recruitmentFieldTable0">
						<div class="bg-white p-5 contact-form" style="width:100%; text-align:left;" >
			            	<table style="width:100%;">
			            		<tr>
			            			<td class="tdWidth">
						            	<label class="form-group icon-star" style="color:red;"></label>모집분야 명
			            			</td>
			            			<td colspan="2">
						            	<input type="text" class="form-control" name="recruitmentFieldList[0].recruitment_field_name" placeholder="예) 경영지원, 고객상담">
			            			</td>
			            			<td style="width:10%;"></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>모집분야 경력
			            			</td>
			            			<td colspan="3">
		            					<c:forEach items="${careerHistoryList}" var="careerHistoryInfo" varStatus="status">
							              	<input type="radio" name="recruitmentFieldList[0].careerhistory_num" id="career0_${status.count}" value="${careerHistoryInfo.careerhistory_num}" onchange="selectCareer(this.id);" style="${(!status.first)? 'margin-left:3%;' : '' }">${careerHistoryInfo.careerhistory_contents}
		            					</c:forEach>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>모집분야 인원수
			            			</td>
			            			<td style="line-height:50px;">
			            				<input type="text" class="form-control" name="recruitmentFieldList[0].recruitment_field_personnel" style="width:20%; float:left; margin-right:10px;">명 모집
			            			</td>
			            			<td></td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>모집분야 직급
			            			</td>
			            			<td colspan="2">
			            				<select class="form-control" name="recruitmentFieldList[0].clsf_num">
			            					<option>선택해주세요.</option>
			            					<c:forEach items="${classOfPositionList}" var="classOfPositionInfo">
				            					<option value="${classOfPositionInfo.clsf_num}">${classOfPositionInfo.clsf_name}</option>
			            					</c:forEach>
			            				</select>
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>모집분야 담당업무
			            			</td>
			            			<td colspan="2">
			            				<input type="text" class="form-control" name="recruitmentFieldList[0].recruitment_field_job" placeholder="담당업무를 입력해주세요.">
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	모집분야 근무부서
			            			</td>
			            			<td colspan="2">
			            				<input type="text" class="form-control" name="recruitmentFieldList[0].recruitment_field_department" placeholder="근무하게 될 부서를 입력해주세요.">
			            			</td>
			            			<td></td>
			            		</tr>
			            	</table>
			            	<hr>
			            </div>
		        	</div>
					<div class="col-md-13 order-md-last d-flex" style="clear:both;">
						<div class="bg-white p-5 contact-form secondDiv" style="width:100%; text-align:left; display:none;" id="recruitmentFieldTable1">
							<a class="form-control deleteBTNStyle" id="recruitmentFieldDeleteBTN1" onclick="elementDeleteBTN(this.id);">
								삭제
								<label class="icon-remove" style="margin-left:15px;"></label>
							</a>
			            	<table style="width:100%;">
			            		<tr>
			            			<td class="tdWidth">
						            	<label class="form-group icon-star" style="color:red;"></label>모집분야 명
			            			</td>
			            			<td colspan="2">
						            	<input type="text" class="form-control" name="recruitmentFieldList[1].recruitment_field_name" placeholder="예) 경영지원, 고객상담">
			            			</td>
			            			<td style="width:10%;"></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>모집분야 경력
			            			</td>
			            			<td colspan="3">
			            				<c:forEach items="${careerHistoryList}" var="careerHistoryInfo" varStatus="status">
							              	<input type="radio" name="recruitmentFieldList[1].careerhistory_num" id="career1_${status.count}" value="${careerHistoryInfo.careerhistory_num}" onchange="selectCareer(this.id);" style="${(!status.first)? 'margin-left:3%;' : '' }">${careerHistoryInfo.careerhistory_contents}
		            					</c:forEach>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>모집분야 인원수
			            			</td>
			            			<td style="line-height: 50px;">
			            				<input type="text" class="form-control" name="recruitmentFieldList[1].recruitment_field_personnel" style="width:20%; float:left; margin-right:10px;">명 모집
			            			</td>
			            			<td></td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>모집분야 직급
			            			</td>
			            			<td colspan="2">
			            				<select class="form-control" name="recruitmentFieldList[1].clsf_num">
			            					<option>선택해주세요.</option>
			            					<c:forEach items="${classOfPositionList}" var="classOfPositionInfo">
				            					<option value="${classOfPositionInfo.clsf_num}">${classOfPositionInfo.clsf_name}</option>
			            					</c:forEach>
			            				</select>
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>모집분야 담당업무
			            			</td>
			            			<td colspan="2">
			            				<input type="text" class="form-control" name="recruitmentFieldList[1].recruitment_field_job" placeholder="담당업무를 입력해주세요.">
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	모집분야 근무부서
			            			</td>
			            			<td colspan="2">
			            				<input type="text" class="form-control" name="recruitmentFieldList[1].recruitment_field_department" placeholder="근무하게 될 부서를 입력해주세요.">
			            			</td>
			            			<td></td>
			            		</tr>
			            	</table>
			            	<hr>
			            </div>
		        	</div>
	        	</div>
	        	<a class="form-control itemPlus" id="recruitmentFieldPlusBTN" style="line-height:35px;">
		        	모집분야
		        	<label class="icon-plus" style="margin-left: 15px;"></label>
	        	</a>
	        	<h2 style="margin-top:100px; float:left;">첨부파일</h2>
				<div style="margin-top:120px; float:left; margin-left:20px;">자사양식 및 기타서류는 다섯개까지 등록가능합니다.</div>
				<div id="jobOfferFileDiv">
					<div class="col-md-13 order-md-last d-flex" style="clear:both;" id="jobOfferFileTable">
						<div class="bg-white p-5 contact-form" style="width:100%; margin-bottom:10%;">
							<div class="sidebar-box ftco-animate">
				            	<div class="categories" style="text-align:left;">
					                <li><input type="file" class="btn" name="jobOfferFiles" data-buttonName="btn-primary"></li>
					                <li><input type="file" class="btn" name="jobOfferFiles" data-buttonName="btn-primary"></li>
					                <li><input type="file" class="btn" name="jobOfferFiles" data-buttonName="btn-primary"></li>
					                <li><input type="file" class="btn" name="jobOfferFiles" data-buttonName="btn-primary"></li>
					                <li><input type="file" class="btn" name="jobOfferFiles" data-buttonName="btn-primary"></li>
					                <li></li>
					            </div>
					        </div>        
		              	</div>
		            </div>
	            </div>
	            <h2 style="clear:both; float:left; margin-right:5%;">복리 후생</h2>
	        	<div style="float:left; margin-top:1%; margin-bottom:1%;" >
	        		<input type="checkbox" checked/>
	        		작성시 체크해주세요.
	        	</div>
				<div class="col-md-13 order-md-last d-flex" style="clear:both;">
					<div class="bg-white p-5 contact-form" style="width:100%; text-align:left; margin-bottom:10%;">
		            	<table style="width:100%;">
		            		<tr>
		            			<td>
		            				<input type="checkbox" id="joWlfare_0"/>
		            			</td>
		            			<td style="width:17%;">
					            	지원금&보험
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" id="jo_wlfare_0" >
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            				<input type="checkbox" id="joWlfare_1"/>
		            			</td>
		            			<td>
					            	급여제도
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" id="jo_wlfare_1" placeholder="ex) 4대보험, 퇴직금, 휴일(특근)수당 등"/>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            				<input type="checkbox" id="joWlfare_2"/>
		            			</td>
		            			<td>
					            	출산/육아
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" id="jo_wlfare_2" />
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            				<input type="checkbox" id="joWlfare_3"/>
		            			</td>
		            			<td>
					            	선물
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" id="jo_wlfare_3" placeholder="ex) 명절선물 등 "/>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            				<input type="checkbox"  id="joWlfare_4"/>
		            			</td>
		            			<td>
					            	교육&생활
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" id="jo_wlfare_4" placeholder="ex) 도서구입비지원 등 "/>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            				<input type="checkbox"  id="joWlfare_5"/>
		            			</td>
		            			<td>
					            	근무환경
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" id="jo_wlfare_5">
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            				<input type="checkbox"  id="joWlfare_6"/>
		            			</td>
		            			<td>
					            	리프레시
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" id="jo_wlfare_6" placeholder="ex) 연차, 반차, 여름휴가 등 "/>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            				<input type="checkbox"  id="joWlfare_7"/>
		            			</td>
		            			<td>
					            	출퇴근
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" id="jo_wlfare_7" placeholder="ex) 차량유지비지급, 기숙사제공, 회사차량있음 등 "/>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            				<input type="checkbox"  id="joWlfare_8"/>
		            			</td>
		            			<td>
					            	그 외
		            			</td>
		            			<td>
					            	<textarea type="text" class="form-control" id="jo_wlfare_8" style="height:150px !important;"></textarea>
		            			</td>
		            		</tr>
		            	</table>
		            </div>
	        	</div>
	        	<h2 style="clear:both; float:left; margin-right:5%;">기타 사항</h2>
	        	<div style="float:left; margin-top:1%; margin-bottom:1%;" >
	        		<input type="checkbox" checked/>
	        		작성시 체크해주세요.
	        	</div>
				<div class="col-md-13 order-md-last d-flex" style="clear:both;">
					<div class="bg-white p-5 contact-form" style="width:100%; text-align:left; margin-bottom:10%;">
		            	<table style="width:100%;">
		            		<tr>
		            			<td>
		            				<input type="checkbox" id="joCn_0"/>
		            			</td>
		            			<td style="width:17%;">
					            	우대사항
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" id="jo_cn_0" placeholder="ex) 전공, 자격증 등"/>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            				<input type="checkbox" id="joCn_1"/>
		            			</td>
		            			<td>
					            	접수방법
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" id="jo_cn_1" placeholder="ex) inAIR 입사지원, 이메일지원, 우편지원 등"/>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            				<input type="checkbox" id="joCn_2"/>
		            			</td>
		            			<td>
					            	전형절차
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" id="jo_cn_2" placeholder="ex) 서류전형, 1차면접, 2차면접, 임원면접, 최종합격 등 "/>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            				<input type="checkbox" id="joCn_3"/>
		            			</td>
		            			<td>
					            	제출서류
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" id="jo_cn_3" placeholder=" 제출해야할 서류를 입력하세요."/>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            				<input type="checkbox" id="joCn_4"/>
		            			</td>
		            			<td>
					            	유의사항
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" id="jo_cn_4" value="입사지원 서류에 허위사실이 발견될 경우, 채용확정 이후라도 채용이 취소될 수 있습니다." disabled/>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            				<input type="checkbox" id="joCn_5"/>
		            			</td>
		            			<td>
					            	유의사항
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" id="jo_cn_5" value="모집분야별로 마감일이 상이할 수 있으니 유의하시길 바랍니다." disabled/>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            				<input type="checkbox" id="joCn_6"/>
		            			</td>
		            			<td>
					            	기타 참고사항
		            			</td>
		            			<td>
					            	<textarea type="text" class="form-control" id="jo_cn_6" style="height:150px !important;"></textarea>
		            			</td>
		            		</tr>
		            	</table>
		            </div>
	        	</div>
	        	<h2 style="clear:both; float:left; margin-right:5%;">구인 정보</h2>
				<div class="col-md-13 order-md-last d-flex" style="clear:both;">
					<div class="bg-white p-5 contact-form" style="width:100%; text-align:left; margin-bottom:10%;">
		            	<table style="width:100%;">
		            		<tr>
		            			<td class="tdWidth">
					            	<label class="form-group icon-star" style="color:red;"></label>등록일
		            			</td>
		            			<td>
					            	<input type="date" class="form-control" name="jo_rgsde">
		            			</td>
		            			<td style="width:10%;"></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>마감일
		            			</td>
		            			<td>
					            	<input type="date" class="form-control" name="jo_clos">
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>AI면접 시작일
		            			</td>
		            			<td>
					            	<input type="date" class="form-control" name="jo_aistart">
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>AI면접 마감일
		            			</td>
		            			<td>
					            	<input type="date" class="form-control" name="jo_aiend">
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>근무요일
		            			</td>
		            			<td>
					            	<select class="form-control" id="joWorkDay" onchange="selectWorkDay(this.id);">
					            		<option>선택해주세요.</option>
					            		<option value="주 5일(월~금)">주 5일(월~금)</option>
					            		<option value="토요일 격주휴무(월~토)">토요일 격주휴무(월~토)</option>
					            		<option value="주 6일(월~토)">주 6일(월~토)</option>
					            		<option value="주 3일(격일제)">주 3일(격일제)</option>
					            		<option value="탄력적근무제">탄력적근무제</option>
					            		<option value="2교대">2교대</option>
					            		<option value="3교대">3교대</option>
					            		<option value="4교대">4교대</option>
					            		<option value="1">직접입력</option>
					            	</select>
		            			</td>
		            			<td style="width:10%;"></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>근무시간
		            			</td>
		            			<td>
					              	<select class="form-control" id="joWorkTime" onchange="selectWorkTime(this.id);">
					            		<option>선택해주세요.</option>
					            		<option value="오전 8시~오후 5시">오전 8시~오후 5시</option>
					            		<option value="오전 8시 30분~오후 5시 30분">오전 8시 30분~오후 5시 30분</option>
					            		<option value="오전 9시~오후 6시">오전 9시~오후 6시</option>
					            		<option value="오전 9시 30분~오후 6시 30분">오전 9시 30분~오후 6시 30분</option>
					            		<option value="오전10시~오후 7시">오전10시~오후 7시</option>
					            		<option value="탄력근무제">탄력근무제</option>
					            		<option value="1">직접입력</option>
					            	</select>
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>근무지
		            			</td>
		            			<td>
		            				<select class="form-control" id="joAdres1" onchange="selectSearchAddr(this.id);" name="jo_adres1">
					            		<option>선택해주세요.</option>
					            	</select>
		            			</td>
		            			<td>
		            				<select class="form-control" id="joAdres2" name="jo_adres2">
					            		<option>선택해주세요.</option>
					            	</select>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>공고 대표 직종
		            			</td>
		            			<td style="width:35%;">
		            				<select class="form-control" id="selectUpPROInfo" onchange="selectLowPROFunction(this.id);" >
					              		<option value="0">선택해주세요.</option>
					            		<c:forEach items="${upPROList}" var="upPROInfo">
						            		<option value="${upPROInfo.uppro_num}">${upPROInfo.uppro_name}</option>
					            		</c:forEach>
					            	</select>
		            			</td>
		            			<td style="width:35%;">
		            				<select class="form-control" id="selecLowPROInfo" name="lowpro_num">
						            		<option value="">선택해주세요.</option>
					            	</select>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>급여
		            			</td>
		            			<td>
		            				<select class="form-control" name="salary_num">
					              		<option value="">선택해주세요.</option>
					            		<c:forEach items="${salaryList}" var="salaryInfo">
						            		<option value="${salaryInfo.salary_num}">${salaryInfo.salary_scope}</option>
					            		</c:forEach>
					            	</select>
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr style="height:70px; line-height:20px; vertical-align:top;">
		            			<td>
		            			</td>
		            			<td colspan="2">
		            				<strong>최저시급 8,590원, 주 40시간 기준 최저연봉 약 21,543,720원</strong><br>
		            				최저임금을 준수하지 않는 경우, 공고 강제 마감 및 행정처분을 받을 수 있습니다.
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>고용 형태
		            			</td>
		            			<td>
		            				<select class="form-control" name="emplym_num">
					            		<option value="">선택해주세요.</option>
					            		<c:forEach items="${employmentList}" var="employmentInfo">
						            		<option value="${employmentInfo.emplym_num}">${employmentInfo.emplym}</option>
					            		</c:forEach>
					            	</select>
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>최종 학력
		            			</td>
		            			<td>
		            				<select class="form-control" name="fin_acdmcr_num">
					            		<option value="">선택해주세요.</option>
					            		<c:forEach items="${finalAcademicList}" var="finalAcademicInfo">
						            		<option value="${finalAcademicInfo.fin_acdmcr_num}">${finalAcademicInfo.fin_acdmcr}</option>
					            		</c:forEach>
					            	</select>
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>공고 제목
		            			</td>
		            			<td colspan="2">
		            				<input type="text" class="form-control" name="jo_sj" placeholder="33자 이하로 입력하세요. 모집분야명 위주로 작성하세요." name="jo_sj">
		            			</td>
		            		</tr>
		            		<tr style="height:50px; line-height:20px; vertical-align:top;">
		            			<td>
		            			</td>
		            			<td colspan="2">
		            				내부 공고관리 규정에 위배되는 채용제목을 입력 시, 별도 안내 없이 수정 또는 변경될 수 있습니다.
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
		            			</td>
		            			<td colspan="2">
		            				<h5 style="margin-top:8%; margin-bottom:3%;">
			            				<label class="form-group icon-star" style="color:red;"></label>
			            				구인 지원 접수를 inAIR가 관리하도록 위임하시겠습니까?
			            				<input type="checkbox" id="agreeCheckbox" style="margin-left:2%; margin-right:1%;">네, 동의합니다.
			            			</h5>	
		            			</td>
		            		</tr>
		            	</table>
		            </div>
	        	</div>
	        	<div class="col-md-13 order-md-last d-flex">
	            	<input type="submit" class="form-control btnStyle" value="구인 공고 등록" id="submitBTN" style="height:70px !important; font-size: 25px;">
	            	<input type="button" class="form-control btnStyle" value="목록" id="listBTN" style="height:70px !important; font-size: 25px;">
				</div>
			</div>
		</form>
	</section>
</body>
</html>