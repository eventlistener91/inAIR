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
		$('#indvdlMemListBTN').click(function(){
			location.href="${adminMemberManagementURL}/individualDeleteMember.do";
		});
	});
</script>
</head>
<body>
	<div id="content">
	  <div id="content-header">
	    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>회원관리</a> <a href="#" class="current">개인회원 상세정보</a> </div>
	    <h1>개인회원 상세정보</h1>
	  </div>
	  <div class="container-fluid" style="padding-right:20%; padding-left:20%; height:650px;">
	    <div class="row-fluid" style="height:95%;">
	    	<div class="span6" style="justify-content:center; width:100%; align-items:center; height:100%;">
		        <div class="widget-box" style="height:100%;">
		          <div class="widget-title">
		            <h5>IndividualMember-info</h5>
		          </div>
		          <div class="widget-content nopadding" style="height:94%;">
		            <form action="#" method="get" class="form-horizontal" style="height:99%;">
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 이름 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${indvdlMemberInfo.indvdl_name}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 아이디 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${indvdlMemberInfo.indvdl_id}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 생년월일 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${indvdlMemberInfo.indvdl_bir}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 연락처 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${indvdlMemberInfo.indvdl_tel}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 이메일 : </label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${indvdlMemberInfo.indvdl_mail}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 성별 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${indvdlMemberInfo.indvdl_gend}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 주소 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${indvdlMemberInfo.indvdl_adres1} ${indvdlMemberInfo.indvdl_adres2}</span> 
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 최종학력 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${indvdlMemberInfo.fin_acdmcr_string}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 희망직종 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${indvdlMemberInfo.hopepro_string}</span>
		                </div>
		              </div>
		              <div class="control-group" style="height:8.5%; padding-left:10%;">
		                <label class="control-label"> 탈퇴사유 :</label>
		                <div class="controls">
		                  <span class="help-block" style="margin-top:5px;">${indvdlMemberInfo.indvdl_secsn}</span>
		                </div>
		              </div>
		              <div class="form-actions" >
		                <button type="button" class="btn btn-success" id="indvdlMemListBTN" style="float:right; margin-right:10%;">목록</button>
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