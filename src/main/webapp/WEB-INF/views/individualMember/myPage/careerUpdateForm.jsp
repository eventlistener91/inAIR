<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		
		if(${fn:length(resumeInfo.careerInfoList)} > 1){
			$('.careerTable0').css("display", "block");
			$('#careerPlusBTN').css("display", "block");
			
			$('#careerBTN').css("background", "#007bff");
			$('#careerBTN').css("color", "white");
			
			$('#newcomerBTN').css("background", "white");
			$('#newcomerBTN').css("color", "black");
			
			$('#careerCheck').val("1");
		}
		
		$('#careerBTN').click(function(){
			$('.careerTable0').css("display", "block");
			$('#careerPlusBTN').css("display", "block");
			
			$('#careerBTN').css("background", "#007bff");
			$('#careerBTN').css("color", "white");
			
			$('#newcomerBTN').css("background", "white");
			$('#newcomerBTN').css("color", "black");
			
			$('#careerCheck').val("1");
		});
		
		$('#newcomerBTN').click(function(){
			careerTabletemp = 1;
			
			$('.careerTable0').css("display", "none");
			$('#careerTable1').css("display", "none");
			$('#careerPlusBTN').css("display", "none");
			
			$('#newcomerBTN').css("background", "#007bff");
			$('#newcomerBTN').css("color", "white");
			
			$('#careerBTN').css("background", "white");
			$('#careerBTN').css("color", "black");
			
			$('#careerCheck').val("0");
			
			$('.addCareerTable').remove();
		});
		
		
		//경력
		if($('.careerTable0').css('display') == 'block' || (parseInt(careerTabletemp) > 1)){
			for(var i=0; i<parseInt(careerTabletemp)+1; i++){
				if(i == 1){
					if($('#careerTable1').css('display') == 'none' ){
						i = i+1;
					}
				}
				if(document.getElementById('careerTable'+i)){
					if($('input[name="careerInfoList['+ i +'].com_name"]').val() == ''){
						alert("경력 회사명을 입력하세요.");
						return false;
					}else if($('input[name="careerInfoList['+ i +'].com_encpn').val() == ''){
						alert("경력 입사일을 확인해주세요.");
						return false;
					}else if($('input[name="careerInfoList['+ i +'].com_retire').val() == ''){
						alert("경력 퇴사일을 확인해주세요.");
						return false;
					}else if($('select[name="careerInfoList['+ i +'].clsf_num').val() == ''){
						alert("경력 직급을 선택해주세요.");
						return false;
					}else if($('select[name="careerInfoList['+ i +'].lowpro_num').val() == ''){
						alert("경력 직종을 선택해주세요.");
						return false;
					}else if($('select[name="careerInfoList['+ i +'].lwinduty_num').val() == ''){
						alert("경력 업종을 선택해주세요.");
						return false;
					}else if($('select[name="careerInfoList['+ i +'].com_adres1').val() == ''){
						alert("경력 근무지역을 선택해주세요.");
						return false;
					}else if($('select[name="careerInfoList['+ i +'].com_adres2').val() == ''){
						alert("경력 근무지역을 선택해주세요.");
						return false;
					}else if($('input[name="careerInfoList['+ i +'].job').val() == ''){
						alert("경력 담당업무를 입력하세요.");
						return false;
					}
				}
			}
		}
		
		//경력 추가 버튼 클릭 이벤트 
		var careerTabletemp = ${fn:length(resumeInfo.careerInfoList)}+1;
		$('#careerPlusBTN').click(function(){
			if($('#careerTable1').css("display") == "none"){
				$('#careerTable1').css("display", "block");
			}else{
				var addDiv = document.getElementById('careerTable1');
				var addTable = addDiv.cloneNode(true);
				careerTabletemp = parseInt(careerTabletemp) + 1;
				careerTabletemp = String(careerTabletemp);
				//추가되는 테이블 id 다음번호로 변경
				addTable.id = 'careerTable'+ careerTabletemp;
				addTable.className ='bg-white contact-form addCareerTable secondDiv';
				//추가되는 테이블 삭제 버튼 id 다음번호로 변경
				addTable.children[0].id = 'careerDeleteBTN'+ careerTabletemp;
				
				//회사명
				addTable.children[1].children[0].children[0].children[1].children[0].name = "careerInfoList["+ careerTabletemp +"].com_name";
				//입사일
				addTable.children[1].children[0].children[1].children[1].children[0].name = "careerInfoList["+ careerTabletemp +"].com_encpn";
				//퇴사일
				addTable.children[1].children[0].children[1].children[1].children[2].name = "careerInfoList["+ careerTabletemp +"].com_retire";
				//직급번호
				addTable.children[1].children[0].children[2].children[1].children[0].name = "careerInfoList["+ careerTabletemp +"].clsf_num";
				//상위직종
				addTable.children[1].children[0].children[3].children[1].children[0].id = "careerSelectUpPROInfo" + careerTabletemp;
				//하위직종
				addTable.children[1].children[0].children[3].children[2].children[0].id = "careerSelectLowPROInfo"+ careerTabletemp;
				addTable.children[1].children[0].children[3].children[2].children[0].name = "careerInfoList["+ careerTabletemp +"].lowpro_num";
				//상위업종
				addTable.children[1].children[0].children[4].children[1].children[0].id = "careerSelectUpIndustry"+ careerTabletemp;
				//하위업종
				addTable.children[1].children[0].children[4].children[2].children[0].id = "careerSelectLowIndustry"+ careerTabletemp;
				addTable.children[1].children[0].children[4].children[2].children[0].name = "careerInfoList["+ careerTabletemp +"].lwinduty_num";
				//근무지역 시도
				addTable.children[1].children[0].children[5].children[1].children[0].name="careerInfoList["+ careerTabletemp +"].com_adres1";
				addTable.children[1].children[0].children[5].children[1].children[0].id = "career_search_addr1_"+ careerTabletemp;
				//근무지역 구군
				addTable.children[1].children[0].children[5].children[1].children[1].name = "careerInfoList["+ careerTabletemp +"].com_adres2";
				addTable.children[1].children[0].children[5].children[1].children[1].id = "career_search_addr2_"+ careerTabletemp;
				//연봉
				addTable.children[1].children[0].children[6].children[1].children[0].name = "careerInfoList["+ careerTabletemp +"].salary";
				//담당업무
				addTable.children[1].children[0].children[7].children[1].children[0].name = "careerInfoList["+ careerTabletemp +"].job";
				//보유기술
				addTable.children[1].children[0].children[8].children[1].children[0].name = "careerInfoList["+ careerTabletemp +"].tchnlgy";
				
				$('#careerDiv').append(addTable);
			}
		});
		
	});
	
	//추가 경력 삭제 함수
	function deleteCareer(btnId){
		if(btnId == 'careerDeleteBTN1'){
			$("#careerTable1").css("display", "none");
		}else{
			var btnIdElement = document.getElementById(btnId);
			var deleteDiv = btnIdElement.parentNode;
			deleteDiv.remove();
		}
	}
	
	//직종 selectBox 변경 함수
	function selectLowPROFunction(thisId){
		var thisIdElement = document.getElementById(thisId);
		var thisIdNextElementId = thisIdElement.parentNode.parentNode.childNodes[5].firstElementChild.id;
		$('#' + thisIdNextElementId).empty();
		if($('#'+thisId+' option:selected').val() == '0'){
			var changeOption = $('<option value="0">선택해주세요.</option>');
			$(thisIdNextElementId).append(changeOption);
		}else{
			getLowPROList($('#'+thisId+' option:selected').val(), '#' + thisIdNextElementId);
		}
	}
	
	//업종 selectBox 변경 함수
	function selectLowIndustryFunction(thisId){
		var thisIdElement = document.getElementById(thisId);
		var thisIdNextElementId = thisIdElement.parentNode.parentNode.childNodes[5].firstElementChild.id;
		$('#' + thisIdNextElementId).empty();
		if($('#'+thisId+' option:selected').val() == '0'){
			var changeOption = $('<option value="0">선택해주세요.</option>');
			$(thisIdNextElementId).append(changeOption);
		}else{
			getLowIndustryList($('#'+thisId+' option:selected').val(), '#' + thisIdNextElementId);
		}
	}
	
	// 시도주소를 세팅하는 부분
	$('.career_search_addr1').append(getSido());
	
	$('.career_search_addr1').each(function(index, item){
		var careerSearchAddr1 = $('input[name="career_search_addr1_'+ index +'"]').val();
		$(item).val(careerSearchAddr1).attr("selected","selected");
		
		$(item).val(careerSearchAddr1).trigger('change');
		
		var careerSearchAddr2 = $('input[name="career_search_addr2_'+ index +'"]').val();
		$('.career_search_addr2').eq(index).val(careerSearchAddr2).attr("selected","selected");
	});
	
	$('.search_addr1').append(getSido());
	
	//직종 selectBox 변경 함수
	function selectLowPROFunction(thisId){
		var thisIdElement = document.getElementById(thisId);
		var thisIdNextElementId = thisIdElement.parentNode.parentNode.childNodes[5].firstElementChild.id;
		$('#' + thisIdNextElementId).empty();
		if($('#'+thisId+' option:selected').val() == '0'){
			var changeOption = $('<option value="0">선택해주세요.</option>');
			$(thisIdNextElementId).append(changeOption);
		}else{
			getLowPROList($('#'+thisId+' option:selected').val(), '#' + thisIdNextElementId);
		}
	}
	
	//업종 selectBox 변경 함수
	function selectLowIndustryFunction(thisId){
		var thisIdElement = document.getElementById(thisId);
		var thisIdNextElementId = thisIdElement.parentNode.parentNode.childNodes[5].firstElementChild.id;
		$('#' + thisIdNextElementId).empty();
		if($('#'+thisId+' option:selected').val() == '0'){
			var changeOption = $('<option value="0">선택해주세요.</option>');
			$(thisIdNextElementId).append(changeOption);
		}else{
			getLowIndustryList($('#'+thisId+' option:selected').val(), '#' + thisIdNextElementId);
		}
	}
	
	//근무지역 selectBox 변경 함수 
	function selectSearchAddr(thisId){
		var gugun = getGugun($('#'+thisId).val());
		var thisIdElement = document.getElementById(thisId);
		var searchAddr2Id = thisIdElement.nextElementSibling.id;
		
		$('#'+searchAddr2Id).empty();
		$('#'+searchAddr2Id).append('<option value="">선택해주세요.</option>');
		for(var i = 1; i < gugun.length; i++){
			$('#'+searchAddr2Id).append('<option value="' + gugun[i] + '">' + gugun[i] + '</option>');
		}
	}
	
