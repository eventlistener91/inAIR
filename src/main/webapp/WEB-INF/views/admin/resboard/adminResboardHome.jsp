<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.widget-box{
	width:90%;
	margin-left:5%;
}
</style>
<script type="text/javascript">
	$(function(){
		$('#rboardListTBY tr').click(function(){
			var res_num = $(this).find('td:eq(0) input').val();
			var rnum = $(this).find('td:eq(0)').text();
			var search_keyword = "${search_keyword}";
			var search_keycode = "${search_keycode}";
			var res_group = $(this).find('td:eq(1) input').val();
			location.href='/admin/resboard/resboardView.do?res_num='+res_num+'&rnum='+rnum
												+'&search_keyword='+search_keyword+'&search_keycode='+search_keycode+'&res_group='+res_group;
		});
		

	});
</script>
</head>
<body>

  <div id="content">
	    <div id="content-header">
		     <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>회원관리</a> <a href="#" class="current">개인회원관리</a>
		     </div>
		     <h1>자료실 </h1>
	    </div>
        <div class="widget-box">
	          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
	            <h5>자료실게시판</h5>
	          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
	              <thead>
		                <tr>
			                <th style="width:3%">NO</th>
			                <th style="width:10%">작성일</th>
			                <th style="width:10%">작성자</th>
			                <th style="width:60%">제목</th>

		                </tr>
	              </thead>
	              <tbody id="rboardListTBY">
		              	<c:if test="${empty resboardList}">
		              		<tr class="odd gradeX">
		              			<td>
		              				 <td colspan="5" align="center"><font color="red">등록된 게시글이 없습니다. </font></td>
		              			</td>
		              		</tr>
		              	</c:if>
		              <c:if test="${!empty resboardList}">
		              		<c:forEach items="${resboardList}" var="resboardInfo">
		              			<c:if test="${resboardInfo.res_depth<1}">
					              	 <tr class="odd gradeX">
						                 <td><input type="hidden" value="${resboardInfo.res_num}"/>${resboardInfo.rnum}</td>
						                 <td><input type="hidden" value="${resboardInfo.res_group}"/>${resboardInfo.res_rgsde.substring(0,10)}</td>
						                 <c:if test="${resboardInfo.indvdl_id != null}">
						                 <td style="color:blue">${resboardInfo.indvdl_id}(개인회원)</td>
						                 </c:if>
						                 <c:if test="${resboardInfo.indvdl_id == null}">
						                  <td style="color:green">${resboardInfo.com_id}(기업회원)</td>
						                 </c:if>
						                 <td>${resboardInfo.res_sj}</td>

					               	 </tr>
				               	 </c:if>
			               	 </c:forEach>
		               	</c:if>
	              </tbody>
            </table>
        </div><!-- end widget-content nopadding -->
      	<div>
			${paginationHTML}
	  	</div>	 
	  	<form name="searchForm" action="/admin/resboard/adminResboardHome.do" method="post" style="border-bottom: 1px solid #CDCDCD;">
	 	<div style="width:40%;margin-left:75%;margin-top:1%">
		            <select style=" width:20%; margin-bottom: 0px;" name="search_keycode" id="search_keycode">
		               	<option value="">검색조건</option>
		               	<option value="TOTAL">전체</option>
		               	<option value="SJ">제목</option>
		               	<option value="CN">내용</option>
		               	<option value="ID">작성자</option>
		            </select>
			  <input type="search_keyword" name="search_keyword" placeholder="Search here..."/>
			  <button type="submit" class="btn btn-info">search</button>
		</div>
	</form>
	 </div><!-- end widget-box -->
  </div><!-- end content -->
</body>
</html>