<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
</head>
<body>
<style>
ul {
	list-style-type: none;
	padding: 0px;
	margin: 0px;
	width: 120px;
	background: #efefef;
	height: 100%;
	overflow: auto;
	position: fixed;
}

li a {
	text-decoration: none;
	padding: 10px;
	display: block;
	color: #000;
	font-weight: bold;
}

li a:hover {
	background: #333;
	color: #fff;
}

li a.deleteid {
	background: #333;
	color: #fff;
}

.cd1 {
	margin-left: 140px;
}
</style>	

	<ul>
		<li><a class="userinfo" href="/userinfo">회원정보</a></li>
		<li><a class="reservatelist" href="#">예약내역</a></li>
		<li><a class="chagepw" href="/updatePw">비밀번호변경</a></li>
		<li><a class="deleteid" href="/deleteUser">회원탈퇴</a></li>
	</ul>
	
	<div class="cd1"> 회원탈퇴
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<p>이름: <sec:authentication property="principal.user.userName"/></p>
	<p>아이디: <sec:authentication property="principal.user.userId"/></p>
	
	<form method="post" action="/deleteUser">
		<label for="password">비밀번호:</label>
		<input type="password" id="password" name="password" required><br>
		
		<label for="passwordConfirm">비밀번호 확인:</label>
		<input type="password" id="passwordConfirm" name="passwordConfirm" required><br>
		
		<c:if test="${not empty message}">
			<p style="color: green;">${message}</p>
		</c:if>
		
		<c:if test="${not empty error}">
			<p style="color: red;">${error}</p>
		</c:if>
		
		<input type="hidden" name="userId" value="${userId}">
		<button type="submit">회원 탈퇴</button>
	</form>
	
	</div>
	
</body>
</html>
