<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>대한 고교 성적처리 2021 v1</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

body {
	width: 100vw;
	height: 100vh;
}

#main {
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 30px;
	background-color: rgb(56, 128, 221);
	color: white;
	height: 100px;
	font-weight: 700;
	font-size: 36px;
}

nav {
	background-color: rgb(88, 87, 87);
	height: 50px;
}

#navi {
	color: white;
	display: flex;
	list-style: none;
	margin-left: 20px;
}

#navi li {
	padding: 15px 12px;
	margin-right: 10px;
}

#navi li:last-of-type {
	margin-left: 1450px;
}

table {
	margin-top: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	border-collapse: collapse;
}

td {
	padding: 15px 60px;
	border: 1px solid rgb(139, 139, 139)
}

td:nth-child(odd) {
	background-color: rgb(182, 182, 182);
}

.button_case {
	margin: 30px;
	width: 70%;
}

#add {
	padding: 10px 60px;
	margin: 0 50px;
	font-size: 16px;
	background-color: rgb(56, 128, 221);
	color: white;
	font-weight: 400;
	border: none;
	border-radius: 5px;
	float: right;
}
</style>
</head>

<body>
	<header>
		<p id="main">대한 고교 성적처리 2021 v1</p>
		<nav>
			<ul id="navi">
				<li>Home</li>
				<li>학생정보</li>
				<li>성적일람표</li>
				<li>로그인</li>
			</ul>

		</nav>

	</header>
	<section>
		<div>
			<table>
				<tr>
					<td>학번</td>
					<td>20210001</td>
					<td>전공</td>
					<td>컴퓨터공학</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>홍길동</td>
					<td>학년</td>
					<td>2</td>
				</tr>
				<tr>
					<td>주소</td>
					<td colspan="3">서울특별시</td>
				</tr>

			</table>
		</div>
		<div class="button_case">
			<button id="add">학생정보 추가</button>
		</div>

	</section>

</body>

</html>