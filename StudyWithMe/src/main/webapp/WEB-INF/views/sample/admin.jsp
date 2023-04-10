<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>/sample/admin page</h1>


<p>principal : <sec:authentication property="principal"/></p>
<p>UserVO : <sec:authentication property="principal.user"/></p>
<p>사용자이름(UserVO로 획득) : <sec:authentication property="principal.user.userName"/></p>
<p>사용자아이디 (principal.username로 획득): <sec:authentication property="principal.username"/></p>
<p>사용자 권한(UserVO로 획득) : <sec:authentication property="principal.user.role"/></p>


<a href="/logout">Logout</a>


</body>
</html>
