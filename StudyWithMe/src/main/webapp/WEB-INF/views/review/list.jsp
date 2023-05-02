<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>응원 리뷰</title>
<!-- Add Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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
	margin-right: 70px;
	padding-right: 20px;
	padding-bottom: 20px;
	padding-right: 20px
}

.list {
	text-align: center;
}

form {
	text-align: left;
	padding-right: 500px;
}

.cd2 p {
	text-align: left;
	font-size: 1.2em;
	font-weight: bold;
	padding-top: 20px;
	padding-down: 20px;
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
	padding: 20px;
}

.pagination {
	list-style-type: none;
	display: flex;
	justify-content: center;
}

.pagination li {
	margin-right: 20px;
}

.btn-group-lg>.btn, .btn-lg {
	margin: 0.5em;
	padding: 0.5rem 2.0rem;
	font-size: 1.0rem;
	line-height: 1.5;
	border-radius: 1rem;
}
</style>
</head>
<body>
	<%@include file="../includes/header.jsp"%>



	<div class="cd2">
		<input id="csrfToken" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		<p>리뷰 목록</p>
		<!-- 검색 기능 -->
		<form id='searchForm' action="reviewlist" method='get'>
			<select name='type'>
				<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
				<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
				<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
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
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>댓글</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="review" items="${reviewList}">
						<tr>
							<td>${review.reviewNo}</td>
							<td><a class='move' href='<c:out value="${review.reviewNo}"/>'>
									<c:out value="${review.title}" />
								</a></td>
							<td>${review.userId}</td>
							<td>${review.createdDate}</td>
							<td>${review.replyCnt}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>


		<div class='pull-right'>
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					<li class="paginate_button  ${pageMaker.cri.pageNum == num ? 'active':''} "><a href="${num}">${num}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
				</c:if>

			</ul>
		</div>

		<form id="actionForm" action="noticeBoard" method="get">
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type="hidden" name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
		</form>

		<div>
			<button type="button" class="btnForModal btn btn-outline-primary btn-lg" onclick="location.href='/insertReview'">새글 등록</button>
		</div>

	</div>

	<input id="csrfToken" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

	<!-- js 파일 경로 -->
	<script type="text/javascript" src="/resources/js/reviewList.js">	</script>
</body>
<%@include file="../includes/footer.jsp"%>


</html>