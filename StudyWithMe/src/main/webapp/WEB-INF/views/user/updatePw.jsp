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
		<li><a class="userinfo" href="/mypage">회원정보</a></li>
		<li><a class="reservatelist" href="#">예약내역</a></li>
		<li><a class="chagepw" href="/updatePw">비밀번호변경</a></li>
		<li><a class="deleteid" href="#">회원탈퇴</a></li>
	</ul>


	<div class="cd1">
		비밀번호 변경
		<hr>
		<section>
			<form action="/userpwchangers" method="post">
				<input type="hidden" name="userid" value="principal.user.userId" />

				<div>
					<label>기존 비밀번호</label> <input type="text" name="user_pw" value= ${password}/>
				</div>

				<div>
					<label>새로운 비밀번호</label> <input type="password"
						id="newpw">
				</div>

				<div>
					<label>새로운 비밀번호 확인</label> <input type="password"
						id="pwcheck">
				</div>

				<button type="button" onclick="newpwcheck(newpw.value,pwcheck.value)">변경하기</button> 
				 <input
					type="button" value="뒤로가기" onclick="location.href='main.jsp'">
			</form>
		</section>


		<hr>
	</div>
	
	<script>
		function newpwcheck(newpw,pwcheck){
			if(arguments[0]===arguments[1]){
				alert('성공');
				
			}
		}
	</script>
	
</body>
</html>