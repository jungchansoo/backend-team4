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
<!-- 헤드 태그 안에 들어가는 공통코드 -->
<link rel="stylesheet" href="resources/css/userMainPage.css"
	type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/sidebar.css"
	type="text/css">

</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%><body>

	<style>
li a.userinfo {
	background: #333;
	color: #fff;
}
/* 폼태그속 디자인 */
#actionForm {
	min-height: 500px;
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
					<td>스터디석 :<sec:authentication
							property="principal.user.remainingSeatTime" /><br> 스터디룸 :<sec:authentication
							property="principal.user.remainingStudyRoomTime" /><br> 사물함
						:<sec:authentication property="principal.user.remainingLockerTime" />
					</td>
				</tr>
			</table>
		</form>


	</div>


</body>
</html>