<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<h1>Mypage</h1>

	<style>
ul {
	list-style-type: none;
	padding: 0px;
	margin: 0px;
	width: 120px;
	background: #efefef;
	height: 100%;
	overflow: auto;
	position: fixed;
}

li a {
	text-decoration: none;
	padding: 10px;
	display: block;
	color: #000;
	font-weight: bold;
}

li a:hover {
	background: #333;
	color: #fff;
}

li a.chagepw {
	background: #333;
	color: #fff;
}

.cd1 {
	margin-left: 140px;
}
</style>




	<ul>
		<li><a class="userinfo" href="/userinfo">회원정보</a></li>
		<li><a class="reservatelist" href="/reservationList">예약내역</a></li>
		<li><a class="chagepw" href="/updatePw">비밀번호변경</a></li>
		<li><a class="deleteid" href="/deleteUser">회원탈퇴</a></li>
	</ul>

	<div class="cd1">
		비밀번호 변경
		<hr>

		<form id="updatePwForm" action="/userpwchangers" method="post">
	<input type="hidden" id="csrfToken" name="${_csrf.parameterName}" value="${_csrf.token}" />
	<div>
		<label for="current_pw">기존 비밀번호</label> 
		<input type="password" id="current_pw" name="currentPassword" required>
	</div>
	<div>
		<label for="new_pw">새로운 비밀번호</label> 
		<input type="password" id="new_pw" name="newPassword" required>
	</div>
	<div>
		<label for="pw_confirm">새로운 비밀번호 확인</label> 
		<input type="password" id="pw_confirm" name="newPasswordConfirm" required>
	</div>
	<button type="submit">변경하기</button>
	<input type="button" value="뒤로가기" onclick="location.href='main.jsp'">
</form>


		<hr>
	</div>
	
<!-- jQuery 라이브러리 로드 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
  // CSRF 토큰 설정
  var csrf_token = $('meta[name="csrf-token"]').attr('content');

  // 변경 버튼 클릭시
  $("#changeBtn").click(function() {
    var current_pw = $("#current_pw").val();
    var new_pw = $("#new_pw").val();
    var pw_confirm = $("#pw_confirm").val();

    // 입력값 유효성 검사
    if (current_pw == '' || new_pw == '' || pw_confirm == '') {
      alert("모든 항목을 입력해주세요.");
      return;
    }

    // 새로운 비밀번호와 확인 비밀번호가 같은지 확인
    if (new_pw != pw_confirm) {
      alert("새로운 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
      return;
    }

    // 서버에 비밀번호 변경 요청 보내기
    $.ajax({
      url: "/userpwchangers",
      method: "POST",
      headers: {
        "X-CSRF-Token": csrf_token // CSRF 토큰 설정
      },
      data: {
    	currentPassword: current_pw,
    	newPassword: new_pw,
    	newPasswordConfirm: pw_confirm
      },
      success: function(data) {
        // 비밀번호 변경 성공시
        alert("비밀번호가 성공적으로 변경되었습니다.");
        location.reload(); // 페이지 새로고침
      },
      error: function(xhr, status, error) {
        // 비밀번호 변경 실패시
        alert("비밀번호 변경에 실패했습니다. 잠시 후 다시 시도해주세요.");
      }
    });
  });
});
</script>





</body>
</html>


<!-- <script>
		function newpwcheck(newpw,pwcheck){
			if(arguments[0]===arguments[1]){
				alert('성공');
			}
		}
	</script> -->