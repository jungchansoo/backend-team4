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
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	
</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%>
<body>
	<h1>Mypage</h1>

	<!-- <style>
ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
	width: 120px;
	background-color: #efefef;
	height: 100%;
	position: fixed;
}

li a {
	display: block;
	color: #000;
	font-weight: bold;
	padding: 10px;
	text-decoration: none;
}

li a:hover {
	background-color: #333;
	color: #fff;
}

li a.reservatelist {
	background-color: #333;
	color: #fff;
}

/* .sidebar-content {
	display: flex;
	align-items: center;
	justify-content: space-between;
	flex-grow: 1;
	flex-direction: row;
} */
.sidebar-content {
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-wrap: wrap;
  margin-top: auto;
  margin-bottom: 0;
}

.sidebar-content p {
	text-align: center;
	font-size: 0.7em;
}

.logo {
	width: 12px;
	height: 12px;
	cursor: pointer;
	margin-left: auto;
}

.cd1 {
	margin-left: 140px;
}
</style> -->

	<ul>
  <li><a class="userinfo" href="/userinfo">회원정보</a></li>
  <li><a class="reservatelist" href="/reservationList">예약내역</a></li>
  <li><a class="chagepw" href="/updatePw">비밀번호변경</a></li>
  <li><a class="deleteid" href="/deleteUser">회원탈퇴</a></li>
  <li class="sidebar-content">
      <p><sec:authentication property="principal.user.userId" /></p>
      <p><sec:authentication property="principal.user.phoneNumber" /></p>
      <img src="/resources/image/logout_icon.png" alt="로고" class="logo" onclick="#">
  </li>
</ul>




	<div class="cd1">
		예약 내역
		<hr>
		<table>
			<thead>
				<tr>
					<th>이용지점</th>
					<th>예약 날짜</th>
					<th>좌석종류</th>
					<th>이용시간</th>
				</tr>
			</thead>
			<tbody>
				<!-- tbl_reservation에 있는 db값을 넣기 -->
				<c:forEach var="reservation" items="${reservations}">
					<tr>
						<td>${reservation.location}이용지점예시</td>
						<td>${reservation.date}예약날짜예시</td>
						<td>${reservation.seatType}좌석종류예시</td>
						<td>${reservation.time}이용시간예시</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>




		<hr>
	</div>



	<script>
		
	</script>



</body>
</html>
