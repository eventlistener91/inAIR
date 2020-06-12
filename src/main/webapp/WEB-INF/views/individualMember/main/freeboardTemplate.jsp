<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
		<div id="wrapper">
			<section class="ftco-section bg-light" >
				<div class="container">
					 <div style="margin-left: 3%">
						<tiles:insertAttribute name="leftFreeboardContent"></tiles:insertAttribute>
					</div>
					<div>
						<tiles:insertAttribute name="left"></tiles:insertAttribute>
					</div>
				</div>
		</section>
	</div>
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>