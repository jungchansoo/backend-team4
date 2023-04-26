<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />


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

/* 버튼 디자인 */
.submit-button, .back-button {
	background-color: #B2ECC7;
	color: #000;
	border-radius: 12px;
	padding: 8px 30px;
	border: none;
	margin: 30px;
	display: inline-block;
	font-weight: bold;
	font-size: 15px;
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

		<form id="updatePwForm" action="/userpwchangers" method="post">
			<input type="hidden" id="csrfToken" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div class="text">
				<div>
					<label for="current_pw">기존 비밀번호</label> <input type="password"
						id="current_pw" name="currentPassword">
				</div>
				<div>
					<label for="new_pw">새로운 비밀번호</label> <input type="password"
						id="new_pw" name="newPassword">
				</div>
				<div>
					<label for="pw_confirm">새로운 비밀번호 확인</label> <input type="password"
						id="pw_confirm" name="newPasswordConfirm">
				</div>
			</div>
			<div class="clickbutton">
				<button type="submit" class="submit-button" >변경</button>
				<button type="button" class="back-button" onClick="location.href='userinfo'" >취소</button>
			</div>
		</form>
	</div>
	
	<!-- 모달 코드 -->
	<div id="updateModal" class="modal">
		<p>정말 변경하시겠습니까?</p>
		<button class="yes" >확인</button>
		<button class="no" >취소</button>
	</div>
    <div id="inputnull" class="modal">
		<p class="checkmessage">모든항목을 입력해주세요.</p>
		<button class="check" >확인</button>
	</div>

    <!-- <div id="checkpw" class="modal">
		<p class="checkmessage">기존 비밀번호가 일치하지 않습니다.</p>
		<button class="check" >확인</button>
	</div> -->

    <div id="pwconfirmfail" class="modal">
		<p class="checkmessage">새로운 비밀번호와 새로운 비밀번호 확인이 일치하지 않습니다.</p>
		<button class="check" >확인</button>
	</div>
    <div id="updatepwsuccess" class="modal">
		<p class="checkmessage">비밀번호가 변경되었습니다.</p>
		<button class="logout" >확인</button>
	</div>
     <div id="updatepwfail" class="modal">
		<p class="checkmessage">비밀번호 변경에 실패하였습니다. 다시 시도해주세요.</p>
		<button class="check" >확인</button>
	</div>

<script>
$(document).ready(function() {
	  // 변경 버튼 클릭시
	  $('.submit-button').click(function(event) {
	    // 폼의 기본 동작을 막음
	    event.preventDefault();
	    
	    // 입력된 값 가져오기
	    var currentPassword = $('#current_pw').val();
	    var newPassword = $('#new_pw').val();
	    var newPasswordConfirm = $('#pw_confirm').val();
	    
	    // 입력값이 비어있는 경우
	    if (currentPassword == '' || newPassword == '' || newPasswordConfirm == '') {
	      $('#inputnull').modal();
	    }
	    // 입력값이 모두 존재하는 경우
	    else {
	      // 기존 비밀번호와 새 비밀번호 확인값이 일치하지 않는 경우
	      if (newPassword != newPasswordConfirm) {
	        $('#pwconfirmfail').modal();
	      }
	      else {
	        // 변경 모달 띄우기
	        $('#updateModal').modal();
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
	          $('#updatepwfail').modal();
	        }
	      }
	    });
	  });
	  
	  // 변경 모달 취소 버튼 클릭시
	  $('.no').click(function() {
	    // 변경 모달 닫기
	    $('#updateModal').hide();
	  });
	  
	  // 확인 모달 확인 버튼 클릭시 페이지 새로고침
	  $('.check').click(function() {
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
