<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<c:url var="individualMemberURL" value="/individualMember/jobOffer"></c:url> 
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
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="col-md-13 order-md-last d-flex" style="clear:both; margin-bottom:4%;">
				<div class="bg-white p-5 contact-form" style="width:100%; text-align:left;">
		           	<c:if test="${!empty resumeInfo.selfIntroductionList}">
			           	<div class="divStyle marginTop">
			           		<h3 style="float:left;">자기소개서</h3>
           					<c:forEach items="${resumeInfo.selfIntroductionList}" var="selfIntroductionInfo">
			            		<table class="table" style="width:90%">
			            			<tbody style="text-align:center;">
			            				<tr>
			            					<td><b>${fn:trim(selfIntroductionInfo.selfintro_qestn)}</b></td>
			            				</tr>
			            				<tr>
			            					<td style="text-align:left;">
				            					<pre>${fn:trim(selfIntroductionInfo.selfintro_answer)}</pre>
			            					</td>
			            				</tr>
			            			</tbody>
			            		</table>
           					</c:forEach>
			           	</div>
		           	</c:if>
	           	</div>
			</div>
		</div>
	</section>
</body>
</html>