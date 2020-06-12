<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:url var="individualMemberURL" value="/individualMember"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		.itemPlus{
			width:26%; 
			float:right; 
			margin-top:15px;
		}
		.itemPlus:hover{
			background-color:silver !important;
			color:#fff !important;
		}
		#submitBTN{
 			margin-left:60%; 
			width:25%;
			margin-top:60px;
			height:75px !important; 
			font-size:25px !important; 
		}
		#listBTN{
			width:15%;
			margin-top:60px;
			height:75px !important; 
			font-size:25px !important; 
		}
		#submitBTN:hover{		
			background-color:#007bff !important;
			color:#fff !important;
		} 
		#listBTN:hover{		
			background-color:#007bff !important;
			color:#fff !important;
		} 
		.secondDiv{
			padding: 0px 48px 48px 48px !important;
		}
		.deleteBTNStyle{
			width:16%; float:right; margin-right:10%;
		}
		.checkboxStyle{
			float:left; margin-top:1.5%; margin-left:5%;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			var indvdlBir = String(${LOGIN_INDVDLMEMINFO.indvdl_bir}); 
			var indvdl_bir = "";
			for(var i=0; i<indvdlBir.length; i++){ // 19980324 8  -> 1998-03-24 10 
				if(i == 4 || i == 6){
					indvdl_bir += "-";
					indvdl_bir += indvdlBir[i];
				}else{
					indvdl_bir += indvdlBir[i];
				}
			}
			$('input[name=indvdl_bir]').val(indvdl_bir);
			
			if(${fn:length(resumeInfo.careerInfoList)} >= 1){
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
			
			
			//대학 대학원 추가 버튼 클릭 이벤트
			var academicTemp = ${fn:length(resumeInfo.academicDetaList)}+1;
			$('#academicPlusBTN').click(function(){
				if($('#UniversityTable4').css('display') == 'none'){
					$('#UniversityTable4').css('display', 'block');
				}else{
					var addDiv = document.getElementById('UniversityTable4');
					var addTable = addDiv.cloneNode(true);
					academicTemp = parseInt(academicTemp) + 1;
					academicTemp = String(academicTemp);
					//추가되는 테이블 id명 다음 번호로 변경 
					addTable.id = 'UniversityTable'+ academicTemp;
					//추가되는 테이블의 삭제 버튼 id 다음번호로 변경
					addTable.children[0].id = 'academicDeleteBTN'+ academicTemp;
					//학교명
					addTable.children[2].children[0].children[0].children[1].children[0].name = "academicDetaList["+ academicTemp +"].det_acdmcr_school";
					//입학일
					addTable.children[2].children[0].children[1].children[1].children[0].name = "academicDetaList["+ academicTemp  +"].det_acdmcr_entsch";
					//졸업일
					addTable.children[2].children[0].children[1].children[1].children[2].name = "academicDetaList["+ academicTemp   +"].det_acdmcr_grdtn";
					//전공
					addTable.children[2].children[0].children[2].children[1].children[0].name = "academicDetaList["+ academicTemp +"].det_acdmcr_major"
					//학과
					addTable.children[2].children[0].children[3].children[1].children[0].name = "academicDetaList["+ academicTemp +"].det_acdmcr_subjct";
					//학력 번호
					addTable.children[3].name = "academicDetaList["+ academicTemp +"].acdmcr_num";
					
					$('#academic_deta').append(addTable);
					
				}
			});
			
			
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

			//자격증 내역 추가 버튼 클릭 이벤트
			var cerificatieTabletemp = ${fn:length(resumeInfo.cerificatieList)}+1;
			$('#cerificatiePlusBTN').click(function(){
				if($('#cerificatieTable1').css('display') == 'none'){
					$('#cerificatieTable1').css('display', 'block');
				}else{
					var addDiv = document.getElementById('cerificatieTable1');
					var addTable = addDiv.cloneNode(true);
					cerificatieTabletemp = parseInt(cerificatieTabletemp) + 1;
					cerificatieTabletemp = String(cerificatieTabletemp);
					
					//추가되는 테이블 id 다음번호로 변경
					addTable.id = 'cerificatieTable'+ cerificatieTabletemp;
					//삭제 버튼 id 다음번호로 변경
					addTable.children[0].children[0].id  = 'cerificatieDeleteBTN'+ cerificatieTabletemp;
					//자격증명
					addTable.children[0].children[1].children[0].children[0].children[1].children[0].name = "cerificatieList["+ cerificatieTabletemp +"].crqfc_name";
					//자격증 발행처
					addTable.children[0].children[1].children[0].children[1].children[1].children[0].name = "cerificatieList["+ cerificatieTabletemp  +"].crqfc_pblshr"; 
					//자격증 취득일
					addTable.children[0].children[1].children[0].children[2].children[1].children[0].name = "cerificatieList["+ cerificatieTabletemp  +"].crqfc_acqdt";
					
					$('#cerificatieDiv').append(addTable);
				}
			});
			
			//수상내역 추가 버튼 클릭 이벤트
			var winningprizeTabletemp = ${fn:length(resumeInfo.winningPrizeList)}+1;
			$('#winningprizePlusBTN').click(function(){
				if($('#winningprizeTable1').css('display') == 'none'){
					$('#winningprizeTable1').css('display', 'block');
				}else{
					var addDiv = document.getElementById('winningprizeTable1');
					var addTable = addDiv.cloneNode(true);
					winningprizeTabletemp = parseInt(winningprizeTabletemp) + 1;
					winningprizeTabletemp = String(winningprizeTabletemp);
					
					//추가되는 테이블 id 다음번호로 변경
					addTable.id = 'winningprizeTable'+ winningprizeTabletemp;
					//삭제 버튼 id 다음번호로 변경
					addTable.children[0].children[0].id  = 'winningprizeDeleteBTN'+ winningprizeTabletemp;
					//수상명
					addTable.children[0].children[1].children[0].children[0].children[1].children[0].name = "winningPrizeList["+ winningprizeTabletemp +"].wnpz_name";
					//수여기관
					addTable.children[0].children[1].children[0].children[1].children[1].children[0].name = "winningPrizeList["+ winningprizeTabletemp  +"].cnfer_instt"; 
					//취득일
					addTable.children[0].children[1].children[0].children[2].children[1].children[0].name = "winningPrizeList["+ winningprizeTabletemp  +"].acqdt";
					
					$('#winningprizeDiv').append(addTable);
				}
			});
			
			//어학내역 추가 버튼 클릭 이벤트
			var lstcsListTabletemp = ${fn:length(resumeInfo.lstcsListList)}+1;
			$('#lstcsListPlusBTN').click(function(){
				if($('#LSTCS_ListTable1').css('display') == 'none'){
					$('#LSTCS_ListTable1').css('display', 'block');
				}else{
					var addDiv = document.getElementById('LSTCS_ListTable1');
					var addTable = addDiv.cloneNode(true);
					lstcsListTabletemp = parseInt(lstcsListTabletemp) + 1;
					lstcsListTabletemp = String(lstcsListTabletemp);
					
					//추가되는 테이블 id 다음번호로 변경
					addTable.id = 'LSTCS_ListTable'+ lstcsListTabletemp;
					//삭제 버튼 id 다음번호로 변경
					addTable.children[0].children[0].id  = 'LSTCS_ListDeleteBTN'+ lstcsListTabletemp;
					//언어번호
					addTable.children[0].children[1].children[0].children[0].children[1].children[0].name = "lstcsListList["+ lstcsListTabletemp +"].lang_num";
					//언어 시험명
					addTable.children[0].children[1].children[0].children[1].children[1].children[0].name = "lstcsListList["+ lstcsListTabletemp  +"].lang_test_name"; 
					//점수
					addTable.children[0].children[1].children[0].children[2].children[1].children[0].name = "lstcsListList["+ lstcsListTabletemp  +"].score";
					//급수
					addTable.children[0].children[1].children[0].children[3].children[1].children[0].name = "lstcsListList["+ lstcsListTabletemp  +"].grad";
					//취득일
					addTable.children[0].children[1].children[0].children[4].children[1].children[0].name = "lstcsListList["+ lstcsListTabletemp  +"].acqdt";
					
					$('#LSTCS_ListDiv').append(addTable);
				}
			});
			
			//자기소개서 추가 버튼 클릭 이벤트
			var selfIntroductionTabletemp = ${fn:length(resumeInfo.selfIntroductionList)}+1;
			$('#selfIntroductionPlusBTN').click(function(){
				if($('#selfIntroductionTable1').css('display') == 'none'){
					$('#selfIntroductionTable1').css('display', 'block');
				}else{
					var addDiv = document.getElementById('selfIntroductionTable1');
					var addTable = addDiv.cloneNode(true);
					selfIntroductionTabletemp = parseInt(selfIntroductionTabletemp) + 1;
					selfIntroductionTabletemp = String(selfIntroductionTabletemp);
					
					//추가되는 테이블 id 다음번호로 변경
					addTable.id = 'selfIntroductionTable'+ selfIntroductionTabletemp;
					//삭제 버튼 id 다음번호로 변경
					addTable.children[0].children[0].id  = 'selfIntroductionDeleteBTN'+ selfIntroductionTabletemp;
					//자기소개서 제목
					addTable.children[0].children[1].children[0].children[0].children[1].children[0].name = "selfIntroductionList["+ selfIntroductionTabletemp +"].selfintro_qestn";
					//자기소개서 내용
					addTable.children[0].children[1].children[0].children[1].children[1].children[0].name = "selfIntroductionList["+ selfIntroductionTabletemp  +"].selfintro_answer"; 
					
					$('#selfIntroductionDiv').append(addTable);
				}
			});
			
			
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
			//희망근무지역 select 
			var resume_hope_search_addr = "${resumeInfo.resume_hope_area}";
			var hope_search_addr1 = resume_hope_search_addr.split(" ")[0];
			var hope_search_addr2 = resume_hope_search_addr.split(" ")[1];
			$('#hope_search_addr1').val(hope_search_addr1).attr("selected","selected");
			$('#hope_search_addr1').val(hope_search_addr1).trigger('change');
			$('#hope_search_addr2').val(hope_search_addr2).attr("selected","selected");



			
			
			
			//이력서 submit 
			$('#submitBTN').click(function(){
				$('#updateResumeForm').attr("action","${individualMemberURL}/updateResume.do");
				
				//제목
				if($('textarea[name="resume_sj"]').val() == ''){
					alert("이력서제목을 입력하세요.");
					return false;
				}
				
				//validation
				//초등학교
				if($('#elementarySchoolCheck').is(':checked') == true){
					if($('input[name="academicDetaList[0].det_acdmcr_school"]').val() == ''){
						alert("초등학교 학교명을 입력하세요.");
						return false;
					}else if($('input[name="academicDetaList[0].det_acdmcr_entsch"]').val() == ''){
						alert("초등학교 입학일을 확인해주세요.");
						return false;
					}else if($('input[name="academicDetaList[0].det_acdmcr_grdtn"]').val() == ''){
						alert("초등학교 졸업일을 확인해주세요.");
						return false;
					}
				}
				
				//중학교
				if($('#middleSchoolCheck').is(':checked') == true){
					if($('input[name="academicDetaList[1].det_acdmcr_school"]').val() == ''){
						alert("중학교 학교명을 입력하세요.");
						return false;
					}else if($('input[name="academicDetaList[1].det_acdmcr_entsch"]').val() == ''){
						alert("중학교 입학일을 확인해주세요.");
						return false;
					}else if($('input[name="academicDetaList[1].det_acdmcr_grdtn"]').val() == ''){
						alert("중학교 졸업일을 확인해주세요.");
						return false;
					}
				}
				
				//고등학교
				if($('#highSchoolCheck').is(':checked') == true){
					if($('input[name="academicDetaList[2].det_acdmcr_school"]').val() == ''){
						alert("고등학교 학교명을 입력하세요.");
						return false;
					}else if($('input[name="academicDetaList[2].det_acdmcr_entsch"]').val() == ''){
						alert("고등학교 입학일을 확인해주세요.");
						return false;
					}else if($('input[name="academicDetaList[2].det_acdmcr_grdtn"]').val() == ''){
						alert("고등학교 졸업일을 확인해주세요.");
						return false;
					}
				}
				
				//대학&대학교
				if($('#UniversityCheck').is(':checked') == true){
					if($('input[name="academicDetaList[3].det_acdmcr_school"]').val() == ''){
						alert("대학&대학원 학교명을 입력하세요.");
						return false;
					}else if($('input[name="academicDetaList[3].det_acdmcr_entsch"]').val() == ''){
						alert("대학&대학원 입학일을 확인해주세요.");
						return false;
					}else if($('input[name="academicDetaList[3].det_acdmcr_grdtn"]').val() == ''){
						alert("대학&대학원 졸업일을 확인해주세요.");
						return false;
					}else if($('input[name="academicDetaList[3].det_acdmcr_major"]').val() == ''){
						alert("대학&대학원 전공을 입력하세요.");
						return false;
					}else if($('input[name="academicDetaList[3].det_acdmcr_subjct"]').val() == ''){
						alert("대학&대학원 학과를 입력하세요.");
						return false;
					}
				}
				
				if($('#UniversityTable4').css('display') == 'block' || (parseInt(academicTemp) > 4)){
					var temp = 0;
					if($('#UniversityTable4').css('display') == 'block'){
						temp = 4;
					}else{
						temp = 5;
					}
					
					for(var i=temp; i< parseInt(academicTemp)+1; i++ ){
						if(document.getElementById('UniversityTable'+i)){
							if($('input[name="academicDetaList['+ i +'].det_acdmcr_school"]').val() == ''){
								alert("대학&대학원 학교명을 입력하세요.");
								return false;
							}else if($('input[name="academicDetaList['+ i +'].det_acdmcr_entsch"]').val() == ''){
								alert("대학&대학원 입학일을 확인해주세요.");
								return false;
							}else if($('input[name="academicDetaList['+ i +'].det_acdmcr_grdtn"]').val() == ''){
								alert("대학&대학원 졸업일을 확인해주세요.");
								return false;
							}else if($('input[name="academicDetaList['+ i +'].det_acdmcr_major"]').val() == ''){
								alert("대학&대학원 전공을 입력하세요.");
								return false;
							}else if($('input[name="academicDetaList['+ i +'].det_acdmcr_subjct"]').val() == ''){
								alert("대학&대학원 학과를 입력하세요.");
								return false;
							}
						}
					}
				}
				
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
				
				//자격증
				if($('#cerificatieCheck').is(':checked') == true){
					for(var i=0; i<parseInt(cerificatieTabletemp)+1; i++){
						if(i == 1){
							if($('#cerificatieTable1').css('display') == 'none' ){
								i = i+1;
							}
						}
						if(document.getElementById('cerificatieTable'+i)){
							if($('input[name="cerificatieList['+ i +'].crqfc_name"]').val() == ''){
								alert("자격증 입력 선택시 자격증 명을 입력하셔야합니다.");
								return false;
							}else if($('input[name="cerificatieList['+ i +'].crqfc_pblshr"]').val() == ''){
								alert("자격증 입력 선택시 자격증 발행처를 입력하셔야합니다.");
								return false;
							}else if($('input[name="cerificatieList['+ i +'].crqfc_acqdt"]').val() == ''){
								alert("자격증 입력 선택시 자격증 취득일을 입력하셔야합니다. 확인해주세요.");
								return false;
							}
						}
					}
				}
				
				//수상내역
				if($('#winningprizeCheck').is(':checked') == true){
					for(var i=0; i<parseInt(winningprizeTabletemp)+1; i++){
						if(i == 1){
							if($('#winningprizeTable1').css('display') == 'none' ){
								i = i+1;
							}
						}
						if(document.getElementById('winningprizeTable'+i)){
							if($('input[name="winningPrizeList['+ i +'].wnpz_name"]').val() == ''){
								alert("수상내역 입력 선택시 수상 명을 입력하셔야합니다.");
								return false;
							}else if($('input[name="winningPrizeList['+ i +'].cnfer_instt"]').val() == ''){
								alert("수상내역 입력 선택시 수여기관을 입력하셔야합니다.");
								return false;
							}else if($('input[name="winningPrizeList['+ i +'].acqdt"]').val() == ''){
								alert("수상내역 입력 선택시 취득일을 입력하셔야합니다. 확인해주세요.");
								return false;
							}
						}
					}
				}
				
				//어학 내역
				if($('#LSTCS_ListCheck').is(':checked') == true){
					for(var i=0; i<parseInt(lstcsListTabletemp)+1; i++){
						if(i == 1){
							if($('#LSTCS_ListTable1').css('display') == 'none' ){
								i = i+1;
							}
						}
						if(document.getElementById('LSTCS_ListTable'+i)){
							if($('select[name="lstcsListList['+ i +'].lang_num"]').val() == ''){
								alert("어학내역 입력 선택시 언어를 선택하셔야합니다.");
								return false;
							}else if($('input[name="lstcsListList['+ i +'].lang_test_name"]').val() == ''){
								alert("어학내역 입력 선택시 시험명을 입력하셔야합니다.");
								return false;
							}else if($('input[name="lstcsListList['+ i +'].acqdt"]').val() == ''){
								alert("어학내역 입력 선택시 취득일을 입력하셔야합니다. 확인해주세요.");
								return false;
							}
						}
					}
				}
				
				//자기소개
				if($('#selfIntroductionCheck').is(':checked') == true){
					for(var i=0; i<parseInt(selfIntroductionTabletemp)+1; i++){
						if(i == 1){
							if($('#selfIntroductionTable1').css('display') == 'none' ){
								i = i+1;
							}
						}
						if(document.getElementById('selfIntroductionTable'+i)){
							if($('input[name="selfIntroductionList['+ i +'].selfintro_qestn"]').val() == ''){
								alert("자기소개서 입력 선택시 제목을 입력하셔야합니다.");
								return false;
							}else if($('input[name="selfIntroductionList['+ i +'].selfintro_answer"]').val() == ''){
								alert("자기소개서 입력 선택시 내용을 입력하셔야합니다.");
								return false;
							}
						}
					}
				}
				
				//이력서 항목들
				if($('select[name="emplym_num"]').val() == ''){
					alert("고용형태를 선택하세요.");
					return false;
				}
				if($('select[name="salary_num"]').val() == ''){
					alert("희망연봉을 선택하세요.");
					return false;
				}
				if($('select[name="work_num"]').val() == ''){
					alert("근무상태를 선택하세요.");
					return false;
				}
				if($('select[name="fin_acdmcr_num"]').val() == ''){
					alert("최종학력을 선택하세요.");
					return false;
				}
				if($('input[name="emplym_num"]').val() == ''){
					alert("고용형태를 선택하세요.");
					return false;
				}
				if($('input[name="lowpro_num"]').val() == ''){
					alert("희망 직종을 선택하세요.");
					return false;
				}
				if($('#hope_search_addr1').val() == ''){
					alert("희망 근무지역을 선택하세요.");
					return false;
				}
				if($('#hope_search_addr2').val() == ''){
					alert("희망 직종을 선택하세요.");
					return false;
				}
				
				
				//희망 근무 지역 id : hope_search_addr1+hope_search_addr2
				//resume_hope_area hidden으로 추가 
				var resumeHopeArea = $('<input type="hidden" name="resume_hope_area" value="'+ $('#hope_search_addr1').val() +' '+ $('#hope_search_addr2').val() +'"/>');
				$('#updateResumeForm').append(resumeHopeArea);
				
				//resume_adres1, resume_adres2
				var resumeAdres1 = $('<input type="hidden" name="resume_adres1" value="${LOGIN_INDVDLMEMINFO.indvdl_adres1}"/>');
				$('#updateResumeForm').append(resumeAdres1);
				var resumeAdres2 = $('<input type="hidden" name="resume_adres2" value="${LOGIN_INDVDLMEMINFO.indvdl_adres2}"/>');
				$('#updateResumeForm').append(resumeAdres2);
				
				//이력서 번호
				var resumeNum = $('<input type="hidden" name="resume_num" value="${resumeInfo.resume_num}"/>');
				$('#updateResumeForm').append(resumeNum);
				
				$('#updateResumeForm').submit();
			});
			
			//자기소개서 글자수 세기 키보드 이벤트  characterCounting
			$('.selfintroAnswer').keyup(function(e){
				var content = $(this).val();
				var counting = $('<div>( '+ content.length +' / 최대 1330자 )</div>');
				$(this).parents('td').prev().children().html(counting);
			});
			
			$('#listBTN').click(function(){
				location.href = "${individualMemberURL}/resumeHome.do";
			});
			
		});
		
		//추가 학력 삭제 함수
		function deleteAcademic(btnId){
			if(btnId == 'academicDeleteBTN4'){
				$('#UniversityTable4').css('display', 'none');
			}else{
				var btnIdElement = document.getElementById(btnId);
				var deleteDiv = btnIdElement.parentNode;
				deleteDiv.remove();
			}
		}
		
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
		
		//추가 자격증, 수상, 어학, 자기소개서 삭제 함수 
		function elementDeleteBTN(btnId){
			if(btnId == 'cerificatieDeleteBTN1'){
				$("#cerificatieTable1").css("display", "none");
			}else if(btnId == 'winningprizeDeleteBTN1'){
				$("#winningprizeTable1").css("display", "none");
			}else if(btnId == 'LSTCS_ListDeleteBTN1'){
				$("#LSTCS_ListTable1").css("display", "none");
			}else if(btnId == 'selfIntroductionDeleteBTN1'){
				$("#selfIntroductionTable1").css("display", "none");
			}else{
				var btnIdElement = document.getElementById(btnId);
				var deleteDiv = btnIdElement.parentNode.parentNode;
				deleteDiv.remove();
			}
		}
		
		//포트폴리오 업데이트 
		function change(index){
			$('input[name=updateport_num'+index+']').val("1");
		}
		
	</script>
