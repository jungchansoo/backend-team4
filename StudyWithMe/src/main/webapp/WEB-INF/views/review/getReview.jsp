<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>응원리뷰</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 이 부분 추가 -->


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
				</table>



				<button id="upvote-btn" class="btn btn-primary">
					<i class="bi bi-hand-thumbs-up" id="upvote-count"> ${board.upvotes} </i>
				</button>



				<button id="downvote-btn" class="btn btn-danger">
					<i class="bi bi-hand-thumbs-down" id="downvote-count"> ${board.downvotes}</i>
				</button>

			</div>
			<input type="hidden" id="reviewNo" data-review-no="${board.reviewNo}">
			<input type="hidden" id="userId" value="${pageContext.request.userPrincipal.name}" />

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
	<!-- 	<script type="text/javascript" src="/resources/js/getReview.js?var=2>"></script>
 -->
	<script>
		var reviewNo = $('#reviewNo').data('review-no');
		var userId = $('#userId').val();

		const csrfTokenValue = $('#csrfToken').val();

		var hasUpvoted;
		var hasDownvoted;

		$(document).ready(function() {
			var operForm = $("#operForm");
			$("button[data-oper='modify']").on("click", function(e) {
				operForm.attr("action", "/updateReview").submit();
			});
			hasUpvoted = '${hasUpvoted}' === 'true';
			hasDownvoted = '${hasDownvoted}' === 'true';
			updateUpvoteButton(hasUpvoted);
			updateDownvoteButton(hasDownvoted);

		});
		function updateUpvoteButton(hasUpvoted) {
			if (hasUpvoted) {
				$("#upvote-btn").removeClass("btn-light").addClass(
						"btn-primary");
			} else {
				$("#upvote-btn").removeClass("btn-primary").addClass(
						"btn-light");
			}
		}

		function updateDownvoteButton(hasDownvoted) {
			if (hasDownvoted) {
				$("#downvote-btn").removeClass("btn-light").addClass(
						"btn-danger");
			} else {
				$("#downvote-btn").removeClass("btn-danger").addClass(
						"btn-light");
			}
		}

		$(function() {
			$("#start-date").datepicker();
			$("#end-date").datepicker();
		});

		$(function() {
			$(".datepicker").datepicker({
				dateFormat : "yy-mm-dd"
			});
		});

		$(function() {
			$("#datepicker").datepicker({
				dateFormat : "yy-mm-dd",
				onSelect : function(dateText) {
					$("#selected-date").text("Selected date: " + dateText);
				}
			});

			$("#datepicker-trigger").click(function() {
				$("#datepicker").datepicker("show");
			});
		});

		function confirmDelete() {
			// 모달창 띄우기
			$('#deleteModal').modal('show');
		}

		function deleteReview() {
			// Review 삭제 요청을 보내는 AJAX 요청 코드
			$.ajax({
				url : '/deleteReview',
				type : 'POST',
				headers : {
					'X-CSRF-TOKEN' : csrfTokenValue
				},
				data : {
					reviewNo : '${board.reviewNo}'
				},
				success : function(result) {
					window.location.href = '/reviewlist';
				},
				error : function(xhr, status, error) {
					alert('삭제에 실패하였습니다.');
				}
			});
		}

		$(document).on("click", "button.btn-danger delete", function() {
			confirmDelete();
		});

		$(document).on("click", "button#delete-confirm-button", function() {
			deleteReview();
		});

		// 좋아요 버튼 클릭 이벤트

		$("#upvote-btn")
				.on(
						"click",
						function() {
							console.log("reviewNo: " + reviewNo);
							var action = hasUpvoted ? "cancelReviewUpvote"
									: "upvoteReview";
							console.log('userId:' + userId);
							console.log('action:' + action);

							$
									.ajax({
										type : "POST",
										url : "/" + action,
										headers : {
											'X-CSRF-TOKEN' : csrfTokenValue
										},
										data : {
											userId : userId,
											reviewNo : reviewNo,
											action : 'upvote'
										}
									})
									.done(
											function(data) {
												if (data === "success") {
													console
															.log("Upvote success!");
													var currentUpvotes = parseInt(
															$("#upvote-count")
																	.text(), 10);
													if (action === "upvoteReview") {
														$("#upvote-count")
																.text(
																		currentUpvotes + 1);
													} else {
														$("#upvote-count")
																.text(
																		currentUpvotes - 1);
													}
													hasUpvoted = !hasUpvoted;
													updateUpvoteButton(hasUpvoted);
												} else {
													console
															.log("Upvote failed. Data: "
																	+ data);
												}
											})
									.fail(
											function(jqXHR, textStatus,
													errorThrown) {
												console
														.log("Upvote AJAX request failed. Status: "
																+ textStatus
																+ ", Error: "
																+ errorThrown);
												console
														.log("Response: "
																+ JSON
																		.stringify(jqXHR));
											});
						});

		// 싫어요 버튼 클릭 이벤트
		$("#downvote-btn")
				.on(
						"click",
						function() {
							console.log("reviewNo: " + reviewNo);
							var action = hasDownvoted ? "cancelReviewDownvote"
									: "downvoteReview";
							console.log('userId:' + userId);
							console.log('action:' + action);

							$
									.ajax({
										type : "POST",
										url : "/" + action,
										headers : {
											'X-CSRF-TOKEN' : csrfTokenValue
										},
										data : {
											userId : userId,
											reviewNo : reviewNo,
											action : 'downvote'
										}
									})
									.done(
											function(data) {
												if (data === "success") {
													console
															.log("Downvote success!");
													var currentDownvotes = parseInt(
															$("#downvote-count")
																	.text(), 10);
													if (action === "downvoteReview") {
														$("#downvote-count")
																.text(
																		currentDownvotes + 1);
													} else {
														$("#downvote-count")
																.text(
																		currentDownvotes - 1);
													}
													hasDownvoted = !hasDownvoted;
													updateDownvoteButton(hasDownvoted);
												} else {
													console
															.log("Downvote failed. Data: "
																	+ data);
												}
											})
									.fail(
											function(jqXHR, textStatus,
													errorThrown) {
												console
														.log("Upvote AJAX request failed. Status: "
																+ textStatus
																+ ", Error: "
																+ errorThrown);
												console
														.log("Response: "
																+ JSON
																		.stringify(jqXHR));
											});
						});
	</script>
</body>
<%@include file="../includes/footer.jsp"%>
</html>
