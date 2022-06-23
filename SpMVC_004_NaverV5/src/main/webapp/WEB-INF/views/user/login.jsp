<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
<style>
	form.login{
		width:70%;
		margin: 20px auto;
		padding:20px;
	}
	form.login input, form.login button{
		margin:5px;
	}
</style>
<script src="${rootPath}/static/js/login.js?20220609001"></script>
</head>
<body>
<form method="POST" class="w3-container login w3-card-4">


	<h2 class="w3-text-blue">로그인</h2>
	<c:if test="${error == 'LOGIN_NEED'}">
		<div class="w3-red w3-padding-16">* 로그인이 필요한 서비스입니다</div>
	</c:if>
	<c:if test="${error == 'USERNAME_FAIL'}">
		<div class="w3-red w3-padding-16">* ID가 없음. 회원가입을 먼저 하세요</div>
	</c:if>
	<c:if test="${error == 'PASSWORD_FAIL'}">
		<div class="w3-red w3-padding-16">* 비밀번호가 틀렸습니다</div>
	</c:if>
	<label class="w3-text-blue">User Name(ID)</label>
	<input name="username" id="username" placeholer="USERNAME" class="w3-input w3-border">
	<label class="w3-text-blue">비밀번호</label>	
	<input name="password" id="password" placeholer="PASSWORD" class="w3-input w3-border">
	
	<button class="w3-button w3-blue btn-login" type="button">로그인</button>
	
</form>
</body>
</html>