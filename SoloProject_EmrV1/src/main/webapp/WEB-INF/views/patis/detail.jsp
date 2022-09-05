<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>EMR Chart - modify</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${rootPath}/static/css/main.css" />
<link rel="stylesheet" href="${rootPath}/static/css/detail.css?001" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">

	<!-- Header -->
	<header id="header">
		<a href="index.html" class="title">EMR System</a>
		<nav>
			<ul>
				<li><a href="${rootPath}/">Home</a></li>
				<li><a href="${rootPath}/emrs" class="active">EMR SYSTEM</a></li>
				<li><a href="${rootPath}/api">Service</a></li>
			</ul>
		</nav>
	</header>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<section id="main" class="wrapper">
			<div class="inner">
				<h1 class="major">환자정보</h1>
				<table>
					<tr>
						<th>성명 : ${PATI.name}</th>
					</tr>
					<tr>
						<th>연령 : ${PATI.age}</th>
					</tr>
					<tr>
						<th>성별 : ${PATI.sex}</th>
					</tr>
					<tr>
						<th>질병코드 : ${PATI.code}</th>
					</tr>
					<tr>
						<th>기록지 : ${PATI.disease}</th>
					</tr>
					<tr>
						<th>특이사항 : ${PATI.karte}</th>
					</tr>
				</table>
				<div class="col-6 col-12-medium">
					<ul class="actions">
						<li><a href="${rootPath}/emrs/update/${PATI.seq}"
							class="button primary">수정하기</a></li>
						<li><a href="${rootPath}/emrs/delete/${PATI.seq}"
							class="button">삭제하기</a></li>
						<li><a href="${rootPath}/emrs/" class="button primary">돌아가기</a></li>
					</ul>
				</div>
			</div>
		</section>

	</div>

	<!-- Footer -->
	<footer id="footer" class="wrapper alt">
		<div class="inner">
			<ul class="menu">
				<li>&copy; Untitled. All rights reserved.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
	</footer>

	<!-- Scripts -->
	<script src="${rootPath}/static/js/detail.js?001"></script>
	<script src="${rootPath}/static/js/jquery.min.js"></script>
	<script src="${rootPath}/static/js/jquery.scrollex.min.js"></script>
	<script src="${rootPath}/static/js/jquery.scrolly.min.js"></script>
	<script src="${rootPath}/static/js/browser.min.js"></script>
	<script src="${rootPath}/static/js/breakpoints.min.js"></script>
	<script src="${rootPath}/static/js/util.js"></script>
	<script src="${rootPath}/static/js/main.js"></script>

</body>
</html>