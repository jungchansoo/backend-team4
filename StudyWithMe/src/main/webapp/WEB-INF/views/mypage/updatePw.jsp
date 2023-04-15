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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

li a.chagepw {
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
		비밀번호 변경
		<hr>

		<form id="updatePwForm" action="/userpwchangers" method="post">
			<input type="hidden" id="csrfToken" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div>
				<label for="current_pw">기존 비밀번호</label> <input type="password"
					id="current_pw" name="password">
			</div>
			<div>
				<label for="new_pw">새로운 비밀번호</label> <input type="password"
					id="new_pw" name="newPassword">
			</div>
			<div>
				<label for="pw_confirm">새로운 비밀번호 확인</label> <input type="password"
					id="pw_confirm" name="newPasswordConfirm">
			</div>
			<button type="button" onclick="updatePassword()">변경하기</button>
			<input type="button" value="뒤로가기" onclick="location.href='main.jsp'">
			
		</form>



		<hr>
	</div>



	<script>
		function updatePassword() {
			var currentPw = document.getElementById("current_pw").value;
			var newPw = document.getElementById("new_pw").value;
			var pwConfirm = document.getElementById("pw_confirm").value;

			if (newPw !== pwConfirm) {
				alert("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				return;
			}

			// 비밀번호 변경 요청을 보낼 AJAX 코드 작성
			var xhr = new XMLHttpRequest();
			const csrfTokenValue = $('#csrfToken').val();

			
			xhr.open("PUT", "/userpwchangers", true);
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr.setRequestHeader("X-CSRF-TOKEN", csrfTokenValue); //헤더에 csrf Token 셋팅

			xhr.onload = function() {
				if (xhr.status === 200) {
					alert("비밀번호가 변경되었습니다.");
					window.location.href = "/mypage/userinfo";
				} else {
					alert("비밀번호 변경에 실패했습니다.");
				}
			};
			var data = {
				currentPassword : currentPw,
				newPassword : newPw
			};
			xhr.send(JSON.stringify(data));
		}
	</script>



</body>
</html>


<!-- <script>
		function newpwcheck(newpw,pwcheck){
			if(arguments[0]===arguments[1]){
				alert('성공');
			}
		}
	</script> -->