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
	<%-- vo:${loginUser}
	username:${name}
	password:${password} --%>

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

li a.userinfo {
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