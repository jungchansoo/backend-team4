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
  <li><a href="/mypage">회원정보</a></li>
  <li><a href="#">예약내역</a></li>
  <li><a href="updatePw">비밀번호변경</a></li>
  <li><a href="#">회원탈퇴</a></li>
</ul>


	<div>회원정보</div>
	<hr>
	
	<form id="actionForm" action="getuserinfo" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 
			<div>이름</div>
			<div><sec:authentication property="principal.user.userName"/></div>
		
			<div>아이디</div>
			<div><sec:authentication property="principal.user.userId"/></div>
		
			<div>이메일</div>
			<div><sec:authentication property="principal.user.email"/></div>
		
			<div>비밀번호</div>
			<div><sec:authentication property="principal.user.password"/></div>
		
			<div>전화번호</div>
			<div><sec:authentication property="principal.user.phoneNumber"/></div>
	
			<div>잔여시간</div>
			<div><sec:authentication property="principal.user.remainingSeatTime"/></div>
			<div><sec:authentication property="principal.user.remainingStudyRoomTime"/></div>
			<div><sec:authentication property="principal.user.remainingLockerTime"/></div>
			
 
    </form> 

	<hr>
	<input type="button" value="뒤로가기" onclick="location.href='main.jsp'">
	
</body>
</html>