<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
td {f on t-family:"돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
}

td a {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: none;
}

td a:hover {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: underline;
}
</style>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<link type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,800italic,400,700,800">
<link type="text/css" rel="stylesheet" href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
<script type="text/javascript" src = "http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		
		var memberInfo = opener.parent.getEmailSendMemberInfo();
		var TMPids = memberInfo[0];
		var TMPnames = memberInfo[1];
		var TMPemails = memberInfo[2];
		
		var idList = TMPids.split(",");
		var namesList = TMPnames.split(",");
		var emailList = TMPemails.split(",");
		
		var trHtmls = "";
		for(var i = 0; i < idList.length-1; i++){
			trHtmls += '<tr>';
			trHtmls += '<td style="cursor:pointer;">' + i+1 + '</td>';
			trHtmls += '<td style="cursor:pointer;">' + idList[i] + '</td>';
			trHtmls += '<td style="cursor:pointer;">' + namesList[i] + '</td>';
			trHtmls += '<td style="cursor:pointer;">' + emailList[i] + '</td>';
			trHtmls += '</tr>';
		}
		
		$('#memberInfoTbody').replaceWith(trHtmls);
		
		$('#send').click(function(){
			if($('#emailContent').val() == ""){
				alert("이메일 내용을 입력해주세요.");
				return false;
			}
			
			var emailContent = $('#emailContent').val();
			$.ajax({
				type : 'post',
				url : '/admin/memberManagement/sendEmails.do',
				data : {"TMPemails":TMPemails,"emailContent":emailContent},
				error : function(result){
					alert(result.status);
				},
				success : function(result){
					alert("이메일이 성공적으로 전송되었습니다,");
					self.close();
				}
			});
			
		});
		
	});
</script>
</head>
<body>
<div class="wrap">	
	<table width="700" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td width="30">&nbsp;</td>
			<td width="790">
				<div id="container">
					<table border="0" cellspacing="1" cellpadding="1" class='table table-bordered data-table'>
						<thead>
							<tr>
								<th width="10%">NO.</th>
								<th width="15%">아이디</th>
								<th width="15%">이름</th>
								<th width="40%">메일</th>
							</tr>
						</thead>
						<tbody class="memberList" align="center" id ="memberInfoTbody">
						</tbody>
					</table>
					<textarea rows="10" cols="80" id="emailContent" style="resize: vertical;" ></textarea>
					<button id="send">보내기</button>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>