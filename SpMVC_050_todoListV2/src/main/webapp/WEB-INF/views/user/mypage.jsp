<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Insert title here</title>
</head>
<body>
	<h1>mypage</h1>	
	<ul>
		<li><strong>User Name : </strong><sec:authentication property="principal.username"/></li>
		<li><strong>Email : </strong><sec:authentication property="principal.email"/></li>
		<li><strong>실명 : </strong><sec:authentication property="principal.realname"/></li>
		<li><strong>닉네임 : </strong><sec:authentication property="principal.nickname"/></li>
		<li><strong>전화번호 : </strong><sec:authentication property="principal.tel"/></li>
	</ul>
</body>
</html>