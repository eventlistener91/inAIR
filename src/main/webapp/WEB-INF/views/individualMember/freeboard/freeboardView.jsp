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
</style>
<script type="text/javascript">
	$(function(){
		$('#freeboard_cn').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
	        
		});
		$('#freeboard_cn').summernote('code','${freeboardInfo.freeboard_cn}');
		
		$('#freeboard_cn').summernote('destroy');
		$('form[name=updateForm]').submit(function(){
			 var freeboard_cn = "${freeboardInfo.freeboard_cn}";
			 $(this).append('<input type="hidden" name="freeboard_cn" value="'+freeboard_cn+'"/>');
			 $(this).attr('action','/freeboard/freeboardUpdateForm.do');
			 
			 return true;
		});
		
		$('#deleteBTN').click(function(){
			if(confirm('정말 삭제하시겠습니까?')){
			location.href = '/freeboard/deleteFreeboard.do?freeboard_num='+${freeboardInfo.freeboard_num};
			   return true;
			}
		});
		
		$('#listBTN').click(function(){
			var search_keyword = "${search_keyword}";
	        var search_keycode = "${search_keycode}";
			location.href='/freeboard/freeboardHome.do?search_keyword='+search_keyword+'&search_keycode=' + search_keycode;
		});
		
		
		$('#fboardComTBY tr').click(function(){
			$("#comment").toggle();
			var $freeboard_group = $(this).find('td:eq(0) input').val();
			var indvdl_id = "${LOGIN_INDVDLMEMINFO.indvdl_id}";
			var freeboard_sn = $(this).find('td:eq(1) input').val();
			var freeboard_depth =  $(this).find('td:eq(2) input').val();
			var freeboard_num =  $(this).find('td:eq(3) input').val();
		});
		
		
		
	});
</script>
</head>
<body>

<form name="updateForm" action="/freeboard/freeboardUpdateForm.do" method="post">
	   <div class="comment-form-wrap pt-5" >
	           <h3 class="mb-5">게시물 </h3>           
	             <table>
		             <tr>
			              <td width="10%"><label for="name">아이디:</label></td>
			              <td><div>${freeboardInfo.indvdl_id}</div></td>
			              <input type="hidden" id="indvdl_id" name="indvdl_id" value="${freeboardInfo.indvdl_id}">
			              <input type="hidden" id="freeboard_num" name="freeboard_num" value="${freeboardInfo.freeboard_num}">
			              <input type="hidden" id="rnum" name="rnum" value="${freeboardInfo.rnum}">    
		             </tr>
	             </table>
	             
	             <table>
		             <tr>
			              <td width="10%"><label for="name">제목:</label></td>
		              <input type="hidden" id="freeboard_sj" name="freeboard_sj" value="${freeboardInfo.freeboard_sj}">
		              <td><div>${freeboardInfo.freeboard_sj}</div></td>
	             </tr>
              </table>
              
             <table>
	             <tr>
		              <td width="10%"><label for="name">첨부파일:</label></td>
		              <c:forEach items="${freeboardInfo.items}" var="fileitem" varStatus="stat">
		              <td><input type="button" id="file01" name="files" value="${fileitem.free_file_name}"
		              		onclick="javascript:location.href='/freeboard/freeboardDownload.do?fileSaveName=${fileitem.free_file_savename}&fileName=${fileitem.free_file_name }';"></td>
		              </c:forEach>
	             </tr>
              </table>
              
              <div class="form-group">
	                <label for="message">내용</label>
	                <div id="freeboard_cn"></div>
              </div>
              
              <div class="form-group" style="margin-left:80%">           
              	<c:if test="${LOGIN_INDVDLMEMINFO.indvdl_id eq freeboardInfo.indvdl_id}">
	               <button type="button" id="deleteBTN" class="btn btn-primary py-2">삭제</button>
	               <button type="submit" id="updateBTN" class="btn btn-primary py-2">수정</button>
	               <button type="button" id="listBTN" class="btn btn-primary py-2">목록</button>       
             	</c:if>  
             	<c:if test="${LOGIN_INDVDLMEMINFO.indvdl_id ne freeboardInfo.indvdl_id}">
             	  <button type="button" id="listBTN" style="margin-left:70%" class="btn btn-primary py-2">목록</button> 
            	</c:if> 
             </div>
        </div>
    </form>
		 <div id ="listReply" ></div>    
	        <div class="container" >
	       
		        <label for="content">comment</label>
			        <form name="commentInsertForm">
			            <div class="input-group">
			               <input type="hidden" name="freeboard_num" value="${freeboardInfo.freeboard_num}"/>
			               <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요.">
			               <span class="input-group-btn">
			                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
			               </span>
			            </div>
			        </form>
			
	        </div>
    <div class="container" style="width:100% ">
        <div class="commentList"></div>
    </div>
    <!-- 추가 -->
	<%@ include file="commentS.jsp" %>
  </div>

</body>
</body>
</html>