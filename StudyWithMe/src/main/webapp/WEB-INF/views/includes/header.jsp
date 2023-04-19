<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* 전체 스타일 설정 */
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial, sans-serif;
}

/* 헤더 스타일 설정 */
header {
	background-color: #FFF;
	border-bottom: 1px solid #DDD;
	padding: 10px;
}

.logo {
	font-weight: bold;
	font-size: 24px;
	color: #333;
	text-decoration: none;
	display: inline-block;
	vertical-align: middle;
}

nav {
	display: table;
	table-layout: fixed;
	width: 100%;
	text-align: center;
}

nav ul {
	display: table-row;
	list-style: none;
	margin: 0;
	padding: 0;
}

nav li {
	display: table-cell;
	list-style: none;
	vertical-align: middle;
}

nav a {
	color: #2196F3;
	text-decoration: none;
	font-size: 23px;
	font-weight: bold;
	transition: all 0.3s ease;
}

nav a:hover {
	color: #035a9e;
}

/* 화면 크기가 768px 이하일 때 세로로 쓰이는 문제 해결 */
@media screen and (max-width: 768px) {
	nav ul {
		display: flex;
		flex-direction: column;
	}
	nav li {
		display: block;
	}
}
</style>
<title>스터디센터</title>
<link rel="stylesheet" href="style.css">
</head>
<header>

	<nav>
		<ul>
			<!-- 공지사항,스터디석,사물함,스터디룸,응원리뷰는 메인페이지에서 선택한 스터디카페no 가 넘어가야함. a태그 처리로 안됨 -->
			<!-- 아래 a태그는 임시로 넣어둠 -->
			<li><a href="/userMainPage"> <img
					src="resources/image/logo.png" alt="로고" width="100" height="100">
			</a></li>
			<li><a href="/userMainPage" class="active">Home</a></li>
			<li><a href="#">공지사항</a></li>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="#">유저 관리</a></li>
				<li><a href="#">요금 관리</a></li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_MANAGER')">
				<li><a href="/userstudyseat">스터디석</a></li>
				<li><a href="#">사물함</a></li>
				<li><a href="#">스터디룸</a></li>
				<li><a href="#">응원리뷰</a></li>
				<li><a href="/userinfo">마이페이지</a></li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li><a href="/logout">로그아웃</a></li>
			</sec:authorize>
			<sec:authorize access="!isAuthenticated()">
				<li><a href="/login">로그인</a></li>
			</sec:authorize>
		</ul>
	</nav>
</header>