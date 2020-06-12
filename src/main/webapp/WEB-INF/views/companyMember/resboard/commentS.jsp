<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

var freeboard_num = '${freeboardInfo.freeboard_num}'; //게시글 번호 

$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = {'indvdl_id' : '${LOGIN_INDVDLMEMINFO.indvdl_id}', 'freeboard_group' : '${freeboardInfo.freeboard_group }', 'freeboard_sj' : '댓글','freeboard_sn' : '${freeboardInfo.freeboard_sn }', 'freeboard_depth' : '${freeboardInfo.freeboard_depth }', 'freeboard_num' : '${freeboardInfo.freeboard_num }','freeboard_cn' :$("input[name=content]").val()}; //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});


//list출력
function commentList(){
	var id='${LOGIN_INDVDLMEMINFO.indvdl_id}';
	
	
	var params =  {'freeboard_group' : '${freeboardInfo.freeboard_group}'};
	 $.ajax({
	        url : '${pageContext.request.contextPath}/freeboard/commentlist.do'
	        ,data : params
	        ,type:'post'
			    ,dataType : "json"
	        ,success : function(result){
	        	 $('.commentList').empty();
	            var a =''; 
	            $.each(result, function(key, value){ 
	            	
	                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px; margin-left: '+value.freeboard_depth*20+'px;">';
	                a += '<div class="commentInfo'+value.freeboard_num+'">'+'댓글번호 : '+value.rnum+' / 작성자 : '+value.indvdl_id;
	                a += '<a  onclick="commentUpdate('+value.freeboard_num+',\''+value.freeboard_cn+'\',\''+value.indvdl_id+'\');"> 수정 </a>';
	                a += '<a  onclick="commentDelete('+value.freeboard_num+',\''+value.indvdl_id+'\');"> 삭제 </a> ';
	                a += '<a onclick="commentReplyInsert('+value.freeboard_num+',\''+value.freeboard_depth+'\',\''+value.freeboard_sn+'\');"> 답글 </a> </div>';
	                a += '<div class="commentContent'+value.freeboard_num+'"> <p> 내용 : '+value.freeboard_cn +'</p>';
	                a += '</div></div>';
	                a += '<div class="commentReplyContent'+value.freeboard_num+'"></div>'	               
	            });
	            
	            $(".commentList").append(a);
	        }
	    });
}

//댓글 등록
function commentInsert(insertData){
	if( $('[name=content]').val()==''){
		alert('내용이 비어있습니다. ')
	}
    $.ajax({
        url : '${pageContext.request.contextPath}/freeboard/insertFreeboardReply.do',
        type : 'post',
        data : insertData,
        success : function(data){
                commentList(); 
                $('[name=content]').val('');
            
        }
    });
}



//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(freeboard_num, freeboard_cn,indvdl_id){
	if('${LOGIN_INDVDLMEMINFO.indvdl_id}' != indvdl_id){
		alert('권한이 없습니다.');
		return false;
	}
    var a ='';
    a += '<div><a onclick=" commentList();"> 취소 </a></div>';
    a += '<div class="input-group">';   
    a += '<input type="text" class="form-control" name="content_'+freeboard_num+'" value="'+freeboard_cn+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+freeboard_num+');">수정</button> </span>';
    a += '</div>';
    $('.commentContent'+freeboard_num).html(a);
}

//대댓글 등록 - input폼을 추가 
function commentReplyInsert(freeboard_num,freeboard_depth,freeboard_sn){
	 var a ='';
	    a += '<div><a onclick=" commentList();"> 취소 </a></div>';
	    a += '<div class="input-group">';
	    a += '<input type="text" class="form-control" placeholder="내용을 입력하세요." name="content_'+freeboard_num+'"/>';
	    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentReplyReplyInsert('+freeboard_depth+',\''+freeboard_num+'\',\''+freeboard_sn+'\');">등록</button> </span>';
	    a += '</div>';
	    $('.commentReplyContent'+freeboard_num).html(a);

}

//대댓글 등록
function commentReplyReplyInsert(freeboard_depth,freeboard_num,freeboard_sn){
	var freeboard_cn = $("input[name='content_"+freeboard_num+"']").val();
	 var insertData = {'indvdl_id' : '${LOGIN_INDVDLMEMINFO.indvdl_id}', 'freeboard_group' : '${freeboardInfo.freeboard_group }', 'freeboard_sj' : '댓글','freeboard_sn' : freeboard_sn, 'freeboard_depth' : freeboard_depth,'freeboard_cn' :freeboard_cn, 'freeboard_num' : '${freeboardInfo.freeboard_num }'};
	$.ajax({		 
	        url : '${pageContext.request.contextPath}/freeboard/insertFreeboardReply.do',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	                commentList(); 
	                $('[name=content]').val('');
	            
	        }
	    });
	
	
	
	
}


//댓글 수정
function commentUpdateProc(freeboard_num){
    var updateContent = $('[name=content_'+freeboard_num+']').val();
    $.ajax({
        url : '${pageContext.request.contextPath}/freeboard/updateFreeboardComment.do',
        type : 'post',
        data : {'freeboard_cn' : updateContent, 'freeboard_num' : freeboard_num},
        success : function(data){
             commentList(freeboard_num); //댓글 수정후 목록 출력 
        }
    });
}

//댓글 삭제 
function commentDelete(freeboard_num,indvdl_id){
	if('${LOGIN_INDVDLMEMINFO.indvdl_id}' != indvdl_id){
		alert('권한이 없습니다.');
		return false;
	}	
	$.ajax({
		url : '${pageContext.request.contextPath}/freeboard/deleteFreeboardComment.do',
	    type: 'post',
	    data: {'freeboard_num': freeboard_num},
	    success : function(data){
	    	commentList(freeboard_num);//댓글 삭제후 목록 출력 
	    }	
	});
}

$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});










</script>