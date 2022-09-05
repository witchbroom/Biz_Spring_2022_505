<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
<style>
.modal{
	position: fixed;
	top:150px;
	left:650px;
	width:50%;
	height:45%;
	display:none;
		background: #6b66ff;
		border-radius: 0.25em;
		border: solid 1px rgba(255, 255, 255, 0.15);
		font-family: "Courier New", monospace;
		font-size: 0.9em;
		margin: 0 0.25em;
		padding: 0.25em 0.65em;
		z-index: 10;
}
.modal button{
	margin-top:20px;
}

form#logout-form{
	display:none;
}
</style>
</head>
<body class="is-preload">

	<!-- Sidebar -->
	<section id="sidebar">
		<div class="inner">
			<nav>
				<ul>
				<sec:authorize access="isAnonymous()">
					<li><a href="#intro">Welcome</a></li>
					<li><a href="#two">약도</a></li>
					<li><a href="#three">연락하기</a></li>				
				</sec:authorize>
				
				<sec:authorize access="isAuthenticated()">
					<li><a href="#intro">Welcome</a></li>
					<li><a href="#one">전자의무기록</a></li>
				</sec:authorize>					
				</ul>
			</nav>
		</div>
	</section>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Intro -->
		<section id="intro" class="wrapper style1 fullscreen fade-up">
			<div class="inner">
				<h1>우리병원 홈페이지</h1>
				<p>
					반갑습니다
				</p>
				<ul class="actions">
					<sec:authorize access="isAnonymous()">
					<li><a href="#" class="button open">로그인</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
					<li class="logout"><button class="button">로그아웃</button></li>
					</sec:authorize>
				</ul>
			</div>
		</section>
		
		<div id="modal" class="modal modal_overlay">
		<div class="modal_body">	
			<h2>LOGIN</h2>
			<form:form id="login_form" action="${rootPath}/user/login">
				<label for="username">ID</label>
				<input type="text" name="username" />
				<label for="password">PASSWORD</label>
				<input type="password" name="password" />
				<button class="button">LOGIN</button>
			</form:form>
		</div>
		</div>

		<sec:authorize access="isAuthenticated()">
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
			<!--
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
			-->
		</section>
		</sec:authorize>

		<sec:authorize access="isAnonymous()">
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
		</sec:authorize>

	</div>

	<!-- Footer -->
	<footer id="footer" class="wrapper style1-alt">
		<div class="inner">
			<ul class="menu">
				<li>&copy; 류영렬(github.com/witchbroom) All rights reserved.</li>
			</ul>
		</div>
	</footer>
	<form:form id="logout-form" action="${rootPath}/logout" method="POST"/>	

	<!-- Scripts -->
	<script>
    const modal = document.querySelector('.modal');
    const open = document.querySelector('.open');

    open.addEventListener('click', () => {
      modal.style.display = 'block';
    });
    
    modal.addEventListener('click', (e) => {
      const evTarget = e.target;
      if (evTarget.classList.contains("modal_overlay")) {
        modal.style.display = "none";
      }
    });   
    window.addEventListener("keyup", (e) => {
    	  if (modal.style.display === "block" && e.key === "Escape") {
    	    modal.style.display = "none";
    	  }
    });
	</script>
	<script>
	document.querySelector("li.logout")?.addEventListener('click',()=>{
		document.querySelector("form#logout-form")?.submit()
	});
	</script>
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