<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<title>MyPage</title>

<link rel="stylesheet" href="resources/css/sidebar.css" type="text/css">
</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%>
<body>

	<style>
li a.deleteid {
	background: #333;
	color: #fff;
}
/* 폼태그속 디자인 */
#deleteid {
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

/* 모달 디자인 */
 #deleteModal {
	text-align: center;
}

#deleteModal p {
	font-size: 20px;
} 

#deleteModal button {
	background-color: #B2ECC7;
	color: #000;
	border-radius: 12px;
	padding: 8px 30px;
	border: none;
	margin: 30px;
	display: inline-block;
	font-weight: bold;
	font-size: 15px;
	margin: auto;
}

.submit-button {
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
		<p>회원탈퇴</p>
		<hr>
		<form id="deleteid" action="/deleteUser" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="userId"
				value="<sec:authentication property='principal.user.userId'/>" />

			<div class="text">
				<div>
					<label for="userName">이름</label>
					<sec:authentication property="principal.user.userName" />
				</div>
				<div>
					<label for="userId">아이디</label>
					<sec:authentication property="principal.user.userId" />
				</div>
				<div>
					<label for="password">비밀번호</label> <input type="password"
						id="password" name="password">
				</div>
				<div>
					<label for="passwordConfirm">비밀번호 확인</label> <input type="password"
						id="passwordConfirm" name="passwordConfirm">
				</div>
			</div>
			<div class="clickbutton">
				<button type="button" class="submit-button"
					onclick="checkPassword()">탈퇴</button>
			</div>
		</form>



	</div>


	<!-- 모달 코드 -->
	<div id="deleteModal" class="modal">
		<p>정말 탈퇴하시겠습니까?</p>
		<button class="yes" onclick="deleteUser()">확인</button>
		<button class="no" onclick="none()">취소</button>
	</div>



	<!-- 스크립트 코드 -->
	<script>
		function deleteUser() {
			// 모달창 확인 버튼 클릭 후 로직
			$('#deleteModal').modal('hide');
			$('#deleteid').submit();
		}
		function none() {
			$('#deleteModal').hide();
			location.reload();
		}

		function checkPassword() {
			// 비밀번호 검증 로직
			var password = $('#password').val();
			var passwordConfirm = $('#passwordConfirm').val();

			if (password === passwordConfirm) {
				$('#deleteModal').modal('show');
			} else {
				alert('비밀번호가 일치하지 않습니다.');
			}
		}
	</script>




</body>


</html>

