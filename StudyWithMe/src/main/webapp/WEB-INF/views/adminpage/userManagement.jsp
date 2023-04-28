<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>유저관리</title>

<style>
.cd2 {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin: auto;
	width: 90%;
	padding: 20px;
	font-size: 1.2em;
}

.cd2 p {
	margin: 10 0;
	width: inherit;
	font-size: 1.2em;
	font-weight: bold;
	height: 20px;
}

#searchForm {
	margin-left: 70%;
	padding-right: 20px;
	padding-bottom: 20px;
}

.list {
	text-align: center;
}

.list tbody {
	margin-top: 20px;
	line-height: 3;
}

.list table {
	border-collapse: collapse;
}

.list thead tr {
	border-bottom: 1px solid black;
}

.list th, .list td {
	padding: 3px;
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
</head>
<body>
	<!-- 헤더 -->
	<%@include file="../includes/header.jsp"%>



	<div class="cd2">
		<input id="csrfToken" type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />

		<p>유저목록</p>
		<!-- 검색 기능 -->
		<form id='searchForm' action="/userlist" method='get'>
			<select name='type'>
				<option value="N" <c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>이름</option>
				<option value="I" <c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>아이디</option>
				<option value="P" <c:out value="${pageMaker.cri.type eq 'P'?'selected':''}"/>>전화번호</option>
			</select>
				<input type='text' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
				<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
				<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
			<button class='btn btn-default'>검색</button>
		</form>


		<div class="list">
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
						<th>---</th>
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
							<td>${changer.time_longtoString(user.remainingSeatTime)}</td>
							<td>${changer.time_longtoString(user.remainingStudyRoomTime)}</td>
							<td>${changer.time_longtoString(user.remainingLockerTime)}</td>
							<td>
								<button onclick="deleteUser('${user.userId}')">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


		<!-- 하단 페이징처리 -->
		<ul class="pagination">
			<li class="paginate_button previous"><a
				href="${pageMaker.startPage - 1}">Previous</a></li>
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li
					class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':''}">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>
			<li class="paginate_button next"><a
				href="${pageMaker.endPage + 1}">Next</a></li>
		</ul>


		<form id="actionForm" action="/userlist" method="get">
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
		$(document)
				.ready(
						function() {
							history.replaceState({}, null, null);
							var searchForm = $("#searchForm");
							$("#searchForm button")
									.on(
											"click",
											function(e) {
												/* if (!searchForm.find("option:selected").val()) {
													alert("검색종류를 선택하세요");
													return false;
												} */
												if (!searchForm
														.find(
																"input[name='keyword']")
														.val()) {
													alert("키워드를 입력하세요");
													return false;
												}
												searchForm
														.find(
																"input[name='pageNum']")
														.val("1");
												e.preventDefault();
												searchForm.submit();
											});

							var actionForm = $("#actionForm");

							$(".paginate_button.previous a")
									.on(
											"click",
											function(e) {
												e.preventDefault();
												var page = parseInt(actionForm
														.find(
																"input[name='pageNum']")
														.val());
												if (page > 1) {
													actionForm
															.find(
																	"input[name='pageNum']")
															.val(page - 1);
													actionForm.submit();
												}
											});

							$(".paginate_button.next a")
									.on(
											"click",
											function(e) {
												e.preventDefault();
												var page = parseInt(actionForm
														.find(
																"input[name='pageNum']")
														.val());
												var lastPage = parseInt("${pageMaker.endPage}");
												if (page < lastPage) {
													actionForm
															.find(
																	"input[name='pageNum']")
															.val(page + 1);
													actionForm.submit();
												}
											});

							$(".paginate_button:not(.previous, .next) a").on(
									"click",
									function(e) {
										e.preventDefault();
										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});

						});
	</script>



</body>
<%@include file="../includes/footer.jsp"%>
</html>
