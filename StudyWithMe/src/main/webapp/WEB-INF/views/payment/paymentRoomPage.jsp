<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	
	li a.room {
		background: #333;
		color: #fff;
	}
	
	.cd1 {
		margin-left: 140px;
	}
</style>
</head>
<body>
	<h1>이용권구매</h1>
	
	<ul>
		<li><a class="seat" href="/paymentSeatPage">스터디석</a></li>
		<li><a class="room" href="/paymentRoomPage">스터디룸</a></li>
		<li><a class="locker" href="/paymentLockerPage">사물함</a></li>
	</ul>
	
	<div class="cd1">스터디룸
	<hr>
	
	<form id="actionForm" action="getuserinfo" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 
		
			
 
    </form> 

	
	</div>
	
</body>
</html>