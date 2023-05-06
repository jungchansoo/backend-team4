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
<%@include file="../includes/header.jsp"%>
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
              <input type="text" class="form-control" name="userId" required>
            </div>
            <div class="mb-3">
              <label class="form-label">이름</label>
              <input type="text" class="form-control" name="userName" required>
            </div>
            <div class="mb-3">
              <label class="form-label">이메일</label>
              <input type="email" class="form-control" name="email" required>
            </div>
            <input id="csrfToken" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <button type="submit" class="btn btn-primary  btn-block  mt-3" id="search-pw-btn">임시 비밀번호 전송</button>
            <div class="text-center mt-3"><a href="login">로그인화면으로</a></div>        
          </form>
        </div>
      </div>
    </div>
  </div>
</div>


<script>
  $(document).ready(function() {
    $('#search-pw-btn').click(function(e) {
      e.preventDefault(); // submit 이벤트를 막음
      var formData = $('#find-password-form').serialize(); // 폼 데이터를 가져옴
      
      // csrf token 가져오기
      const csrfTokenValue = $('#csrfToken').val();
      
      $.ajax({
        url: "/sendTempPw",
        type: "post",
        data: formData,
        headers: {
          'X-CSRF-TOKEN': csrfTokenValue
        },
        success: function(response) {
          alert("임시 비밀번호가 전송되었습니다. 이메일을 확인해주세요.");
        },
        error: function(xhr) {
          alert("임시 비밀번호 전송에 실패했습니다. 다시 시도해주세요.");
        }
      });
    });
  });
</script>



</body>
<%@include file="../includes/footer.jsp"%>
</html>