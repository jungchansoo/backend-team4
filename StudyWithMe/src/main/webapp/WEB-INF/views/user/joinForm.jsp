<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<label for="userid">아이디:</label>
		<input type="text" id="userid" name="userid" required><br><br>
		
		<label for="password">비밀번호:</label>
		<input type="password" id="password" name="password" required><br><br>
		
		<label for="userName">이름:</label>
		<input type="text" id="userName" name="userName" required><br><br>
		
		<label for="phoneNumber">전화번호:</label>
		<input type="text" id="phoneNumber" name="phoneNumber" required><br><br>
		
		<label for="email">이메일:</label>
<!-- 		메일 인증 -->
		<input type="email" id="email" name="email" required><br><br>
		<div class="input-group-addon">
			<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
			<div class="mail-check-box">
				<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
			</div>
			<span id="mail-check-warn"></span>
		</div>
	
		<label for="role">역할:</label>
		<input type="radio" id="user" name="role" value="user" checked>
		<label for="user">사용자</label>
		<input type="radio" id="manager" name="role" value="manager">
		<label for="manager">운영자</label>
		<input type="radio" id="admin" name="role" value="admin">
		<label for="admin">관리자</label><br><br>
		
		<input type="submit" value="회원가입">
	</form>
</body>

<script type="text/javascript">
$('#mail-Check-Btn').click(function() {
	const Email = $('#email').val(); // 이메일 주소값 얻어오기!
	console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
	const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	
	$.ajax({
		type : 'get',
		url: '/mailCheck?email=' + encodeURIComponent(Email),
		success : function (data) {
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}			
	}); // end ajax
}); // end send email
$('.mail-check-input').blur(function () {
	const inputCode = $(this).val();
	const $resultMsg = $('#mail-check-warn');
	
	if(inputCode === code){
		$resultMsg.html('인증번호가 일치합니다.');
		$resultMsg.css('color','green');
		$('#mail-Check-Btn').attr('disabled',true);
		$('#userEmail1').attr('readonly',true);
		$('#userEmail2').attr('readonly',true);
		$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
        $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
	}else{
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
		$resultMsg.css('color','red');
	}
});

</script>
</html>