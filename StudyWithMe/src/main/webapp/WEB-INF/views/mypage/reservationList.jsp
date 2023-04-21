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
<link rel="stylesheet" href="resources/css/sidebar.css" type="text/css">
	
</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%>
<body>
	<style>
	li a.reservatelist {
	background: #333;
	color: #fff;
}
table {
border-radius: 12px;
border: solid 2px black;
width:90%;
margin: auto;
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
	<!-- 검색 기능 -->
	<input id="csrfToken" type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	<!-- 예약 목록 리스트 -->
		<p>예약 내역</p>
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
		
	<!-- 하단 페이징처리 -->
	</div>

</body>
</html>
