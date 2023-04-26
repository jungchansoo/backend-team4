<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container mt-5">

		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h1 class="text-center">Study With Me</h1>
						<c:if test="${param.error != null}">
							<div class="alert alert-danger">아이디와 비밀번호를 확인해주세요.</div>
						</c:if>
						<c:if test="${param.logout != null}">
							<div class="alert alert-success">성공적으로 로그아웃 되었습니다.</div>
						</c:if>

						<form method="post" action="/login">
							<div class="form-group">
								<label for="username">아이디</label> <input type="text"
									class="form-control" id="username" name="username"
									placeholder="ID">
							</div>
							<div class="form-group">
								<label for="password">패스워드</label> <input type="password"
									class="form-control" id="password" name="password"
									placeholder="PASSWORD">
							</div>
							<div class="form-check">
								<label class="form-check-label"> <input type="checkbox"
									class="form-check-input" name="remember-me"> 자동 로그인
								</label>
							</div>

							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}">
							<button type="submit" class="btn btn-primary btn-block">로그인</button>
						</form>

						<div class="text-center mt-3">
							<a href="/join">회원가입</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>