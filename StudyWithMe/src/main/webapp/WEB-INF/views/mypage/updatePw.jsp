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
		<li><a class="reservatelist" href="#">예약내역</a></li>
		<li><a class="chagepw" href="/updatePw">비밀번호변경</a></li>
		<li><a class="deleteid" href="/deleteUser">회원탈퇴</a></li>
	</ul>

	<div class="cd1">
		비밀번호 변경
		<hr>

		<form id="updatePwForm" action="/userpwchangers" method="post" >
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			
			<div>
				<label for="current_pw">기존 비밀번호</label> <sec:authentication property="principal.user.password"/>
				<input type="hidden" id="current_pw" name="password">
			</div>
			<div>
				<label for="new_pw">새로운 비밀번호</label> <input type="password"
					id="new_pw" name="newPassword">
			</div>
			<div>
				<label for="pw_confirm">새로운 비밀번호 확인</label> <input type="password"
					id="pw_confirm">
			</div>
			<button type="button" onclick="updatePassword()">변경하기</button>
			<input type="button" value="뒤로가기" onclick="location.href='main.jsp'">
		</form>



		<hr>
	</div>

<script>
function updatePassword() {
    var currentPw = document.getElementById("current_pw").value;
    var newPw = document.getElementById("new_pw").value;
    var pwConfirm = document.getElementById("pw_confirm").value;

    if (newPw !== pwConfirm) {
        alert("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
        return;
    }
   
    document.getElementById("current_pw").value = newPw;
   
    document.getElementById("updatePwForm").submit();
}

</script>

	<!-- <script>
		function newpwcheck(newpw,pwcheck){
			if(arguments[0]===arguments[1]){
				alert('성공');
				
			}
		}
	</script> -->




</body>
</html>