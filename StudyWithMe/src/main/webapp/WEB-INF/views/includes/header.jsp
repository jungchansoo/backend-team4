<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<style>

/* 헤더 스타일 설정 */
.header {
	width: 100%;
	background-color: #FFF;
	border-bottom: 1px solid #DDD;
	padding: 10px;
	box-sizing: border-box;
	margin: 0;
	font-family: Arial, sans-serif;
}

.header-logo {
	font-weight: bold;
	font-size: 24px;
	color: #333;
	text-decoration: none;
	display: inline-block;
	vertical-align: middle;
}

.header-nav {
	display: table;
	table-layout: fixed;
	width: 100%;
	height: 100%;
	text-align: center;
}

.header-nav ul {
	display: table-row;
	list-style: none;
	margin: 0;
	padding: 0;
	background: none;
	
}

.header-nav li {
	display: table-cell;
	list-style: none;
	vertical-align: middle;
	float: none;
}

.header-nav a {
	color: #2196F3;
	text-decoration: none;
	font-size: 23px;
	font-weight: bold;
	transition: all 0.3s ease;
}

.header-nav a:hover {
	color: #035a9e;
}
</style>

<header class="header">
	<nav class="header-nav">
		<ul>

			<li><a href="/"> <img
					src="resources/image/logo.png" alt="로고" width="100" height="100"
					class="header-logo">
			</a></li>
			<li><a href="/" class="active header-link">Home</a></li>
			<li><a href="#" class="header-link">공지사항</a></li>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="/userlist" class="header-link">유저 관리</a></li>
				<li><a href="/ticketManagement" class="header-link">요금 관리</a></li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_USER')">
				<li><a href="/userstudyseat" class="header-link">스터디석</a></li>
				<li><a href="/userstudylocker" class="header-link">사물함</a></li>
				<li><a href="/userstudyroom" class="header-link">스터디룸</a></li>
				<li><a href="#" class="header-link">응원리뷰</a></li>
				<li><a href="/userinfo" class="header-link">마이페이지</a></li>
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ROLE_MANAGER')">
				<li><a href="/managerstudyseat" class="header-link">스터디석 관리</a></li>
				<li><a href="/managerlocker" class="header-link">사물함 관리</a></li>
				<li><a href="#" class="header-link">스터디룸 관리</a></li>
				<li><a href="#" class="header-link">응원리뷰 관리</a></li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li><a href="/logout" class="header-link">로그아웃</a></li>
			</sec:authorize>
			<sec:authorize access="!isAuthenticated()">
				<li><a href="/login" class="header-link">로그인</a></li>
			</sec:authorize>
		</ul>
	</nav>
</header>
