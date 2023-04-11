<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%!// 변수 선언
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String uid = "ADMIN";
	String pwd = "StudyWithMe4$";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String sql = "select * from TBL_USER";%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0, 0, 0); /* Fallback color */
		background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	}
	/* Modal Content/Box */
	.modal-content {
		background-color: #fefefe;
		margin: 15% auto; /* 15% from the top and centered */
		padding: 20px;
		border: 1px solid #888;
		width: 50%; /* Could be more or less, depending on screen size */
	}
	/* The Close Button */
	.close {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	
	.close:hover, .close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
	.img{
		height: 20px;
		weight: 20px;
	}
</style>

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<div class="container-fluid">
		
		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav me-auto">
				<li class="nav-item"><a class="nav-link active" href="#">Home
						<span class="visually-hidden">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">공지사항</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">스터디석</a></li>
				<li class="nav-item"><a class="nav-link" href="#">사물함</a></li>
				<li class="nav-item"><a class="nav-link" href="#">스터디룸</a></li>
				<li class="nav-item"><a class="nav-link" href="#">응원리뷰</a></li>
				<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<h1>스터디 위드 미</h1>
	
	<p><sec:authentication property="principal.username"/> 님 환영합니다.</p>
	
	<div>
		<h1>스터디카페 위치</h1>
		
		<div class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<p>
					Lorem ipsum, dolor sit amet consectetur adipisicing elit. Expedita
				dolore eveniet laborum repellat sit distinctio, ipsa rem dicta alias
				velit? Repellat doloribus mollitia dolorem voluptatum ex reiciendis
				aut in incidunt?
				</p>
			</div>
		</div>

		<button type="button" class="btn"><img class src="/resources/image/search.jpg"></button>
	</div>
	
	<div>
		<button type="button"  onclick="location.href='/'">충전하기</button>

		<div class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<p>
					Lorem ipsum, dolor sit amet consectetur adipisicing elit. Expedita
				dolore eveniet laborum repellat sit distinctio, ipsa rem dicta alias
				velit? Repellat doloribus mollitia dolorem voluptatum ex reiciendis
				aut in incidunt?
				</p>
			</div>
		</div>

		<button type="button" class="btn">QR 코드</button>
	</div>

	


	<script>
		// Modal을 가져옵니다.
		var modals = document.getElementsByClassName("modal");
		// Modal을 띄우는 클래스 이름을 가져옵니다.
		var btns = document.getElementsByClassName("btn");
		// Modal을 닫는 close 클래스를 가져옵니다.
		var spanes = document.getElementsByClassName("close");
		var funcs = [];

		// Modal을 띄우고 닫는 클릭 이벤트를 정의한 함수
		function Modal(num) {
			return function() {
				// 해당 클래스의 내용을 클릭하면 Modal을 띄웁니다.
				btns[num].onclick = function() {
					modals[num].style.display = "block";
					console.log(num);
				};

				// <span> 태그(X 버튼)를 클릭하면 Modal이 닫습니다.
				spanes[num].onclick = function() {
					modals[num].style.display = "none";
				};
			};
		}

		// 원하는 Modal 수만큼 Modal 함수를 호출해서 funcs 함수에 정의합니다.
		for (var i = 0; i < btns.length; i++) {
			funcs[i] = Modal(i);
		}

		// 원하는 Modal 수만큼 funcs 함수를 호출합니다.
		for (var j = 0; j < btns.length; j++) {
			funcs[j]();
		}

		// Modal 영역 밖을 클릭하면 Modal을 닫습니다.
		window.onclick = function(event) {
			if (event.target.className == "modal") {
				event.target.style.display = "none";
			}
		};
	</script>

</body>
</html>
