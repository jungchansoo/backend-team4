<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<title>Insert title here</title>
</head>
<body>
    <h1>User Role Test Result</h1>
    <p>${result}</p>
    <h1>Cotroller로 새롭게 얻은 UserName(기존처럼 메소드 안에서 UserUtil을 선언한 경우)</h1>
    <p>${nameChangeResult }</p>
 
     <h1>Cotroller로 새롭게 얻은 UserName(클래스 로컬 변수로 UserUtil을 선언한 경우)</h1>
    <p>${nameChangeResult2 }</p>
    
    <h1>Cotroller에서 새롭게 셋팅한 UserVO가 있는지 확인</h1>
    <p>UserVO : <sec:authentication property="principal.user"/></p>
    
</body>
</html>