<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저관리</title>
</head>
<body>

	<!-- 검색 기능 -->
	<form id='searchForm' action="/userlist" method='get'>
		<select name='type'>
			<option value=""
				<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
			<option value="I"
				<c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>아이디</option>
			<option value="N"
				<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>이름</option>
			<option value="P"
				<c:out value="${pageMaker.cri.type eq 'P'?'selected':''}"/>>전화번호</option>
			<%-- <option value="IN"
				<c:out value="${pageMaker.cri.type eq 'IN'?'selected':''}"/>>아이디
				or 이름</option>
			<option value="IP"
				<c:out value="${pageMaker.cri.type eq 'IP'?'selected':''}"/>>아이디
				or 전화번호</option>
			<option value="INP"
				<c:out value="${pageMaker.cri.type eq 'INP'?'selected':''}"/>>아이디
				or 이름 or 전화번호</option> --%>
		</select> <input type='text' name='keyword'
			value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
			type='hidden' name='pageNum'
			value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
			type='hidden' name='amount'
			value='<c:out value="${pageMaker.cri.amount}"/>' />
		<button class='btn btn-default'>검색</button>
	</form>

	<form id='actionForm' action="/userlist" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
		<input type='hidden' name='type'
			value='<c:out value="${ pageMaker.cri.type }"/>'> <input
			type='hidden' name='keyword'
			value='<c:out value="${ pageMaker.cri.keyword }"/>'>
	</form>

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
					<td>${user.role}</td>
					<td>${user.userId}</td>
					<td>${user.userName}</td>
					<td>${user.email}</td>
					<td>${user.phoneNumber}</td>
					<td>${user.remainingSeatTime}</td>
					<td>${user.remainingStudyRoomTime}</td>
					<td>${user.remainingLockerTime}</td>
					<td><button onclick="#">삭제</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 하단 페이징처리 -->
	<div>
		<ul class="pagination">
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous"><a
					href="${pageMaker.startPage - 1}">Previous</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a
					href="${pageMaker.endPage + 1}">Next</a></li>
			</c:if>
		</ul>
	</div>

<script>
	$(document).ready(function() {
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click",function(e) {
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

	});
</script>

</body>
</html>
