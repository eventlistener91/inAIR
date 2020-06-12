<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.top-category text-center:hover{
	border: 1px solid red; 

}
</style>
<script type="text/javascript">
 	$(function() {
		
 		$('#btnform').click(function(){
 			$(location).attr('href','/mentorboard/mentorboardForm.do');
 		});
	});
</script>
</head>
<body>
		<div class="row">
				<div class="col-lg-12 pr-lg-4">
					<div class="row justify-content-center pb-3">
         				<div class="col-md-12 heading-section ftco-animate">
	           				<h2 class="mb-4">멘토/멘티 게시판</h2>
         				</div>
	       			</div>
					<div class="row">
						<c:forEach items="${mentorList}" var="mentorInfo">
							<div class="col-md-12 ftco-animate" id="mentorTable" onclick="mentorView(${mentorInfo.mentor_num},${mentorInfo.mentor_group});" style="cursor: ">
						            <div class="job-post-item p-4 d-block d-lg-flex align-items-center">
							              <div class="one-third mb-4 mb-md-0" style="margin-right:5%;">          
								                <div class="job-post-item-header align-items-center">
									                 <span class="subadge"><input type="hidden" name="mentor_mentor_group" value="${mentorInfo.mentor_group}"/>작성일 : ${mentorInfo.mentor_rgsde}</span>
									                 <h2 class="mr-3 text-black"><input type="hidden" name="mentor_mentor_num" value="${mentorInfo.mentor_num}"/>${mentorInfo.mentor_sj}</a></h2>
								                </div>
								                <div class="job-post-item-body d-block d-md-flex" style="font-size: 17px">
									                    <div class="mr-3"><span class="icon-layers"></span>답변수:${mentorInfo.mentor_comment}</div>
						                  				<div class="mr-3"><span class="icon-my_location"></span>조회수:${mentorInfo.mentor_hit}</div>
								                </div>
							              </div>
					              	 </div>
					            </div>
	          			</c:forEach>
	        		</div>
	      		</div>
			</div>
		</div>

	
	<c:if test="${!empty LOGIN_INDVDLMEMINFO.indvdl_id}">
		<button type="button" id="btnform" class="btn btn-primary py-2" style="margin-left: 90%">게시글 등록</button>
	</c:if>	  
	<div>
	 ${paginationHTML}
	</div>
	
	<div>
		  	<form name="searchForm" action="/mentorboard/mentorboardHome.do" method="post" class="search-job" style="margin-left: 30%;margin-top: 5%">
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
	</div>
	
      <section style="margin-top:10%">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-12">
    				<div class="category-wrap">
    					<div class="row no-gutters">
    						<div class="col-md-2">
    							<div class="top-category text-center no-border-left" style="background-color:#206dfb;margin-right:5%;height:100%">
    								<h3 ><a href="#" style="color:white">인기질문</a></h3>
    								<p style="color:white">지금 가장 관심받는 커리어 질문은?</p>
    							</div>
    						</div>
    						<div class="col-md-2">
    							<div class="top-category text-center"  style="margin-right:5%;height:100%;border: 1px solid #656af9;  border-radius: 5px;" onclick="mentorView(${popularityList[0].mentor_num},${popularityList[0].mentor_group});">
    								<p><span>${popularityList[0].indvdl_id}</span></p>
    								<h3><a href="#">${popularityList[0].mentor_sj}</a></h3>
    								<span class="flaticon-resume" style="font-size:40px;color:#656af9"></span>
    								<p><span class="number">${popularityList[0].mentor_rgsde.substring(0,10)}</span></p> 
    							</div>
    						</div>
    						<div class="col-md-2">
    							<div class="top-category text-center" style="margin-right:5%;height:100%;border: 1px solid #5191e4;  border-radius: 5px;" onclick="mentorView(${popularityList[1].mentor_num},${popularityList[1].mentor_group});">
    								<p><span>${popularityList[1].indvdl_id}</span></p>
    								<h3><a href="#">${popularityList[1].mentor_sj}</a></h3>
    								<span class="flaticon-team" style="font-size:40px;color:font-size:40px;color:#656af9"></span>
    								<p><span class="number">${popularityList[1].mentor_rgsde.substring(0,10)}</span></p> 	
    							</div>
    						</div>
    						<div class="col-md-2">
    							<div class="top-category text-center" style="margin-right:5%;height:100%;border: 1px solid #be70df;  border-radius: 5px;" onclick="mentorView(${popularityList[2].mentor_num},${popularityList[2].mentor_group});">
    								<p><span>${popularityList[2].indvdl_id}</span></p>
    								<h3><a href="#">${popularityList[2].mentor_sj}</a></h3>
    								<span class="flaticon-career" style="font-size:40px;color:#be70df"></span>
    								<p><span class="number">${popularityList[2].mentor_rgsde.substring(0,10)}</span></p> 	
    							</div>
    						</div>
    						<div class="col-md-2">
    							<div class="top-category text-center" style="margin-right:5%;height:100%;border: 1px solid #fdcd2f;  border-radius: 5px;" onclick="mentorView(${popularityList[3].mentor_num},${popularityList[3].mentor_group});">
    								<p><span>${popularityList[3].indvdl_id}</span></p>
    								<h3><a href="#">${popularityList[3].mentor_sj}</a></h3>
    								<span class="flaticon-employees" style="font-size:40px;color:#fdcd2f"></span>
    								<p><span class="number">${popularityList[3].mentor_rgsde.substring(0,10)}</span></p> 	
    							</div>
    						</div>
    						<div class="col-md-2">
    							<div class="top-category text-center" style="margin-right:5%;height:100%;border: 1px solid #7db8b4;  border-radius: 5px;" onclick="mentorView(${popularityList[4].mentor_num},${popularityList[4].mentor_group});">
    								<p><span>${popularityList[4].indvdl_id}</span></p>
    								<h3><a href="#">${popularityList[4].mentor_sj}</a></h3>
    								<span class="flaticon-visitor" style="font-size:40px;color:#7db8b4"></span>
    								<p><span class="number">${popularityList[4].mentor_rgsde.substring(0,10)}</span></p> 	
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>

 
</body>
<script type="text/javascript">
function mentorView(mentor_num,mentor_group) {


	var search_keyword = "${search_keyword}";
	var search_keycode = "${search_keycode}";
	var indvdl_id = "${LOGIN_INDVDLMEMINFO.indvdl_id}";
	
	
	location.href='/mentorboard/mentorboardView.do?mentor_num='+mentor_num
	+'&search_keyword='+search_keyword+'&search_keycode='+search_keycode+'&mentor_group='+mentor_group+'&indvdl_id='+indvdl_id;
}


</script>
</html>