<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<div class="student detail">
	<div class="student detail_body">학번</div><div>${STUDENT.st_num }</div>
	<div class="student detail_body">이름</div><div>${STUDENT.st_name }</div>
	<div class="student detail_body">학과</div><div>${STUDENT.st_dept}</div>
	<div class="student detail_body">전화번호</div><div>${STUDENT.tel }</div>
	<div class="student detail_body">주소</div><div>${STUDENT.st_addr}</div>
</div>

<div>
	<c:forEach items="${STUDENT.scoreList}" var="SCORE">
		<div>${SCORE.sb_name} (${SCORE.sc_sbcode}) : ${SCORE.sc_score}</div>
	</c:forEach>
</div>

<div>
	<a href="${rootPath}/student/update?st_num=${STUDENT.st_num}">수정하기</a>
</div>