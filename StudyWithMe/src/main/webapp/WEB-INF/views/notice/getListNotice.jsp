<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저관리</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">

<link rel="stylesheet" href="resources/css/userMainPage.css" type="text/css">

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
		padding-right : 20px;
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
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%>

<body>
	<div class="cd2">
		<input id="csrfToken" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		<p>공지사항</p>
		
		<!-- 검색 기능 -->
		<form id='searchForm' action="/noticeBoard" method='get'>
			<select name='type'>
				<option value="title" <c:out value="${pageMaker.cri.type eq 'title'?'selected':''}"/>>제목</option>
				<option value="content" <c:out value="${pageMaker.cri.type eq 'content'?'selected':''}"/>>내용</option>
				<option value="userId" <c:out value="${pageMaker.cri.type eq 'userId'?'selected':''}"/>>작성자</option>
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
						<th>수정일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td>${board.noticeNo}</td>	
							<td>
								<a class='move' href='<c:out value="${board.noticeNo}"/>'>
									<c:out value="${board.title}" /> 
								</a>
							</td>
							<td>${board.userId}</td>
							<td>${board.createdDate}</td>
							<td>
								<c:if test="${board.updatedDate != null}">${board.updatedDate}</c:if>
								<c:if test="${board.updatedDate == null}">-</c:if>
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

		<form id="actionForm" action="noticeBoard" method="get">
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type="hidden" name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='type'value='<c:out value="${ pageMaker.cri.type }"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
		</form>
		
		<div>
			<c:if test="${loginUser.role == 'ROLE_ADMIN' || loginUser.role == 'ROLE_MANAGER'}">
				<button type="button" class="btnForModal btn btn-outline-primary btn-lg" onclick="location.href='/insertNotice'">새글 등록</button>
			</c:if>
		</div>
	</div>
	
	
	<!-- Modal -->
	<div id="errorMessageModal" class="modal fade" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
	    	<div class="modal-content modal-content-size">
		    	<div class="modal-body modal-textsize">
		        	<p></p>
		        </div>
		        <div class="modal-footer modal-footer-size">
		        	<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
		        </div>
		    </div>
		</div>
	</div>
	

	
	<script>
		const csrfTokenValue = $('#csrfToken').val();

		$(document).ready(
				function() {
					history.replaceState({}, null, null);
					var searchForm = $("#searchForm");
					$("#searchForm button").on("click", function(e) {
						searchForm
								.find(
										"input[name='pageNum']")
								.val("1");
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
				
				$(".move").on("click", function(e) {
					e.preventDefault();
					actionForm.append("<input type='hidden' name='noticeNo' value='"
											+ $(this).attr("href")
											+ "'>");
							actionForm.attr("action", "/getNotice");
							actionForm.submit();
				});
					
		});
		
		var cafeNum = <%= session.getAttribute("cafeNum") %>;
		function checkCafeNo(event) {
	    	event.preventDefault();
	    
		    if (cafeNum === null || cafeNum === undefined || cafeNum === '') {
		      $('#errorMessageModal').find('.modal-body').text('스터디카페 선택 후 이용해주세요');
		      $('#errorMessageModal').modal('show');
		      
		      return false;
		    }
		    else {
		    	window.location.href = '/userstudyseat';
		    }
		}
	</script>

</body>
<%@include file="../includes/footer.jsp"%>
</html>
