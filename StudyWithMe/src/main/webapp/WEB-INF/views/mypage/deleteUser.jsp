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
li a.deleteid {
	background: #333;
	color: #fff;
}
/* 폼태그속 디자인 */
#deleteid {
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
		<p>회원탈퇴</p>
		<hr>
		<form id="deleteid" action="/deleteUser" method="post">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="hidden" name="userId"
				value="<sec:authentication property='principal.user.userId'/>" />

			<div class="text">
				<div>
					<label for="userName">이름</label>
					<sec:authentication property="principal.user.userName" />
				</div>
				<div>
					<label for="userId">아이디</label>
					<sec:authentication property="principal.user.userId" />
				</div>
				<div>
					<label for="password">비밀번호</label> <input type="password"
						id="password" name="password">
				</div>
				<div>
					<label for="passwordConfirm">비밀번호 확인</label> <input type="password"
						id="passwordConfirm" name="passwordConfirm">
				</div>
			</div>
			<div class="clickbutton">
				<button type="button" class="btn btn-danger btn-lg"
					onclick="checkPassword()">탈퇴</button>
			</div>
		</form>



	</div>


	<!-- 모달 코드 -->
	<div class="modal fade" id="deleteModal" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <p>정말 탈퇴하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" onclick="deleteUser()">확인</button>
        <button type="button" class="btn btn-outline-secondary" onclick="none()">취소</button>
      </div>
    </div>
  </div>
</div>




	<!-- 스크립트 코드 -->
	<script>
		function deleteUser() {
			// 모달창 확인 버튼 클릭 후 로직
			$('#deleteModal').modal('hide');
			$('#deleteid').submit();
		}
		function none() {
			$('#deleteModal').hide();
			location.reload();
		}

		
		function checkPassword() {
			// 비밀번호 검증 로직
			var password = $('#password').val();
			var passwordConfirm = $('#passwordConfirm').val();
			
			if (password == '' || passwordConfirm == '') {
				alert('모든 항목을 입력해주세요.');
			} else {
				if (password === passwordConfirm) {
					$('#deleteModal').modal('show');
				} else {
					alert('비밀번호가 일치하지 않습니다.');
				}
			}
		}
	</script>




</body>
<%@include file="../includes/footer.jsp"%>
</html>