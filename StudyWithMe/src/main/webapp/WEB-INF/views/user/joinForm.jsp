<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="_csrf_parameter" content="${_csrf.parameterName}">
<meta name="_csrf" content="${_csrf.token}">
<title>회원가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h1 class="text-center mb-4">회원가입</h1>
						<form action="/join" method="post" class="mt-4">
							<div class="form-group">
								<label for="userId">아이디</label>
								<div class="input-group">
									<input type="text" class="form-control" id="userId"
										name="userId" required oninput="checkUserId()">
									<div class="input-group-append">
										<button type="button" class="btn btn-primary"
											id="id-check-btn">중복 확인</button>
									</div>
								</div>
								<small id="id-check-result" class="form-text text-muted"></small>
								<small id="userId-check-result" class="form-text text-muted"></small>
							</div>
							<div class="form-group">
								<label for="password">비밀번호</label> <input type="password"
									class="form-control" id="password" name="password" required
									oninput="checkPassword()"> <small
									id="password-check-result" class="form-text text-muted"></small>
							</div>
							<div class="form-group">
								<label for="password-confirm">비밀번호 확인</label> <input
									type="password" class="form-control" id="password-confirm"
									name="password-confirm" required> <small
									id="password-same-result" class="form-text text-muted"></small>
							</div>
							<div class="form-group">
								<label for="userName">이름</label> <input type="text"
									class="form-control" id="userName" name="userName" required>
							</div>
							<div class="form-group">
								<label for="phoneNumber">전화번호</label> <input type="text"
									class="form-control" id="phoneNumber" name="phoneNumber"
									required oninput="checkPhonNumber()"> <small
									id="phoneNumber-check-result" class="form-text text-muted"></small>
							</div>
							<div class="form-group">
								<!-- 문자 인증 -->
								<div class="input-group">
									<input type="text" class="form-control sms-check-input"
										placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled"
										maxlength="6">
									<div class="input-group-append">
										<button type="button" class="btn btn-primary"
											id="sms-Check-Btn">문자 인증</button>
									</div>
								</div>
								<small id="sms-check-warn" class="form-text text-muted"></small>
								<span id="sms-countdown-timer"></span>
							</div>

							<div class="form-group">
								<label for="email">이메일</label><input type="text"
									class="form-control" id="email" name="email"
									required>
								<div class="input-group">
									<input type="text" class="form-control mail-check-input"
										placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled"
										maxlength="6">
									<div class="input-group-append">
										<button type="button" class="btn btn-primary"
											id="mail-Check-Btn">메일인증</button>
									</div>
								</div>
								<small id="mail-check-warn" class="form-text text-muted"></small>
								<span id="email-countdown-timer"></span>
							</div>
							<div class="form-group">
								<label for="role">역할</label>
								<div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" id="ROLE_USER"
											name="role" value="ROLE_USER" checked> <label
											class="form-check-label" for="ROLE_USER">사용자</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" id="ROLE_MANAGER"
											name="role" value="ROLE_MANAGER"> <label
											class="form-check-label" for="ROLE_MANAGER">운영자</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" id="ROLE_ADMIN"
											name="role" value="ROLE_ADMIN"> <label
											class="form-check-label" for="ROLE_ADMIN">관리자</label>
									</div>
								</div>
							</div>
							<button id="register-btn" class="btn btn-primary">회원가입</button>
							<input id="csrfToken" type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Add Bootstrap JS -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<!-- js 파일 경로 -->
	<script type="text/javascript" src="/resources/js/joinForm.js">

	</script>

</body>
</html>
