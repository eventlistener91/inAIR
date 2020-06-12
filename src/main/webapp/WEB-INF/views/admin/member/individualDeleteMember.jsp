<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="admin" value="/admin/memberManagement"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table tbody td{
		vertical-align:middle !important;
		text-align:center !important;
	}
	
	.formHeight{
		height:100%;
	}
	
	.labelWidth{
		padding-top:23px !important;
		width:20% !important;
	}
	
	.divMarginLeft{
		margin-top:1.5%;
		margin-left:25% !important;
	}
	
	.divHeight{
		height:12.7%;
	}
	
	.table th {
		vertical-align:middle !important;
		padding:0;
		font-size:14px;
	}
	#dataTablesPaginate{
		float:right; width:60%;
	}
</style>
<script type="text/javascript">
	$(function(){
		// 시도주소를 세팅하는 부분
		$('#search_addr1').append(getSido());
		
		$('#search_indvdlMemBTN').click(function(){
			var $searchGender = $('<input type="hidden" name="search_gender" value="'+ $('input[name=gender]:checked').val() +'" />');
			
			$('Form[name=search_indvdlMemForm]').append($searchGender);
			
			$('Form[name=search_indvdlMemForm]').submit();
		});
		
		$('tr .indvdlTableTd').click(function(){
			var individualMemberViewForm = document.createElement("form");
			individualMemberViewForm.setAttribute("charset", "UTF-8");
			individualMemberViewForm.setAttribute("method", "post"); 
			individualMemberViewForm.setAttribute("action", "${admin}/individualDeleteMemberViewForm.do"); 
			individualMemberViewForm.setAttribute("name", "individualMemberViewForm"); 
			
			document.body.appendChild(individualMemberViewForm);
			
			var indvdlId = $(this).parent().find('.indvdlIdTd').text();
			var $indvdlMemId = $('<input type="hidden" name="indvdl_id" value="'+ indvdlId +'"/>');
			
			$('form[name=individualMemberViewForm]').append($indvdlMemId);
			
			individualMemberViewForm.submit();
		});
		
	});

	function selectLowPROFunction(thisId){
		$('#hoprSelecLowPROInfo').empty();
		if($('#'+thisId+' option:selected').val() == '0'){
			var changeOption = $('<option value="0">선택해주세요.</option>');
			$('#hoprSelecLowPROInfo').append(changeOption);
		}else{
			getLowPROList($('#'+thisId+' option:selected').val(), '#hoprSelecLowPROInfo');
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
	<div id="content">
	  <div id="content-header">
	    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>회원관리</a> <a href="#" class="current">탈퇴한 회원관리</a> </div>
	    <h1>탈퇴한 개인회원관리</h1>
	  </div>
	  <div class="container-fluid">
	    <div class="row-fluid">
		    <div class="span4" style="height:600px; margin:0px 0px 0px 1%;">
		        <div class="widget-box" style="height:98%;">
		          <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
		            <h5> 개인회원 검색</h5>
		          </div>
		          <div class="widget-content nopadding" style="height:93%;">
		            <form action="#" method="get" class="form-horizontal" style="height:100%;" name="search_indvdlMemForm" >
		              <div class="control-group divHeight">
		                <label class="control-label labelWidth">아이디 :</label>
		                <div class="controls divMarginLeft">
		                  <input type="text" class="span11" placeholder="아이디"  name="search_indvdl_id"/>
		                </div>
		              </div>
		              <div class="control-group divHeight">
		                <label class="control-label labelWidth">이름 :</label>
		                <div class="controls divMarginLeft">
		                  <input type="text" class="span11" placeholder="이름" name="search_indvdl_name"/>
		                </div>
		              </div>
		              <div class="control-group divHeight">
		                <label class="control-label labelWidth">이메일 : </label>
		                <div class="controls divMarginLeft">
		                  <input type="text"  class="span11" placeholder="이메일" name="search_indvdl_mail"/>
		                </div>
		              </div>
		              <div class="control-group divHeight">
		                <label class="control-label labelWidth">성별:</label>
		                <div class="controls divMarginLeft">
		                  <input type="radio" name="gender" value="" checked /> 전체  
		                  <input type="radio" name="gender" value="여성"/> 여성  
		                  <input type="radio" name="gender" value="남성"/> 남성
		                </div>
		              </div>
		              <div class="control-group divHeight">
		                <label class="control-label labelWidth">주소:</label>
		                <div class="controls divMarginLeft">
		                	<select style="float:left; width:40%; margin-right:2%;" id="search_addr1" onchange="selectSearchAddr(this.id);" name="search_indvdl_adres1_1">
		                		<option value="">선택하세요.</option>
		                	</select>  
		                	<select style="float:left; width:40%;" id="search_addr2" name="search_indvdl_adres1_2">
		                		<option value="">선택하세요.</option>
		                	</select>  
		                </div>
		              </div>
		              <div class="control-group divHeight">
		                <label class="control-label labelWidth"> 최종학력 </label>
		                <div class="controls divMarginLeft">
		               		<select style="float:left; width:40%;" name="search_fin_acdmcr_num">
		               			<option value="">선택하세요.</option>
		                		<c:forEach items="${finalAcademicList}" var="finalAcademicInfo">
				            		<option value="${finalAcademicInfo.fin_acdmcr_num}">${finalAcademicInfo.fin_acdmcr}</option>
			            		</c:forEach>
		                	</select>
		                </div>
		              </div>
		              <div class="control-group divHeight">
		                <label class="control-label labelWidth"> 희망직종 </label>
		                <div class="controls divMarginLeft">
		               		<select class="form-control" id="hopeSelectUpPROInfo" onchange="selectLowPROFunction(this.id);" style="width:40%;">
			              		<option value="0">선택하세요.</option>
			            		<c:forEach items="${upPROList}" var="upPROInfo">
				            		<option value="${upPROInfo.uppro_num}">${upPROInfo.uppro_name}</option>
			            		</c:forEach>
			            	</select>  
		                	<select class="form-control" id="hoprSelecLowPROInfo" style="width:45%;" name="search_hopepro_num">
				            		<option value="">선택하세요.</option>
			            	</select> 
		                </div>
		              </div>
		              <div class="form-actions" style="height:6.5%; padding:1.5% 3% 0;">
		                <button type="submit" class="btn btn-success" style="float:right;" id="search_indvdlMemBTN">검색</button>
		              </div>
		            </form>
		          </div>
		        </div>
		    </div>
	      	<div class="span8" style="margin:0px 0px 0px 1%;">
		        <div class="widget-box">
		          <div class="widget-title">
		             <span class="icon"><i class="icon-th"></i></span> 
		            <h5>개인회원 리스트</h5>
		          </div>
	          	  <div class="widget-content nopadding">
	       		  	<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper" role="grid">
			            <table class="table table-bordered data-table" id="DataTables_Table_0" style="height:500px;">
			              <thead>
			                <tr style="height:37px;">
			                  <th style="width:2.9%;">
	                 			<input type="checkbox" id="title-table-checkbox" name="title-table-checkbox" />
			                  </th>
			                  <th style="width:10%;"> 이름 </th>
			                  <th style="width:14%;"> 아이디 </th>
			                  <th style="width:14%;"> 연락처 </th>
			                  <th style="width:16%;"> 이메일 </th>
			                  <th style="width:5%;"> 성별 </th>
			                  <th > 탈퇴사유 </th>
			                </tr>
			              </thead>
			              <tbody>
			              	<c:if test="${empty indvdlMemList}">
			              		<tr>
			              			<td colspan="7" style="color:silver;">
					              		검색하신 회원이 없습니다.
			              			</td>
			              		</tr>
			              	</c:if>
			              	<c:if test="${!empty indvdlMemList}">
				              	<c:forEach items="${indvdlMemList}" var="indvdlMemInfo">
					                <tr class="gradeX">
					                  <td>
			                  			<input type="checkbox" />
					                  </td>
					                  <td class="indvdlTableTd">${indvdlMemInfo.indvdl_name}</td>
					                  <td class="indvdlTableTd indvdlIdTd">${indvdlMemInfo.indvdl_id}</td>
					                  <td class="indvdlTableTd">${indvdlMemInfo.indvdl_tel}</td>
					                  <td class="indvdlTableTd">${indvdlMemInfo.indvdl_mail}</td>
					                  <td class="center class="indvdlTableTd"">${indvdlMemInfo.indvdl_gend}</td>
					                  <td class="indvdlTableTd">${indvdlMemInfo.indvdl_secsn}</td>
					                </tr>
				                </c:forEach>
			                </c:if>
			              </tbody>
			            </table>
			            <div>
			            	<div class='fg-toolbar ui-toolbar ui-widget-header ui-corner-bl ui-corner-br ui-helper-clearfix'>
					            <button type="button" class="btn btn-info" id="sendMailBTN" style="margin-left:1.5%; margin-top:3px;">선택회원 메일발송</button>
					            ${pagingHtmls}
			            	</div>
			            </div>
		            </div>
		          </div>
		        </div>
		    </div>
	    </div>
	  </div>
	</div>
</body>
</html>