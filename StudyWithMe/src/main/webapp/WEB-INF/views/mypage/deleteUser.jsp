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
<!-- 헤드 태그 안에 들어가는 공통코드 -->
<link rel="stylesheet" href="resources/css/userMainPage.css"
	type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	
</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%><body>
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

li a.deleteid {
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
		회원탈퇴
		<hr>
		<form id="deleteid" action="/deleteUser" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="hidden" name="userId" value="<sec:authentication property='principal.user.userId'/>" />
    <div>
        <label for="userName">이름</label>
        <sec:authentication property="principal.user.userName"/>
    </div>
    <div>
        <label for="userId">아이디</label>
        <sec:authentication property="principal.user.userId"/>
    </div>
    <div>
        <label for="password">비밀번호</label>
        <input type="password" id="password" name="password">
    </div>
    <div>
        <label for="passwordConfirm">비밀번호 확인</label>
        <input type="password" id="passwordConfirm" name="passwordConfirm">
    </div>
    <button type="button" onclick="checkPassword()">탈퇴</button>
</form>

		
		<hr>
	</div>


		<!-- 모달 코드 -->
<div id="deleteModal" class="modal">
  <p>정말 탈퇴하시겠습니까?</p>
  <button class="yes" onclick="deleteUser()">확인</button>
  <button class="no" onclick="none()">취소</button>
</div>



<!-- 스크립트 코드 -->
<script>
  function deleteUser() {
	  // 모달창 확인 버튼 클릭 후 로직
    $('#deleteModal').modal('hide');
    $('#deleteid').submit();
  }
  function none(){
	  $('#deleteModal').hide();
	  location.reload();
  }

  function checkPassword() {
    // 비밀번호 검증 로직
    var password = $('#password').val();
    var passwordConfirm = $('#passwordConfirm').val();

    if (password === passwordConfirm) {
      $('#deleteModal').modal('show');
    } else {
      alert('비밀번호가 일치하지 않습니다.');
    }
  }
</script>




</body>


</html>

