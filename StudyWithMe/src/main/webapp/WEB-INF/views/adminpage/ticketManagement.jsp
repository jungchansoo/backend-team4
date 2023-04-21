<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저관리</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">

<link rel="stylesheet" href="resources/css/userMainPage.css" type="text/css">

<style>
	.cd2 {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		margin: auto;
		width: 80%;
		min-height: 500px; /* 최소 높이 지정 */
		padding: 20px;
	}
	
	#searchForm {
		margin-left: auto;
	}
	
	.list {
		text-align: center;
	}
	
	.list p {
		text-align: left;
		font-size: 1.2em;
		font-weight: bold;
	}
	
	.list tbody {
		margin-top: 20px;
		font-size: 16px;
		line-height: 2;
	}
	
	.list table {
		border-collapse: collapse;
	}
	
	.list thead tr {
		border-bottom: 1px solid black;
	}
	
	.list th, .list td {
		padding: 10px;
	}
	
	.pagination {
		list-style-type: none;
		display: flex;
		justify-content: center;
	}
	
	.pagination li {
		margin-right: 20px;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- 헤드 태그 안에 들어가는 공통코드 -->

</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%>

<body>
	<div class="cd2">
		<input id="csrfToken" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		<!-- 검색 기능 -->
		<form id='searchForm' action="/userlist" method='get'>
			<select name='type'>
				<option value="N"
					<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>이름</option>
				<option value="I"
					<c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>아이디</option>
				<option value="P"
					<c:out value="${pageMaker.cri.type eq 'P'?'selected':''}"/>>전화번호</option>
			</select> <input type='text' name='keyword'
				value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
				type='hidden' name='pageNum'
				value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
				type='hidden' name='amount'
				value='<c:out value="${pageMaker.cri.amount}"/>' />
			<button class='btn btn-default'>검색</button>
		</form>

		<div class="list">
			<table>
				<p>이용권 목록</p>
				<thead>
					<tr>
						<th>번호</th>
						<th>구분</th>
						<th>이용권</th>
						<th>충전시간</th>
						<th>가격</th>
						<th>상태</th>
						<th>판매기간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ticket" items="${ticketList}">
						<tr>
							<td>${ticket.ticketNo}</td>
							<td>
								<c:if test="${ticket.category == 'SEAT'}">일반 좌석</c:if>
								<c:if test="${ticket.category == 'STUDY_ROOM'}">스터디룸</c:if>
								<c:if test="${ticket.category == 'LOCKER'}">사물함</c:if>
							</td>
							<td>${ticket.ticketName}</td>
							<td><fmt:formatNumber value="${ticket.chargingTime / 60}" pattern="# '시간'" /></td>
							<td><fmt:formatNumber value="${ticket.price}" pattern="#,##0원" /></td>
							
							<c:set var="currentTime" value="<%= new java.util.Date() %>" />

							<c:choose>
							    <c:when test="${currentTime >= ticket.startTime and currentTime <= ticket.endTime}">
							        <td>판매중</td>
							    </c:when>
							    <c:otherwise>
							        <td>미판매중</td>
							    </c:otherwise>
							</c:choose>
							
							<td>${ticket.startTime} - ${ticket.endTime}</td>
							
							<td>
								
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class='pull-right'>
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a
						href="${pageMaker.startPage -1}">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
						<a href="${num}">${num}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a
						href="${pageMaker.endPage +1 }">Next</a></li>
				</c:if>


			</ul>
		</div>

		<form id="actionForm" action="ticketManagement" method="get">
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type="hidden" name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='type'
				value='<c:out value="${ pageMaker.cri.type }"/>'> <input
				type='hidden' name='keyword'
				value='<c:out value="${ pageMaker.cri.keyword }"/>'>
		</form>

	</div>


	<script>
		const csrfTokenValue = $('#csrfToken').val();

		function deleteUser(userId) {
			if (confirm("정말 삭제하시겠습니까?")) {
				$.ajax({
					type : "POST",
					url : "/userDelete",
					data : {
						'_csrf' : csrfTokenValue,
						'userId' : userId
					},
					beforeSend : function(xhr) {
						xhr.setRequestHeader("X-CSRF-TOKEN", csrfTokenValue);
					},
					success : function(response) {
						if (response === "success") {
							alert("회원 삭제가 완료되었습니다.");
							location.reload();
						} else {
							alert("회원 삭제에 실패하였습니다.");
						}
					}
				});
			}
		}
	</script>


	<script>
		$(document).ready(
				function() {
					history.replaceState({}, null, null);
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

					var actionForm = $("#actionForm");
					$(".paginate_button a").on(
							"click",
							function(e) {
								e.preventDefault();
								console.log('click');
								actionForm.find("input[name='pageNum']").val(
										$(this).attr("href"));
								actionForm.submit();
							});

				});
	</script>



</body>
</html>
