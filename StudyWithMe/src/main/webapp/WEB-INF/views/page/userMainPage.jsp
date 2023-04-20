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
<!-- 헤드 태그 안에 들어가는 공통코드 -->
<link rel="stylesheet" href="resources/css/userMainPage.css"
	type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	
</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%>

<body>
	<h1>스터디 위드 미</h1>
	<p>
		<sec:authentication property="principal.username" />
		님 환영합니다.
	</p>
	<div>
		<h1 id="study-title">스터디카페 위치</h1>
		<div class="modal">
			<div class="modal-content">
				<div class="modal-top">
					<span class="close">&times;</span>
					<p>이용하실 스터디카페를 검색해 주세요.</p>
					<hr>
				</div>

				<div>
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
		</div>
				<button type="button" class="btn"><img class="img" src="/resources/image/search.jpg"></button>

<!-- 		<button type="button" class="btn btn-primary mx-2">
			<i class="bi bi-search"></i>
		</button> -->

	</div>

	<div>
				<button type="button"  onclick="location.href='/paymentSeatPage'">충전하기</button>
<!-- 
		<button type="button" class="btn btn-primary mx-2"
			onclick="location.href='/'">충전하기</button>
 -->

		<div class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<p>QR code</p>
			</div>
		</div>
				<button type="button" class="btn">QR 코드</button>

<!-- 		<button type="button" class="btn btn-primary mx-2">QR 코드</button>
 -->
 	</div>
	<!-- Add Bootstrap JS -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>


	<!-- js 파일 경로 -->
	<script type="text/javascript" src="/resources/js/userMainPage.js"></script>

</body>
</html>
