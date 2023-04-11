<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>
	<h1>Mypage</h1>
	

<ul>
  <li><a class="userinfo" href="/mypage">회원정보</a></li>
  <li><a href="#">예약내역</a></li>
  <li><a href="/updatePw">비밀번호변경</a></li>
  <li><a href="#">회원탈퇴</a></li>
</ul>


	<div>비밀번호 변경</div>
	<hr>
	<section>
		<form action="userpwchangers" method="post">
			<input type="hidden" name="userid" value="principal.user.userId"/>
				<div>
					<label>기존 비밀번호</label>
					<input type="password" name="user_pw">
				</div>
				
		</form>
	</section>


	<hr>
	<input type="button" value="뒤로가기" onclick="location.href='main.jsp'">
	
</body>
</html>