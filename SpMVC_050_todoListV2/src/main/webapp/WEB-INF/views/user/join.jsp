<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입</h1>
	<form:form>
		<div><input name="username" placeholder="USERNAME"></div>
		<div><input name="password" type="password"/></div>
		<div><input name="re_password" type="password"/></div>
		<div><input name="email" placeholder="E-mail"/></div>
		<div><input name="realname" placeholder="실명입력"/></div>
		<div><input name="nickname" placeholder="닉네임 입력"/></div>
		<button>회원가입</button>
	</form:form>
</body>
</html>