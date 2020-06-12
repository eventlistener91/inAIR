<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
  $(function(){
	  
	  
	  
	  
	//테이블 클릭시 view로 이동
	$('#totalNboardList tr').click(function(){
		var notice_num = $(this).find('td:eq(0) input').val();
		var search_keyword = "${search_keyword}";
		var search_keycode = "${search_keycode}";
		location.href='/noticeboard/noticeboardTotalView.do?notice_num='+notice_num
													        +'&search_keyword='+search_keyword
													        +'&search_keycode='+search_keycode;
	});
	
  });

</script>
<style>
	body {font-family: Arial;}
	
	/* Style the tab */
	.tab {
	  overflow: hidden;
	  border: 1px solid #ccc;
	  background-color: #f1f1f1;
	
	}
	.notice{
	
	}
	table{
	margin-top: 30px;
	}
	
	/* Style the buttons inside the tab */
	.tab button {
	
	  background-color: inherit;
	  float: left;
	  border: none;
	  outline: none;
	  cursor: pointer;
	  padding: 14px 50px;
	  transition: 0.3s;
	  font-size: 17px;
	}
	
	.tablinks {
	  background-color: #555;
	  color: black;
	  float: left;
	  border: none;
	  outline: none;
	  cursor: pointer;
	  padding: 14px 16px;
	  font-size: 17px;
	  width: 33.3%;
	}
	
	/* Change background color of buttons on hover */
	.tab button:hover {
	  background-color: #ddd;
	}
	
	/* Create an active/current tablink class */
	.tab button.active {
	  background-color: #ccc;
	}
	
	/* Style the tab content */
	.tabcontent {
	  display: none;
	  padding: 6px 12px;
	  -webkit-animation: fadeEffect 1s;
	  animation: fadeEffect 1s;
	  
	
	}
	
	/* Fade in tabs */
	@-webkit-keyframes fadeEffect {
	  from {opacity: 0;}
	  to {opacity: 1;}
	}
	
	@keyframes fadeEffect {
	  from {opacity: 0;}
	  to {opacity: 1;}
	}
	
	table {
	  border-collapse: collapse;
	  width: 100%;
	}
	
	th, td {
	  padding: 8px;
	  text-align: left;
	  border-bottom: 1px solid #ddd;
	}
	
	
	tr:hover {background-color:#f5f5f5;}
</style>
</head>
<body>
<div style="margin-top: 5%">
	<h3 class="notice">공지사항</h3>
		<div class="tab">
			  <button class="tablinks" onclick="openCity(event, 'Total')" id="defaultOpen">전체</button>
			  <button id="indvdlBTN" class="tablinks" onclick="openCity(event, 'Individual');openIndvdl()">개인회원</button>
			  <button class="tablinks" onclick="openCity(event, 'Company');openCOM()">기업회원</button>
		</div>
<!-- 전체 공지사항 -->
    <div id="Total" class="tabcontent" > 
		 <table>
			  <tbody id="totalNboardList">
				  <c:if test="${empty noticeList}">
					  	<tr>
			  				<td colspan="5" align="center"><font color="red">등록된 게시글이 없습니다.</font></td>
			 		 	</tr>
				  </c:if>
				  <c:if test="${!empty noticeList}">
		 		 	<c:forEach items="${noticeList}" var="noticeInfo">
						  <tr>
				 			 <td><input type="hidden" value="${noticeInfo.notice_num}"/>${noticeInfo.notice_kind}</td>
				 		     <td>${noticeInfo.notice_sj }</td>
				 		     <td style="width:30%">${noticeInfo.notice_rgsde.substring(0,10) }</td>
				 		 </tr>
		  			</c:forEach>
		  		</c:if>
			  </tbody>
		</table>
		
		<div style="margin-top: 3%;">
		${paginationHTML}
		</div>
		
		<div>	
		  	<form name="searchForm" action="/noticeboard/noticeHome.do" method="post" class="search-job" style="width: 50%;margin-left: 60%;margin-top: 5%">
				<div class="row no-gutters">
					<div class="col-md mr-md-2">
						<div class="form-group">
			  				<div class="form-field">
			  					<div class="icon"><span class="icon-briefcase"></span></div>
				                   <input id="search_keyword" name="search_keyword" type="text" class="form-control" placeholder="입력" >
				                </div>
			                </div>
					    </div>
					 <div class="col-md mr-md-2">
						 <div class="form-group">
							 <div class="form-field">
			  					 <div class="select-wrap">
				                      <div class="icon"><span class="ion-ios-arrow-down"></span></div>
					                      <select name="search_keycode" id="search_keycode" class="form-control">
					                      	<option value="">검색조건</option>
					                      	<option value="TOTAL">전체</option>
					                      	<option value="공지">공지</option>
					                        <option value="안내">안내</option>
					                        <option value="기타">기타</option>
					                      </select>
				                    </div>
				             	 </div>
			              	</div>
						</div>
			  			<div class="col-md">
			  				<div class="form-group">
			  					<div class="form-field">
				                	<button type="submit" class="form-control btn btn-primary">Search</button>
					              </div>
				              </div>
			  			</div>
				</div>
		   </form>
	   </div><!-- end searchform -->
	</div><!-- end Total -->
	<!-- 개인회원 -->

	<div id="Individual" class="tabcontent">
		<div class="indvdlTable"></div>

	</div><!-- end Individual -->
	
	<!-- 기업회원 -->
	<div id="Company" class="tabcontent">
		<div class="COMTable"></div>
	</div><!-- end Company -->
	
</div>

<script>
	function openCity(evt, cityName) {
	  var i, tabcontent, tablinks;
	  
	  tabcontent = document.getElementsByClassName("tabcontent");
	  
	  for (i = 0; i < tabcontent.length; i++) {
	    tabcontent[i].style.display = "none";
	  }
	  
	  tablinks = document.getElementsByClassName("tablinks");
	  
	  for (i = 0; i < tablinks.length; i++) {
	    tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	  
	  document.getElementById(cityName).style.display = "block";
	  
	  evt.currentTarget.className += " active";
	}
	document.getElementById("defaultOpen").click();

//개인회원 공지사항
	function openIndvdl(searchkeycode,searchkeyword,currentPage) {
		var search_keyword = $("input[name='searchkeyword']").val();
		var search_keycode = $("select[name='searchkeycode']").val();
		var params = {'search_keycode' : search_keycode, 'search_keyword' : search_keyword};
			$.ajax({
					url:'${pageContext.request.contextPath}/noticeboard/idvdlList.do'
					,data:params
					,type:'post'
					,dataType:"json"
					,success : function(result) {
						console.log('currentPage',result.currentPage);
						var list = result.indvdlNoticeList;
						$('.indvdlTable').empty();
						var a = '';                                                                   
							a += '<table>';
							a += '<thead>';
							a += '</thead> ';
							a += '<tbody id="indvdlNboardList"> ';
						for(var i=0;i<list.length;i++){
							a += '<tr onclick="indvdlView('+result.indvdlNoticeList[i].notice_num+',\''+search_keycode+'\',\''+search_keyword+'\');">';   
							a += '<td><input type="hidden" value="'+result.indvdlNoticeList[i].notice_num+'"/>'+result.indvdlNoticeList[i].notice_kind+'</td>  ';                       
							a += '<td>'+result.indvdlNoticeList[i].notice_sj+'</td>  ';
							a += '<td style="width:30%">'+result.indvdlNoticeList[i].notice_rgsde+'</td>';
							a += '</tr> ';
						}
							a += '</tbody> ';
							a += '</table>';	
							a += '<div style="margin-top: 3%;" onclick="openIndvdl('+search_keycode+',\''+search_keyword+'\',\''+currentPage+'\');">'+result.paginationHTML+'</div>';                                                                                                                       
							a += '<div>';
							console.log('result.paginationHTML.currentPage',result.paginationHTML.currentPage);
							
							a += '<form name="searchForm"  method="post" class="search-job" style="width: 50%;margin-left: 60%;margin-top: 5%">';
							a += '<div class="row no-gutters">';
							a += '<div class="col-md mr-md-2">';
							a += '<div class="form-group">';
							a += '<div class="form-field">';
							a += '<div class="icon"><span class="icon-briefcase"></span></div>';
							a += '<input id="searchkeyword" name="searchkeyword" type="text" class="form-control" placeholder="입력" >';
							a += '</div>'; 
							a += '</div>';
							a += '</div>';
							a += '<div class="col-md mr-md-2">';
							a += '<div class="form-group">';
							a += '<div class="form-field">';
							a += '<div class="select-wrap">';
							a += '<div class="icon"><span class="ion-ios-arrow-down"></span></div>';
							a += '<select name="searchkeycode" id="searchkeycode" class="form-control">';
							a += '<option value="">검색조건</option>';
							a += '<option value="TOTAL">전체</option>';
							a += '<option value="공지">공지</option>';
							a += '<option value="안내">안내</option>';
							a += '<option value="기타">기타</option>';
							a += '</select>';
							a += '</div>';
							a += '</div>';
							a += '</div>';
							a += '</div>';
							a += '<div class="col-md">';
							a += '<div class="form-group">';
							a += '<div class="form-field">';
							a += '<button type="button" class="form-control btn btn-primary"  onclick="openIndvdl('+searchkeycode+',\''+searchkeyword+'\');">Search</button> ';
							a += '</div>';
							a += '</div>';
							a += '</div>';
							a += '</div>';
							a += '</form>';
							a += '</div>';	
						$(".indvdlTable").append(a);	
						
					}	
			});
	}
//기업회원 공지사항 
	function openCOM(COMSearch_keycode,COMSearch_keyword) {
		var search_keyword = $("input[name='COMSearch_keycode']").val();
		var search_keycode = $("select[name='COMSearch_keyword']").val();
	
		var params = {'search_keycode' : search_keycode, 'search_keyword' : search_keyword };
			$.ajax({
					url:'${pageContext.request.contextPath}/noticeboard/COMList.do'
					,data:params
					,type:'post'
					,dataType:"json"
					,success : function(result) {
						console.log('currentPage',result.currentPage);
						var list = result.COMNoticeList;
						$('.COMTable').empty();
						var a = '';                                                                   
							a += '<table>';
							a += '<thead>';
							a += '</thead> ';
							a += '<tbody id="COMNboardList"> ';
						for(var i=0;i<list.length;i++){
							a += '<tr onclick="COMView('+result.COMNoticeList[i].notice_num+',\''+search_keycode+'\',\''+search_keyword+'\')";>';   
							a += '<td>'+result.COMNoticeList[i].notice_kind+'</td>  ';                       
							a += '<td>'+result.COMNoticeList[i].notice_sj+'</td>  ';
							a += '<td style="width:30%">'+result.COMNoticeList[i].notice_rgsde+'</td>';
							a += '</tr> ';
						}
							a += '</tbody> ';
							a += '</table>';	
							a += '<div style="margin-top: 3%;">'+result.paginationHTML+'</div>';                                                                                                                       
							a += '<div>';
							
							a += '<form name="searchForm"  method="post" class="search-job" style="width: 50%;margin-left: 60%;margin-top: 5%">';
							a += '<div class="row no-gutters">';
							a += '<div class="col-md mr-md-2">';
							a += '<div class="form-group">';
							a += '<div class="form-field">';
							a += '<div class="icon"><span class="icon-briefcase"></span></div>';
							a += '<input id="COMSearch_keyword" name="COMSearch_keyword" type="text" class="form-control" placeholder="입력" >';
							a += '</div>'; 
							a += '</div>';
							a += '</div>';
							a += '<div class="col-md mr-md-2">';
							a += '<div class="form-group">';
							a += '<div class="form-field">';
							a += '<div class="select-wrap">';
							a += '<div class="icon"><span class="ion-ios-arrow-down"></span></div>';
							a += '<select name="COMSearch_keycode" id="COMSearch_keycode" class="form-control">';
							a += '<option value="">검색조건</option>';
							a += '<option value="TOTAL">전체</option>';
							a += '<option value="공지">공지</option>';
							a += '<option value="안내">안내</option>';
							a += '<option value="기타">기타</option>';
							a += '</select>';
							a += '</div>';
							a += '</div>';
							a += '</div>';
							a += '</div>';
							a += '<div class="col-md">';
							a += '<div class="form-group">';
							a += '<div class="form-field">';
							a += '<button type="button" class="form-control btn btn-primary"  onclick="openCOM('+COMSearch_keycode+',\''+COMSearch_keyword+'\');">Search</button> ';
							a += '</div>';
							a += '</div>';
							a += '</div>';
							a += '</div>';
							a += '</form>';
							a += '</div>';	
						$(".COMTable").append(a);	
						
					}	
			});
	}
	
	function indvdlView(notice_num,search_keyword,search_keycode){
		location.href='/noticeboard/noticeboardTotalView.do?notice_num='+notice_num
													        +'&search_keyword='+search_keyword
													        +'&search_keycode='+search_keycode;	
	}
	
	function COMView(notice_num,search_keyword,search_keycode){
		location.href='/noticeboard/noticeboardTotalView.do?notice_num='+notice_num
    													    +'&search_keyword='+search_keyword
       													    +'&search_keycode='+search_keycode;	
	}

	
	

</script>   
</body>
</html> 
