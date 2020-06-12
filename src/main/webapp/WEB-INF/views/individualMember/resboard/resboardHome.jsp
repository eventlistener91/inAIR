<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<title>Bootstrap Example</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
  $(function(){
	  
	$('#resboardListTBY tr').click(function(){
		var res_num = $(this).find('td:eq(0) input').val();
		var rnum = $(this).find('td:eq(0)').text();
		var search_keyword = "${search_keyword}";
		var search_keycode = "${search_keycode}";
		var res_group = $(this).find('td:eq(1) input').val();
		location.href='/resboard/indvdlResboardView.do?res_num='+res_num+'&rnum='+rnum
											+'&search_keyword='+search_keyword+'&search_keycode='+search_keycode+'&res_group='+res_group;
	});
	
	$('#btnform').click(function(){
		$(location).attr('href','/resboard/resboardForm.do');
		
	});
	
  });
</script>
<style>
	.center {
	  text-align: center;
	}
	
	.pagination {
	  display: inline-block;
	}
	
	.pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	  transition: background-color .3s;
	  border: 1px solid #ddd;
	  margin: 0 4px;
	}
	
	.pagination a.active {
	  background-color: #4d96fe;
	  color: white;
	  border: 1px solid #4d96fe;
	}
	
	.pagination a:hover:not(.active) {background-color: #4d96fe;}
	
</style>

</head>
<body>
	  <h2>자료실</h2>
	  <table class="table table-hover">
		   <thead>
		      <tr>
		      	<th>NO</th>
		        <th>제목</th>
		        <th>회사명</th>
		        <th>작성일</th>
		        <th>조회수</th>
		      </tr>
		    </thead>
		    <tbody id="resboardListTBY">
			      <c:if test="${empty resboardList}">
				      <tr>
				      	   <td colspan="5" align="center"><font color="red">등록된 게시글이 없습니다. </font></td>
				      </tr>
			      </c:if> 
		      <c:if test="${!empty resboardList}">
			    <c:forEach items="${resboardList}" var="resboardInfo">
			    	<c:if test="${resboardInfo.res_depth < 1}">
				      <tr>
				      	<td><input type="hidden" value="${resboardInfo.res_num}"/>${resboardInfo.rnum}</td>
				        <td><input type="hidden" value="${resboardInfo.res_group}"/>${resboardInfo.res_sj}</td>
				        <td>${resboardInfo.com_id}</td>
				        <td>${resboardInfo.res_rgsde.substring(0,10)}</td>
				        <td>${resboardInfo.res_hit}</td>
				      </tr>
			       </c:if>
			    </c:forEach>
			 </c:if>
		  </tbody>
	  </table>
	</div>
	<div>
	   <div>
		${paginationHTML}
		</div>
		  	<form name="searchForm" action="/freeboard/freeboardHome.do" method="post" class="search-job" style="margin-left: 30%;margin-top: 5%">
				 <div class="row no-gutters">
				 <div class="col-md mr-md-2">
				 		<div class="form-group">
				 			<div class="form-field">
			  	 				<div class="select-wrap">
			                  		 <div class="icon"><span class="ion-ios-arrow-down"></span></div>
				 	                      <select name="search_keycode" id="search_keycode" class="form-control">
				 	                      	<option value="">검색조건</option>
				 	                      	<option value="TOTAL">전체</option>
				 	                      	<option value="SJ">제목</option>
				 	                        <option value="CN">내용</option>
				 	                        <option value="ID">작성자</option>
				 	                      </select>
			                		</div>
				               </div>
			              </div>
				 	</div>
				 	<div class="col-md mr-md-2">
				 		<div class="form-group">
			  	 			<div class="form-field">
			  	 				<div class="icon"><span class="icon-briefcase"></span></div>
				                 <input id="search_keyword" name="search_keyword" type="text" class="form-control" placeholder="입력" >
				               </div>
			               </div>
				 	</div>
				 	
				 	<div class="col-md">
				 		<div class="form-group">
				 			<div class="form-field">
			                 	<button type="submit" class="form-control btn btn-primary" style="width: 130px;">Search</button>
				             </div>
			            </div>
				 	</div>
				 </div>
			</form>
	

</body>
</html>