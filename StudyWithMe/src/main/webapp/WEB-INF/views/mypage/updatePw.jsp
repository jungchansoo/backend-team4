<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Add Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<title>MyPage</title>

<link rel="stylesheet" href="resources/css/sidebar.css" type="text/css">
<style>
li a.chagepw {
	background: #333;
	color: #fff;
}
/* 폼태그속 디자인 */
#updatePwForm {
	margin: auto;
}
</style>

</head>
<body>
	<!-- 헤더 -->
	<%@include file="../includes/header.jsp"%>





	<ul class="sidebar">
		<li class="side_title">Mypage</li>
		<li><a class="userinfo" href="/userinfo">회원정보</a></li>
		<li><a class="reservatelist" href="/reservationList">예약내역</a></li>
		<li><a class="chagepw" href="/updatePw">비밀번호변경</a></li>
		<li><a class="deleteid" href="/deleteUser">회원탈퇴</a></li>
	</ul>

	<div class="cd1">
		<p>비밀번호 변경</p>
		<hr>

		<form id="updatePwForm" action="/userpwchangers" method="post"
			class="needs-validation" novalidate>
			<input type="hidden" id="csrfToken" name="${_csrf.parameterName}"
				value="${_csrf.token}">
			<div class="text">
				<div>
					<label for="current_pw">기존 비밀번호</label> <input type="password"
						id="current_pw" name="currentPassword" required>
				</div>
				<div>
					<label for="new_pw">새로운 비밀번호</label> <input type="password"
						id="new_pw" name="newPassword" required> <small
						id="password-check-result" class="form-text text-muted"></small>
				</div>
				<div>
					<label for="pw_confirm">새로운 비밀번호 확인</label> <input type="password"
						id="pw_confirm" name="newPasswordConfirm" required>
				</div>
			</div>
			<div class="clickbutton">
				<button type="button"
					class="btnForModal btn btn-outline-primary btn-lg"
					data-bs-toggle="modal" data-bs-target="#updateModal">변경</button>
				<button type="button"
					class="btnForModal btn btn-outline-secondary btn-lg"
					onclick="location.href='userinfo'">취소</button>
			</div>
		</form>

	</div>

	<!-- 모달 코드 -->
	<div class="modal fade" id="updateModal"
		aria-labelledby="updateModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<p>정말 변경하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary yes" data-bs-dismiss="modal">확인</button>
					<button class="btn btn-secondary no" data-bs-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="updatepwsuccess"
		aria-labelledby="updatepwsuccessLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<p>비밀번호가 변경되었습니다.</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-primary logout" data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>


	<script>
$(document).ready(function() {
	
	// 새로운 비밀번호 검증 함수
	function validatePassword(password) {
	  // 비밀번호가 8자 이상인지 검사
	  if (password.length < 8 || password.length > 20) {
	    return false;
	  }
	  // 대문자, 소문자, 숫자, 특수 문자 중 3가지 이상 종류가 포함되어 있는지 검사
	  let categories = 0;
	  if (/[A-Z]/.test(password)) categories++;
	  if (/[a-z]/.test(password)) categories++;
	  if (/\d/.test(password)) categories++;
	  if (/[\W_]/.test(password)) categories++;
	  if (categories < 3) {
	    return false;
	  }
	  return true;
	}

	// 변경 버튼 클릭시
	$('button[data-bs-target="#updateModal"]').click(function(event) {
	  // 폼의 기본 동작을 막음
	  event.preventDefault();
	  // 입력된 값 가져오기
	  var currentPassword = $('#current_pw').val();
	  var newPassword = $('#new_pw').val();
	  var newPasswordConfirm = $('#pw_confirm').val();

	  // 입력값이 비어있는 경우
	  if (currentPassword == '' || newPassword == '' || newPasswordConfirm == '') {
	    alert('모든 항목을 입력해주세요.');
	  }
	  // 입력값이 모두 존재하는 경우
	  else {
	    // 새 비밀번호가 조건을 만족하는지 검사
	    if (!validatePassword(newPassword)) {
	      // 조건을 만족하지 않으면 오류 메시지 출력
	      $("#password-check-result").text("문자, 숫자, 특수문자 포함 8~20자리").css({"color": "red", "font-size": "12pt"});
	    } else {
	      // 기존 비밀번호와 새 비밀번호 확인값이 일치하지 않는 경우
	      if (newPassword != newPasswordConfirm) {
	        alert('새로운 비밀번호와 새로운 비밀번호 확인이 일치하지 않습니다.');
	      } else {
	        // 변경 모달 띄우기
	    	  $('#updateModal').modal('show');
	      }
	    }
	  }

	});
	  
	 // 변경 모달 확인 버튼 클릭시
$('.yes').click(function() {
  // 변경 모달 닫기
  $('#updateModal').hide();

  // 비밀번호 변경 요청 보내기
  $.ajax({
    type: 'POST',
    url: '/userpwchangers',
    data: $('#updatePwForm').serialize(),
    success: function(result) {
      // 비밀번호 변경 성공시
      if (result == 'success') {
        $('#updatepwsuccess').modal();
      }
      // 비밀번호 변경 실패시
      else {
        alert("비밀번호 변경에 실패하였습니다.");
      }
    }
  });
});

	  // 변경 모달 취소 버튼 클릭시
	  $('.no').click(function() {
	    // 변경 모달 닫기
		  location.reload();
	  });
	  
	// updatepwsuccess 모달 속 확인 버튼 클릭시
	  $('.logout').click(function() {
	    // 로그아웃 요청하지 않고 3초 후 로그아웃 및 로그인 페이지 이동
	    setTimeout(function(){
	      window.location.href = "/logout";
	    });
	   location.href='/';
	  });
	  
	});

</script>


</body>
<%@include file="../includes/footer.jsp"%>
</html>
