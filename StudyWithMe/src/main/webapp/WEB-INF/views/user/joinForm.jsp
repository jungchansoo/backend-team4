<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/joinForm.js"></script>
</head>
<body>
	<h1>회원가입</h1>
	<form action="/join" method="post">
		<label for="userId">아이디:</label> <input type="text" id="userId"
			name="userId" required oninput="checkUserId()">
		<button type="button" id="id-check-btn">아이디 중복 확인</button>
		<span id="id-check-result"></span><br>
		<span id="userId-check-result"></span> <br> <label for="password">비밀번호:</label>
		<input type="password" id="password" name="password" required
			oninput="checkPassword()"><br> <br> <span
			id="password-check-result"></span> <br> <label
			for="password-confirm">비밀번호 확인:</label> <input type="password"
			id="password-confirm" name="password-confirm" required><br>
		<br> <span id="password-same-result"></span> <br> <br>
		<label for="userName">이름:</label> <input type="text" id="userName"
			name="userName" required><br> <br> <label
			for="phoneNumber">전화번호:</label> <input type="text" id="phoneNumber"
			name="phoneNumber" required oninput="checkPhonNumber()"> <br>
		<br> <span id="phoneNumber-check-result"></span> <br> <br>
		<!-- 문자 인증 -->
		<div class="input-group-addon">
			<button type="button" class="btn btn-primary" id="sms-Check-Btn">문자
				인증</button>
			<span id="sms-countdown-timer"></span>

			<div class="sms-check-box">
				<input class="form-control sms-check-input"
					placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
			</div>
			<span id="sms-check-warn"></span>
		</div>



		<br> <label for="email">이메일:</label>
		<!-- 		메일 인증 -->
		<input type="email" id="email" name="email" required><br>
		<br>
		<div class="input-group-addon">
			<button type="button" class="btn btn-primary" id="mail-Check-Btn">메일인증</button>
			<span id="email-countdown-timer"></span>

			<div class="mail-check-box">
				<input class="form-control mail-check-input"
					placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
			</div>
			<span id="mail-check-warn"></span>
		</div>

		<label for="role">역할:</label> <input type="radio" id="user"
			name="role" value="user" checked> <label for="user">사용자</label>
		<input type="radio" id="manager" name="role" value="manager">
		<label for="manager">운영자</label> <input type="radio" id="admin"
			name="role" value="admin"> <label for="admin">관리자</label><br>
		<br> <button id="register-btn">회원가입</button>

		<input
			type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</body>
</html>