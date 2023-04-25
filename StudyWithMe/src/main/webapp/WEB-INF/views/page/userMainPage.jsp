<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%!// 변수 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String uid = "ADMIN";
	String pwd = "StudyWithMe4$";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String sql = "select * from TBL_USER";%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study with me</title>


<!-- Add Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- 헤드 태그 안에 들어가는 공통코드 -->
<link rel="stylesheet" href="resources/css/userMainPage.css"
	type="text/css">
</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%>

<body>
	<div class="container title-container">
		<div class="row align-items-start">
			<div class="col-lg-6 col-md-12">
				<h1 class="display-4 title-text-color">스터디 위드 미</h1>
				<p class="lead user-text-color">
					<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.username" /> 님 환영합니다.
					</sec:authorize>
					<sec:authorize access="!isAuthenticated()">
						스터디 위드 미 서비스에 오신 것을 환영합니다.
					</sec:authorize>
				</p>
				<div class="d-flex searchBar">
					<sec:authorize access="hasAnyRole('ROLE_USER', 'ROLE_ADMIN')">
						<h2 id="study-title" class="mr-auto title-text-color">스터디카페를
							선택해주세요.</h2>
						<button type="button"
							class="btnForModal btn btn-outline-custom search-button">
							<i class="bi bi-search"></i>
						</button>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_MANAGER')">
						<h2 id="study-title" class="mr-auto title-text-color"><%=session.getAttribute("cafeName")%></h2>
					</sec:authorize>

				</div>
				<hr class="line-divider">
				<div class="d-flex buttons-container mb-3">
					<sec:authorize access="hasRole('ROLE_USER')">
						<button type="button" class="btn btn-primary btn-lg mr-2"
							onclick="location.href='/paymentSeatPage'">충전하기</button>
						<button type="button"
							class="btnForModal btn btn-outline-primary btn-lg">QR 코드</button>
					</sec:authorize>
					<sec:authorize access="!isAuthenticated()">
						<button type="button" class="btn btn-outline-primary btn-lg"
							onclick="location.href='/login'">로그인</button>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('ROLE_MANAGER', 'ROLE_ADMIN')">
						<button type="button" class="btn btn-outline-primary btn-lg"
							onclick="location.href='/logout'">로그아웃</button>
					</sec:authorize>
				</div>
			</div>
			<div class="col-lg-6 col-md-12 mb-3">
				<img class="img-fluid" src="/resources/image/mainPageImage.png"
					style="width: 130%;">
			</div>
		</div>
	</div>



	<!-- Modal -->
	<div class="modal">
		<div class="modal-content">
			<div class="modal-top">
				<span class="close">&times;</span>
				<p>이용하실 스터디카페를 검색해 주세요.</p>
				<hr>
			</div>

			<div class="modal-body">
				<div class="row">
					<div id='searchForm'>
						<input type='text' id='keyword' name='keyword' /> <input
							type='hidden' id='pageNum' name='pageNum' value='1' />
						<button id="search-check-btn">Search</button>
					</div>
				</div>
				<!-- 스터디카체 리스트 출력-->
				<table id="study-table">
					<thead>
						<tr>
							<td>스터디카페</td>
							<td>주소</td>
						</tr>
					</thead>
				</table>

				<div id="page-numbers"></div>
			</div>
		</div>
		<!-- QR 코드 -->
		<div class="modal">
			<div class="modal-content">
				<div class="modal-top">
					<span class="close">&times;</span>
					<p>출입문 개폐를 위해 QR코드를 인식해 주세요.</p>
					<hr>
				</div>
			</div>
		</div>
	</div>


	<!-- js 파일 경로 -->
	<script type="text/javascript" src="/resources/js/userMainPage.js"></script>

</body>
<%@include file="../includes/footer.jsp"%>

</html>

