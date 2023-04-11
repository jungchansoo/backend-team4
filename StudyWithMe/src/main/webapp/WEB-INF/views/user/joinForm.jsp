<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<h1>회원가입</h1>
	<form action="/join" method="post">

		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /> <label for="userid">아이디:</label> <input
			type="text" id="userid" name="userid" required
			oninput="checkUserId()">
		<button type="button" id="id-check-btn">아이디 중복 확인</button>
		<span id="id-check-result"></span><br> <span
			id="userid-check-result"></span> <br> <label for="password">비밀번호:</label>
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
		<br> <span id="phoneNumber-check-result"></span> <br>
		<br> <br> <label for="email">이메일:</label>
		<!-- 		메일 인증 -->
		<input type="email" id="email" name="email" required><br>
		<br>
		<div class="input-group-addon">
			<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
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
		<br> <input type="submit" value="회원가입">
	</form>
</body>

<script type="text/javascript">
	$('#mail-Check-Btn').click(function() {
		const Email = $('#email').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 

		$.ajax({
			type : 'get',
			url : '/mailCheck?email=' + encodeURIComponent(Email),
			success : function(data) {
				console.log("data : " + data);
				checkInput.attr('disabled', false);
				code = data;
				alert('인증번호가 전송되었습니다.')
			}
		}); // end ajax
	}); // end send email
	$('.mail-check-input').blur(
			function() {
				const inputCode = $(this).val();
				const $resultMsg = $('#mail-check-warn');

				if (inputCode === code) {
					$resultMsg.html('인증번호가 일치합니다.');
					$resultMsg.css('color', 'green');
					$('#mail-Check-Btn').attr('disabled', true);
					$('#userEmail1').attr('readonly', true);
					$('#userEmail2').attr('readonly', true);
					$('#userEmail2').attr('onFocus',
							'this.initialSelect = this.selectedIndex');
					$('#userEmail2').attr('onChange',
							'this.selectedIndex = this.initialSelect');
				} else {
					$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
					$resultMsg.css('color', 'red');
				}
			});

	// 아이디 중복 확인 버튼 클릭 이벤트
	$("#id-check-btn").click(
			function() {
				const userId = $("#userid").val();

				// 입력된 아이디가 없을 경우 경고 메시지 표시
				if (!userId) {
					$("#id-check-result").text("아이디를 입력해주세요.").css("color",
							"red");
					return;
				}

				// Ajax 요청으로 아이디 중복 확인
				$
						.ajax({
							type : "GET",
							url : "/checkIdDuplicate",
							data : {
								userId : userId
							},
							success : function(response) {
								console.log("Response:", response);
								console.log($('Boolean', response).text());
								const isDuplicate = $('Boolean', response)
										.text() === 'true';
								if (isDuplicate) {
									$("#id-check-result").text("중복된 아이디입니다.")
											.css("color", "red");
								} else {
									$("#id-check-result")
											.text("사용 가능한 아이디입니다.").css(
													"color", "green");
								}
							},
							error : function() {
								$("#id-check-result").text(
										"아이디 확인 중 오류가 발생했습니다.").css("color",
										"red");
							}
						});
			});
	
	//패스워드 중복 확인
	$("#password-confirm").on("input", function() {
		const password = $("#password").val();
		const confirmPassword = $(this).val();
		const $resultMsg = $("#password-same-result");

		if (password === confirmPassword) {
			$resultMsg.text("비밀번호가 일치합니다.").css("color", "green");
		} else {
			$resultMsg.text("비밀번호가 일치하지 않습니다.").css("color", "red");
		}
	});
</script>
<script>

function checkUserId() {
    const userId = $("#userid").val();
    const userIdRegex = /^[A-za-z0-9]{5,20}$/; // 아이디 정규표현식(영어 대소문자, 숫자만 사용가능, 5~20자리)

    if (!userIdRegex.test(userId)) {
        $("#userid-check-result").text("영어와 숫자만 가능, 5~20자리").css("color", "red");
    } else {
        $("#userid-check-result").text("사용 가능한 아이디 입니다.").css("color", "green");
    }
}

function checkPassword() {
    const password = $("#password").val();
    const passwordRegex = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; //문자. 숫자. 특수문자 포함 8~20자리 

    if (!passwordRegex.test(password)) {
        $("#password-check-result").text("영어와 숫자, 특수문자가 각각 반드시 1개 이상 포함, 8~20자리").css("color", "red");
    } else {
        $("#password-check-result").text("사용 가능한 패스워드 입니다.").css("color", "green");
    }
}

function checkPhonNumber() {
    const phoneNumber = $("#phoneNumber").val();
    const phoneNumberRegex = /^010-\d{3,4}-\d{4}$/; //010-0000-0000 형식 

    if (!phoneNumberRegex.test(phoneNumber)) {
        $("#phoneNumber-check-result").text("010-0000-0000 형태로 입력해주세요.").css("color", "red");
    } else {
        $("#phoneNumber-check-result").text("유효한 전화번호 입니다.").css("color", "green");
    }
}
</script>


</html>