<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="adminMemberManagementURL" value="/admin/memberManagement"></c:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$('#comMemListBTN').click(function(){
			location.href="${adminMemberManagementURL}/companyMemberHome.do";
		});
	});
</script>
</head>
<body>
	<div id="content">
	  <div id="content-header">
	    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>회원관리</a> <a href="#" class="current">기업회원 상세정보</a> </div>
	    <h1>기업회원 상세정보</h1>
	  </div>
	  <div class="container-fluid" style="padding-right:20%; padding-left:20%; height:650px;">
	    <div class="row-fluid" style="height:95%;">
	    	<div class="span6" style="justify-content:center; width:100%; align-items:center; height:100%;">
		        <div class="widget-box" style="height:100%;">
		          <div class="widget-title">
		            <h5>CompanyMember-info</h5>
		          </div>
		          <div class="widget-content nopadding" style="height:94%;">
		            <form action="#" method="get" class="form-horizontal" style="height:99%;">
		              <c:set var="companyInfo" value="${companyMemInfo.companyVo}" ></c:set>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 기업명 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${companyInfo.corp_name}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 아이디 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${companyMemInfo.com_id}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 대표자명 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${companyInfo.ceo_nm}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 연락처 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${companyMemInfo.com_tel}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 이메일 : </label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${companyMemInfo.com_mail}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 사업자등록번호 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${companyInfo.bizr_no}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 설립일 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${companyInfo.est_dt}</span> 
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 주소 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${companyInfo.adres}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 대표전화번호 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${companyInfo.phn_no}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 홈페이지주소 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${companyInfo.hm_url}</span>
		                </div>
		              </div>
		              <div class="form-actions" >
		                <button type="button" class="btn btn-success" id="comMemListBTN" style="float:right; margin-right:10%;">목록</button>
		              </div>
		            </form>
		          </div>
		        </div>
		      </div>
	    	</div>
	  	</div>
	</div>
</body>
</html>