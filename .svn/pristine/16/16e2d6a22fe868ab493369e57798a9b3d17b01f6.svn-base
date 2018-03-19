<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="/spring/resources/common/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/spring/resources/common/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/spring/resources/common/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="/spring/resources/common/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="/spring/resources/common/css/main.css">
<link rel="stylesheet" href="/spring/resources/common/css/jaewoo.css">
<link rel="stylesheet" href="/spring/resources/common/css/vacation.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="/spring/resources/common/css/demo.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">

<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="/spring/resources/common/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/spring/resources/common/img/favicon.png">

<!-- DATE TIME PICKER(부트스트랩 달력) -->
<link rel="stylesheet"
	href="/spring/resources/common/css/bootstrap-datetimepicker.min.css" />


<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<script src="/spring/resources/common/vendor/jquery/jquery.min.js"></script>
	<script src="/spring/resources/common/js/jquery.form.js"></script>
	<script src="/spring/resources/common/js/paging.js"></script>

	<div id="wrapper">
		<header id="header"> 
			<tiles:insertAttribute name="header" />
		</header>

		<section id="sidemenu"> 
			<tiles:insertAttribute name="menu" />
		</section>

		<section id="site-content"> 
			<tiles:insertAttribute name="body" /> </section>

		<footer id="footer"> 
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>

	<!-- Javascript -->
	<script src="/spring/resources/common/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/spring/resources/common/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/spring/resources/common/scripts/klorofil-common.js"></script>
	<script src="/spring/resources/common/js/moment.js"></script> <!-- ※datetimepicker보다 먼저 import 되어야함 -->
	<script src="/spring/resources/common/js/ko.js"></script>
	<script src="/spring/resources/common/js/bootstrap-datetimepicker.js"></script>
	<script src="/spring/resources/common/js/jquery.tablesorter.js"></script> <!-- 테이블 정렬 -->
	<script src="/spring/resources/common/js/commMenu.js"></script>
	<script src="/spring/resources/common/js/jquery.printelement.js"></script> <!-- 인쇄 -->
	<script src="/spring/resources/common/js/excelexportjs.js"></script> <!-- 엑셀다운 -->
	<tiles:insertAttribute name="scripts"/>
</body>
</html>