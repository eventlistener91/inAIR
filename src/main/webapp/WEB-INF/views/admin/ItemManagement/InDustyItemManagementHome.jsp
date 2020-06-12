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
</script>
</head>
<body>
<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Tables</a> </div>
   <div style="display:flex;">
   <h1 style="margin-left:11%">상위업종</h1>
   <h1 style="margin-left:45%">하위업종</h1>
   </div>
    <div style="display:flex;">
  	<table style="width:50%;margin-left:10%">
		 <tr>
		 	<td>
			 	<div class="inDusty-box">
			 		 <div style="display:flex">
			 		 	<form  style="display:flex">
			 		 	  <c:if test="${!empty LOGIN_ADMININFO.admin_id}">
			 		 		 <input type="text" name="inDustyTxt">
			 		 		 <button type="submit" name="inDustyInsertForm" class="btn btn-info" style="height:30px;">추가</button>
						   </c:if>
						</form>   
					  </div>
			       
			          <div class="widget-content nopadding">
			            <table class="table table-bordered table-striped">
				              <thead>
				                <tr>
				                  <th style="width:5%">코드</th>
				                  <th>상위업종</th>
				                  <c:if test="${!empty LOGIN_ADMININFO.admin_id}">
				                  	<th style="width:10%">삭제</th>
				                   </c:if>
				                </tr>
				              </thead>
				              <tbody id="inDustyTBY">
				              	<c:if test="${empty UpIndustyList}">
				              		<tr class="odd gradeX">
				              			 <td colspan="2" align="center"><font color="red">등록된 게시글이 없습니다. </font></td>
				              		</tr>
				              	</c:if>
				              	<c:if test="${!empty UpIndustyList}">
				              		<c:forEach items="${UpIndustyList}" var="upIndustyInfo">
						                <tr class="odd gradeX">
						                  <td><input id="UpIndustryClick${upIndustyInfo.upinduty_num}" type="hidden" value="${upIndustyInfo.upinduty_num}">${upIndustyInfo.rnum}</td>
						                  <td>${upIndustyInfo.upinduty_name}</td>
						                  <c:if test="${!empty LOGIN_ADMININFO.admin_id}">
						                  	<td><a style="color:red" onclick="inDustyDelete(${upIndustyInfo.upinduty_num})">[삭제]</a></td>
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
			     	 <button type="button" name="lowProInsertForm" class="btn btn-info" style="height:30px;" >추가</button>
			      </c:if>	
			    </form>   
				   <div class="widget-content nopadding">
			            <table class="table table-bordered table-striped">
			              <thead>
			                <tr>
			                  <th>코드</th>
			                  <th>하위업종</th>
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
    $('[name=inDustyInsertForm]').click(function(){
    	var insertData = {'upinduty_name' : $("input[name=inDustyTxt]").val()};
    	InDustyInsert(insertData);
    });
  
    //추가
    function InDustyInsert(insertData){
    	$.ajax({
   			url:'${pageContext.request.contextPath}/admin/ItemManagement/insertIUpIndusty.do', 		
    		type: 'post',
    		data: insertData,
    		success : function(data){
    			$(".inDusty-box").show();
    		}

    	});
    }
    
    //삭제
    function inDustyDelete(upinduty_num){
    	if(confirm('정말삭제하시겠습니까?')){
    	$.ajax({
    		url : '${pageContext.request.contextPath}/admin/ItemManagement/DeleteUpIndusty.do',
    		type : 'post',
    		data : {'upinduty_num':upinduty_num},
    		success : function(data){
    			location.reload();
    		}

    	});
    	}
    }
    
    //하위직종 LIST출력 
    $(function (){
    	$('#inDustyTBY tr').click(function(){
    		var upinduty_num = $(this).find('td:eq(0) input').val();
    		
    		var params = {'upinduty_num':upinduty_num};
    		$.ajax({
    			url:'${pageContext.request.contextPath}/admin/ItemManagement/lowIndustList.do'
    		   ,data : params
    		   ,type : 'post'
    		   ,dataType : "json"   		
    		   ,success : function(result){
    			var list = result.lowIndustyList;
    			$(".lowPROList").empty();
    			
    			var a = '';	  
	    			for(var i=0;i<list.length;i++){
		    			 a+='<tr class="odd gradeX">';
		                 a+='<td><input id="upProInsert" type="hidden" value='+result.lowIndustyList[i].upinduty_num+'>'+result.lowIndustyList[i].rnum+'</td>';
		                 a+='<td>'+result.lowIndustyList[i].lwinduty_name+'</td>';
		                if("${LOGIN_ADMININFO.admin_id}" != ""){
		                 a+='<td><a style="color:red" onclick="lowPRODelete('+result.lowIndustyList[i].lwinduty_num+');">[삭제]</td>';
		                }
		                 a+='</tr>';
		                 
	    			}
                $(".lowPROList").append(a);
    		   }
    		})
    	});	
    });
    
  
    //하위직종 추가
     $('[name=lowProInsertForm]').click(function(){
    	    var upinduty_num = $('#upProInsert').val();
        	var insertData = {'lwinduty_name' : $("input[name=lowProTxt]").val(),'upinduty_num' : upinduty_num};
        	LowproInsert(insertData);
    });
    
  
    //추가
     function LowproInsert(insertData){
    	   var upinduty_num = $('#upProInsert').val();
     	$.ajax({
    			url:'${pageContext.request.contextPath}/admin/ItemManagement/insertLowInduty.do', 		
     		type: 'post',
     		data: insertData,
     		success : function(data){
     		 alert("추가가 완료되었습니다.");
     		 $('#UpIndustryClick'+upinduty_num+'').trigger("click");

     		}
     		
    
     	});
     }
    
    //삭제 
    function lowPRODelete(lwinduty_num){
    	if(confirm('정말삭제하시겠습니까?')){
    	  var upinduty_num = $('#upProInsert').val();
    	$.ajax({
    		url: '${pageContext.request.contextPath}/admin/ItemManagement/deletelwindusty.do',
    		type: 'post',
    		data : {'lwinduty_num':lwinduty_num},
    		success: function(data){
    			
    			 $('#UpIndustryClick'+upinduty_num+'').trigger("click");
    		}
    		
    	});
    	}
    	
    }
    
    
    
    
    
    </script>
</body>
</html>