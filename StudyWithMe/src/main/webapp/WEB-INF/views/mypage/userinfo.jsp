<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<!-- 헤드 태그 안에 들어가는 공통코드 -->
<link rel="stylesheet" href="resources/css/userMainPage.css"
	type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
	
</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%><body>
	<h1>Mypage</h1>
	<%-- vo:${loginUser}
	username:${name}
	password:${password} --%>

	

	<ul>
		<li><a class="userinfo" href="/userinfo">회원정보</a></li>
		<li><a class="reservatelist" href="/reservationList">예약내역</a></li>
		<li><a class="chagepw" href="/updatePw">비밀번호변경</a></li>
		<li><a class="deleteid" href="/deleteUser">회원탈퇴</a></li>
	</ul>


	<div class="cd1">회원정보
	<hr>
	
	<form id="actionForm" action="getuserinfo" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 
			<div>이름
			<sec:authentication property="principal.user.userName"/></div>
		
			<div>아이디
			<sec:authentication property="principal.user.userId"/></div>
		
			<div>이메일
			<sec:authentication property="principal.user.email"/></div>
		
			<%-- <div>비밀번호
			<sec:authentication property="principal.user.password"/></div> --%>
		
			<div>전화번호
			<sec:authentication property="principal.user.phoneNumber"/></div>
	
			<div>잔여시간
			<sec:authentication property="principal.user.remainingSeatTime"/><br>
			<sec:authentication property="principal.user.remainingStudyRoomTime"/><br>
			<sec:authentication property="principal.user.remainingLockerTime"/></div>
			
 
    </form> 

	
	</div>
</body>
</html>