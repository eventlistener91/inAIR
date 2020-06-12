<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="adminMemberManagementURL" value="/admin/memberManagement"></c:url>
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
		width:18% !important;
   		margin-left:15px;
   		margin-top:2%;
	}
	
	.divMarginLeft{
		margin-top:2%;
		margin-left:23% !important;
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
	var emails = "";
	var emails = "";
	var names = "";
	var ids = "";
	$(function(){
		// 시도주소를 세팅하는 부분
		$('#search_addr1').append(getSido());
		
		$('#search_indvdlMemBTN').click(function(){
			var $searchGender = $('<input type="hidden" name="search_gender" value="'+ $('input[name=gender]:checked').val() +'" />');
			
			$('Form[name=search_indvdlMemForm]').append($searchGender);
			
			$('Form[name=search_indvdlMemForm]').submit();
		});
		
		$('tr .comMemTableTd').click(function(){
			var companyMemberViewForm = document.createElement("form");
			companyMemberViewForm.setAttribute("charset", "UTF-8");
			companyMemberViewForm.setAttribute("method", "post"); 
			companyMemberViewForm.setAttribute("action", "${adminMemberManagementURL}/companyMemberView.do"); 
			companyMemberViewForm.setAttribute("name", "companyMemberViewForm"); 
			
			document.body.appendChild(companyMemberViewForm);
			
			var comId = $(this).parent().find('.comIdTd').text();
			var $comMemId = $('<input type="hidden" name="com_id" value="'+ comId +'"/>');
			
			$('form[name=companyMemberViewForm]').append($comMemId);
			
			companyMemberViewForm.submit();
		});
		
		$('input[name=title-table-checkbox]').click(function(){
			if(!$(this).prop('checked')){
				$('input[name=selectMember]').prop('checked', false);
			} else {
				$('input[name=selectMember]').prop('checked', true);
			}
		});
		
		$('#sendMailBTN').click(function(){
			emails = "";
			ids = "";
			names = "";
			
			$('input[name=selectMember]').each(function(){
				if($(this).is(":checked")){
					names += $(this).parent().parent().find('td').eq(1).text() + ",";
					ids +=  $(this).parent().parent().find('td').eq(2).text() + ",";
					emails +=  $(this).parent().parent().find('td').eq(4).text() + ",";
				}
			});
			
			
			
			var url = '${adminMemberManagementURL}/sendEmailForm.do';
			var options = 'width=700px, height=400px, resizable=no, scrollbars=no, copyhistory=no';
		
			window.open(url, '이메일 보내기', options);
		});
		
	});
	
	function getEmailSendMemberInfo(){
		var memberInfo = [ids, names, emails];
		return memberInfo;
	};

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
	    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>회원관리</a> <a href="#" class="current">기업회원관리</a> </div>
	    <h1>기업회원관리</h1>
	  </div>
	  <div class="container-fluid">
	    <div class="row-fluid">
		    <div class="span4" style="height:600px; margin:0px 0px 0px 1%; width:22%;">
		        <div class="widget-box" style="height:98%;">
		          <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
		            <h5> 기업회원 검색</h5>
		          </div>
		          <div class="widget-content nopadding" style="height:94%;">
		            <form action="#" method="get" class="form-horizontal" style="height:100%;" name="search_companyMemForm" >
		              <div class="control-group divHeight">
		                <label class="control-label labelWidth">아이디</label>
		                <div class="controls divMarginLeft">
		                  : <input type="text" class="span11" placeholder="아이디"  name="search_com_id" style="width:87%;"/>
		                </div>
		              </div>
		              <div class="control-group divHeight">
		                <label class="control-label labelWidth">기업 명</label>
		                <div class="controls divMarginLeft">
		                  : <input type="text" class="span11" placeholder="기업 명" name="search_corp_name" style="width:87%;"/>
		                </div>
		              </div>
		              <div class="control-group divHeight">
		                <label class="control-label labelWidth">대표자 명</label>
		                <div class="controls divMarginLeft">
		                  : <input type="text" class="span11" placeholder="대표자 명" name="search_ceo_nm" style="width:87%;"/>
		                </div>
		              </div>
		              <div class="control-group divHeight">
		                <label class="control-label labelWidth">이메일</label>
		                <div class="controls divMarginLeft">
		                  : <input type="text"  class="span11" placeholder="이메일" name="search_com_mail" style="width:87%;"/>
		                </div>
		              </div>
		              <div class="control-group" style="height:13%;">
		              	<div style="float:left; margin-top:3%; margin-left:4%;">
			                <label style="margin-left:15px;"> &nbsp;&nbsp;&nbsp;&nbsp;사업자</label>
			                <label style="margin-left:15px;">등록번호</label>
		              	</div>
		                <div class="controls divMarginLeft">
		                  : <input type="text"  class="span11" placeholder="사업자등록번호" name="search_bizr_no" style="width:87%;"/>
		                </div>
		              </div>
		              <div class="control-group divHeight">
		                <label class="control-label labelWidth">주소</label>
		                <div class="controls divMarginLeft">
		                	<select style="float:left; width:40%; margin-right:2%; margin-left:2.5%;" id="search_addr1" onchange="selectSearchAddr(this.id);" name="search_addr1">
		                		<option value="">선택하세요.</option>
		                	</select>  
		                	<select style="float:left; width:45%;" id="search_addr2" name="search_addr2">
		                		<option value="">선택하세요.</option>
		                	</select>  
		                </div>
		              </div>
		              <div class="control-group divHeight">
		                <label class="control-label labelWidth"> 업종 </label>
		                <div class="controls divMarginLeft">
		               		<select class="form-control" id="upinduty_num" onchange="selectLowIndustryFunction(this.id);" style="width:40%; margin-right:1%; margin-left:2.5%;">
			              		<option value="0">선택하세요.</option>
			            		<c:forEach items="${upIndustryList}" var="upIndustryInfo">
				            		<option value="${upIndustryInfo.upinduty_num}">${upIndustryInfo.upinduty_name}</option>
			            		</c:forEach>
			            	</select>  
		                	<select class="form-control" id="lwinduty_num" style="width:45%;" name="lwinduty_num">
				            		<option value="">선택하세요.</option>
			            	</select> 
		                </div>
		              </div>
		              <div class="form-actions" style="height:6.5%; padding:1.5% 3% 0;">
		                <button type="submit" class="btn btn-success" style="float:right;" id="search_companyMemBTN">검색</button>
		              </div>
		            </form>
		          </div>
		        </div>
		    </div>
	      	<div class="span10" style="margin:0px 0px 0px 1%; width:75.5%;">
		        <div class="widget-box">
		          <div class="widget-title">
		             <span class="icon"><i class="icon-th"></i></span> 
		            <h5>기업회원 리스트</h5>
		          </div>
	          	  <div class="widget-content nopadding">
	       		  	<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper" role="grid">
			            <table class="table table-bordered data-table" id="DataTables_Table_0" style="height:500px;">
			              <thead>
			                <tr style="height:37px;">
			                  <th style="width:2.5%;">
	                 			<input type="checkbox" id="title-table-checkbox" name="title-table-checkbox" />
			                  </th>
			                  <th style="width:12%;"> 기업명 </th>
			                  <th style="width:12%;"> 아이디 </th>
			                  <th style="width:12%;"> 연락처 </th>
			                  <th style="width:12%;"> 이메일 </th>
			                  <th style="width:12%;"> 업종 </th>
			                  <th style="width:12%;"> 사업자등록번호 </th>
			                  <th> 주소 </th>
			                </tr>
			              </thead>
			              <tbody>
			              	<c:if test="${empty companyMemList}">
			              		<tr>
			              			<td colspan="9" style="color:silver;">
					              		검색하신 회원이 없습니다.
			              			</td>
			              		</tr>
			              	</c:if>
			              	<c:if test="${!empty companyMemList}">
				              	<c:forEach items="${companyMemList}" var="companyMemInfo">
					                <tr class="gradeX">
					                  <td>
			                  			<input type="checkbox" name="selectMember"/>
					                  </td>
					                  <td class="comMemTableTd">${companyMemInfo.corp_name}</td>
					                  <td class="comMemTableTd comIdTd">${companyMemInfo.com_id}</td>
					                  <td class="comMemTableTd">${companyMemInfo.com_tel}</td>
					                  <td class="comMemTableTd">${companyMemInfo.com_mail}</td>
					                  <td class="comMemTableTd">${companyMemInfo.lwinduty_name}</td>
					                  <td class="center comMemTableTd">${companyMemInfo.bizr_no}</td>
					                  <td class="comMemTableTd">${companyMemInfo.adres}</td>
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