</script>
</head>
<body>
<form name="myPageUpdateForm" method="post">
	<div class="col-md-13 order-md-last d-flex" style="clear:both;">
		<div class="bg-white p-5 contact-form" id="personalData" style="width:100%;">
			<h2>경력 사항</h2>
			<br>
			<input type="button" value="신입" class="btn py-3 px-5 top-category" style="width:130px border-left:0; background:#007bff; color:white;" id="newcomerBTN">
			<input type="button" value="경력" class="btn py-3 px-5 top-category" style="width:130px border-left:0;" id="careerBTN">
			
			<div id="careerDiv">
				<c:if test="${empty resumeInfo.careerInfoList}">
					<div class="col-md-13 order-md-last d-flex" >
						<div class="bg-white p-5 contact-form careerTable0" style="width:100%; display:none;" id="careerTable0">
			            	<table style="width:100%; ">
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>회사명
			            			</td>
			            			<td colspan="2">
						            	<input type="text" class="form-control" name="careerInfoList[0].com_name">
			            			</td>
			            			<td style="width:5%;"></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>입사일 - 퇴사일 </label>
			            			</td>
			            			<td colspan="2">
						              	<input type="date" class="form-control" style="width:45%; float:left;" name="careerInfoList[0].com_encpn">	
						              	<div style="line-height:50px; float:left; width:10%; text-align:center;">──</div> 
						              	<input type="date" class="form-control" style="width:45%; float:right;" name="careerInfoList[0].com_retire">
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>직급
			            			</td>
			            			<td colspan="2">
						              	<select class="form-control" name="careerInfoList[0].clsf_num">
						            		<option value="">선택해주세요.</option>
						            		<c:forEach items="${classOfPositionList}" var="classOfPositionInfo">
							            		<option value="${classOfPositionInfo.clsf_num}">${classOfPositionInfo.clsf_name}</option>
						            		</c:forEach>
						            	</select>
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>직종
			            			</td>
			            			<td style="width:35%;">
						              	<select class="form-control" id="careerSelectUpPROInfo0" onchange="selectLowPROFunction(this.id);" >
						              		<option value="0">선택해주세요.</option>
						            		<c:forEach items="${upPROList}" var="upPROInfo">
							            		<option value="${upPROInfo.uppro_num}">${upPROInfo.uppro_name}</option>
						            		</c:forEach>
						            	</select>
						            </td>
						            <td style="width:35%;">	
						              	<select class="form-control" id="careerSelectLowPROInfo0" name="careerInfoList[0].lowpro_num">
							            		<option value="">선택해주세요.</option>
						            	</select>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>업종
			            			</td>
			            			<td style="width:35%;">
						              	<select class="form-control" id="careerSelectUpIndustry0" onchange="selectLowIndustryFunction(this.id);">
						              		<option value="0">선택해주세요.</option>
						            		<c:forEach items="${upIndustryList}" var="upIndustryInfo">
						            			<option value="${upIndustryInfo.upinduty_num}">${upIndustryInfo.upinduty_name}</option>
						            		</c:forEach>
						            	</select>
					            	</td>
					            	<td style="width:35%;">
						              	<select class="form-control" id="careerSelectLowIndustry0" name="careerInfoList[0].lwinduty_num">
							            		<option value="">선택해주세요.</option>
						            	</select>
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>근무지역
			            			</td>
			            			<td colspan="2">
						              	<select id="career_search_addr1_0" class="search_addr1 form-control" style="width:50%; float:left;" name="careerInfoList[0].com_adres1" onchange="selectSearchAddr(this.id);">
											<option value="">선택해주세요.</option>
										</select>
										<select id="career_search_addr2_0" class="search_addr2 form-control" style="width:50%; float:right;" name="careerInfoList[0].com_adres2">
											<option value="">선택해주세요.</option>
										</select>
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group" ></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연봉
			            			</td>
			            			<td colspan="2">
						              	<input type="text" class="form-control" name="careerInfoList[0].salary">
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>담당업무
			            			</td>
			            			<td colspan="2">
						              	<input type="text" class="form-control" name="careerInfoList[0].job">
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	<label class="form-group" ></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;보유기술
			            			</td>
			            			<td colspan="2">
						              	<input type="text" class="form-control" name="careerInfoList[0].tchnlgy">
			            			</td>
			            			<td></td>
			            		</tr>
			            	</table>
			           		<hr>
			            </div>
		            </div>
				</c:if>
				<c:if test="${!empty resumeInfo.careerInfoList}">
					<c:forEach items="${resumeInfo.careerInfoList}" var="careerInfo" varStatus="index">
						<div class="col-md-13 order-md-last d-flex" >
							<div class="bg-white p-5 contact-form careerTable0" style="width:100%; display:none;">
				            	<table style="width:100%; ">
				            		<tr>
				            			<td>
							            	<label class="form-group icon-star" style="color:red;"></label>회사명
				            			</td>
				            			<td colspan="2">
							            	<input type="text" class="form-control" name="careerInfoList[${index.count}].com_name" value="${careerInfo.com_name}">
				            			</td>
				            			<td style="width:5%;"></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	<label class="form-group icon-star" style="color:red;"></label>입사일 - 퇴사일 </label>
				            			</td>
				            			<td colspan="2">
							              	<input type="date" class="form-control" style="width:45%; float:left;" name="careerInfoList[${index.count}].com_encpn" value="${careerInfo.com_encpn}">	
							              	<div style="line-height:50px; float:left; width:10%; text-align:center;">──</div> 
							              	<input type="date" class="form-control" style="width:45%; float:right;" name="careerInfoList[${index.count}].com_retire" value="${careerInfo.com_retire}">
				            			</td>
				            			<td></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	<label class="form-group icon-star" style="color:red;"></label>직급
				            			</td>
				            			<td colspan="2">
							              	<select class="form-control" name="careerInfoList[${index.count}].clsf_num" >
							            		<option value="">선택해주세요.</option>
							            		<c:forEach items="${classOfPositionList}" var="classOfPositionInfo">
								            		<option value="${classOfPositionInfo.clsf_num}" ${(careerInfo.clsf_num eq classOfPositionInfo.clsf_num)? 'selected' : ''} >${classOfPositionInfo.clsf_name}</option>
							            		</c:forEach>
							            	</select>
				            			</td>
				            			<td></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	<label class="form-group icon-star" style="color:red;"></label>직종
				            			</td>
				            			<td style="width:35%;">
							              	<select class="form-control" id="careerSelectUpPROInfo0" onchange="selectLowPROFunction(this.id);" >
							              		<option value="0">선택해주세요.</option>
							            		<c:forEach items="${upPROList}" var="upPROInfo">
								            		<option value="${upPROInfo.uppro_num}" ${(careerInfo.uppro_num eq upPROInfo.uppro_num)? 'selected' : '' } >${upPROInfo.uppro_name}</option>
							            		</c:forEach>
							            	</select>
							            </td>
							            <td style="width:35%;">	
							              	<select class="form-control" id="careerSelectLowPROInfo0" name="careerInfoList[${index.count}].lowpro_num" >
								            		<option value="">선택해주세요.</option>
								            		<c:forEach items="${careerInfo.lowproList}" var="lowPROInfo">
								            			<option value="${lowPROInfo.lowpro_num}" ${(careerInfo.lowpro_num eq lowPROInfo.lowpro_num)? 'selected' : '' }>${lowPROInfo.lowpro_name}</option>
								            		</c:forEach>
							            	</select>
				            			</td>
				            		</tr>
				            		<tr>
				            			<td>
							            	<label class="form-group icon-star" style="color:red;"></label>업종
				            			</td>
				            			<td style="width:35%;">
							              	<select class="form-control" id="careerSelectUpIndustry0" onchange="selectLowIndustryFunction(this.id);" >
							              		<option value="0">선택해주세요.</option>
							            		<c:forEach items="${upIndustryList}" var="upIndustryInfo">
							            			<option value="${upIndustryInfo.upinduty_num}" ${(careerInfo.upinduty_num eq upIndustryInfo.upinduty_num)? 'selected' : '' } >${upIndustryInfo.upinduty_name}</option>
							            		</c:forEach>
							            	</select>
						            	</td>
						            	<td style="width:35%;">
							              	<select class="form-control" id="careerSelectLowIndustry0" name="careerInfoList[${index.count}].lwinduty_num" >
								            		<option value="">선택해주세요.</option>
								            		<c:forEach items="${careerInfo.lwindutyList}" var="lwindutyInfo">
								            			<option value="${lwindutyInfo.lwinduty_num}" ${(careerInfo.lwinduty_num eq lwindutyInfo.lwinduty_num)? 'selected' : '' }>${lwindutyInfo.lwinduty_name}</option>
								            		</c:forEach>
							            	</select>
				            			</td>
				            			<td></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	<label class="form-group icon-star" style="color:red;"></label>근무지역
				            			</td>
				            			<td colspan="2">
							              	<select id="career_search_addr1_0" class="search_addr1 form-control" style="width:50%; float:left;" name="careerInfoList[${index.count}].com_adres1" onchange="selectSearchAddr(this.id);" value="${careerInfo.com_adres1}">
												<option value="">선택해주세요.</option>
											</select>
											<select id="career_search_addr2_0" class="search_addr2 form-control" style="width:50%; float:right;" name="careerInfoList[${index.count}].com_adres2" value="${careerInfo.com_adres2}">
												<option value="">선택해주세요.</option>
											</select>
				            			</td>
				            			<td></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	<label class="form-group" ></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연봉
				            			</td>
				            			<td colspan="2">
							              	<input type="text" class="form-control" name="careerInfoList[${index.count}].salary" value="${careerInfo.salary}"> 
				            			</td>
				            			<td></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	<label class="form-group icon-star" style="color:red;"></label>담당업무
				            			</td>
				            			<td colspan="2">
							               	<input type="text" class="form-control" name="careerInfoList[${index.count}].job" value="${careerInfo.job}">
				            			</td>
				            			<td></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	<label class="form-group" ></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;보유기술
				            			</td>
				            			<td colspan="2">
							              	<input type="text" class="form-control" name="careerInfoList[${index.count}].tchnlgy" value="${careerInfo.tchnlgy}">
				            			</td>
				            			<td></td>
				            		</tr>
				            	</table>
				            	<input type="hidden" name="careerInfoList[${index.count}].career_num" value="${careerInfo.career_num}">
				           		<hr>
				            </div>
			            </div>
		            </c:forEach>
	            </c:if>
	            <div class="bg-white contact-form secondDiv" style="width:100%; display:none;" id="careerTable1">
	            	<table style="width:100%; ">
		            	<input type="button" class="form-control itemPlus" value="삭제 ⅹ " style="width:150px; float:right; margin-right:5%;" id="careerDeleteBTN1" onclick="deleteCareer(this.id);">
	            		<tr>
	            			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>회사명
	            			</td>
	            			<td colspan="2">
				            	<input type="text" class="form-control" name="careerInfoList[${fn:length(resumeInfo.careerInfoList)+1}].com_name">
	            			</td>
	            			<td style="width:5%;"></td>
	            		</tr>
	            		<tr>
	            			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>입사일 - 퇴사일 </label>
	            			</td>
	            			<td colspan="2">
				              	<input type="date" class="form-control" style="width:45%; float:left;" name="careerInfoList[${fn:length(resumeInfo.careerInfoList)+1}].com_encpn">	
				              	<div style="line-height:50px; float:left; width:10%; text-align:center;">──</div> 
				              	<input type="date" class="form-control" style="width:45%; float:right;" name="careerInfoList[${fn:length(resumeInfo.careerInfoList)+1}].com_retire">
	            			</td>
	            			<td></td>
	            		</tr>
	            		<tr>
	            			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>직급
	            			</td>
	            			<td colspan="2">
				              	<select class="form-control" name="careerInfoList[${fn:length(resumeInfo.careerInfoList)+1}].clsf_num">
				            		<option value="">선택해주세요.</option>
				            		<c:forEach items="${classOfPositionList}" var="classOfPositionInfo">
					            		<option value="${classOfPositionInfo.clsf_num}" >${classOfPositionInfo.clsf_name}</option>
				            		</c:forEach>
				            	</select>
	            			</td>
	            			<td></td>
	            		</tr>
	            		<tr>
	            			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>직종
	            			</td>
	            			<td style="width:35%;">
				              	<select class="form-control" id="careerSelectUpPROInfo1"  onchange="selectLowPROFunction(this.id);">
				              		<option value="0">선택해주세요.</option>
				            		<c:forEach items="${upPROList}" var="upPROInfo">
					            		<option value="${upPROInfo.uppro_num}">${upPROInfo.uppro_name}</option>
				            		</c:forEach>
				            	</select>
				            </td>
				            <td style="width:35%;">	
				              	<select class="form-control" id="careerSelectLowPROInfo1" name="careerInfoList[${fn:length(resumeInfo.careerInfoList)+1}].lowpro_num">
					            		<option value="">선택해주세요.</option>
				            	</select>
	            			</td>
	            		</tr>
	            		<tr>
	            			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>업종
	            			</td>
	            			<td style="width:35%;">
				              	<select class="form-control" id="careerSelectUpIndustry1" onchange="selectLowIndustryFunction(this.id);">
				              		<option value="0">선택해주세요.</option>
				            		<c:forEach items="${upIndustryList}" var="upIndustryInfo">
				            			<option value="${upIndustryInfo.upinduty_num}">${upIndustryInfo.upinduty_name}</option>
				            		</c:forEach>
				            	</select>
			            	</td>
			            	<td style="width:35%;">
				              	<select class="form-control" id="careerSelectLowIndustry1" name="careerInfoList[${fn:length(resumeInfo.careerInfoList)+1}].lwinduty_num">
					            		<option value="">선택해주세요.</option>
				            	</select>
	            			</td>
	            			<td></td>
	            		</tr>
	            		<tr>
	            			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>근무지역
	            			</td>
	            			<td colspan="2">
				              	<select id="career_search_addr1_1" class="search_addr1 form-control" style="width:50%; float:left;" name="careerInfoList[${fn:length(resumeInfo.careerInfoList)+1}].com_adres1" onchange="selectSearchAddr(this.id);">
									<option value="">선택해주세요.</option>
								</select>
								<select id="career_search_addr2_1" class="form-control" style="width:50%; float:right;" name="careerInfoList[${fn:length(resumeInfo.careerInfoList)+1}].com_adres2">
									<option value="">선택해주세요.</option>
								</select>
	            			</td>
	            			<td></td>
	            		</tr>
	            		<tr>
	            			<td>
				            	<label class="form-group" ></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;연봉
	            			</td>
	            			<td colspan="2">
				              	<input type="text" class="form-control" name="careerInfoList[${fn:length(resumeInfo.careerInfoList)+1}].salary">
	            			</td>
	            			<td></td>
	            		</tr>
	            		<tr>
	            			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>담당업무
	            			</td>
	            			<td colspan="2">
				              	<input type="text" class="form-control" name="careerInfoList[${fn:length(resumeInfo.careerInfoList)+1}].job">
	            			</td>
	            			<td></td>
	            		</tr>
	            		<tr>
	            			<td>
				            	<label class="form-group" ></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;보유기술
	            			</td>
	            			<td colspan="2">
				              	<input type="text" class="form-control" name="careerInfoList[${fn:length(resumeInfo.careerInfoList)+1}].tchnlgy">
	            			</td>
	            			<td></td>
	            		</tr>
	            	</table>
	           		<hr>
	            </div>
	        </div>
            
		</div>
	</div>
</form>
</body>
</html>