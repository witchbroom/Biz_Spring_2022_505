<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
	<head>
		<title>수가확인서비스</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${rootPath}/static/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Header -->
			<header id="header">
				<a href="index.html" class="title">Hyperspace</a>
				<nav>
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="generic.html" class="active">EMR SYSTEM</a></li>
						<li><a href="elements.html">Service</a></li>
					</ul>
				</nav>
			</header>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<section id="main" class="wrapper">
						<div class="inner">
							<h1 class="major">진료수가목록조회 서비스</h1>
							<table id="api">
								<thead>
									<tr>
										<th>한글명</th>
										<th>수가코드</th>
										<th>수가분류번호</th>
										<th>급여구분명</th>
										<th>수술구분명</th>
										<th>의원단가</th>
										<th>병원단가</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${APIS}" var="API">
										<tr>
											<td>${API.korNm}</td>
											<td>${API.mdfeeCd}</td>
											<td>${API.mdfeeDivNo}</td>
											<td>${API.payTpCd}</td>
											<td>${API.soprTpNm}</td>
											<td>${API.unprc}</td>
											<td>${API.unprc2}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</section>

			</div>

		<!-- Footer -->
			<footer id="footer" class="wrapper alt">
				<div class="inner">
					<ul class="menu">
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>
			</footer>

		<!-- Scripts -->
	<script src="${rootPath}/static/js/jquery.min.js"></script>
	<script src="${rootPath}/static/js/jquery.scrollex.min.js"></script>
	<script src="${rootPath}/static/js/jquery.scrolly.min.js"></script>
	<script src="${rootPath}/static/js/browser.min.js"></script>
	<script src="${rootPath}/static/js/breakpoints.min.js"></script>
	<script src="${rootPath}/static/js/util.js"></script>
	<script src="${rootPath}/static/js/main.js"></script>
	</body>
</html>