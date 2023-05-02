<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>

<title>비밀번호 찾기</title>
</head>
<body>

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
      <div class="card">
        <div class="card-body">
          <h1 class="text-center my-5">비밀번호 찾기</h1>
          <form id="find-password-form">
            <div class="mb-3">
              <label class="form-label">아이디</label>
              <input type="text" class="form-control" name="id" required>
            </div>
            <div class="mb-3">
              <label class="form-label">이름</label>
              <input type="text" class="form-control" name="name" required>
            </div>
            <div class="mb-3">
              <label class="form-label">전화번호</label>
              <input type="tel" class="form-control" name="phone" required>
            </div>
            <div class="mb-3">
              <label class="form-label">이메일</label>
              <input type="email" class="form-control" name="email" required>
            </div>
            <button type="submit" class="btn btn-primary">비밀번호찾기</button>
            <button type="button" class="btn btn-outline-primary" onclick="location.href='/login'">로그인</button>
            
          </form>
        </div>
      </div>
    </div>
  </div>
</div>


</body>
</html>