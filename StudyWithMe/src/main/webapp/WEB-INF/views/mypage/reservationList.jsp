<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>
	<h1>Mypage</h1>

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

li a.reservatelist {
	background: #333;
	color: #fff;
}

.cd1 {
	margin-left: 140px;
}
</style>




	<ul>
		<li><a class="userinfo" href="/userinfo">회원정보</a></li>
		<li><a class="reservatelist" href="/reservationList">예약내역</a></li>
		<li><a class="chagepw" href="/updatePw">비밀번호변경</a></li>
		<li><a class="deleteid" href="/deleteUser">회원탈퇴</a></li>
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
