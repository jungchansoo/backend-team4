<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디센터</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="/userMainPage"> <img
					src="resources/image/logo.png" alt="로고" width="70" height="70">
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link" href="/userMainPage">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<li class="nav-item"><a class="nav-link" href="#">유저 관리</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="#">요금 관리</a>
							</li>
						</sec:authorize>
						<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_MANAGER')">
							<li class="nav-item"><a class="nav-link"
								href="/userstudyseat">스터디석</a></li>
							<li class="nav-item"><a class="nav-link" href="#">사물함</a></li>
							<li class="nav-item"><a class="nav-link" href="#">스터디룸</a></li>
							<li class="nav-item"><a class="nav-link" href="#">응원리뷰</a></li>
							<li class="nav-item"><a class="nav-link" href="/userinfo">마이페이지</a>
							</li>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a>
							</li>
						</sec:authorize>
						<sec:authorize access="!isAuthenticated()">
							<li class="nav-item"><a class="nav-link" href="/login">로그인</a>
							</li>
						</sec:authorize>
					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>