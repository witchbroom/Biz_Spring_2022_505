<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
form.student.input{
	width:80%;
	margin:20px auto;
}
form.student.input div{
	display:flex;
}
form.student.input input,
form.student.input button{
	flex:1;
	padding:16px 12px;
	margin:5px;
}
</style>


<form method="POST" class="student input">
	<div>
		<h3>이름 :</h3>
		<input name="st_name" type="text" value="${STUDENT.st_name}" />
	</div>
	<div>
		<h3>학과 :</h3>
		<input name="st_dept" type="text" value="${STUDENT.st_dept}" />
	</div>
	<div>
		<h3>전화번호 :</h3>
		<input name="st_tel" type="tel" value="${STUDENT.st_tel}" />
	</div>
	<div>
		<h3>주소 :</h3>
		<input name="st_addr" type="text" value="${STUDENT.st_addr}" />
	</div>
	<div>
		<button>수정하기</button>
	</div>
</form>
