<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="comMemURL" value="/companyMember"></c:url>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>inAIR</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="${pageContext.request.contextPath}/js/commons.js"></script>
    <style>
    .main-center-category{
    	width:20%;
    }
	.newsKeyWord {
		cursor: pointer;
		color: blue;
	}
	.nav_word, .nav_bar {
		color: white;
		font-size: 20px;
		margin-left: 10px;
		margin-right: 10px;
	}
	.nav_word{
		cursor: pointer;
	}
	.nav_word:hover{
		color: black;
	}
	.col-md-2{
		cursor: pointer;
	}
	.col-md-2 p {
		color: black;
	}
	.proButton {
		border: none;
		font-size: 15px;
		margin-top: 2px;
		margin-bottom: 2px;
		background-color: white;
	}
	.indutyButton {
		border: none;
		font-size: 15px;
		margin-top: 2px;
		margin-bottom: 2px;
		background-color: white;
	}
	.addButton {
		border: none;
		font-size: 15px;
		margin-top: 1px;
		margin-bottom: 1px;
		background-color: white;
		width: 90px;
	}
	#imgDiv {
		height: 920px;
	}
	.lowProButton {
		font-size: 13px; 
		height: 30px; 
		width: 180px; 
		background-color: #f8f9fa; 
		border-radius:5px; 
		margin: 5px;
	}
	.lowProButton:hover {
		background: #206dfb; 
		border: 1px solid rgba(0, 0, 0, 0.05); 
		box-shadow: 1px 1px 2px rgba(255, 255, 255, 0.2); 
		color: white; 
		text-shadow: -1px -1px 0 #c2211c;
	}
	.gugunButton {
		font-size: 13px; 
		height: 30px; 
		width: 85px; 
		background-color: #f8f9fa; 
		border-radius:5px; 
		margin: 5px;
	}
	.gugunButton:hover {
		background: #206dfb; 
		border: 1px solid rgba(0, 0, 0, 0.05); 
		box-shadow: 1px 1px 2px rgba(255, 255, 255, 0.2); 
		color: white; 
		text-shadow: -1px -1px 0 #c2211c;
	}
	.corpNameP:hover {
		background-color: #e4e5e5;
	}    
    </style>
    <script type="text/javascript">
	    var contextPath = "${pageContext.request.contextPath}";
	    var corpName = false;
	    var corpCode = "";
	
	    $(function() {
	    	
	    	if (eval('${!empty param.message}')) {
	    		alert('${param.message}');
	    	}
	
	    	$('.newsKeyWord').click(function() {
	    		var clickKeyWord = ($(this).text()).substr(1);
	
	    		$.ajax({
	    			url : '${pageContext.request.contextPath}/individualMember/resetNews.do',
	    			type : 'post',
	    			data : {'clickKeyWord' : clickKeyWord},
	    			dataType : 'json',
	    			error : function(result) {
	    				alert(result.status);
	    			},
	    			success : function(result) {
	    				$('#newsContentDiv').empty();
	
	    				var newsContentHtmls = "";
	    				$.each(result,function(index, item) {
	    					newsContentHtmls += '<div class="row">'
	    									 + '<div>'
	    									 + '<div class="job-post-item p-4 d-block d-lg-flex align-items-center">'
	    									 + '<div class="one-third mb-4 mb-md-0">'
	    									 + '<div class="job-post-item-header align-items-center">'
	    									 + '<span class="subadge">'
	    									 + item.clickKeyWord
	    									 + '</span>&nbsp;&nbsp;&nbsp;<span style="font-size: 12px;">업데이트 날짜  :  '
	    									 + item.news_rgsde
	    									 + '</span>'
	    									 + '<h2 class="mr-3 text-black">'
	    									 + item.news_sj
	    									 + '</h2>'
	    									 + '<div>'
	    									 + item.news_cn
	    									 + '</div>'
	    									 + '</div>'
	    									 + '</div>'
	    									 + '<div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">'
	    									 + '<a href="' + item.news_link + '" target="_blank" class="btn btn-primary py-2">바로가기</a>'
	    									 + '</div>'
	    									 + '</div>'
	    									 + '</div>'
	    									 + '</div>';
	
	    				})
	    				
	    				$('#newsContentDiv').append(newsContentHtmls);
	    			}
	    		});
	    	});
	    	
	    	$('#professionSelectTable').hide();
	    	$('#addressSelectTable').hide();
	    	$('#resultDiv').hide();
	    	
	    	$('#proInput').click(function() {
	    		$('#professionSelectTable').slideDown();
	    		$('#addressSelectTable').slideUp();
	    		$('#resultDiv').slideUp();
	    	});
	    	$('#proInput').dblclick(function() {
	    		$('#professionSelectTable').slideUp();
	    	});
	    	
	    	$('#addressInput').click(function() {
	    		$('#addressSelectTable').slideDown();
	    		$('#professionSelectTable').slideUp();
	    		$('#resultDiv').slideUp();
	    	});
	    	$('#addressInput').dblclick(function() {
	    		$('#addressSelectTable').slideUp();
	    	});
	    	
	    	// 검색
	    	$('#searchSubmit').click(function() {
	    		var search_keyword = $('#search_keyword').val();
	    		var corp_add = $('#addressInput').val();
	    		var lowpro = $('#proNumInput').val();
	    		location.href = '/companyMember/resumeNews/resumeNewsHome.do?search_keyword=' + search_keyword + '&corp_add=' + corp_add + '&corp_lowPro=' + lowpro;
	    	});
	    	
	    });
	
	    //onclick 직종
	    function selectLowPROFunction(thisId) {
	    	$('#nextId').empty();
	    	
	    	getLowProfession($('#' + thisId).val(), '#nextId');
	    }
	
	    // 선택에 따른 하위 직종 불러오기 
	    function getLowProfession(value, appendId){
	    	$.ajax({
	    		url : contextPath+'/individualMember/lowPROList.do'
	    		,dataType : 'json'
	    		,data : { uppro_num : value }
	    		,error : function(result){
	    					alert(result.status);	
	    				}
	    		,success : function(result){
	    						$.each(result, function(index, item){
	    								var changeOption = $('<button class="lowProButton" id="lowPro' + item.lowpro_num
	    													+ '"value="'+ item.lowpro_num 	
	    													+ '"onclick="clickedLowProfession(this.id)">'
	    													+ item.lowpro_name +'</button>');
	    								$(appendId).append(changeOption);
	    						});
	    				}
	    	});  
	    }
	
	    function clickedLowProfession(thisLowId) {
	    	$('#proInput').val($('button[id="'+ thisLowId + '"]').text());
	    	$('#proNumInput').val($('button[id="'+ thisLowId + '"]').val());
	    	$('#professionSelectTable').slideUp();
	    }
	
	    // 선택에 따른 지역 불러오기
	    function selectSearchAddr(thisId) {
	    	var gugun = getGugun($('#'+thisId).val());
	    	
	    	$('#nextAddId').empty();
	    	
	    	for(var i = 1; i < gugun.length; i++){
	    		var changeOption = '<button class="gugunButton" value="' + gugun[i] 
	    							+ '"id="gugun' + i 
	    							+ '"onclick="clickedGugun(this.id)" >' + gugun[i] + '</button>';
	    							
	    		$('#nextAddId').append(changeOption);
	    	}
	    }
	
	    function clickedGugun(thisId) {
	    	$('#addressInput').val($('button[id="' + thisId + '"]').text());
	    	$('#addressSelectTable').slideUp();
	    }
	    
	    function resumeNewsHome() {
	    	if(${empty LOGIN_COMMEMINFO}){
	    		alert('로그인 후 이용 가능합니다.');
	    		return false;
	    	}else{
	    		location.href='${comMemURL}/resumeNews/resumeNewsHome.do';
	    	}
	    }

	    function jobOfferHome() {
	    	if(${empty LOGIN_COMMEMINFO}){
	    		alert('로그인 후 이용 가능합니다.');
	    		return false;
	    	}else{
	    		location.href='${comMemURL}/jobOffer/jobOfferHome.do';
	    	}
	    }

	    function resboardHome() {
	    	if(${empty LOGIN_COMMEMINFO}){
	    		alert('로그인 후 이용 가능합니다.');
	    		return false;
	    	}else{
	    		location.href='/resboard/resboardHome.do';
	    	}
	    }

	    function applicantHome() {
	    	if(${empty LOGIN_COMMEMINFO}){
	    		alert('로그인 후 이용 가능합니다.');
	    		return false;
	    	}else{
	    		location.href='/companyMember/applicant/applicantHome.do';
	    	}
	    }

	    function myPageHome() {
	    	if(${empty LOGIN_COMMEMINFO}){
	    		alert('로그인 후 이용 가능합니다.');
	    		return false;
	    	}else{
	    		location.href='${comMemURL}/myPage/myPageHome.do';
	    	}
	    }

    </script>
  </head>
  <body>
	  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container-fluid px-md-4	">
	      <a class="navbar-brand" href="${comMemURL}/mainView.do">inAIR</a>
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav ml-auto">
	          <li class="nav-item"><a href="#" class="nav-link" style="font-size: 20px;">${LOGIN_COMMEMINFO.com_id} 님</a></li>
	          <li class="nav-item"><a href="/companyMember/login/logout.do" class="nav-link" style="font-size: 20px;">로그아웃</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
    <!-- END nav -->
    
    <div class="hero-wrap img" style="background-image: url(${pageContext.request.contextPath}/images/bg_1.jpg); height:920px;">
      <div class="overlay"></div>
      <div class="container">
      	<div class="row d-md-flex no-gutters slider-text align-items-center justify-content-center">
	        <div class="col-md-10 d-flex align-items-center ftco-animate">
	        	<div class="text text-center pt-5 mt-md-5">
        		<p class="mb-4">The Smartest Way to Get New Talent</p>
	            <h1 class="mb-5">새로운 인재를 얻는 가장 현명한 방법</h1>
					<div class="ftco-counter ftco-no-pt ftco-no-pb">
			        	<div class="row">
				          <div class="col-md-4 d-flex justify-content-center counter-wrap ftco-animate">
				            <div class="block-18">
				              <div class="text d-flex">
				              	<div class="icon mr-2">
				              		<span class="flaticon-worldwide"></span>
				              	</div>
				              	<div class="desc text-left">
					                <strong class="number">${connectCount}</strong>
					                <span>방문자 수</span>
				                </div>
				              </div>
				            </div>
				          </div>
				          <div class="col-md-4 d-flex justify-content-center counter-wrap ftco-animate">
				            <div class="block-18 text-center">
				              <div class="text d-flex">
				              	<div class="icon mr-2">
				              		<span class="flaticon-visitor"></span>
				              	</div>
				              	<div class="desc text-left">
					                <strong class="number" data-number="${jobOfferCount}0"></strong>
					                <span>구인글 등록수</span>
					              </div>
				              </div>
				            </div>
				          </div>
				          <div class="col-md-4 d-flex justify-content-center counter-wrap ftco-animate">
				            <div class="block-18 text-center">
				              <div class="text d-flex">
				              	<div class="icon mr-2">
				              		<span class="flaticon-resume"></span>
				              	</div>
				              	<div class="desc text-left">
					                <strong class="number" data-number="${indvdlMemCount}0"></strong>
					                <span>구직자 등록수</span>
					              </div>
				              </div>
				            </div>
				          </div>
				        </div>
			        </div>
					<div class="ftco-search my-md-5">
						<div class="row">
				            <div class="col-md-12 nav-link-wrap">
					            <div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical" style="opacity:0;">
					              <a class="nav-link active mr-md-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Find a Job</a>
					              <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Find a Candidate</a>
					            </div>
					        </div>
				          	<div class="col-md-12 tab-wrap">
					            <div class="tab-content p-4" id="v-pills-tabContent">
									<div class="tab-pane fade show active" id="v-pills-1"
										role="tabpanel" aria-labelledby="v-pills-nextgen-tab" style="padding-bottom: 10px;">
										<form action="#" class="search-job">
											<div class="row no-gutters">
												<div class="col-md mr-md-2">
													<div class="form-group">
														<div class="form-field">
															<div class="icon">
																<span class="icon-briefcase"></span>
															</div>
															<input type="text" id="search_keyword" class="form-control" name="search_keyword" placeholder="검색어 입력">
														</div>
													</div>
												</div>
												<div class="col-md mr-md-2">
													<div class="form-group">
														<div class="form-field">
															<div class="select-wrap">
																<div class="icon">
																	<span class="ion-ios-arrow-down"></span>
																</div>
																<input type="text" id="proInput" class="form-control" placeholder="직종 선택">
																<input type="hidden" id="proNumInput" >
															</div>
														</div>
													</div>
												</div>
												<div class="col-md mr-md-2">
													<div class="form-group">
														<div class="form-field">
															<div class="select-wrap">
																<div class="icon">
																	<span class="icon-map-marker"></span>
																</div>
																<input type="text" id="addressInput" class="form-control" placeholder="지역 선택">
															</div>
														</div>
													</div>
												</div>
												<div class="col-md">
													<div class="form-group">
														<div class="form-field">
															<button type="button" id="searchSubmit" class="form-control btn btn-primary">검색</button>
														</div>
													</div>
												</div>
											</div>
										</form>
									</div>
									<!-- 기업 검색 -->
									<div id="resultDiv" style="overflow:auto; width:230px; height:260px;"></div>
									<!-- 직종 선택 -->
									<div id="professionSelectTable" style="padding: 10px 0px; border: 1.5px solid #e4e5e5; ">
										<table style="margin-top: 10px;">
											<tr>
												<td style="width: 135px;">
													<c:forEach items="${upPROList}" var="proInfo" varStatus="stat" >
														<c:if test="${stat.index <= 6 }">
															<div>
																<button id="proButton${proInfo.uppro_num}" class="proButton" value="${proInfo.uppro_num}" onclick="selectLowPROFunction(this.id)">${proInfo.uppro_name }</button>
															</div>
														</c:if>
													</c:forEach>
												</td>
												<td style="width: 135px;">
													<c:forEach items="${upPROList}" var="proInfo" varStatus="stat">
														<c:if test="${stat.index >= 7 && stat.index <= 13}"> 
															<div>
																<button id="proButton${proInfo.uppro_num}" class="proButton" value="${proInfo.uppro_num}" onclick="selectLowPROFunction(this.id)">${proInfo.uppro_name }</button>
															</div>
														</c:if>
													</c:forEach>
													<div>&nbsp;</div>
												</td>
												<td id="nextId" style="width: 600px; border-left: 1.5px solid #e4e5e5; padding: 0px 10px;"></td>
											</tr>
										</table>
									</div>
									<!-- 지역 선택 -->
									<div id="addressSelectTable" style="border: 1.5px solid #e4e5e5; ">
										<table style="margin-top: 10px;">
											<tr>
												<td style="width: 135px;">
													<div class="addressDiv">
														<button class="addButton" id="addButton1" value="서울" onclick="selectSearchAddr(this.id)">서울특별시</button>
													    <button class="addButton" id="addButton2" value="부산" onclick="selectSearchAddr(this.id)">부산광역시</button>
													    <button class="addButton" id="addButton3" value="대구" onclick="selectSearchAddr(this.id)">대구광역시</button>
													    <button class="addButton" id="addButton4" value="인천" onclick="selectSearchAddr(this.id)">인천광역시</button>
													    <button class="addButton" id="addButton5" value="광주" onclick="selectSearchAddr(this.id)">광주광역시</button>
													    <button class="addButton" id="addButton6" value="대전" onclick="selectSearchAddr(this.id)">대전광역시</button>
													    <button class="addButton" id="addButton7" value="울산" onclick="selectSearchAddr(this.id)">울산광역시</button>
													    <button class="addButton" id="addButton8" value="경기" onclick="selectSearchAddr(this.id)">경기도</button> 
													</div>
												</td>
												<td style="width: 135px; padding: 0px;">
													<div class="addressDiv">
													    <button class="addButton" id="addButton9" value="강원" onclick="selectSearchAddr(this.id)">강원도</button> 
													    <button class="addButton" id="addButton10" value="충북" onclick="selectSearchAddr(this.id)">충청북도</button>
													    <button class="addButton" id="addButton11" value="충남" onclick="selectSearchAddr(this.id)">충청남도</button>
													    <button class="addButton" id="addButton12" value="전북" onclick="selectSearchAddr(this.id)">전라북도</button>
													    <button class="addButton" id="addButton13" value="전남" onclick="selectSearchAddr(this.id)">전라남도</button>
													    <button class="addButton" id="addButton14" value="경북" onclick="selectSearchAddr(this.id)">경상북도</button>
													    <button class="addButton" id="addButton15" value="경남" onclick="selectSearchAddr(this.id)">경상남도</button>
			    										<button class="addButton" id="addButton16" value="제주" onclick="selectSearchAddr(this.id)">제주도</button>
													</div>
												</td>
												<td id="nextAddId" style="width: 600px; border-left: 1.5px solid #e4e5e5; padding: 0px 10px;"></td>
											</tr>
										</table>
									</div>
								</div>
				          </div>
				        </div>
			        </div>
	          </div>
	        </div>
    	</div>
      </div>
    </div>
    <section class="ftco-section ftco-no-pt ftco-no-pb bg-light">
    	<div class="container">
    		<div class="row">
    			<div class="col-md-12">
    				<div class="category-wrap">
    					<div class="row no-gutters">
    						<div class="main-center-category" onclick="resumeNewsHome();">
    							<div class="top-category text-center no-border-left">
    								<h3><a href="#">구직소식란</a></h3>
    								<span class="icon flaticon-contact"></span>
    								<p><span>job-seeking news</span></p>
    							</div>
    						</div>
    						<div class="main-center-category" onclick="jobOfferHome();">
    							<div class="top-category text-center ">
    								<h3><a href="#">구인 공고 관리</a></h3>
    								<span class="icon flaticon-mortarboard"></span>
    								<p><span>a notice of employment</span></p>
    							</div>
    						</div>
    						<div class="main-center-category" onclick="resboardHome();">
    							<div class="top-category text-center">
    								<h3><a href="#">자료실</a></h3>
    								<span class="icon flaticon-idea"></span>
    								<p><span>reference</span></p>
    							</div>
    						</div>
    						<div class="main-center-category" onclick="applicantHome();">
    							<div class="top-category text-center">
    								<h3><a href="#">지원자 관리</a></h3>
    								<span class="icon flaticon-accounting"></span>
    								<p><span>applicant management</span></p>
    							</div>
    						</div>
    						<div class="main-center-category" onclick="myPageHome();">
    							<div class="top-category text-center no-border-right">
    								<h3><a href="#">기업정보 관리</a></h3>
    								<span class="icon flaticon-dish"></span>
    								<p><span>corporate information</span></p>
    							</div>
    						</div>
    					</div>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-15 pr-lg-5">

					<div class="row justify-content-center pb-3">
						<div class="col-md-12 heading-section ftco-animate">
							<span class="subheading">Job News</span>
							<h2 class="mb-4">취업소식란</h2>
							<c:forEach items="${newsKeyWordList}" var="newsKeyWordInfo">&nbsp;|&nbsp;
				            	<span class="newsKeyWord" style="font-size: 20px;">#${newsKeyWordInfo.keyword_cn }</span>&nbsp;|&nbsp;
			            	</c:forEach>
						</div>
					</div>
					<div id="newsContentDiv">
						<c:forEach items="${newsContentList}" var="newsContentInfo">
							<div class="row">
								<div>
									<div class="job-post-item p-4 d-block d-lg-flex align-items-center">
										<div class="one-third mb-4 mb-md-0">
											<div class="job-post-item-header align-items-center">
												<span class="subadge">${newsContentInfo.keyword_cn}</span>&nbsp;&nbsp;&nbsp;
												<span style="font-size: 12px;">업데이트 날짜 : ${newsContentInfo.news_rgsde }</span>
												<h2 class="mr-3 text-black">${newsContentInfo.news_sj}</h2>
												<div>${newsContentInfo.news_cn}</div>
											</div>
										</div>
										<div class="one-forth ml-auto d-flex align-items-center mt-4 md-md-0">
											<a href="${newsContentInfo.news_link}" target="_blank" class="btn btn-primary py-2">바로가기</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
    <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
        	<div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Skillhunt Jobboard</h2>
              <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-3">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Employers</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="pb-1 d-block">Browse Candidates</a></li>
                <li><a href="#" class="pb-1 d-block">Post a Job</a></li>
                <li><a href="#" class="pb-1 d-block">Employer Listing</a></li>
                <li><a href="#" class="pb-1 d-block">Resume Page</a></li>
                <li><a href="#" class="pb-1 d-block">Dashboard</a></li>
                <li><a href="#" class="pb-1 d-block">Job Packages</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Candidate</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="pb-1 d-block">Browse Jobs</a></li>
                <li><a href="#" class="pb-1 d-block">Submit Resume</a></li>
                <li><a href="#" class="pb-1 d-block">Dashboard</a></li>
                <li><a href="#" class="pb-1 d-block">Browse Categories</a></li>
                <li><a href="#" class="pb-1 d-block">My Bookmarks</a></li>
                <li><a href="#" class="pb-1 d-block">Candidate Listing</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-md-4">
              <h2 class="ftco-heading-2">Account</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="pb-1 d-block">My Account</a></li>
                <li><a href="#" class="pb-1 d-block">Sign In</a></li>
                <li><a href="#" class="pb-1 d-block">Create Account</a></li>
                <li><a href="#" class="pb-1 d-block">Checkout</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
            	<h2 class="ftco-heading-2">Have a Questions?</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
	                <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
	                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
	              </ul>
	            </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">

            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart text-danger" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/scrollax.min.js"></script>
  <script src="${pageContext.request.contextPath}/https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/js/main.js"></script>
    
  </body>
</html>