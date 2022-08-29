<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
<head>
<title>HOME</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${rootPath}/static/css/main.css" />
<noscript>
	<link rel="stylesheet" href="${rootPath}/static/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">

	<!-- Sidebar -->
	<section id="sidebar">
		<div class="inner">
			<nav>
				<ul>
					<li><a href="#intro">Welcome</a></li>
					<li><a href="#one">Project</a></li>
					<li><a href="#two">Where we go</a></li>
					<li><a href="#three">Contact me</a></li>
				</ul>
			</nav>
		</div>
	</section>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Intro -->
		<section id="intro" class="wrapper style1 fullscreen fade-up">
			<div class="inner">
				<h1>Solo Project v1</h1>
				<p>
					병원 사내 홈페이지
					EMR 시스템 구현<br />
					류영렬<a href="http://github.com/witchbroom">(github.com/witchbroom)</a>
				</p>
				<ul class="actions">
					<li><a href="#one" class="button scrolly">프로젝트 확인하기</a></li>
				</ul>
			</div>
		</section>

		<!-- One -->
		<section id="one" class="wrapper style2 spotlights">
			<section>
				<a href="${rootPath}/emrs" class="image"><img src="${rootPath}/static/css/images/hospital.png"
					data-position="center center" class="image fit" /></a>
				<div class="content">
					<div class="inner">
						<h2>환자관리 시스템 V1</h2>
						<p>CRUD 구현</p>
						<ul class="actions">
							<li><a href="${rootPath}/emrs" class="button">들어가기</a></li>
						</ul>
					</div>
				</div>
			</section>
			<section>
				<a href="#" class="image"><img src="${rootPath}/static/css/images/board.png" alt=""
					data-position="center center" class="image fit"/></a>
				<div class="content">
					<div class="inner">
						<h2>진료수가목록조회 서비스</h2>
						<p>건강보험심사평가원 Open API 데이터 활용</p>
						<ul class="actions">
							<li><a href="generic.html" class="button">들어가기</a></li>
						</ul>
					</div>
				</div>
			</section>
		</section>

		<!-- Two -->
		<section id="two" class="wrapper style3 fade-up">
			<div class="inner">
				<h2>약도</h2>
				<div class="features col-12">
					<section>
						<div id="map" style="width:100%;height:400px;" class="col-12">
						</div>
						<p>위치 : 광주광역시 북구 설죽로 291 광주현대병원(임시)</p>
					</section>
				</div>
				<ul class="actions">
					<li><a href="generic.html" class="button">Learn more</a></li>
				</ul>
			</div>
		</section>

		<!-- Three -->
		<section id="three" class="wrapper style1 fade-up">
			<div class="inner">
				<h2>Contact me</h2>
				<p>문의사항은 상기의 연락처로 연락 바랍니다. 아래의 양식으로 메일을 보낼 수 있습니다.<br>문의시 이름과 부서, 연락처를 꼭 기입해주세요.</p>
				<div class="split style1">
					<section>
						<form method="post" action="${rootPath}/mail">
							<div class="fields">
								<div class="field">
									<label for="name">Name</label> <input type="text" name="subject"
										id="name" />
								</div>
								<div class="field">
									<label for="message">Message</label>
									<textarea name="message" id="message" rows="5"></textarea>
								</div>
							</div>
							<ul class="actions">
								<li><button type="submit">Send</button></li>
							</ul>
						</form>
					</section>
					<section>
						<ul class="contact">
							<li>
								<h3>Address</h3> <span>github.com/witchbroom<br />
									KR
							</span>
							</li>
							<li>
								<h3>Email</h3><span>witchbloom@naver.com</span>
							</li>
							<li>
								<h3>Phone</h3> <span>(000) 000-0000</span>
							</li>
						</ul>
					</section>
				</div>
			</div>
		</section>

	</div>

	<!-- Footer -->
	<footer id="footer" class="wrapper style1-alt">
		<div class="inner">
			<ul class="menu">
				<li>&copy; Untitled. All rights reserved.</li>
				<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
			</ul>
		</div>
	</footer>

	<!-- Scripts -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef66483277c7fb3e1d8cb32a29db706d"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ef66483277c7fb3e1d8cb32a29db706d&libraries=services,clusterer"></script>
	<script src="${rootPath}/static/js/map.js?ver=006"></script>
	<script src="${rootPath}/static/js/jquery.min.js"></script>
	<script src="${rootPath}/static/js/jquery.scrollex.min.js"></script>
	<script src="${rootPath}/static/js/jquery.scrolly.min.js"></script>
	<script src="${rootPath}/static/js/browser.min.js"></script>
	<script src="${rootPath}/static/js/breakpoints.min.js"></script>
	<script src="${rootPath}/static/js/util.js"></script>
	<script src="${rootPath}/static/js/main.js"></script>
</body>
</html>