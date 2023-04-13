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

<script type="text/javascript">
	//회원가입 조건 체크 1
	let isDuplicationChecked = false; //아이디 중복 확인
	let smsVerificationStatus = { verified: false }; // 문자 인증 확인
	let emailVerificationStatus = { verified: false }; // 메일 인증 확인
	let isPasswordDoubleChked = false; // 패스워드 확인란 입력 확인

	//회원가입 정규식 체크 2
	let isUserIdValid = false; // 아이디 정규식 확인
	let isPasswordValid = false; //비밀번호 정규식 확인
	let isPhoneNumberValid = false; // 전화번호 정규식 확인

	//문자 및 메일 인증 공용 코드
	let emailCountdownTimer;
	let emailCountdownSeconds;

	let smsCountdownTimer;
	let smsCountdownSeconds;

	//인증버튼 클릭 시 카운트다운 시작
	function startCountdown(timerElementId, checkButtonId, countdownTimer,
			countdownSeconds, verificationStatus) {
        verificationStatus.verified = false;
		const timerElement = $("#" + timerElementId);
		clearInterval(countdownTimer);
		countdownSeconds = 300;
		updateCountdown(timerElement, countdownSeconds);

		countdownTimer = setInterval(function() {
			countdownSeconds--;
			updateCountdown(timerElement, countdownSeconds);

			if (countdownSeconds <= 0) {
				clearInterval(countdownTimer);
	            verificationStatus.verified = false;
				timerElement.html('0:00<br>인증 시간이 만료하였습니다. 다시 시도해주세요').css(
						"color", "red");
			}
		}, 1000); // 1000ms = 1초
		$("#" + checkButtonId).attr('disabled', true);
	}
	//인증시간 매 초마다 갱신
	function updateCountdown(timerElement, countdownSeconds) {
		const minutes = Math.floor(countdownSeconds / 60);
		const seconds = countdownSeconds % 60;
		timerElement.html(
				minutes + ":" + (seconds < 10 ? "0" : "") + seconds
						+ '<br>인증번호가 전송되었습니다.').css("color", "green");
	}
	//인증번호 일치 확인
	function checkVerificationCode(input, resultMsgElement, checkButtonId,
			code, verificationStatus) {
		const inputCode = input.val();
		const $resultMsg = $(resultMsgElement);

		if (inputCode === code) {
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color', 'green');
            verificationStatus.verified = true;

		} else {
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color', 'red');
			$("#" + checkButtonId).attr('disabled', false);
            verificationStatus.verified = false;

		}
	}
	//문자 인증 구현
	// 문자 인증 버튼 클릭 시 문자 전송
	$('#sms-Check-Btn').click(
			function() {
				const phoneNumber = $('#phoneNumber').val().replace(/-/g, ''); // 전화번호 얻어오기(- 삭제)
				const checkInput = $('.sms-check-input') // 인증번호 입력하는곳 

				// 서버에 전화번호를 전송하고 인증번호를 받아오는 Ajax 호출
				$.ajax({
					type : 'post',
					url : '/smsCheck',
					headers : {
						'X-CSRF-TOKEN' : $(
								'input[name="${_csrf.parameterName}"]').val()
					},
					data : {
						phoneNumber : phoneNumber
					},
					success : function(data) {
						checkInput.attr('disabled', false);
						code = data;
						console.log(code);
					}
				});
				startCountdown("sms-countdown-timer", "sms-Check-Btn",
						smsCountdownTimer, smsCountdownSeconds, smsVerificationStatus);
			});

	//문자 인증 번호 입력 시 메시지 표시,  인증 처리
	$('.sms-check-input').blur(
			function() {
				checkVerificationCode($(this), '#sms-check-warn',
						'sms-Check-Btn', code, smsVerificationStatus);
			});

	//메일 버튼 클릭 시 메일 전송
	$('#mail-Check-Btn')
			.click(
					function() {
						const email = $('#email').val(); // 이메일 주소값 얻어오기!
						console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
						const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 

						$.ajax({
							type : 'get',
							url : '/mailCheck?email='
									+ encodeURIComponent(email),
							success : function(data) {
								console.log("data : " + data);
								checkInput.attr('disabled', false);
								code = data;
							}
						}); // end ajax
						// 카운트다운 타이머 시작
						startCountdown("email-countdown-timer",
								"mail-Check-Btn", smsCountdownTimer,
								smsCountdownSeconds, emailVerificationStatus);
					}); // end send email

	//메일 인증 번호 입력 시 메시지 표시, 인증 처리
	$('.mail-check-input').blur(
			function() {
				checkVerificationCode($(this), '#mail-check-warn',
						'mail-Check-Btn', code, emailVerificationStatus);
			});

	// 아이디 중복 확인 버튼 클릭 이벤트
	$("#id-check-btn").click(
			function() {
				const userId = $("#userId").val();

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
								isDuplicationChecked = false;
								const isDuplicate = $('Boolean', response)
										.text() === 'true';
								if (isDuplicate) {
									$("#id-check-result").text("중복된 아이디입니다.")
											.css("color", "red");
									isDuplicationChecked = false;
								} else {
									$("#id-check-result")
											.text("사용 가능한 아이디입니다.").css(
													"color", "green");
									isDuplicationChecked = true;

								}
							},
							error : function() {
								$("#id-check-result").text(
										"아이디 확인 중 오류가 발생했습니다.").css("color",
										"red");
								isDuplicationChecked = false;

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
			isPasswordDoubleChked = true;
		} else {
			$resultMsg.text("비밀번호가 일치하지 않습니다.").css("color", "red");
			isPasswordDoubleChked = false;
		}
	});

	//유저 아이디 정규식 
	function checkUserId() {
		const userId = $("#userId").val();
		const userIdRegex = /^[A-za-z0-9]{5,20}$/; // 아이디 정규표현식(영어 대소문자, 숫자만 사용가능, 5~20자리)

		if (!userIdRegex.test(userId)) {
			$("#userId-check-result").text("영어와 숫자만 가능, 5~20자리").css("color",
					"red");
			isUserIdValid = false;
		} else {
			$("#userId-check-result").text("사용 가능한 아이디 입니다.").css("color",
					"green");
			isUserIdValid = true;
		}
	}
	//유저 패스워드 정규식 
	function checkPassword() {
		const password = $("#password").val();
		const passwordRegex = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/; //문자. 숫자. 특수문자 포함 8~20자리 

		if (!passwordRegex.test(password)) {
			$("#password-check-result").text(
					"영어와 숫자, 특수문자가 각각 반드시 1개 이상 포함, 8~20자리")
					.css("color", "red");
			isPasswordValid = false;
		} else {
			$("#password-check-result").text("사용 가능한 패스워드 입니다.").css("color",
					"green");
			isPasswordValid = true;

		}
	}
	//유저 전화번호 정규식 
	function checkPhonNumber() {
		const phoneNumber = $("#phoneNumber").val();
		const phoneNumberRegex = /^010-\d{3,4}-\d{4}$/; //010-0000-0000 형식 

		if (!phoneNumberRegex.test(phoneNumber)) {
			$("#phoneNumber-check-result").text("010-0000-0000 형태로 입력해주세요.")
					.css("color", "red");
			isPhoneNumberValid = false;

		} else {
			$("#phoneNumber-check-result").text("유효한 전화번호 입니다.").css("color",
					"green");
			isPhoneNumberValid = true;

		}
	}
	
	//회원가입 시 인증 확인
	$("#register-btn").click(function (event) {
	    // 필수 조건들을 확인합니다.
	    if (!isDuplicationChecked||!smsVerificationStatus.verified||!emailVerificationStatus.verified||!isPasswordDoubleChked|| !isUserIdValid || !isPasswordValid || !isPhoneNumberValid) {
	        // 경고 메시지를 표시하고 회원가입 중단
	        alert("입력된 정보를 다시 확인해주세요.");
	        console.log('isDuplicationChecked: '+isDuplicationChecked);
	        console.log('smsVerificationStatus.verified: '+smsVerificationStatus.verified);
	        console.log('emailVerificationStatus.verified: '+emailVerificationStatus.verified);
	        console.log('isPasswordDoubleChked: '+isPasswordDoubleChked);
	        console.log('isUserIdValid: '+isUserIdValid);
	        console.log('isPasswordValid: '+isPasswordValid);
	        console.log('isPhoneNumberValid: '+isPhoneNumberValid);

	        event.preventDefault(); // 폼 제출을 막습니다.
	    } else {
	        // 회원가입 절차를 진행합니다.
	        $("form").submit(); // 폼 제출을 진행합니다.
	    }
	});

</script>


</html>