<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="comMemMyPageURL" value="/companyMember/myPage"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 	.informationBtn{ 
 		width:30%; float:left; 
 		border-radius:6px;
 		border: 1px solid #ccc !important;
 		font-size:25px !important;
 	} 
 	.informationBtn:hover{ 
 		background-color:#007bff !important; 
 		color:#fff !important; 
 	} 
 	.secondTd{
 		width:16%; padding-left:2.5% !important;
 	}
 	.widthSize{
 		width: 90%;
    	padding-left: 3%;
 	}
 	.selectStyle{
 		height:34px; width:45%;
 	}
 	.textCenter{
 		text-align:center;
 	}
 	.firstTd{
 		padding-left:4% !important; 
 		width:20%;
 	}
 	
 	.submitBtnStyle{
 		margin-right:1%; width:20%; float:right;
 	}
 	.submitBtnStyle:hover{
 		background-color:#007bff !important; 
 		color:#fff !important;
 	}
 	.companyFirstTd{
	    text-align:right;
	    width:35%;
	    padding-right:3% !important;
 	}

	/* Style the tab */
	.tab {
	  overflow: hidden;
	}
	
	/* Style the buttons inside the tab */
	.tab button {
	  background-color: inherit;
	  float: left;
	  border: none;
	  outline: none;
	  cursor: pointer;
	  padding: 14px 16px;
	  transition: 0.3s;
	  font-size: 17px;
	}
	
	/* Change background color of buttons on hover */
	.tab button:hover {
	  background-color: #ddd;
	}
	
	/* Create an active/current tablink class */
	.tab button.active {
	  background-color: #007bff;
	  color:#fff;
	}
	
	/* Style the tab content */
	.tabcontent {
	  display: none;
	  padding: 6px 12px;
	  border-top: none;
	}
</style>
<script type="text/javascript">
	$(function() {
		// Get the element with id="defaultOpen" and click on it
		document.getElementById("companymemBTN").click();
		
		$('#passUpdateBTN').click(function(){
			location.href = "${comMemMyPageURL}/passwordChange.do";
		});
		
		$('#updateComMemBTN').click(function(){
			var result = confirm('기본정보를 수정하시겠습니까?');
			if(result){
				$('form[name="companyMemUpdateForm"]').submit();
			}else{
				return false;
			}
		});
		
		$('#updateCompanyBTN').click(function(){
			var result = confirm('기업정보를 수정하시겠습니까?');
			if(result){
				$('form[name="companyUpdateForm"]').submit();
			}else{
				return false;
			}
		});
		
		$('#updateCompanyInfoBTN').click(function(){
			var result = confirm('기업 추가정보를 수정하시겠습니까?');
			if(result){
				$('form[name="companyInfoUpdateForm"]').submit();
			}else{
				return false;
			}
		});
		
		$('#dropBTN').click(function(){
			location.href = "${comMemMyPageURL}/comMemberdropOut.do";
		});
	});

	function openCity(evt, cityName){
	  var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	  document.getElementById(cityName).style.display = "block";
	  evt.currentTarget.className += " active";
	}
	
	function selectLowIndustryFunction(thisId){
		var thisIdElement = document.getElementById(thisId);
		var thisIdNextElementId = thisIdElement.nextElementSibling.id;
		$('#' + thisIdNextElementId).empty();
		if($('#'+thisId+' option:selected').val() == '0'){
			var changeOption = $('<option value="0">선택해주세요.</option>');
			$('#'+thisIdNextElementId).append(changeOption);
		}else{
			getLowIndustryList($('#'+thisId+' option:selected').val(), '#' + thisIdNextElementId);
		}
	}
	
