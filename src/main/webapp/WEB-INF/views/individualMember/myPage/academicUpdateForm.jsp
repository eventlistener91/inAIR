<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.iconStyle{
 		float:left;
 		font-size:40px;
 		color:red;
 	}
 	.divStyle{
 		clear:both; margin-left:5%;
 	}
 	.tableStyle{
 		font-size:19px;
 	}
 	.firstStyle{
 		vertical-align:text-top;
 	}
 	.secondStyle{
 		padding-left:2%;
	    width:19% !important;
 	}
 	.marginTop{
 		margin-top:5%;
 	}
 	.chartsDivStyle{
 		width:48%; float:left; border:1px solid #ced4da;
 	}
 	pre{
 		max-width:866px;
 		overflow:auto;
 		white-space:pre-wrap;
 		
 	}
 	.btn{
 		border:1px solid #ced4da !important;
 	}
</style>
</head>
<body>
<form name="myPageUpdateForm" method="post" >
	<div class="col-md-13 order-md-last d-flex" style="clear:both;">
		<div class="bg-white p-5 contact-form" id="personalData" style="width:100%;">
			<h2>학력사항</h2>
			<br>
			<c:forEach items="${resumeInfo.academicDetaList}" var="academicDetaInfo" varStatus="index">
			<c:choose>
			<c:when test="${academicDetaInfo.acdmcr_num eq '1'}">
			<div class="col-md-13 order-md-last d-flex">
				<div class="bg-white contact-form secondDiv" style="width:100%;">
					<h4 style="float:left;">초등학교 졸업</h4><input type="checkbox" id="elementarySchoolCheck" style="margin-top:15px;" ${(!empty academicDetaInfo.det_acdmcr_school)? 'checked' : ''}>
					<input type="hidden" name="academicDetaList[${index.count}].acdmcr_num" value="1"/>
					<table style="width:100%; ">
			    		<tr>
			    			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>학교명
			    			</td>
			    			<td>
				            	<input type="text" class="form-control" name="academicDetaList[${index.count}].det_acdmcr_school" value="${academicDetaInfo.det_acdmcr_school}">
			    			</td>
			    			<td style="width:10%;"></td>
			    		</tr>
			    		<tr>
			    			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>입학 - 졸업 <label class="icon-calendar"></label>
			    			</td>
			    			<td>
				              	<input type="date" class="form-control" style="width:45%; float:left;" name="academicDetaList[${index.count}].det_acdmcr_entsch" value="${academicDetaInfo.det_acdmcr_entsch}">	
				              	<div style="line-height:50px; float:left; width:10%; text-align:center;">──</div> 
				              	<input type="date" class="form-control" style="width:45%; float:right;" name="academicDetaList[${index.count}].det_acdmcr_grdtn" value="${academicDetaInfo.det_acdmcr_grdtn}">
			    			</td>
			    			<td></td>
			    		</tr>
			    	</table>
			    	<input type="hidden" name="academicDetaList[${index.count}].det_acdmcr_num" value="${academicDetaInfo.det_acdmcr_num}"/>
			    	<br>
			    	<hr>
		    	</div>
	    	</div>
	    	</c:when>
	    	
	    	<c:when test="${academicDetaInfo.acdmcr_num eq '2'}">
	    	<div class="col-md-13 order-md-last d-flex" >
				<div class="bg-white contact-form secondDiv" style="width:100%;">
					<br>
					<h4 style="float:left;">중학교 졸업</h4><input type="checkbox" id="middleSchoolCheck" style="margin-top:15px;" ${(!empty academicDetaInfo.det_acdmcr_school)? 'checked' : ''}>
					<input type="hidden" name="academicDetaList[${index.count}].acdmcr_num" value="2"/>
			    	<table style="width:100%; ">
			    		<tr>
			    			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>학교명
			    			</td>
			    			<td>
				            	<input type="text" class="form-control" name="academicDetaList[${index.count}].det_acdmcr_school" value="${academicDetaInfo.det_acdmcr_school}">
			    			</td>
			    			<td style="width:10%;"></td>
			    		</tr>
			    		<tr>
			    			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>입학 - 졸업 <label class="icon-calendar"></label>
			    			</td>
			    			<td>
				              	<input type="date" class="form-control" style="width:45%; float:left;" name="academicDetaList[${index.count}].det_acdmcr_entsch" value="${academicDetaInfo.det_acdmcr_entsch}">	
				              	<div style="line-height:50px; float:left; width:10%; text-align:center;">──</div> 
				              	<input type="date" class="form-control" style="width:45%; float:right;" name="academicDetaList[${index.count}].det_acdmcr_grdtn" value="${academicDetaInfo.det_acdmcr_grdtn}">
			    			</td>
			    			<td></td>
			    		</tr>
			    	</table>
			    	<input type="hidden" name="academicDetaList[${index.count}].det_acdmcr_num" value="${academicDetaInfo.det_acdmcr_num}"/>
			    	<br>
			   		<hr>
			    </div>
			</div>
			</c:when>
	    	
	    	<c:when test="${academicDetaInfo.acdmcr_num eq '3'}">
	    	<div class="col-md-13 order-md-last d-flex" >
				<div class="bg-white contact-form secondDiv" style="width:100%;">
					<br>
					<h4 style="float:left;">고등학교 졸업</h4><input type="checkbox" id="highSchoolCheck" style="margin-top:15px;" ${(!empty academicDetaInfo.det_acdmcr_school)? 'checked' : ''}>
					<input type="hidden" name="academicDetaList[${index.count}].acdmcr_num" value="3"/>
			    	<table style="width:100%; ">
			    		<tr>
			    			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>학교명
			    			</td>
			    			<td>
				            	<input type="text" class="form-control" name="academicDetaList[${index.count}].det_acdmcr_school" value="${academicDetaInfo.det_acdmcr_school}">
			    			</td>
			    			<td style="width:10%;"></td>
			    		</tr>
			    		<tr>
			    			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>입학 - 졸업 <label class="icon-calendar"></label>
			    			</td>
			    			<td>
				              	<input type="date" class="form-control" style="width:45%; float:left;" name="academicDetaList[${index.count}].det_acdmcr_entsch" value="${academicDetaInfo.det_acdmcr_entsch}">	
				              	<div style="line-height:50px; float:left; width:10%; text-align:center;">──</div> 
				              	<input type="date" class="form-control" style="width:45%; float:right;" name="academicDetaList[${index.count}].det_acdmcr_grdtn" value="${academicDetaInfo.det_acdmcr_grdtn}">
			    			</td>
			    			<td></td>
			    		</tr>
			    		<tr>
			    			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>전공계열
			    			</td>
			    			<td>
				            	<input type="text" class="form-control" name="academicDetaList[${index.count}].det_acdmcr_major" value="${academicDetaInfo.det_acdmcr_major}">
			    			</td>
			    			<td style="width:10%;"></td>
			    		</tr>
			    	</table>
			    	<input type="hidden" name="academicDetaList[${index.count}].det_acdmcr_num" value="${academicDetaInfo.det_acdmcr_num}"/>
			    	<br>
			   		<hr>
			    </div>
			</div>
			</c:when>
			
			<c:when test="${academicDetaInfo.acdmcr_num eq '4'}">
			<div class="col-md-13 order-md-last d-flex" >
				<div class="bg-white contact-form secondDiv" style="width:100%;" id="UniversityTable1">
					<br>
					<h4 style="float:left;">대학⠂대학원 졸업</h4><input type="checkbox" id="UniversityCheck" style="margin-top:15px;" ${(!empty academicDetaInfo.det_acdmcr_school)? 'checked' : ''}>
					<input type="hidden" name="academicDetaList[${index.count}].acdmcr_num" value="4"/>
			    	<table style="width:100%; ">
			    		<tr>
			    			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>학교명
			    			</td>
			    			<td>
				            	<input type="text" class="form-control" name="academicDetaList[${index.count}].det_acdmcr_school" value="${academicDetaInfo.det_acdmcr_school}">
			    			</td>
			    			<td style="width:10%;"></td>
			    		</tr>
			    		<tr>
			    			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>입학 - 졸업 <label class="icon-calendar"></label>
			    			</td>
			    			<td>
				              	<input type="date" class="form-control" style="width:45%; float:left;" name="academicDetaList[${index.count}].det_acdmcr_entsch" value="${academicDetaInfo.det_acdmcr_entsch}">	
				              	<div style="line-height:50px; float:left; width:10%; text-align:center;">──</div> 
				              	<input type="date" class="form-control" style="width:45%; float:right;" name="academicDetaList[${index.count}].det_acdmcr_grdtn" value="${academicDetaInfo.det_acdmcr_grdtn}">
			    			</td>
			    			<td></td>
			    		</tr>
			    		<tr>
			    			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>전공
			    			</td>
			    			<td>
				            	<input type="text" class="form-control" name="academicDetaList[${index.count}].det_acdmcr_major" value="${academicDetaInfo.det_acdmcr_school}">
			    			</td>
			    			<td style="width:10%;"></td>
			    		</tr>
			    		<tr>
			    			<td>
				            	<label class="form-group icon-star" style="color:red;"></label>학과
			    			</td>
			    			<td>
				            	<input type="text" class="form-control" name="academicDetaList[${index.count}].det_acdmcr_subjct" value="${academicDetaInfo.det_acdmcr_subjct}">
			    			</td>
			    			<td style="width:10%;"></td>
			    		</tr>
			    	</table>
			    	<input type="hidden" name="academicDetaList[${index.count}].det_acdmcr_num" value="${academicDetaInfo.det_acdmcr_num}"/>
			    	<br>
			   		<hr>
			    </div>
			</div>
			</c:when>
			</c:choose>
			</c:forEach>
		</div>
	</div>
</form>
</body>
</html>