<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	display: flex;
	align-items: center;
	justify-content: flex-start;
	padding: 10px;
}

.logo {
	font-weight: bold;
	font-size: 24px;
	color: #333;
	text-decoration: none;
}

img{
	margin-left: 30px;
}

nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: flex;
}

nav li {
	margin-right: 150px;
}

nav li:first-child {
	margin-left: 150px;
}

nav li:last-child {
	margin-right: 0;
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
</style>
<title>스터디센터</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<header>
	<a href="/userMainPage">
		<img src="resources/image/logo.png"
			alt="로고" width="70" height="70">
			</a>
		<nav>
			<ul>
			<!-- 공지사항,스터디석,사물함,스터디룸,응원리뷰는 메인페이지에서 선택한 스터디카페no 가 넘어가야함. a태그 처리로 안됨 -->
			<!-- 아래 a태그는 임시로 처리함 -->
				<li><a href="/userMainPage" class="active">Home</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="/userstudyseat">스터디석</a></li>
				<li><a href="#">사물함</a></li>
				<li><a href="#">스터디룸</a></li>
				<li><a href="#">응원리뷰</a></li>
				<li><a href="/userinfo">마이페이지</a></li>
			</ul>
		</nav>
	</header>
	<main>
		<!-- 메인 콘텐츠 -->
	</main>
</body>
</html>