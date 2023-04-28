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
    
    // 폼 제출 이벤트 핸들러
    $('form').on('submit', function(e) {
        e.preventDefault();
	    // 필수 조건들을 확인합니다.
        const findMethod = $('input[type=radio][name=find-method]:checked').val();
        const userName = $('#name').val();
        const email = $('#email').val();
        const phoneNumber = $('#phoneNumber').val();

		const csrfTokenValue = $('#csrfToken').val();
		console.log(csrfTokenValue);

        let url = "";

		if (findMethod === 'email') {
			if (!emailVerificationStatus.verified) {
				alert("이메일 인증번호를 확인해주세요.");
				return;
			}
			url = "/searchIdbyEmail";
		} else if (findMethod === 'phone') {
			if (!smsVerificationStatus.verified) {
				alert("문자 인증번호를 확인해주세요.");
				return;
			}
			url = "/searchIdbyPhoneNumber";
		}
	

        $.ajax({
            type: 'POST',
            url: url,
			headers : {
				'X-CSRF-TOKEN' : csrfTokenValue
			},
            data: {
                userName: userName,
                email: email,
                phoneNumber: phoneNumber
            },
            success: function(response) {
				if (response.userId === undefined || response.userId === null || response.userId === '') {
					alert('입력하신 정보와 일치하는 아이디가 없습니다.');
					window.location.href = "/searchId";
				} else {
					window.location.href = "/searchIdResult";
				}
			},
            error: function() {
				alert('아이디를 가져오는 데에 에러가 발생했습니다.');
                window.location.href = "/searchId";
            }
        });
    });
});



let smsVerificationStatus = { verified: false }; // 문자 인증 확인
let emailVerificationStatus = { verified: false }; // 메일 인증 확인

console.log('smsVerificationStatus.verified: '+smsVerificationStatus.verified);
console.log('emailVerificationStatus.verified: '+emailVerificationStatus.verified);

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
			const checkInput = $('.sms-check-input'); // 인증번호 입력하는곳 
			const csrfTokenValue = $('#csrfToken').val();

			console.log(csrfTokenValue);

			// 서버에 전화번호를 전송하고 인증번호를 받아오는 Ajax 호출
			$.ajax({
				type : 'post',
				url : '/smsCheck',
				headers : {
					'X-CSRF-TOKEN' : csrfTokenValue
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
			// 인증번호 입력 필드를 활성화하는 코드
			$('.sms-check-input').prop('disabled', false);
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
					// 인증번호 입력 필드를 활성화하는 코드
					$('.mail-check-input').prop('disabled', false);
				}); // end send email

//메일 인증 번호 입력 시 메시지 표시, 인증 처리
$('.mail-check-input').blur(
		function() {
			checkVerificationCode($(this), '#mail-check-warn',
					'mail-Check-Btn', code, emailVerificationStatus);
		});


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

