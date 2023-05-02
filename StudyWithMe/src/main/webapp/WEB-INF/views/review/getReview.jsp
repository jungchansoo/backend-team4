<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>응원리뷰</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> <!-- 이 부분 추가 -->


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="resources/css/getReview.css" type="text/css">
</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%>

<body>
	<div class="cd2">
		<input id="csrfToken" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<div class="list">
			<p>응원리뷰</p>

			<div class='pull-right'>
				<input type="hidden" id="csrfToken" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<table>
					<tr>
						<td>번호</td>
						<td class="input-content">${board.reviewNo}</td>
					</tr>

					<tr>
						<td>제목</td>
						<td class="input-content">${board.title}</td>
					</tr>

					<tr>
						<td>작성자</td>
						<td class="input-content">${board.userId}</td>
					</tr>

					<tr>
						<td>작성일</td>
						<td class="input-content">${board.createdDate}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td class="input-content">
							<div class="form-group">
								<textarea rows="3" name='content' readonly>${board.content}</textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td>좋아요</td>
						<td class="">
							<button id="upvote-btn" class="btn btn-primary">
								<i class="fas fa-thumbs-up"></i> <div id="upvote-count"> ${board.upvotes}</div>
							</button>
						</td>
					</tr>
					<tr>
						<td>싫어요</td>
						<td class="">
							<button id="downvote-btn" class="btn btn-danger">
								<i class="fas fa-thumbs-down"></i><div id="downvote-count"> ${board.downvotes}</div>
							</button>
						</td>
					</tr>
				</table>
			</div>
			<input type="hidden" id="reviewNo" data-review-no="${board.reviewNo}">
			
			<div class="btn-div">
				<!-- 모달창 -->
				<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="deleteModalLabel">리뷰 삭제</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body">정말로 리뷰 글을 삭제하시겠습니까?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary cancel" data-bs-dismiss="modal">취소</button>
								<button type="button" class="btn btn-danger delete" onclick="deleteReview()">삭제</button>
							</div>
						</div>
					</div>
				</div>
				<!-- userId와 board.userId가 일치할 때만 수정/삭제 버튼을 보여줌 -->
				<sec:authorize access="hasRole('ROLE_ADMIN')" var="isAdmin" />
				<c:if test="${board.userId == pageContext.request.userPrincipal.name or isAdmin}">
					<button data-oper='modify' class="btnForModal btn btn-outline-primary btn-lg">리뷰 수정</button>
					<button type="button" class="btnForModal btn btn-outline-primary btn-lg" onclick="if(confirm('정말로 삭제하시겠습니까?')) { location.href='/deleteReview?reviewNo=${board.reviewNo}'; }">리뷰 삭제</button>
				</c:if>
				<button type="button" class="btnForModal btn btn-outline-primary btn-lg" onclick="location.href='/reviewlist'">목록으로</button>
				<form id='operForm' action="updateReview" method="get">
					<input type='hidden' id='reviewNo' name='reviewNo' value='<c:out value="${board.reviewNo}"/>'>
				</form>
			</div>
		</div>
	</div>

	<!-- js 파일 경로 -->
	<script type="text/javascript" src="/resources/js/getReview.js"></script>
</body>
<%@include file="../includes/footer.jsp"%>
</html>
