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
</head>
<body>

<table>
	<tr>
		<th>학번</th>
		<th>이름</th>
		<th>학과</th>
		<th>학년</th>
		<th>연락처</th>
		<th>주소</th>
	</tr>
	<c:forEach items="${STUDENTS}" var="ST" varStatus="">
		<tr>
			<td>{ST.st_num}</td>
			<td>{ST.st_name}</td>
			<td>{ST.st_dept}</td>
			<td>{ST.st.grade}</td>
			<td>{ST.st_tel}</td>
			<td>{ST.st_addr}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>