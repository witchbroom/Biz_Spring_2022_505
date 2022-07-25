<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Insert title here</title>
<style>
html, body {
	margin: 0;
	padding: 0;
	font-family: 'Gowun Dodum', sans-serif;
}

body {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

form {
	width:100%;
	padding: 10px;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	text-align: center;
}

button {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	margin: 0;
	padding: 0.5rem 1rem;
	font-family: "Noto Sans KR", sans-serif;
	font-size: 1rem;
	font-weight: 400;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	width: auto;
	border: none;
	border-radius: 4px;
	box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px
		rgba(0, 0, 0, 0.06);
	cursor: pointer;
	transition: 0.5s;
	background-color: #B7F0B1;
}

button:active, button:hover, button:focus {
	background: var(- -button-hover-bg-color);
	outline: 0;
}

button:disabled {
	opacity: 0.5;
}

input {
	text-align:center;
	color:black;
	height: 30px;
	font-size: 12px;
	font-weight: 700;
	border-radius: 6px;
	border: 0;
	outline: 0;
}

table {
	width: 700px;
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
	white-space:nowrap;
}

table tr, th, td {
	border: 1px solid black;
	padding: 10px 50px;
}

td a {
	text-decoration: none;
	color: inherit;
}
</style>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
</head>
<body>
	<h1>주소록 CRUD</h1>
	<%// form에 한개의 input box만 있을 경우 input box text를 입력한 후 Enter를 누르면
	 //	input box에 담긴 문자열을 서버로 전송하는 기능이 활성화된다 %>
	<form>
		<input name="search" placeholder="검색어 입력후 Enter" />
	</form>
	<table>
		<thead>
			<tr>
				<th>SEQ</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ADDRS}" var="ADDR">
				<tr data-seq=${ADDR.a_seq}>
					<td>${ADDR.a_seq}</td>
					<td><a href="${rootPath}/detail?seq=${ADDR.a_seq}">${ADDR.a_name}</a></td>
					<td>${ADDR.a_tel}</td>
					<td>${ADDR.a_address}</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
	<%@ include file="/WEB-INF/views/pagination.jsp" %>
	<a href="${rootPath}/insert">주소 추가하기</a>
</body>
</html>