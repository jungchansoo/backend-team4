<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page import="java.util.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%>

<h1>접근이 불가능한 페이지입니다.</h1>

<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>

<h2><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage()}"/></h2>

<h2><c:out value="${msg}"/></h2>
<h2>권한이 충분한지 확인해주세요. 불편이 계속될 경우 시스템 관리자에게 문의 부탁드립니다.</h2>

</body>
</html>
