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
		<span id="id-check-result"></span><br> <span
			id="userId-check-result"></span> <br> <label for="password">비밀번호:</label>
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
			<span id="countdown-timer"></span>

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
			<span id="countdown-timer"></span>

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
		<br> <input type="submit" value="회원가입"> <input
			type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
</body>

<script type="text/javascript">


	//메일인증 구현
	//메일 인증 제한시간
	let countdownTimer;
	let countdownSeconds = 180;
	const TIMEOUT_MS = countdownSeconds * 1000;

	//분:초 표시용 함수
	function updateCountdown() {
		const minutes = Math.floor(countdownSeconds / 60);
		const seconds = countdownSeconds % 60;
		console.log(minutes);
		console.log(seconds);
		$("#countdown-timer").html(
				minutes + ":" + (seconds < 10 ? "0" : "") + seconds
						+ '<br>인증번호가 전송되었습니다.').css("color", "green");

	}

	//메일 버튼 클릭 시 메일 전송
	$('#mail-Check-Btn').click(
			function() {
				const email = $('#email').val(); // 이메일 주소값 얻어오기!
				console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
				const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 

				$.ajax({
					type : 'get',
					url : '/mailCheck?email=' + encodeURIComponent(email),
					success : function(data) {
						console.log("data : " + data);
						checkInput.attr('disabled', false);
						code = data;
					}
				}); // end ajax
				// 카운트다운 타이머 시작
				$("#countdown-timer").show();
				clearInterval(countdownTimer);
				countdownSeconds = 180;
				console.log(countdownSeconds);
				updateCountdown();

				countdownTimer = setInterval(function() {
					countdownSeconds--;
					console.log(countdownSeconds);
					updateCountdown();

					if (countdownSeconds <= 0) {
						clearInterval(countdownTimer);
						$("#countdown-timer").html(
								'0:00<br>인증 시간이 만료하였습니다. 다시 시도해주세요').css(
								"color", "red");
					}
				}, 1000); // 1000ms = 1초
			}); // end send email

	//메일 인증 번호 입력 시 메시지 표시
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
			}); //end 메일 인증 구현

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

	//유저 아이디 정규식 
	function checkUserId() {
		const userId = $("#userId").val();
		const userIdRegex = /^[A-za-z0-9]{5,20}$/; // 아이디 정규표현식(영어 대소문자, 숫자만 사용가능, 5~20자리)

		if (!userIdRegex.test(userId)) {
			$("#userId-check-result").text("영어와 숫자만 가능, 5~20자리").css("color",
					"red");
		} else {
			$("#userId-check-result").text("사용 가능한 아이디 입니다.").css("color",
					"green");
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
		} else {
			$("#password-check-result").text("사용 가능한 패스워드 입니다.").css("color",
					"green");
		}
	}
	//유저 전화번호 정규식 
	function checkPhonNumber() {
		const phoneNumber = $("#phoneNumber").val();
		const phoneNumberRegex = /^010-\d{3,4}-\d{4}$/; //010-0000-0000 형식 

		if (!phoneNumberRegex.test(phoneNumber)) {
			$("#phoneNumber-check-result").text("010-0000-0000 형태로 입력해주세요.")
					.css("color", "red");
		} else {
			$("#phoneNumber-check-result").text("유효한 전화번호 입니다.").css("color",
					"green");
		}
	}
</script>


</html>