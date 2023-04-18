<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form id='searchForm' action="" method='get'>
		<button class='btn btn-default'>Search</button>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>권한</th>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>스터디석 잔여시간</th>
					<th>스터디룸 잔여시간</th>
					<th>사물함 잔여시간</th>
					<th></th>
				</tr>
			</thead>

			<tbody>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.userNo}</td>
                    <td>${user.userId}</td>
                    <td>${user.userName}</td>
                    <td>${user.phoneNumber}</td>
                    <td>${user.email}</td>
                    <td>${user.role}</td>
                    <td>${user.remainingSeatTime}</td>
                    <td>${user.remainingStudyRoomTime}</td>
                    <td>${user.remainingLockerTime}</td>
					<td><button onclick="deleteUser('<%=%>')">삭제</button></td>
                </tr>
            </c:forEach>
			</tbody>
		</table>
	</form>

	<script>
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		});
	</script>


</body>
</html>