<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
td{
	margin-right:5%;
 	padding: 10px;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Tables</a> </div>
    <h1 style="margin-left:11%">고용형태 항목</h1>
  	<table style="width:80%;margin-left:10%">
		 <tr>
		 	<td>
			 	<div class="salary-box">
			 		 <div style="display:flex">
			 		 	<form  style="display:flex;width:100%">
			 		 	   <c:if test="${!empty LOGIN_ADMININFO.admin_id}">
			 		 			<input type="text" name="employmentTxt">
			 		 			<button type="submit" name="EmploymentInsertForm" class="btn btn-info" style="margin-right:50%;margin-left:1%; height:30px;" >추가</button>
							</c:if>
						</form>   
					  </div>
			          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
			            <h5>고용형태항목</h5>
			          </div>
			          <div class="widget-content nopadding">
			            <table class="table table-bordered table-striped">
				              <thead>
				                <tr>
					                  <th style="width:3%">코드</th>
					                  <th>고용형태</th>
					                <c:if test="${!empty LOGIN_ADMININFO.admin_id}">
					                   <th style="width:5%">삭제</th>
					                </c:if>
				                </tr>
				              </thead>
				              <tbody id="LanguageTBY">
				              	<c:if test="${empty employmentList}">
				              		<tr class="odd gradeX">
				              			 <td colspan="2" align="center"><font color="red">등록된 게시글이 없습니다. </font></td>
				              		</tr>
				              	</c:if>
				              	<c:if test="${!empty employmentList}">
				              		<c:forEach items="${employmentList}" var="employmentInfo">
						                <tr class="odd gradeX">
						                  <td><input type="hidden" value="${employmentInfo.emplym_num}">${employmentInfo.rnum}</td>
						                  <td>${employmentInfo.emplym}</td>
						                  <c:if test="${!empty LOGIN_ADMININFO.admin_id}">
						                     <td><a style="color:red" onclick="EmployDelete(${employmentInfo.emplym_num})">[삭제]</a></td>
						                  </c:if>
						                </tr>
						            </c:forEach>
					            </c:if>
				              </tbody>
			            </table>
			        </div>
			          <div style="background-color:#efefef ">
						${paginationHTML}
				  	  </div>
			        </div>
		        </td>
    		</tr>
        </table> 
      </div>
    </div>
    <script type="text/javascript">
    $('[name=EmploymentInsertForm]').click(function(){
    	var insertData = {'emplym' : $("input[name=employmentTxt]").val()};
    	EmploymentInsert(insertData);
    });
  
    //추가
    function EmploymentInsert(insertData){
    	$.ajax({
   			url:'${pageContext.request.contextPath}/admin/ItemManagement/insertEmployment.do', 		
    		type: 'post',
    		data: insertData,
    		success : function(data){
    			$(".salary-box").show();
    		}
    		
   
    	});
    }
    
    
    
    //삭제
    function EmployDelete(emplym_num){
    	if(confirm('정말삭제하시겠습니까?')){
    	$.ajax({
    		url : '${pageContext.request.contextPath}/admin/ItemManagement/deleteEmplym.do',
    		type : 'post',
    		data : {'emplym_num':emplym_num},
    		success : function(data){
    			location.reload();
    		}

    	});
    	}
    }
    </script>
</body>
</html>