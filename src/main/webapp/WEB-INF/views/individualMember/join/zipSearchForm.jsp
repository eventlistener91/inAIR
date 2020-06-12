<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="google-signin-client_id" content="429193550282-0vtvu8m5avrb1ucklkh7r1comiqkpp37.apps.googleusercontent.com">
<title>우편번호 검색</title>

<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/css/util.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/bootStrap3/css/main.css">

<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="${pageContext.request.contextPath}/js/commons.js"></script>
<script src="${pageContext.request.contextPath}/js/validation.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/animsition/js/animsition.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/bootstrap/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/select2/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/daterangepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/bootStrap3/vendor/countdowntime/countdowntime.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<style type="text/css">
	#searchBTN{cursor: pointer;}
	#zipSearchResultTable tr{cursor: pointer;}
	#zipSearchResultTable tr:HOVER {background-color: #f0f0f0;}
}
</style>
<script type="text/javascript">
$(function(){
	
	// 시도 세팅
	$('#sido').append(getSido());
	
	// 구군 세팅
	$('#sido').change(function(){
		if($('#sido').val() == ""){
			$('#gugun').empty();
			$('#gugun').append('<option value="">시/군/구</option>');
		}else{
			$('#gugun').empty();
			var gugunList = getGugun($('#sido').val());
			var htmls = '<option value="">시/군/구</option>';
			for (var i = 0; i < gugunList.length; i++){
				htmls += '<option value="' + gugunList[i] + '">' + gugunList[i] + '</option>'
			}
			
			$('#gugun').append(htmls);
		}
	});
	
	$('#dong').keyup(function(key){
		if(key.keyCode == 13) {
			searchBTN();
		}
	});
	
	$('#searchBTN').click(function(){
		searchBTN();
	});
	
});

function searchBTN(){
	if($('#sido').val() != "" && $('#gugun').val() != "" && $('#dong').val() != ""){
		$.ajax({
			url : "${pageContext.request.contextPath}/individualMember/join/zipSearch.do",
			data : {"sido" : $('#sido').val(), "gugun" : $('#gugun').val(), "dong" : $('#dong').val()},
			dataType : "json",
			type : "post",
			error : function(result) {
				alert("주소를 불러오는데 실패했습니다. 관리자에게 문의해주세요.");
			},
			success : function(result) {
				var htmls = "<table width='100%' id='zipSearchResultTable' style='overflow:scroll; border-collapse: separate; border-padding: 0 10px;'>";
				$.each(result, function(index, item){
					htmls += "<tr>"
						   + "<td>" + item.zipcode + "</td>";
						   
					if (item.bunji != null){
					   htmls += "<td>" + item.sido + " " + item.gugun + " " + item.dong + " " + item.bunji + "</td>";
				    } else {
					   htmls += "<td>" + item.sido + item.gugun + item.dong + "</td>";
				    }
					
						   + "</tr>";
				})
				htmls +="</table>";
				
				
				$('#search_count').text(result[0].search_count);
				$('#result_dong').text($('#dong').val() + " ");
				$('#resultTable').empty().html(htmls);
				
				$('#zipSearchResultTable tr').click(function(){
					var zipCode = "(" + $(this).find('td:eq(0)').text() + ")";
					var addr = $(this).find('td:eq(1)').text();
					
					$('#indvdl_adres', opener.document).val(zipCode + " " + addr);
					
					opener.parent.changeAdresFlag();
					self.close();
				});
			}
		});
	}
}
</script>
</head>
<body style="position: absolute;">
	
	<div class="limiter" style="position: relative;">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-50" style="width: 600px;">
				<div class="login100-form">
					<span class="login100-form-title p-b-33">
						우편번호 검색
					</span>
					
					<table style="width: inherit;">
						<tbody>
							<tr>
								<td colspan="3">
									<label for="sido" style="font-size: 12px;">찾고자 하는 주소의 읍/면/동을 입력하세요.</label>
								</td>
							</tr>
							<tr>
								<td>
									<select width="49%" name="sido" id="sido" style="width: 100%; height: 40px; border-color: #e6e6e6; padding-left: 20px;">
										<option value="">시/도</option>
									</select>
								</td>
								<td width="2%">
								</td>
								<td>
									<select width="49%" id="gugun" style="width: 100%; height: 40px; border-color: #e6e6e6; padding-left: 20px;">
										<option value="">시/군/구</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="3">
									<div class="wrap-input100 validate-input" style="margin-top: 5px; position: relative;">
										<span class="icon" id="searchBTN" style="position: absolute; z-index: 1; top: 30%; left: 450px;"><i class="fa fa-search"></i></span>
										<input type="text" id="dong" name="dong" class="input100" style="height: 40px; padding-right: 50px;" placeholder="동(읍/면/리)을 입력하세요.">
										<span class="focus-input100-1"></span>
										<span class="focus-input100-2"></span>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<br>
					<label><b id="result_dong"></b>검색결과 <b id="search_count">0</b>건</label>
					<div class="wrap-input100 validate-input" id="resultTable" style="margin-top: 5px; width: inherit; height: 300;">
						<p style="line-height: 250px; text-indent: 30%;">검색결과가 없습니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>