</script>
</head>
<body>
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="col-md-13 order-md-last d-flex" style="clear:both;">
				<div class="bg-white p-5 contact-form" id="personalData" style="width:100%;">
					<h2>기업정보 수정</h2>
					<br>
					<div class="tab" style="background:#fff;">
					  <button class="tablinks informationBtn" onclick="openCity(event, 'London')" id="companymemBTN">기본정보</button>
					  <button class="tablinks informationBtn" onclick="openCity(event, 'Paris')" id="companyBTN" style="margin-left:5%;">기업정보</button>
					  <button class="tablinks informationBtn" onclick="openCity(event, 'Tokyo')" id="companyinfoBTN" style="margin-left:5%;">추가정보</button>
					</div>
					<div id="London" class="tabcontent" style="display:block;">
						<form name="companyMemUpdateForm" action="${comMemMyPageURL}/updateCompanyMem.do" method="post" enctype="multipart/form-data">
							<table class="table" style="margin-top:4%;">
								<tbody>
									<tr>
										<td rowspan="4" style="width:39%; text-align:center; padding-top:3%;">
											<c:if test="${!empty comProfileInfo}">
												<img src="/files/${comProfileInfo.com_file_savename }" alt="기업프로필사진" style="width:235px; height:165px;">
												<input type="hidden" name="com_file_num" value="${comProfileInfo.com_file_num }"/>
											</c:if>
										</td>
										<td class="secondTd">기업회원 아이디</td>
										<td>
											<input type="text" class="widthSize" value="${companyMemVo.com_id}" disabled/>
											<input type="hidden" name="com_id" value="${companyMemVo.com_id}"/>
										</td>
									</tr>
									<tr>
										<td class="secondTd">기업회원 연락처</td>
										<td><input type="text" class="widthSize" name="com_tel" value="${companyMemVo.com_tel}"/></td>
									</tr>
									<tr>
										<td class="secondTd">기업회원 연매출</td>
										<td><input type="text" class="widthSize" name="com_selng" value="${companyMemVo.com_selng}"/></td>
									</tr>
									<tr>
										<td class="secondTd">기업회원 순이익</td>
										<td><input type="text" class="widthSize" name="com_profit" value="${companyMemVo.com_profit}"/></td>
									</tr>
									<tr>
										<td>
											<c:if test="${empty comProfileInfo}">
												로고 등록
											</c:if>
											<c:if test="${!empty comProfileInfo}">
												로고 수정
											</c:if>
											<input type="file" name="com_profile" value="프로필사진변경" style="margin-left:5%;"/>
										</td>
										<td class="secondTd">기업회원 이메일</td>
										<td><input type="text" class="widthSize" name="com_mail" value="${companyMemVo.com_mail}"/></td>
									</tr>
									<tr>
										<td></td>
										<td class="secondTd">업종</td>
										<td>
											<select class="selectStyle" id="selectUpIndustry" onchange="selectLowIndustryFunction(this.id)">
												<option>선택하세요.</option>
												<c:forEach items="${upIndustryList}" var="upIndustryInfo">
													<option value="${upIndustryInfo.upinduty_num}" ${(upIndustryInfo.upinduty_num eq companyMemVo.upinduty_num)? 'selected' : '' }>${upIndustryInfo.upinduty_name}</option>
												</c:forEach>
											</select>
											<select class="selectStyle" id="selectLowIndustry" name="lwinduty_num">
												<c:forEach items="${companyMemVo.lwindutyNumList}" var="lwindutyNumInfo">
													<option value="${lwindutyNumInfo.lwinduty_num}" ${(lwindutyNumInfo.lwinduty_num eq companyMemVo.lwinduty_num)? 'selected' : '' }>${lwindutyNumInfo.lwinduty_name}</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<td colspan="3" style="text-align:right; padding-right:3%;">
											<input type="button" class="submitBtnStyle btn form-control" id="dropBTN" value="탈퇴하기"/>
											<input type="button" class="submitBtnStyle btn form-control" id="updateComMemBTN" value="기본정보 수정"/>
											<input type="button" class="submitBtnStyle btn form-control" id="passUpdateBTN" value="비밀번호 수정"/>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					<div id="Paris" class="tabcontent">
						<form name="companyUpdateForm" method="post" action="${comMemMyPageURL}/updateCompany.do">
							<input type="hidden" name="corp_code" value="${companyMemVo.corp_code}"/>
							<c:set var="companyInfo" value="${companyMemVo.companyVo}"></c:set>
							<table class="table" style="margin-top:4%;">
								<tbody>
									<tr>
										<td class="companyFirstTd">기업 정식 명칭</td>
										<td><input type="text" class="widthSize" name="corp_name" value="${companyInfo.corp_name}"></td>
									</tr>
									<tr>
										<td class="companyFirstTd">기업 영문 명칭</td>
										<td><input type="text" class="widthSize" name="corp_name_eng" value="${companyInfo.corp_name_eng}"></td>
									</tr>
									<tr>
										<td class="companyFirstTd">대표자 명</td>
										<td><input type="text" class="widthSize" name="ceo_nm" value="${companyInfo.ceo_nm}"></td>
									</tr>
									<tr>
										<td class="companyFirstTd">법인등록번호</td>
										<td><input type="text" class="widthSize" name="jurir_no" value="${companyInfo.jurir_no}"></td>
									</tr>
									<tr>
										<td class="companyFirstTd">사업자등록번호</td>
										<td><input type="text" class="widthSize" name="bizr_no" value="${companyInfo.bizr_no}"></td>
									</tr>
									<tr>
										<td class="companyFirstTd">대표 주소</td>
										<td><input type="text" class="widthSize" name="adres" value="${companyInfo.adres}"></td>
									</tr>
									<tr>
										<td class="companyFirstTd">홈페이지주소</td>
										<td><input type="text" class="widthSize" name="hm_url" value="${companyInfo.hm_url}"></td>
									</tr>
									<tr>
										<td class="companyFirstTd">대표전화번호</td>
										<td><input type="text" class="widthSize" name="phn_no" value="${companyInfo.phn_no}"></td>
									</tr>
									<tr>
										<td class="companyFirstTd">대표팩스번호</td>
										<td><input type="text" class="widthSize" name="fax_no" value="${companyInfo.fax_no}"></td>
									</tr>
									<tr>
										<td colspan="2" style="text-align:right; padding-right:3%;">
											<input type="button" class="submitBtnStyle btn form-control" id="updateCompanyBTN" value="기업정보 수정"/>
										</td>
									</tr>
								</tbody>
							</table> 
						</form>
					</div>
					<div id="Tokyo" class="tabcontent">
						<form name="companyInfoUpdateForm" method="post" action="${comMemMyPageURL}/updateCompanyInfo.do">
							<c:forEach items="${companyMemVo.companyInfoList}" var="companyInfo">
								<c:if test="${companyInfo.sexdstn eq '여'}">
									<c:set var="companyInfoF" value="${companyInfo}"></c:set>
								</c:if>
								<c:if test="${companyInfo.sexdstn eq '남'}">
									<c:set var="companyInfoM" value="${companyInfo}"></c:set>
								</c:if>
							</c:forEach>
						  	<table class="table" style="margin-top:4%;">
						  		<thead>
						  			<th></th>
						  			<th class="textCenter"> 여성 </th>
						  			<th class="textCenter"> 남성 </th>
						  		</thead>
								<tbody>
									<tr>
										<td class="firstTd"> 정규직 수 </td>
										<td class="textCenter">
											<input type="text" class="widthSize" name="companyInfoList[0].rgllbr_co" value="${companyInfoF.rgllbr_co}"/>
											<input type="hidden" name="companyInfoList[0].info_num" value="${companyInfoF.info_num}"/>
										</td>
										<td class="textCenter">
											<input type="text" class="widthSize" name="companyInfoList[1].rgllbr_co" value="${companyInfoM.rgllbr_co}"/>
											<input type="hidden" name="companyInfoList[1].info_num" value="${companyInfoM.info_num}"/>
										</td>
									</tr>
									<tr>
										<td class="firstTd"> 계약직 수</td>
										<td class="textCenter"><input type="text" class="widthSize" name="companyInfoList[0].cnttk_co" value="${companyInfoF.cnttk_co}"/></td>
										<td class="textCenter"><input type="text" class="widthSize" name="companyInfoList[1].cnttk_co" value="${companyInfoM.cnttk_co}"/></td>
									</tr>
									<tr>
										<td class="firstTd"> 직원 수 합계</td>
										<td class="textCenter"><input type="text" class="widthSize" name="companyInfoList[0].sm" value="${companyInfoF.sm}"/></td>
										<td class="textCenter"><input type="text" class="widthSize" name="companyInfoList[1].sm" value="${companyInfoM.sm}"/></td>
									</tr>
									<tr>
										<td class="firstTd">연간 급여 총액</td>
										<td class="textCenter"><input type="text" class="widthSize" name="companyInfoList[0].fyer_salary_totamt" value="${companyInfoF.fyer_salary_totamt}"/></td>
										<td class="textCenter"><input type="text" class="widthSize" name="companyInfoList[1].fyer_salary_totamt" value="${companyInfoM.fyer_salary_totamt}"/></td>
									</tr>
									<tr>
										<td class="firstTd">1인 평균 급여액</td>
										<td class="textCenter"><input type="text" class="widthSize" name="companyInfoList[0].jan_salary_am" value="${companyInfoF.jan_salary_am}"/></td>
										<td class="textCenter"><input type="text" class="widthSize" name="companyInfoList[1].jan_salary_am" value="${companyInfoM.jan_salary_am}"/></td>
									</tr>
									<tr>
										<td colspan="3" style="text-align:right; padding-right:3%;">
											<input type="button" class="submitBtnStyle btn form-control" id="updateCompanyInfoBTN" value="추가정보 수정"/>
										</td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>					
</body>
</html>