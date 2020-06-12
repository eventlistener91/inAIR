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
.insertDIV{
	margin-left:87%;
	width:70%;

}
</style>
<script type="text/javascript">
	$(function(){
		$('#btnform').click(function(){
			if('${LOGIN_ADMININFO.admin_id}'==''){
				alert('권한이 없습니다.');
				return false;
			}else{
				$(location).attr('href','/admin/noticeboard/adminNoticeboardForm.do');
				return true;
			}
		
			
		});
		
		$('#nboardListTBY tr').click(function(){
			var notice_num = $(this).find('td:eq(0) input').val();
			var rnum = $(this).find('td:eq(0)').text();
			var search_keycode = "${search_keycode}";
			var search_keyword = "${search_keyword}";
			location.href='/admin/noticeboard/noticeboardView.do?notice_num='+notice_num+'&rnum='+rnum
																+'&search_keyword='+search_keyword+'&search_keycode='+search_keycode;
			

		});
		
		$('form[name=searchKindForm]').submit(function(){
			var str ="${search_group}";
			var search_group =str.replace(',','');
		
			 location.href='/admin/noticeboard/adminNoticeboardHome.do?search_group='+search_group;
		});
		$('form[name=searchForm]').submit(function(){
			var str ="${search_group}";
			var search_group =str.replace(',','');
		
			 location.href='/admin/noticeboard/adminNoticeboardHome.do?search_group='+search_group;
		});
		
		
		
		
		
	});
</script>
</head>
<body>
  <div id="content">
	    <div id="content-header">
		     <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>회원관리</a> <a href="#" class="current">개인회원관리</a>
		     </div>
		     <h1>공지사항 관리</h1>
		    
			<div class="insertDIV">
			    <form name="searchForm">
		     	 <select style=" width:10%" name="search_group" id="search_group" onchange="myFunction()">
			            <option value="">회원검색</option>
			            <option value="전체회원">전체회원</option>
			            <option value="개인회원">개인회원</option>
			            <option value="기업회원">기업회원</option>
			    </select>
			 </form>
	 	    </div>
	    </div>
        <div class="widget-box">
	          <div class="widget-title"> <span class="icon"> <i class="icon-th"></i> </span>
	            <h5>공지사항</h5>
	          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered table-striped">
	              <thead>
		                <tr>
			                <th style="width:3%">NO</th>
			                <th style="width:10%">그룹</th>
			                <th style="width:10%">종류</th>
			                <th style="width:20%">작성일</th>
			                <th>제목</th>
		                </tr>
	              </thead>
	              <tbody id="nboardListTBY">
		              	<c:if test="${empty noticeboardList }">
		              		<tr class="odd gradeX">
		              			<td>
		              				 <td colspan="5" align="center"><font color="red">등록된 게시글이 없습니다. </font></td>
		              			</td>
		              		</tr>
		              	</c:if>
		              <c:if test="${!empty noticeboardList}">
		              		<c:forEach items="${noticeboardList}" var="noticeboardInfo">	              		
					              	 <tr class="odd gradeX">
						                 <td><input type="hidden" value="${noticeboardInfo.notice_num}"/>${noticeboardInfo.rnum}</td>
						                 <td>${noticeboardInfo.notice_group}</td>
						                 <td>${noticeboardInfo.notice_kind}</td>
						                 <td>${noticeboardInfo.notice_rgsde}</td>
						                 <td>${noticeboardInfo.notice_sj}</td>
					               	 </tr>
			               	 </c:forEach>
		               	</c:if>
	              </tbody>
            </table>
        </div><!-- end widget-content nopadding -->
      	<div>
			${paginationHTML}
	  	</div>	 
	  	<form name="searchKindForm" action="" method="post" style="border-bottom: 1px solid #CDCDCD;">
		 	 <div style="width:40%;margin-left:75%;margin-top:1%">
			            <select style=" width:20%; margin-bottom: 0px;" name="search_keycode" id="search_keycode">
			               	<option value="">종류검색</option>
			               	<option value="TOTAL">전체</option>
			               	<option value="공지">공지</option>
			               	<option value="안내">안내</option>
			               	<option value="기타">기타</option>
			            </select>
				  <input type="text" id="search_keyword" name="search_keyword" placeholder="Search here..."/>
				  <button type="submit" class="btn btn-info">search</button>
			 </div>
	    </form>
     </div><!-- end widget-box -->
     <c:if test="${!empty LOGIN_ADMININFO.admin_id }">
  		<button type="button" id="btnform" class="btn btn-info" style="margin-left:91%">등록하기</button>
	</c:if>
</div><!-- end content -->
<script type="text/javascript">
function myFunction() {
	  var search_group = document.getElementById("search_group").value;
	  location.href='/admin/noticeboard/adminNoticeboardHome.do?search_group='+search_group;

	}
</script>
</body>
</html>