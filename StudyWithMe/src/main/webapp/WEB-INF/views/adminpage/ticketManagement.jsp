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
	
	.btn-group-lg>.btn, .btn-lg {
		padding: 0.5rem 3.0rem;
	    font-size: 1.25rem;
	    line-height: 1.5;
	    border-radius: 1rem;
	}

</style>

<!-- 헤드 태그 안에 들어가는 공통코드 -->

</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%>

<body>
	<div class="cd2">
		<input id="csrfToken" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		<!-- 검색 기능 -->
		<form id='searchForm' action="/ticketManagement" method='get'>
			<input type='hidden' name='type' value="category" ${pageMaker.cri.type}/>
			<label><input type="radio" name="keyword" value="SEAT" ${pageMaker.cri.keyword == 'SEAT' ? 'checked' : ''} />일반 좌석</label>
			<label><input type="radio" name="keyword" value="STUDY_ROOM" ${pageMaker.cri.keyword == 'STUDY_ROOM' ? 'checked' : ''} />스터디룸</label>
			<label><input type="radio" name="keyword" value="LOCKER" ${pageMaker.cri.keyword == 'LOCKER' ? 'checked' : ''} />사물함</label>
			<input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
			<input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
		</form>
		
		<!-- <form id="searchForm" action="search" method="get">
			<input type="radio" name="ticketType" value="male">일반 좌석
			<input type="radio" name="ticketType" value="female">스터디룸
			<input type="radio" name="ticketType" value="female">사물함
			<input type="submit" value="조회">
		</form> -->

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
							<td>
								<a class='move' href='<c:out value="${ticket.ticketNo}"/>'>
									<c:out value="${ticket.ticketName}" /> 
								</a>
							</td>
							
							<td>
								<c:if test="${ticket.category == 'SEAT'}"><fmt:formatNumber value="${ticket.chargingTime / 60}" pattern="# '시간'" /></c:if>
								<c:if test="${ticket.category == 'STUDY_ROOM'}"><fmt:formatNumber value="${ticket.chargingTime / 60}" pattern="# '시간'" /></c:if>
								<c:if test="${ticket.category == 'LOCKER'}"><fmt:formatNumber value="${ticket.chargingTime / (60 * 24)}" pattern="# '일'" /></c:if>
							</td>
							
							
							<td><fmt:formatNumber value="${ticket.price}" pattern="#,##0원" /></td>
							
							<td>
								<c:if test="${ticket.isSale == 1}">판매중</c:if>
								<c:if test="${ticket.isSale == 0}">미판매중</c:if>
							</td>
							
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
			<input type='hidden' name='type'value='<c:out value="${ pageMaker.cri.type }"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
		</form>
		
		<div>
			<button type="button" class="btn btn-primary btn-lg mr-2" onclick="location.href='/insertTicket'">이용권 추가</button>
		</div>

	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		const csrfTokenValue = $('#csrfToken').val();

		$(document).ready(
				function() {
					history.replaceState({}, null, null);
					var searchForm = $("#searchForm");
					$("#searchForm").on("click", function(e) {
						
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
					
					$(".move")
					.on(
							"click",
							function(e) {

								e.preventDefault();
								actionForm
										.append("<input type='hidden' name='ticketNo' value='"
												+ $(this).attr(
														"href")
												+ "'>");
								actionForm.attr("action",
										"/getTicket");
								actionForm.submit();

							});
					
				});
	</script>



</body>
<%@include file="../includes/footer.jsp"%>
</html>
