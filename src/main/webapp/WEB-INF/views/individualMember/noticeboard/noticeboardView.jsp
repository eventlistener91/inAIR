<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table {
	  border-collapse: collapse;
	  width: 100%;
	}
	
	th, td {
	  padding: 8px;
	  text-align: left;
	  border-bottom: 1px solid #ddd;
	}
	
	tr:nth-child(even) {background-color: #f2f2f2;}
	
	.cke_top
    {
        display: none !important;
    }
    
    .cke_bottom
    {
        display: none !important;
    }
	
    
</style>

<script type="text/javascript">
$(document).ready(function() {
	
	
	  
	$('#listBTN').click(function(){
		if(confirm('목록으로 돌아가시겠습니까?')){
			var search_keyword = "${search_keyword}";
	        var search_keycode = "${search_keycode}";
			location.href='/noticeboard/noticeHome.do?search_keyword='+search_keyword+'&search_keycode=' + search_keycode;
		}		
	});
	
	
});
	
</script>
</head>
<body>
	<div>
	   <form>
	     <div class="comment-form-wrap pt-5">
	           <h3 class="mb-5">게시물 </h3>           
	             <table>
		             <tr>
			              <td width="10%"><label for="name">제목:</label></td>
			              <input type="hidden" id="notice_sj" name="notice_sj" value="${noticeTotalInfo.notice_sj}">
			              <td><div>${noticeTotalInfo.notice_sj}</div></td>
		             </tr>
	              </table>
	              <div id="content" class="form-group" style="margin-left:10px">
		                <label for="message">내용</label>
		                <span class="help-block">${noticeTotalInfo.notice_cn}</span>
	              </div>     
	              <div class="form-group" style="margin-left: 90%">             
		               <button type="button" id="listBTN" class="btn btn-primary py-2">목록</button>       
	             </div>
	        </div>
	    </form>
	</div>
</body>
</html>