</head>
<body>
	<section class="ftco-section bg-light">
		<form id="updateResumeForm" method="post" enctype="multipart/form-data">
			<div class="container" style="line-height:250%;">
				<h2 style="float:left; margin-right:5%;">이력서 제목</h2>
				<textarea rows="2" cols="30" class="form-control" placeholder="33자 이하로 입력하세요." name="resume_sj" id="resume_sj">${resumeInfo.resume_sj}</textarea>
				<div style="margin-top:5%;"><label class="form-group icon-star" style="color:red; line-height:250%;"></label>필수사항 입니다.</div>
				<h2 style="float:left; margin-right:5%;">기본 사항</h2>
				<div style="float:left; margin-top:2%;" class="icon-person">기본 사항은 마이페이지에서 수정 가능합니다. 마이페이지에서 개인정보 수정시 이력서에 자동으로 업데이트됩니다.</div>
				<div class="col-md-13 order-md-last d-flex" style="clear:both;">
					<div class="bg-white p-5 contact-form" style="width:100%;">
		            	<table style="width:100%;">
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>이름 
		            			</td>
		            			<td>
					            	<input type="text" class="form-control" name="indvdl_name" value="${LOGIN_INDVDLMEMINFO.indvdl_name}" disabled >
		            			</td>
		            			<td rowspan='4' style="width:22%; height:100%; margin-left:10%;"> 
		            				<c:forEach items="${LOGIN_INDVDLMEMINFO.pictures}" var="fileitem" varStatus="stat">
										<img src="/files/${fileitem.idpic_file_savename }" alt="증명사진" style="width:130px; height:200px; margin-left:30%;" >
									</c:forEach>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>생년월일 <label class="icon-calendar"></label>
		            			</td>
		            			<td>
					              	<input type="date" class="form-control" name="indvdl_bir" disabled>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>성별
		            			</td>
		            			<td>
		            				<input type="radio" name="indvdl_gend" ${LOGIN_INDVDLMEMINFO.indvdl_gend == '여성'? 'checked' : ''} disabled/>여성
		            				<input type="radio" name="indvdl_gend" ${LOGIN_INDVDLMEMINFO.indvdl_gend == '남성'? 'checked' : ''} style="margin-left:5%;" disabled/>남성
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>이메일
		            			</td>
		            			<td>
					              	<input type="text" class="form-control" value="${LOGIN_INDVDLMEMINFO.indvdl_mail}" disabled>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>핸드폰번호
		            			</td>
		            			<td>
					              	<input type="text" class="form-control" value="${LOGIN_INDVDLMEMINFO.indvdl_tel}" disabled>
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>주소
		            			</td>
		            			<td>
					              	<input type="text" class="form-control" value="${LOGIN_INDVDLMEMINFO.indvdl_adres1}" disabled>
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>상세주소
		            			</td>
		            			<td>
					              	<input type="text" class="form-control" value="${LOGIN_INDVDLMEMINFO.indvdl_adres2}" disabled>
		            			</td>
		            			<td></td>
		            		</tr>
		            	</table>
		            </div>
	        	</div>	
				<div id="academic_deta" style="line-height:250%;">
					<h2 style="margin-top:100px; float:left; margin-right:5%; ">학력 사항</h2>
					<div style="margin-top:100px; float:left;"><input type="checkbox" style=" float:left; margin-top:15px" checked="checked">해당사항에 체크해주세요.</div>
					<c:forEach items="${resumeInfo.academicDetaList}" var="academicDetaInfo" varStatus="index">
						<c:choose>
							<c:when test="${academicDetaInfo.acdmcr_num eq '1'}">
								<div class="col-md-13 order-md-last d-flex" style="clear:both;">
									<div class="bg-white p-5 contact-form" style="width:100%;">
										<h4 style="float:left;">초등학교 졸업</h4><input type="checkbox" id="elementarySchoolCheck" style="margin-top:15px;" ${(!empty academicDetaInfo.det_acdmcr_school)? 'checked' : ''}>
										<input type="hidden" name="academicDetaList[${index.count-1}].acdmcr_num" value="1"/>
								    	<table style="width:100%; ">
								    		<tr>
								    			<td>
									            	<label class="form-group icon-star" style="color:red;"></label>학교명
								    			</td>
								    			<td>
									            	<input type="text" class="form-control" name="academicDetaList[${index.count-1}].det_acdmcr_school" value="${academicDetaInfo.det_acdmcr_school}">
								    			</td>
								    			<td style="width:10%;"></td>
								    		</tr>
								    		<tr>
								    			<td>
									            	<label class="form-group icon-star" style="color:red;"></label>입학 - 졸업 <label class="icon-calendar"></label>
								    			</td>
								    			<td>
									              	<input type="date" class="form-control" style="width:45%; float:left;" name="academicDetaList[${index.count-1}].det_acdmcr_entsch" value="${academicDetaInfo.det_acdmcr_entsch}">	
									              	<div style="line-height:50px; float:left; width:10%; text-align:center;">──</div> 
									              	<input type="date" class="form-control" style="width:45%; float:right;" name="academicDetaList[${index.count-1}].det_acdmcr_grdtn" value="${academicDetaInfo.det_acdmcr_grdtn}">
								    			</td>
								    			<td></td>
								    		</tr>
								    	</table>
								    	<input type="hidden" name="academicDetaList[${index.count-1}].det_acdmcr_num" value="${academicDetaInfo.det_acdmcr_num}"/>
								   		<hr>
								    </div>
								</div>
							</c:when>
							<c:when test="${academicDetaInfo.acdmcr_num eq '2'}">
								<div class="col-md-13 order-md-last d-flex" >
									<div class="bg-white contact-form secondDiv" style="width:100%;">
										<h4 style="float:left;">중학교 졸업</h4><input type="checkbox" id="middleSchoolCheck" style="margin-top:15px;" ${(!empty academicDetaInfo.det_acdmcr_school)? 'checked' : ''}>
										<input type="hidden" name="academicDetaList[${index.count-1}].acdmcr_num" value="2"/>
								    	<table style="width:100%; ">
								    		<tr>
								    			<td>
									            	<label class="form-group icon-star" style="color:red;"></label>학교명
								    			</td>
								    			<td>
									            	<input type="text" class="form-control" name="academicDetaList[${index.count-1}].det_acdmcr_school" value="${academicDetaInfo.det_acdmcr_school}">
								    			</td>
								    			<td style="width:10%;"></td>
								    		</tr>
								    		<tr>
								    			<td>
									            	<label class="form-group icon-star" style="color:red;"></label>입학 - 졸업 <label class="icon-calendar"></label>
								    			</td>
								    			<td>
									              	<input type="date" class="form-control" style="width:45%; float:left;" name="academicDetaList[${index.count-1}].det_acdmcr_entsch" value="${academicDetaInfo.det_acdmcr_entsch}">	
									              	<div style="line-height:50px; float:left; width:10%; text-align:center;">──</div> 
									              	<input type="date" class="form-control" style="width:45%; float:right;" name="academicDetaList[${index.count-1}].det_acdmcr_grdtn" value="${academicDetaInfo.det_acdmcr_grdtn}">
								    			</td>
								    			<td></td>
								    		</tr>
								    	</table>
								    	<input type="hidden" name="academicDetaList[${index.count-1}].det_acdmcr_num" value="${academicDetaInfo.det_acdmcr_num}"/>
								   		<hr>
								    </div>
								</div>
							</c:when>
							<c:when test="${academicDetaInfo.acdmcr_num eq '3'}">
								<div class="col-md-13 order-md-last d-flex" >
									<div class="bg-white contact-form secondDiv" style="width:100%;">
										<h4 style="float:left;">고등학교 졸업</h4><input type="checkbox" id="highSchoolCheck" style="margin-top:15px;" ${(!empty academicDetaInfo.det_acdmcr_school)? 'checked' : ''}>
										<input type="hidden" name="academicDetaList[${index.count}].acdmcr_num" value="3"/>
								    	<table style="width:100%; ">
								    		<tr>
								    			<td>
									            	<label class="form-group icon-star" style="color:red;"></label>학교명
								    			</td>
								    			<td>
									            	<input type="text" class="form-control" name="academicDetaList[${index.count-1}].det_acdmcr_school" value="${academicDetaInfo.det_acdmcr_school}">
								    			</td>
								    			<td style="width:10%;"></td>
								    		</tr>
								    		<tr>
								    			<td>
									            	<label class="form-group icon-star" style="color:red;"></label>입학 - 졸업 <label class="icon-calendar"></label>
								    			</td>
								    			<td>
									              	<input type="date" class="form-control" style="width:45%; float:left;" name="academicDetaList[${index.count-1}].det_acdmcr_entsch" value="${academicDetaInfo.det_acdmcr_entsch}">	
									              	<div style="line-height:50px; float:left; width:10%; text-align:center;">──</div> 
									              	<input type="date" class="form-control" style="width:45%; float:right;" name="academicDetaList[${index.count-1}].det_acdmcr_grdtn" value="${academicDetaInfo.det_acdmcr_grdtn}">
								    			</td>
								    			<td></td>
								    		</tr>
								    		<tr>
								    			<td>
									            	<label class="form-group icon-star" style="color:red;"></label>전공계열
								    			</td>
								    			<td>
									            	<input type="text" class="form-control" name="academicDetaList[${index.count-1}].det_acdmcr_major" value="${academicDetaInfo.det_acdmcr_major}">
								    			</td>
								    			<td style="width:10%;"></td>
								    		</tr>
								    	</table>
								    	<input type="hidden" name="academicDetaList[${index.count-1}].det_acdmcr_num" value="${academicDetaInfo.det_acdmcr_num}"/>
								   		<hr>
								    </div>
								</div>
							</c:when>
							<c:when test="${academicDetaInfo.acdmcr_num eq '4'}">
								<div class="col-md-13 order-md-last d-flex" >
									<div class="bg-white contact-form secondDiv" style="width:100%;" id="UniversityTable1">
										<h4 style="float:left;">대학⠂대학원 졸업</h4><input type="checkbox" id="UniversityCheck" style="margin-top:15px;" ${(!empty academicDetaInfo.det_acdmcr_school)? 'checked' : ''}>
										<input type="hidden" name="academicDetaList[${index.count-1}].acdmcr_num" value="4"/>
								    	<table style="width:100%; ">
								    		<tr>
								    			<td>
									            	<label class="form-group icon-star" style="color:red;"></label>학교명
								    			</td>
								    			<td>
									            	<input type="text" class="form-control" name="academicDetaList[${index.count-1}].det_acdmcr_school" value="${academicDetaInfo.det_acdmcr_school}">
								    			</td>
								    			<td style="width:10%;"></td>
								    		</tr>
								    		<tr>
								    			<td>
									            	<label class="form-group icon-star" style="color:red;"></label>입학 - 졸업 <label class="icon-calendar"></label>
								    			</td>
								    			<td>
									              	<input type="date" class="form-control" style="width:45%; float:left;" name="academicDetaList[${index.count-1}].det_acdmcr_entsch" value="${academicDetaInfo.det_acdmcr_entsch}">	
									              	<div style="line-height:50px; float:left; width:10%; text-align:center;">──</div> 
									              	<input type="date" class="form-control" style="width:45%; float:right;" name="academicDetaList[${index.count-1}].det_acdmcr_grdtn" value="${academicDetaInfo.det_acdmcr_grdtn}">
								    			</td>
								    			<td></td>
								    		</tr>
								    		<tr>
								    			<td>
									            	<label class="form-group icon-star" style="color:red;"></label>전공
								    			</td>
								    			<td>
									            	<input type="text" class="form-control" name="academicDetaList[${index.count-1}].det_acdmcr_major" value="${academicDetaInfo.det_acdmcr_school}">
								    			</td>
								    			<td style="width:10%;"></td>
								    		</tr>
								    		<tr>
								    			<td>
									            	<label class="form-group icon-star" style="color:red;"></label>학과
								    			</td>
								    			<td>
									            	<input type="text" class="form-control" name="academicDetaList[${index.count-1}].det_acdmcr_subjct" value="${academicDetaInfo.det_acdmcr_subjct}">
								    			</td>
								    			<td style="width:10%;"></td>
								    		</tr>
								    	</table>
								    	<input type="hidden" name="academicDetaList[${index.count-1}].det_acdmcr_num" value="${academicDetaInfo.det_acdmcr_num}"/>
								   		<hr>
								    </div>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
					<div class="col-md-13 order-md-last d-flex" >
						<div class="bg-white contact-form secondDiv" style="width:100%; display:none;" id="UniversityTable4">
							<input type="button" class="form-control itemPlus deleteBTNStyle"   value="삭제 ⅹ " id="academicDeleteBTN4" onclick="deleteAcademic(this.id);">
							<h4 style="float:left;">대학⠂대학원 졸업</h4>
					    	<table style="width:100%; ">
					    		<tr>
					    			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>학교명
					    			</td>
					    			<td>
						            	<input type="text" class="form-control" name="academicDetaList[${fn:length(resumeInfo.academicDetaList)+1}].det_acdmcr_school">
					    			</td>
					    			<td style="width:10%;"></td>
					    		</tr>
					    		<tr>
					    			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>입학 - 졸업 <label class="icon-calendar"></label>
					    			</td>
					    			<td>
						              	<input type="date" class="form-control" style="width:45%; float:left;" name="academicDetaList[${fn:length(resumeInfo.academicDetaList)+1}].det_acdmcr_entsch">	
						              	<div style="line-height:50px; float:left; width:10%; text-align:center;">──</div> 
						              	<input type="date" class="form-control" style="width:45%; float:right;" name="academicDetaList[${fn:length(resumeInfo.academicDetaList)+1}].det_acdmcr_grdtn">
					    			</td>
					    			<td></td>
					    		</tr>
					    		<tr>
					    			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>전공
					    			</td>
					    			<td>
						            	<input type="text" class="form-control" name="academicDetaList[${fn:length(resumeInfo.academicDetaList)+1}].det_acdmcr_major">
					    			</td>
					    			<td style="width:10%;"></td>
					    		</tr>
					    		<tr>
					    			<td>
						            	<label class="form-group icon-star" style="color:red;"></label>학과
					    			</td>
					    			<td>
						            	<input type="text" class="form-control" name="academicDetaList[${fn:length(resumeInfo.academicDetaList)+1}].det_acdmcr_subjct">
					    			</td>
					    			<td style="width:10%;"></td>
					    		</tr>
					    	</table>
					    	<input type="hidden" name="academicDetaList[4].acdmcr_num" value="4"/>
					   		<hr>
					    </div>
					</div>	
				</div>
				<input type="button" class="form-control itemPlus"  value="대학⠂대학원 추가 +" id="academicPlusBTN">
				<h2 style="margin-top:100px;">경력 사항</h2>
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
							            	<label class="form-group icon-star" style="color:red;"></label>입사일 - 퇴사일 <label class="icon-calendar"></label>
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
							            	<label class="form-group" ></label>&nbsp&nbsp&nbsp&nbsp&nbsp연봉
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
							            	<label class="form-group" ></label>&nbsp&nbsp&nbsp&nbsp&nbsp보유기술
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
								            	<label class="form-group icon-star" style="color:red;"></label>입사일 - 퇴사일 <label class="icon-calendar"></label>
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
					            				<input type="hidden" name="career_search_addr1_${index.count-1}" value="${careerInfo.com_adres1}">
					            				<input type="hidden" name="career_search_addr2_${index.count-1}" value="${careerInfo.com_adres2}">
								              	<select id="career_search_addr1_${index.count-1}" class="career_search_addr1 form-control" style="width:50%; float:left;" name="careerInfoList[${index.count}].com_adres1" onchange="selectSearchAddr(this.id);" >
													<option value="">선택해주세요.</option>
												</select>
												<select id="career_search_addr2_${index.count-1}" class="career_search_addr2 form-control" style="width:50%; float:right;" name="careerInfoList[${index.count}].com_adres2">
													<option value="">선택해주세요.</option>
												</select>
					            			</td>
					            			<td></td>
					            		</tr>
					            		<tr>
					            			<td>
								            	<label class="form-group" ></label>&nbsp&nbsp&nbsp&nbsp&nbsp연봉
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
								            	<label class="form-group" ></label>&nbsp&nbsp&nbsp&nbsp&nbsp보유기술
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
					            	<label class="form-group icon-star" style="color:red;"></label>입사일 - 퇴사일 <label class="icon-calendar"></label>
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
					              	<select id="career_search_addr1_${fn:length(resumeInfo.careerInfoList)+1}" class="search_addr1 form-control" style="width:50%; float:left;" name="careerInfoList[${fn:length(resumeInfo.careerInfoList)+1}].com_adres1" onchange="selectSearchAddr(this.id);">
										<option value="">선택해주세요.</option>
									</select>
									<select id="career_search_addr2_${fn:length(resumeInfo.careerInfoList)+1}" class="form-control" style="width:50%; float:right;" name="careerInfoList[${fn:length(resumeInfo.careerInfoList)+1}].com_adres2">
										<option value="">선택해주세요.</option>
									</select>
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group" ></label>&nbsp&nbsp&nbsp&nbsp&nbsp연봉
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
					            	<label class="form-group" ></label>&nbsp&nbsp&nbsp&nbsp&nbsp보유기술
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
	           	<input type="button" class="form-control itemPlus"  value="경력 추가 +" style="width:150px; float:right; margin-top:15px; display:none;" id="careerPlusBTN">
				<h2 style="margin-top:100px; float:left;">자격증 내역</h2>
				<div style="margin-top:100px; width:80%;"><input type="checkbox" class="checkboxStyle" id="cerificatieCheck" ${(!empty resumeInfo.cerificatieList)? 'checked' : ''}>작성시 체크해 주세요.</div>
				<div id="cerificatieDiv">
					<c:if test="${empty resumeInfo.cerificatieList}" >
						<div class="col-md-13 order-md-last d-flex" style="clear:both;" id="cerificatieTable0">
							<div class="bg-white p-5 contact-form" style="width:100%; " >
				            	<table style="width:100%; ">
				            		<tr>
				            			<td>
							            	자격증 명
				            			</td>
				            			<td style="width:70%;">
							            	<input type="text" class="form-control" name="cerificatieList[0].crqfc_name">
				            			</td>
				            			<td style="width:10%;"></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	자격증 발행처
				            			</td>
				            			<td>
							              	<input type="text" class="form-control" name="cerificatieList[0].crqfc_pblshr">
				            			</td>
				            			<td></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	자격증 취득일
				            			</td>
				            			<td>
							              	<input type="date" class="form-control" name="cerificatieList[0].crqfc_acqdt">
				            			</td>
				            			<td></td>
				            		</tr>
				            	</table>
				            	<hr>
				            </div>
			            </div>
					</c:if>
					<c:if test="${!empty resumeInfo.cerificatieList}" >
						<c:forEach items="${resumeInfo.cerificatieList}" var="cerificatieInfo" varStatus="index">
							<div class="col-md-13 order-md-last d-flex" style="clear:both;" id="cerificatieTable0">
								<div class="bg-white p-5 contact-form" style="width:100%; " >
					            	<table style="width:100%; ">
					            		<tr>
					            			<td>
								            	자격증 명
					            			</td>
					            			<td style="width:70%;">
								            	<input type="text" class="form-control" name="cerificatieList[${index.count}].crqfc_name" value="${cerificatieInfo.crqfc_name}">
					            			</td>
					            			<td style="width:10%;"></td>
					            		</tr>
					            		<tr>
					            			<td>
								            	자격증 발행처
					            			</td>
					            			<td>
								              	<input type="text" class="form-control" name="cerificatieList[${index.count}].crqfc_pblshr" value="${cerificatieInfo.crqfc_pblshr}">
					            			</td>
					            			<td></td>
					            		</tr>
					            		<tr>
					            			<td>
								            	자격증 취득일
					            			</td>
					            			<td>
								              	<input type="date" class="form-control" name="cerificatieList[${index.count}].crqfc_acqdt" value="${cerificatieInfo.crqfc_acqdt}">
					            			</td>
					            			<td></td>
					            		</tr>
					            	</table>
					            	<input type="hidden" name="cerificatieList[${index.count}].crqfc_num" value="${cerificatieInfo.crqfc_num}"/>
					            	<hr>
					            </div>
				            </div>
			            </c:forEach>
		            </c:if>
		            <div style="clear:both; display:none;" id="cerificatieTable1">
						<div class="bg-white contact-form secondDiv" style="width:100%; ">
							<input type="button" class="form-control itemPlus deleteBTNStyle" value="삭제 ⅹ " id="cerificatieDeleteBTN1" onclick="elementDeleteBTN(this.id);">
			            	<table style="width:100%; ">
			            		<tr>
			            			<td>
						            	자격증 명
			            			</td>
			            			<td style="width:70%;">
						            	<input type="text" class="form-control" name="cerificatieList[${fn:length(resumeInfo.cerificatieList)+1}].crqfc_name">
			            			</td>
			            			<td style="width:10%;"></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	자격증 발행처
			            			</td>
			            			<td>
						              	<input type="text" class="form-control" name="cerificatieList[${fn:length(resumeInfo.cerificatieList)+1}].crqfc_pblshr">
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	자격증 취득일
			            			</td>
			            			<td>
						              	<input type="date" class="form-control" name="cerificatieList[${fn:length(resumeInfo.cerificatieList)+1}].crqfc_acqdt">
			            			</td>
			            			<td></td>
			            		</tr>
			            	</table>
			            	<hr>
			            </div>
		            </div>
	            </div>
	            <input type="button" class="form-control itemPlus"  value="자격증내역 추가 +" id="cerificatiePlusBTN">
				<h2 style="margin-top:100px; float:left;">수상 내역</h2>
				<div style="margin-top:100px; width:80%;"><input type="checkbox" class="checkboxStyle" id="winningprizeCheck" ${(!empty resumeInfo.winningPrizeList)? 'checked' : ''}>작성시 체크해 주세요.</div>
				<div id="winningprizeDiv">
					<c:if test="${empty resumeInfo.winningPrizeList}" >
						<div class="col-md-13 order-md-last d-flex" style="clear:both;" id="winningprizeTable0">
							<div class="bg-white p-5 contact-form" style="width:100%;">
				            	<table style="width:100%;">
				            		<tr>
				            			<td>
							            	수상 명
				            			</td>
				            			<td style="width:70%;">
							            	<input type="text" class="form-control" name="winningPrizeList[0].wnpz_name">
				            			</td>
				            			<td style="width:10%;"></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	수여기관
				            			</td>
				            			<td>
							              	<input type="text" class="form-control" name="winningPrizeList[0].cnfer_instt">
				            			</td>
				            			<td></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	취득일
				            			</td>
				            			<td>
							              	<input type="date" class="form-control" name="winningPrizeList[0].acqdt">
				            			</td>
				            			<td></td>
				            		</tr>
				            	</table>
				            </div>
			            </div>	
					</c:if>
					<c:if test="${!empty resumeInfo.winningPrizeList}" >
						<c:forEach items="${resumeInfo.winningPrizeList}" var="winningPrizeInfo" varStatus="index">
							<div class="col-md-13 order-md-last d-flex" style="clear:both;" id="winningprizeTable0">
								<div class="bg-white p-5 contact-form" style="width:100%;">
					            	<table style="width:100%;">
					            		<tr>
					            			<td>
								            	수상 명
					            			</td>
					            			<td style="width:70%;">
								            	<input type="text" class="form-control" name="winningPrizeList[${index.count}].wnpz_name" value="${winningPrizeInfo.wnpz_name}">
					            			</td>
					            			<td style="width:10%;"></td>
					            		</tr>
					            		<tr>
					            			<td>
								            	수여기관
					            			</td>
					            			<td>
								              	<input type="text" class="form-control" name="winningPrizeList[${index.count}].cnfer_instt" value="${winningPrizeInfo.cnfer_instt}">
					            			</td>
					            			<td></td>
					            		</tr>
					            		<tr>
					            			<td>
								            	취득일
					            			</td>
					            			<td>
								              	<input type="date" class="form-control" name="winningPrizeList[${index.count}].acqdt" value="${winningPrizeInfo.acqdt}">
					            			</td>
					            			<td></td>
					            		</tr>
					            	</table>
					            	<input type="hidden" name="winningPrizeList[${index.count}].wnpz_num" value="${winningPrizeInfo.wnpz_num}"/>
					            </div>
				            </div>
			            </c:forEach>
		            </c:if>
					<div style="clear:both; display:none;" id="winningprizeTable1">
						<div class="bg-white contact-form secondDiv" style="width:100%;">
							<input type="button" class="form-control itemPlus deleteBTNStyle" value="삭제 ⅹ " id="winningprizeDeleteBTN1" onclick="elementDeleteBTN(this.id);">
			            	<table style="width:100%;">
			            		<tr>
			            			<td>
						            	수상 명
			            			</td>
			            			<td style="width:70%;">
						            	<input type="text" class="form-control" name="winningPrizeList[${fn:length(resumeInfo.winningPrizeList)+1}].wnpz_name">
			            			</td>
			            			<td style="width:10%;"></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	수여기관
			            			</td>
			            			<td>
						              	<input type="text" class="form-control" name="winningPrizeList[${fn:length(resumeInfo.winningPrizeList)+1}].cnfer_instt">
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	취득일
			            			</td>
			            			<td>
						              	<input type="date" class="form-control" name="winningPrizeList[${fn:length(resumeInfo.winningPrizeList)+1}].acqdt">
			            			</td>
			            			<td></td>
			            		</tr>
			            	</table>
			            </div>
		            </div>
	            </div>
	            <input type="button" class="form-control itemPlus"  value="수상내역 추가 +" id="winningprizePlusBTN">
				<h2 style="margin-top:100px; float:left;">어학 내역</h2>
				<div style="margin-top:100px; width:80%;"><input type="checkbox" class="checkboxStyle" id="LSTCS_ListCheck" ${(!empty resumeInfo.lstcsListList)? 'checked' : ''}>작성시 체크해 주세요.</div>
				<div id="LSTCS_ListDiv">
					<c:if test="${empty resumeInfo.lstcsListList}">
						<div class="col-md-13 order-md-last d-flex" style="clear:both;" id="LSTCS_ListTable0">
							<div class="bg-white p-5 contact-form" style="width:100%; ">
				            	<table style="width:100%; ">
				            		<tr>
				            			<td>
							            	언어
				            			</td>
				            			<td style="width:70%;">
							            	<select class="form-control" name="lstcsListList[0].lang_num">
							            		<option value="">선택해주세요.</option>
							            		<c:forEach items="${languageList}" var="languageInfo">
								            		<option value="${languageInfo.lang_num}">${languageInfo.lang_kind}</option>
							            		</c:forEach>
							            	</select>
				            			</td>
				            			<td style="width:10%;"></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	시험명
				            			</td>
				            			<td>
							              	<input type="text" class="form-control" name="lstcsListList[0].lang_test_name">
				            			</td>
				            			<td></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	점수
				            			</td>
				            			<td>
							              	<input type="text" class="form-control" name="lstcsListList[0].score">
				            			</td>
				            			<td></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	급수
				            			</td>
				            			<td>
							              	<input type="text" class="form-control" name="lstcsListList[0].grad">
				            			</td>
				            			<td></td>
				            		</tr>
				            		<tr>
				            			<td>
							            	취득일
				            			</td>
				            			<td>
							              	<input type="date" class="form-control" name="lstcsListList[0].acqdt">
				            			</td>
				            			<td></td>
				            		</tr>
				            	</table>
				            </div>
			            </div>	
					</c:if>
					<c:if test="${!empty resumeInfo.lstcsListList}">
						<c:forEach items="${resumeInfo.lstcsListList}" var="lstcsListInfo" varStatus="index">
							<div class="col-md-13 order-md-last d-flex" style="clear:both;" id="LSTCS_ListTable0">
								<div class="bg-white p-5 contact-form" style="width:100%; ">
					            	<table style="width:100%; ">
					            		<tr>
					            			<td>
								            	언어
					            			</td>
					            			<td style="width:70%;">
								            	<select class="form-control" name="lstcsListList[${index.count}].lang_num">
								            		<option value="">선택해주세요.</option>
								            		<c:forEach items="${languageList}" var="languageInfo">
									            		<option value="${languageInfo.lang_num}" ${(lstcsListInfo.lang_num eq languageInfo.lang_num)? 'selected':'' }>${languageInfo.lang_kind}</option>
								            		</c:forEach>
								            	</select>
					            			</td>
					            			<td style="width:10%;"></td>
					            		</tr>
					            		<tr>
					            			<td>
								            	시험명
					            			</td>
					            			<td>
								              	<input type="text" class="form-control" name="lstcsListList[${index.count}].lang_test_name" value="${lstcsListInfo.lang_test_name}">
					            			</td>
					            			<td></td>
					            		</tr>
					            		<tr>
					            			<td>
								            	점수
					            			</td>
					            			<td>
								              	<input type="text" class="form-control" name="lstcsListList[${index.count}].score" value="${lstcsListInfo.score}">
					            			</td>
					            			<td></td>
					            		</tr>
					            		<tr>
					            			<td>
								            	급수
					            			</td>
					            			<td>
								              	<input type="text" class="form-control" name="lstcsListList[${index.count}].grad" value="${lstcsListInfo.grad}">
					            			</td>
					            			<td></td>
					            		</tr>
					            		<tr>
					            			<td>
								            	취득일
					            			</td>
					            			<td>
								              	<input type="date" class="form-control" name="lstcsListList[${index.count}].acqdt" value="${lstcsListInfo.acqdt}">
					            			</td>
					            			<td></td>
					            		</tr>
					            	</table>
					            	<input type="hidden" name="lstcsListList[${index.count}].lstcs_dtls_num" value="${lstcsListInfo.lstcs_dtls_num}" />
					            </div>
				            </div>
			            </c:forEach>
		            </c:if>
					<div style="clear:both; display:none;" id="LSTCS_ListTable1">
						<div class="bg-white contact-form secondDiv" style="width:100%; ">
							<input type="button" class="form-control itemPlus deleteBTNStyle" value="삭제 ⅹ " id="LSTCS_ListDeleteBTN1" onclick="elementDeleteBTN(this.id);">
			            	<table style="width:100%; ">
			            		<tr>
			            			<td>
						            	언어
			            			</td>
			            			<td style="width:70%;">
						            	<select class="form-control" name="lstcsListList[${fn:length(resumeInfo.lstcsListList)+1}].lang_num">
						            		<option value="">선택해주세요.</option>
						            		<c:forEach items="${languageList}" var="languageInfo">
							            		<option value="${languageInfo.lang_num}">${languageInfo.lang_kind}</option>
						            		</c:forEach>
						            	</select>
			            			</td>
			            			<td style="width:10%;"></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	시험명
			            			</td>
			            			<td>
						              	<input type="text" class="form-control" name="lstcsListList[${fn:length(resumeInfo.lstcsListList)+1}].lang_test_name">
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	점수
			            			</td>
			            			<td>
						              	<input type="text" class="form-control" name="lstcsListList[${fn:length(resumeInfo.lstcsListList)+1}].score">
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	급수
			            			</td>
			            			<td>
						              	<input type="text" class="form-control" name="lstcsListList[${fn:length(resumeInfo.lstcsListList)+1}].grad">
			            			</td>
			            			<td></td>
			            		</tr>
			            		<tr>
			            			<td>
						            	취득일
			            			</td>
			            			<td>
						              	<input type="date" class="form-control" name="lstcsListList[${fn:length(resumeInfo.lstcsListList)+1}].acqdt">
			            			</td>
			            			<td></td>
			            		</tr>
			            	</table>
			            </div>
		            </div>
	            </div>
	            <input type="button" class="form-control itemPlus"  value="어학내역 추가 +" id="lstcsListPlusBTN">
				<h2 style="margin-top:100px; float:left;">자기소개서</h2>
				<div style="margin-top:100px; width:80%;"><input type="checkbox" class="checkboxStyle" id="selfIntroductionCheck" ${(!empty resumeInfo.selfIntroductionList)? 'checked' : ''}>작성시 체크해 주세요.</div>
				<div id="selfIntroductionDiv">
					<c:if test="${empty resumeInfo.selfIntroductionList}">
						<div class="col-md-13 order-md-last d-flex" style="clear:both;" id="selfIntroductionTable0">
							<div class="bg-white p-5 contact-form" style="width:100%; ">
				            	<table style="width:100%; ">
				            		<tr>
				            			<td style="width:20.3%;">
							            	자기소개서 제목
				            			</td>
				            			<td>
							              	<input type="text" class="form-control" placeholder="1330자 이하로 입력하세요." name="selfIntroductionList[0].selfintro_qestn">
				            			</td>
				            		</tr>
				            		<tr>
				            			<td>
							            	자기소개서 내용
							            	<div></div>
				            			</td>
				            			<td>
							              	<textarea rows="20" cols="30" class="form-control selfintroAnswer" placeholder="1330자 이하로 입력하세요." name="selfIntroductionList[0].selfintro_answer"></textarea>
				            			</td>
				            		</tr>
				            	</table>
				            	<div></div>
				            	<hr>
				            </div>
			            </div>	
					</c:if>
					<c:if test="${!empty resumeInfo.selfIntroductionList}">
						<c:forEach items="${resumeInfo.selfIntroductionList}" var="selfIntroductionInfo" varStatus="index">
							<div class="col-md-13 order-md-last d-flex" style="clear:both;" id="selfIntroductionTable0">
								<div class="bg-white p-5 contact-form" style="width:100%; ">
					            	<table style="width:100%; ">
					            		<tr>
					            			<td style="width:20.3%;">
								            	자기소개서 제목
					            			</td>
					            			<td>
								              	<input type="text" class="form-control" placeholder="1330자 이하로 입력하세요." name="selfIntroductionList[${index.count}].selfintro_qestn" value="${selfIntroductionInfo.selfintro_qestn}">
					            			</td>
					            		</tr>
					            		<tr>
					            			<td>
								            	자기소개서 내용
								            	<div></div>
					            			</td>
					            			<td>
								              	<textarea rows="20" cols="30" class="form-control selfintroAnswer" placeholder="1330자 이하로 입력하세요." name="selfIntroductionList[${index.count}].selfintro_answer" >${selfIntroductionInfo.selfintro_answer}</textarea>
					            			</td>
					            		</tr>
					            	</table>
					            	<input type="hidden" name="selfIntroductionList[${index.count}].selfintro_num" value="${selfIntroductionInfo.selfintro_num}" />
					            	<div></div>
					            	<hr>
					            </div>
				            </div>
			            </c:forEach>
		            </c:if>
					<div style="clear:both; display:none;" id="selfIntroductionTable1">
						<div class="bg-white contact-form secondDiv" style="width:100%; ">
							<input type="button" class="form-control itemPlus deleteBTNStyle" style="margin-right:0px;" value="삭제 ⅹ " id="selfIntroductionDeleteBTN1" onclick="elementDeleteBTN(this.id);">
			            	<table style="width:100%; ">
			            		<tr>
			            			<td style="width:20.3%;">
						            	자기소개서 제목
			            			</td>
			            			<td>
						              	<input type="text" class="form-control" placeholder="1330자 이하로 입력하세요." name="selfIntroductionList[${fn:length(resumeInfo.selfIntroductionList)+1}].selfintro_qestn">
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>
						            	자기소개서 내용
						            	<div></div>
			            			</td>
			            			<td>
						              	<textarea rows="20" cols="30" class="form-control selfintroAnswer" placeholder="1330자 이하로 입력하세요." name="selfIntroductionList[${fn:length(resumeInfo.selfIntroductionList)+1}].selfintro_answer"></textarea>
			            			</td>
			            		</tr>
			            	</table>
			            	<hr>
			            </div>
		            </div>
	            </div>
   	            <input type="button" class="form-control itemPlus"  value="자기소개서 추가 +" id="selfIntroductionPlusBTN">
				<h2 style="margin-top:100px; float:left;">포트폴리오</h2>
				<div style="margin-top:105px; width:80%;">포트폴리오 및 기타 파일은 다섯개 까지 등록가능합니다.</div>
				<div id="portfolioDiv">
					<div class="col-md-13 order-md-last d-flex" style="clear:both;" id="portfolioTable">
						<div class="bg-white p-5 contact-form" style="width:100%; ">
							<div class="sidebar-box ftco-animate">
				            	<div class="categories">
				            		<c:forEach begin="0" end="4" var="i" >
				            			<li>
					            			<c:if test="${!empty resumeInfo.portfolioList[i]}">
					            				<input type="button" class="btn" name="portfolioFiles" data-buttonName="btn-primary"
					            				 value="${resumeInfo.portfolioList[i].port_filename}" onclick="javascript:location.href='${individualMemberURL}/portfolioDownload.do?port_filesavename=${resumeInfo.portfolioList[i].port_filesavename}&port_filename=${resumeInfo.portfolioList[i].port_filename}'" >
					            				파일 수정 : 
					            				<input type="file" class="btn" name="portfolioFiles" data-buttonName="btn-primary" onchange="change(${i});">
					            				<input type="hidden" name="port_num" value="${resumeInfo.portfolioList[i].port_num}">
					            				<input type="hidden" name="updateport_num${i}" value="0" />
					            			</c:if>
					            			<c:if test="${empty resumeInfo.portfolioList[i]}">
					            				<input type="file" class="btn" name="portfolioFiles" data-buttonName="btn-primary">
					            				<input type="hidden" name="updateport_num${i}" value="0" />
					            			</c:if>
				            			</li>
				            		</c:forEach>
					            </div>
					        </div>        
		              	</div>
		            </div>
	            </div>
				<h2 style="margin-top:100px;">희망 근무 조건</h2>
				<div class="col-md-13 order-md-last d-flex" >
					<div class="bg-white p-5 contact-form" style="width:100%; ">
		            	<table style="width:100%; ">
			            	<input type="hidden" name="indvdl_id" value="${LOGIN_INDVDLMEMINFO.indvdl_id}">
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>고용형태
		            			</td>
		            			<td colspan="2">
					            	<select class="form-control" name="emplym_num">
					            		<option value="">선택해주세요.</option>
					            		<c:forEach items="${employmentList}" var="employmentInfo">
						            		<option value="${employmentInfo.emplym_num}" ${(resumeInfo.emplym_num eq employmentInfo.emplym_num)? 'selected' : '' }>${employmentInfo.emplym}</option>
					            		</c:forEach>
					            	</select>
		            			</td>
		            			<td style="width:10%;"></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>희망연봉
		            			</td>
		            			<td colspan="2">
					              	<select class="form-control" name="salary_num">
					              		<option value="">선택해주세요.</option>
					            		<c:forEach items="${salaryList}" var="salaryInfo">
						            		<option value="${salaryInfo.salary_num}" ${(resumeInfo.salary_num eq salaryInfo.salary_num)? 'selected' : '' }>${salaryInfo.salary_scope}</option>
					            		</c:forEach>
					            	</select>
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>근무상태
		            			</td>
		            			<td colspan="2">
					              	<select class="form-control" name="work_num">
					              		<option value="">선택해주세요.</option>
					            		<c:forEach items="${workList}" var="workInfo">
						            		<option value="${workInfo.work_num}" ${(resumeInfo.work_num eq workInfo.work_num)? 'selected' : '' }>${workInfo.work_name}</option>
					            		</c:forEach>
					            	</select>
		            			</td>
		            			<td></td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>최종학력
		            			</td>
		            			<td colspan="2">
					              	<select class="form-control" name="fin_acdmcr_num">
					              		<option value="">선택해주세요.</option>
					            		<c:forEach items="${finalAcademicList}" var="finalAcademicInfo">
						            		<option value="${finalAcademicInfo.fin_acdmcr_num}" ${(resumeInfo.fin_acdmcr_num eq finalAcademicInfo.fin_acdmcr_num)? 'selected' : '' }>${finalAcademicInfo.fin_acdmcr}</option>
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
					              	<select class="form-control" id="hopeSelectUpPROInfo" onchange="selectLowPROFunction(this.id);" >
					              		<option value="0">선택해주세요.</option>
					            		<c:forEach items="${upPROList}" var="upPROInfo">
						            		<option value="${upPROInfo.uppro_num}" ${(resumeInfo.lowproList[0].uppro_num eq upPROInfo.uppro_num)? 'selected' : '' }>${upPROInfo.uppro_name}</option>
					            		</c:forEach>
					            	</select>
					            </td>
					            <td style="width:35%;">	
					              	<select class="form-control" id="hoprSelecLowPROInfo" name="lowpro_num">
						            		<option value="">선택해주세요.</option>
						            		<c:forEach items="${resumeInfo.lowproList}" var="lowproInfo">
						            			<option value="${lowproInfo.lowpro_num}" ${(resumeInfo.lowpro_num eq lowproInfo.lowpro_num)? 'selected' : '' }>${lowproInfo.lowpro_name}</option>
						            		</c:forEach>
					            	</select>
		            			</td>
		            		</tr>
		            		<tr>
		            			<td>
					            	<label class="form-group icon-star" style="color:red;"></label>근무지역
		            			</td>
		            			<td colspan="2">
					              	<select id="hope_search_addr1" class="form-control search_addr1" style="width:50%; float:left;" onchange="selectSearchAddr(this.id);">
										<option value="">선택해주세요.</option>
									</select>
									<select id="hope_search_addr2" class="form-control" style="width:50%; float:right;" >
										<option value="">선택해주세요.</option>
									</select>
		            			</td>
		            			<td></td>
		            		</tr>
		            	</table>
		            </div>
	            </div>
	            <div class="col-md-13 order-md-last d-flex">
	            	<input type="submit" class="form-control" value="이력서 수정" id="submitBTN" >
	            	<input type="button" class="form-control" value="목록" id="listBTN">
				</div>
			</div>
		</form>
	</section>
</body>
</html>