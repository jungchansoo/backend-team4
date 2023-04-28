<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디 찾기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
    $('input[type=radio][name=find-method]').change(function() {
        if (this.value === 'phone') {
            $('#phone-method').show();
            $('#email-method').hide();
        } else if (this.value === 'email') {
            $('#phone-method').hide();
            $('#email-method').show();
        }
    });
    // 페이지 로드 시 초기 상태 설정
    $('input[type=radio][name=find-method]:checked').trigger('change');
});
</script>
</head>
<body>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h1 class="text-center my-5">아이디 찾기</h1>
						<form action="/searchId" method="post" class="mt-4">
							<label class="form-label mb-3">아이디 찾기 방법 선택</label>

							<div class="text-center mt-3 row">
								<div class="form-check form-check-inline col text-center">
									<input class="form-check-input" type="radio" name="find-method"
										id="find-by-phone" value="phone" checked> <label
										class="form-check-label" for="find-by-phone">등록된 전화번호로
										찾기</label>
								</div>
								<div class="form-check form-check-inline col text-center">
									<input class="form-check-input" type="radio" name="find-method"
										id="find-by-email" value="email"> <label
										class="form-check-label" for="find-by-email">등록된 이메일로
										찾기</label>
								</div>
							</div>
							<!-- 입력란 -->
							<div class="form-group mb-3">
								<label for="name" class="form-label">이름</label> <input
									type="text" class="form-control" id="name">
							</div>
							<div class="form-group" id="phone-method">
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

							<div class="form-group" id="email-method">
								<label for="email">이메일</label><input type="text"
									class="form-control" id="email" name="email" required>
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
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}">
							<button type="submit" class="btn btn-primary">확인</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
