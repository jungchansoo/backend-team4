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
<!-- 헤드 태그 안에 들어가는 공통코드 -->
<link rel="stylesheet" href="resources/css/userMainPage.css"
	type="text/css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- 사이드바 -->
<link rel="stylesheet" href="resources/css/sidebar.css" type="text/css">
</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%>
<body>

	<style>
li a.chagepw {
	background: #333;
	color: #fff;
}
/* 폼태그속 디자인 */
#updatePwForm {
	margin: auto;
}

.text {
	padding: 40px 60px;
}

.clickbutton {
	text-align: center;
}

.text div label {
	width: calc(100%/ 4 - 2px);
	display: inline-block;
	padding: 10px;
	margin: 10px 5px;
}

.text div input {
	border: solid 2px #efefef;
	border-radius: 10px;
	background-color: #efefef;
	height: 45px;
	font-size: 16px;
	width: calc(100%/ 3 - 2px);
}

.submit-button, .back-button {
	background-color: #B2ECC7;
	color: #000;
	border-radius: 12px;
	padding: 8px 30px;
	border: none;
	margin: 30px;
	display: inline-block;
	font-weight: bold;
	font-size: 15px;
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
		<p>비밀번호 변경</p>
		<hr>

		<form id="updatePwForm" action="/updatePw" method="post">
			<input type="hidden" id="csrfToken" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="text">
				<div>
					<label for="current_pw">기존 비밀번호</label> <input type="password"
						id="current_pw" name="currentPassword" required>
				</div>
				<div>
					<label for="new_pw">새로운 비밀번호</label> <input type="password"
						id="new_pw" name="newPassword" required>
				</div>
				<div>
					<label for="pw_confirm">새로운 비밀번호 확인</label> <input type="password"
						id="pw_confirm" name="newPasswordConfirm" required>
				</div>
			</div>
			<div class="clickbutton">
				<button type="submit" class="submit-button" onclick="updatePw()">변경</button>
				<button type="button" class="back-button"
					onclick="location.href='userMainPage'">취소</button>
			</div>

		</form>


	</div>

	<!-- jQuery 라이브러리 로드 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		// CSRF 토큰 설정
		const csrfTokenValue = $('#csrfToken').val();
		var current_pw = $("#current_pw").val();
		var new_pw = $("#new_pw").val();
		var pw_confirm = $("#pw_confirm").val();

		// 변경 버튼 클릭시
		function updatePw() {
			// 입력값 유효성 검사
			/* if (current_pw == '' || new_pw == '' || pw_confirm == '') {
				alert("모든 항목을 입력해주세요.");
				return;
			}
			*/
if (confirm("비밀번호를 변경하시겠습니까?")) {
  // 서버에 비밀번호 변경 요청 보내기
  $.ajax({
    url: "/updatePw",
    method: "POST",
    headers: {
      "X-CSRF-Token": csrf_token // CSRF 토큰 설정
    },
    data: {
      currentPassword: current_pw,
      newPassword: new_pw,
      newPasswordConfirm: pw_confirm
    },
    success: function() {
      // 새 비밀번호와 비밀번호 확인이 일치하는지 확인
      if (new_pw !== pw_confirm) {
        alert("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        return;
      }
      // 비밀번호 변경 성공시
      alert("비밀번호가 성공적으로 변경되었습니다.");
      location.href = "/userinfo";
    },
    error: function(xhr, status, error) {
      // 비밀번호 변경 실패시
      alert("비밀번호 변경에 실패했습니다. 잠시 후 다시 시도해주세요.");
    }
  });
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