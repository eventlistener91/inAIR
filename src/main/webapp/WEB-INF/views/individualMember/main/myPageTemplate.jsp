<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<tiles:insertAttribute name="header"></tiles:insertAttribute>
	<section class="ftco-section bg-light">
	<div class="container">
		<div class="row">
			<div class="col-lg-9 pr-lg-4">
				<tiles:insertAttribute name="leftContent"></tiles:insertAttribute>
			</div>
			<div class="col-lg-3 sidebar">
				<tiles:insertAttribute name="right"></tiles:insertAttribute>
			</div>
		</div>
	</div>
	</section>
	<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>
