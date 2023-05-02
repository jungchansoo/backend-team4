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
              <small id="user-check-result" class="form-text text-muted"></small>
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

<script>
  const form = document.querySelector('#find-password-form');
  const usercheck = document.querySelector('#user-check-result');

  form.addEventListener('submit', (event) => {
    event.preventDefault();
    const formData = new FormData(form);
    const phone = formData.get('phone');
    // 여기서 DB에 저장된 회원정보와 입력된 formData를 비교합니다.
    if (DB에 저장된 회원정보와 일치하지 않으면) {
    	usercheck.textContent = "입력한 정보와 일치하는 회원이 없습니다.";
    } else {
    	usercheck.textContent = "입력한 정보와 일치하는 회원입니다. 이메일을 입력하여 임시 비밀번호를 발급받으세요.";
    }
  });
</script>

</body>
</html>