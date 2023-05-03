<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>

<!-- Add Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/sidebar.css" type="text/css">
<style>
li a.userinfo {
	background: #333;
	color: #fff;
}
/* 폼태그속 디자인 */
#actionForm {
	margin: auto;
}

table {
	min-width: 800px;
}

th {
	width: calc(100%/ 2 - 2px); /* form태그의 너비보다 조금 작게 만들기 */
	text-align: center;
	padding: 20px;
	font-weight: normal;
}

td {
	width: calc(100%/ 2 - 2px); /* form태그의 너비보다 조금 작게 만들기 */
	padding: 20px;
}
</style>

</head>
<body>
	<!-- 헤더 -->
	<%@include file="../includes/header.jsp"%>



	<ul class="sidebar">
		<li class="side_title">Mypage</li>
		<li><a class="userinfo" href="/userinfo">회원정보</a></li>
		<li><a class="reservatelist" href="/reservationList">예약내역</a></li>
		<li><a class="chagepw" href="/updatePw">비밀번호변경</a></li>
		<li><a class="deleteid" href="/deleteUser">회원탈퇴</a></li>
	</ul>


	<div class="cd1">

		<p>회원정보</p>
		<hr>

		<form id="actionForm" action="getuserinfo" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<table>
				<tr>
					<th>이름</th>
					<td><sec:authentication property="principal.user.userName" /></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><sec:authentication property="principal.user.userId" /></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><sec:authentication property="principal.user.email" /></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><sec:authentication property="principal.user.phoneNumber" /></td>
				</tr>
				<tr>
					<th>잔여시간</th>
					<td>스터디석 : ${seattime}<br> 
					스터디룸 : ${roomtime}  <br>
					사물함 : ${lockertime}
					</td>
				</tr>
			</table>
		</form>


	</div>


</body>
<%@include file="../includes/footer.jsp"%>
</html>