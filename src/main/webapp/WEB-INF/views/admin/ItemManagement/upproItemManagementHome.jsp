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
.vertical-menu {
  width: 30%;
  margin-top:1%;
  margin-left:1%;
  height: 470px;
  overflow-y: auto;
}
.vertical-menu a.active {
  background-color: #2f96b4;
  color: white;
}
.vertical-menu a {
  background-color: #eee;
  color: black;
  display: block;
  padding: 12px;
  text-decoration: none;
}


</style>
<script type="text/javascript">
function searchFunction() {
	var search_keyword = $("#search_keyword").val();
  location.href="/admin/ItemManagement/itemManagementHome.do?search_keyword="+search_keyword+'&mySelect='+"언어항목";
}
</script>
</head>
<body>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Tables</a> </div>
    <div style="display:flex;">
	   <h1 style="margin-left:11%">상위직종</h1>
	   <h1 style="margin-left:45%">하위직종</h1>
	</div>
    <div style="display:flex;">
  	<table style="width:50%;margin-left:10%">
		 <tr>
		 	<td>
			 	<div class="uppro-box">
			 		 <div style="display:flex">
			 		 	<form  style="display:flex">
			 		 	  <c:if test="${!empty LOGIN_ADMININFO.admin_id}">
			 		 		<input type="text" name="upProTxt">
			 		 		<button type="submit" name="upProInsertForm" class="btn btn-info" style="height:30px;">추가</button>
					     </c:if>
						</form>   
					  </div>
			         
			          <div class="widget-content nopadding">
			            <table class="table table-bordered table-striped">
				              <thead>
				                <tr>
				                  <th style="width:5%">코드</th>
				                  <th>상위직종</th>
				                 <c:if test="${!empty LOGIN_ADMININFO.admin_id}">  
				                   <th style="width:10%">삭제</th>
				                 </c:if>
				                </tr>
				              </thead>
				              <tbody id="UpProTBY">
				              	<c:if test="${empty UpProList}">
				              		<tr class="odd gradeX">
				              			 <td colspan="2" align="center"><font color="red">등록된 게시글이 없습니다. </font></td>
				              		</tr>
				              	</c:if>
				              	<c:if test="${!empty UpProList}">
				              		<c:forEach items="${UpProList}" var="upProInfo">
						                <tr class="odd gradeX">
						                  <td><input id="upProClick${upProInfo.uppro_num}"  type="hidden" value="${upProInfo.uppro_num}">${upProInfo.rnum}</td>
						                  <td>${upProInfo.uppro_name}</td>
						                  <c:if test="${!empty LOGIN_ADMININFO.admin_id}">
						                     <td><a style="color:red" onclick="UpProDelete(${upProInfo.uppro_num})">[삭제]</a></td>
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
	        <div class="vertical-menu">
	           <form  style="display:flex">
	               <c:if test="${!empty LOGIN_ADMININFO.admin_id}">  
			 		  <input type="text" name="lowProTxt">
			          <button type="button" name="lowProInsertForm" class="btn btn-info" style="height:30px;">추가</button>
			   	   </c:if>
			    </form>   
				   <div class="widget-content nopadding">
			            <table class="table table-bordered table-striped">
			              <thead>
			                <tr>
			                  <th>코드</th>
			                  <th>하위직종</th>
			                 <c:if test="${!empty LOGIN_ADMININFO.admin_id}">  
			                  <th>삭제</th>
			                 </c:if> 	               
			                </tr>
			              </thead>
			              <tbody class="lowPROList">
			              
			              	
			              </tbody>
			          </table>
			      </div>
			  </div>
          </div>
       </div>
    </div>
    <script type="text/javascript">
    //상위 직종 입력폼 데이터 가져오기
    $('[name=upProInsertForm]').click(function(){
    	var insertData = {'uppro_name' : $("input[name=upProTxt]").val()};
    	UpproInsert(insertData);
    });
  
    //추가
    function UpproInsert(insertData){
    	$.ajax({
   			url:'${pageContext.request.contextPath}/admin/ItemManagement/insertUppro.do', 		
    		type: 'post',
    		data: insertData,
    		success : function(data){
    			$(".uppro-box").show();
    		}
    		
    	});
    }
    
    //삭제
    function UpProDelete(uppro_num){
    	if(confirm('정말삭제하시겠습니까?')){
    	$.ajax({
    		url : '${pageContext.request.contextPath}/admin/ItemManagement/deleteUppro.do',
    		type : 'post',
    		data : {'uppro_num':uppro_num},
    		success : function(data){
    			location.reload();
    		}

    	});
    	}
    }
    
    //하위직종 LIST출력 
    $(function (){
    	$('#UpProTBY tr').click(function(){
    	
    		var uppro_num = $(this).find('td:eq(0) input').val();
    		
    		var params = {'uppro_num':uppro_num};
    		$.ajax({
    			url:'${pageContext.request.contextPath}/admin/ItemManagement/lowProList.do'
    		   ,data : params
    		   ,type : 'post'
    		   ,dataType : "json"   		
    		   ,success : function(result){
    			var list = result.lowPROList;
    			$(".lowPROList").empty();
    			
    			var a = '';	  
	    			for(var i=0;i<list.length;i++){
		    			 a+='<tr class="odd gradeX">';
		                 a+='<td><input id="upProInsert" class="upProClick'+result.lowPROList[i].uppro_num+'" type="hidden" value='
		                 										+result.lowPROList[i].uppro_num+'>'+result.lowPROList[i].rnum+'</td>';
		                 a+='<td>'+result.lowPROList[i].lowpro_name+'</td>';
		               if("${LOGIN_ADMININFO.admin_id}" != ""){
		                 a+='<td><a style="color:red" onclick="lowPRODelete('+result.lowPROList[i].lowpro_num+');">[삭제]</td>';
		                }
		                 a+='</tr>';
		                 
	    			}
                $(".lowPROList").append(a);
    		   }
    		})
    	});	
    });
    
  
    //하위직종 입력 폼 데이터 가져오기
     $('[name=lowProInsertForm]').click(function(){
    	    var uppro_num = $('#upProInsert').val();
        	var insertData = {'lowpro_name' : $("input[name=lowProTxt]").val(),'uppro_num' : uppro_num};
        	LowproInsert(insertData);
    });
    
  
    //추가
     function LowproInsert(insertData){
    	   var uppro_num = $('#upProInsert').val();
     	$.ajax({
    			url:'${pageContext.request.contextPath}/admin/ItemManagement/insertLowPro.do', 		
     		type: 'post',
     		data: insertData,
     		success : function(data){
     			 alert("추가가 완료되었습니다.");
     		  $('#upProClick'+uppro_num+'').trigger("click");
				console.log('#upProClick'+uppro_num+'');
				$('[name=lowProTxt]').val('');
				
     		}
     		
    
     	});
     }
    
    //삭제 
    function lowPRODelete(lowpro_num){
    	if(confirm('정말삭제하시겠습니까?')){
    	  var uppro_num = $('#upProInsert').val();
    	$.ajax({
    		url: '${pageContext.request.contextPath}/admin/ItemManagement/deleteLowPro.do',
    		type: 'post',
    		data : {'lowpro_num':lowpro_num},
    		success: function(data){
    		
    			  $('#upProClick'+uppro_num+'').trigger("click");
    		}
    		
    	});
    	}
    	
    }
    
    
    
    
    
    </script>
</body>
</html>