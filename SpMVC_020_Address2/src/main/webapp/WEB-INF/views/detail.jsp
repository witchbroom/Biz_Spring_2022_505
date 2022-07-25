<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
a{
	margin:5px;
	color: inherit;
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
hr{
	color:black;
}

.box {
	width: 30%;
	height: 50%;
	border: 1px solid black;
	border-radius: 10px;
	top: 150px;
	left: 500px;
	text-align:center;
	margin:10px;
}

</style>
<link
	href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap"
	rel="stylesheet">
</head>
<body>

	<h1>주소 자세히 보기</h1>
	<div class="box">
	<h4>이름 : ${ADDR.a_name}</h4>
	<h4>전화번호 : ${ADDR.a_tel}</h4>
	<h4>주소 : ${ADDR.a_address}</h4>
	</div>
	<div>
		<a href="${rootPath}/update?seq=${ADDR.a_seq}">수정하기</a>
		<a href="${rootPath}/delete?seq=${ADDR.a_seq}">삭제하기</a>
		<a href="${rootPath}/">처음으로</a>
	</div>
	
</body>
</html>