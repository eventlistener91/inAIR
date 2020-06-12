<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.container-fluid{
	margin-left:25%;
	width:100%

}

.noresize {
  resize: none; /* 사용자 임의 변경 불가 */
 
}
.cke_bottom
    {
        display: none !important;
    }
</style>

<script src="//cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	CKEDITOR.replace('editor');
	
	 var notice_kind = "${noticeTotalInfo.notice_kind}";
	 var notice_group = "${noticeTotalInfo.notice_group}";
	
	 
	$("#kind_select").val(notice_kind).attr('selected','selected');
	$("#group_select").val(notice_group).attr('selected','selected');
	
	
	CKEDITOR.instances.editor.setData('${noticeTotalInfo.notice_cn}');
	
	$('form[name=updateNoticeboard]').submit(function(){
		var notice_cn = CKEDITOR.instances.editor.getData().replace(/\n/g, "");
		
		$(this).append('<input type="hidden" name="notice_cn" value="'+notice_cn+'"/>');
		$(this).attr('action','/admin/noticeboard/noticeUpdate.do');

	});
	$('#listBTN').click(function(){
		if(confirm('목록으로 가시겠습니까?')){
			location.href = '/admin/noticeboard/adminNoticeboardHome.do';
			return true;
		}
	})
	

});
</script>
</head>
<body>
 <div id="content">
	<div id="content-header">
		<div class="container-fluid">
		    <div class="row-fluid">
		     	 <div class="span6">
		       		 <div class="widget-box">
		       		 
		         		 <div class="widget-title"> <span class="icon"> <i class="icon-align-justify"></i> </span>
		            		<h5>공지사항 등록</h5>
		         		 </div><!-- end  widget-title-->
		         		 
					          <div class="widget-content nopadding">
						            <form name="updateNoticeboard" action="" method="post" enctype="multipart/form-data" class="form-horizontal">
							              <div class="control-group">
							                <label class="control-label">아이디 :</label>
								                <div class="controls">
								                 	<label class="control-label">${noticeTotalInfo.admin_id}</label>
								                </div>
							              </div>
							              <div class="control-group">
							                <label class="control-label">제목 :</label>
								                <div class="controls">
								                 	 <input type="text" id="notice_sj" name="notice_sj" class="span11" placeholder="제목" value="${noticeTotalInfo.notice_sj }"/>
								               		 <input type="hidden" id="admin_id" name="admin_id" value="${noticeTotalInfo.admin_id}"/>
								               		 <input type="hidden" id="notice_num" name="notice_num" value="${noticeTotalInfo.notice_num}"/>
								                </div>
							              </div>
							                <div class="control-group">
								                <label class="control-label">그룹</label>
								                <div class="controls">
								                  <select id="group_select" name="group_select">
								                    <option value="">선택하세요</option>
								                    <option value="개인회원">개인회원</option>
								                    <option value="전체회원">전체회원</option>
								                    <option value="기업회원">기업회원</option>
								                  </select>
								                </div>
								              </div>
							                <div class="control-group">
								                <label class="control-label">종류</label>
								                <div class="controls">
								                  <select id="kind_select" name="kind_select">
								                    <option value="">선택하세요</option>
								                    <option value="공지">공지</option>
								                    <option value="안내">안내</option>
								                    <option value="기타">기타</option>
								                  </select>
								                </div>
								              </div>
							              <div class="control-group">
							                <label class="control-label" style="margin-left:30%">내용</label>
		
							              </div>
							              <div class="control-group">	
										           <textarea name="editor"></textarea>										      
							              </div>
							              <div class="form-actions">
							              		<button type="button"class="btn btn-info" id="listBTN">목록</button>
							                	<button type="submit" class="btn btn-success" style="margin-left:90%">수정</button>
							              </div>
						            </form>
					          </div><!-- end widget-content nopadding -->
		        		</div><!-- end  widget-box-->
		     		</div><!-- end span6 -->
		   		 </div><!-- end row-fluid -->
		    </div><!-- end  container-fluid-->
  	   </div><!-- end content-header -->
    </div><!-- end content-->
    
</body>
</html>