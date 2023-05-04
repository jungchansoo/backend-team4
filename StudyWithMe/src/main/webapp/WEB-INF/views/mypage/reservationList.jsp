<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Add Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>MyPage</title>
<link rel="stylesheet" href="resources/css/sidebar.css" type="text/css">

	<style>
li a.reservatelist {
	background: #333;
	color: #fff;
}

#searchForm {
	margin-left: 70%;
	padding-bottom: 10px;
	font-size: 0.9rem;
    margin-right: 5%;
}

table {
	border-radius: 12px;
	border: solid 2px black;
	width: 95%;
	margin: auto;
	text-align: center;
	padding: 3px;
	margin-bottom: 1rem;
}

th,td {
padding: 5px;
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

	<ul class="sidebar">
		<li class="side_title">Mypage</li>
		<li><a class="userinfo" href="/userinfo">회원정보</a></li>
		<li><a class="reservatelist" href="/reservationList">예약내역</a></li>
		<li><a class="chagepw" href="/updatePw">비밀번호변경</a></li>
		<li><a class="deleteid" href="/deleteUser">회원탈퇴</a></li>
	</ul>

	<div class="cd1">

		<input id="csrfToken" type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<!-- 예약 목록 리스트 -->
		<p>예약 내역</p>
		<hr>

		<!-- 검색 기능 -->
		<form id='searchForm' action="/reservationList" method='get'>
    <div class="input-group mb-3">
        <select class="form-select" name='searchType'>
            <option value="N" <c:if test="${pageMaker.recri.searchType eq 'N'}">selected</c:if>>이용지점</option>
            <option value="C" <c:if test="${pageMaker.recri.searchType eq 'C'}">selected</c:if>>좌석종류</option>
            <option value="S" <c:if test="${pageMaker.recri.searchType eq 'S'}">selected</c:if>>예약날짜</option>
        </select>
        <input type='text' class="form-control" name='keyword' value='<c:out value="${pageMaker.recri.keyword}"/>' />
        <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.recri.pageNum}"/>' />
        <input type='hidden' name='amount' value='<c:out value="${pageMaker.recri.amount}"/>' />
        <button type="button" class="btn btn-outline-dark">검색</button>
    </div>
</form>


		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>이용지점</th>
					<th>예약날짜</th>
					<th>좌석종류</th>
					<th>좌석번호</th>
					<th>이용시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${reservationList}" var="reservation"
					varStatus="status">
					<tr>
						<td>${pageMaker.getRealIndex(status.index)}</td>
						<td>${reservation.name}</td>
						<td>${changer.convertToKoreanDate(reservation.start_time)}</td>
						<td>${reservation.category}</td>
						<td>${reservation.num_using}</td>
						<td>${changer.time_longtoString(reservation.duration)}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<!-- 하단 페이징처리 -->
		<ul class="pagination">
			<li class="paginate_button previous"><a
				href="${pageMaker.startPage - 1}">Previous</a></li>
			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li
					class="paginate_button ${pageMaker.recri.pageNum == num ? 'active':''}">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>
			<li class="paginate_button next"><a
				href="${pageMaker.endPage + 1}">Next</a></li>
		</ul>

		<form id='actionForm' action="/reservationList" method='get'>
			<input type='hidden' name='pageNum'
				value='${pageMaker.recri.pageNum}'> <input type='hidden'
				name='amount' value='${pageMaker.recri.amount}'> <input
				type='hidden' name='searchType'
				value='<c:out value="${pageMaker.recri.searchType}"/>'> <input
				type='hidden' name='keyword'
				value='<c:out value="${pageMaker.recri.keyword}"/>'>
		</form>

	</div>

	<script>
	$(document).ready(function() {
		  history.replaceState({}, null, null);

		  var searchForm = $("#searchForm");

		  $("#searchForm button").on("click", function(e) {
		    if (!searchForm.find("input[name='keyword']").val()) {
		      alert("키워드를 입력하세요");
		      return false;
		    }
		    searchForm.find("input[name='pageNum']").val("1");
		    e.preventDefault();
		    searchForm.submit();
		  });

		  var actionForm = $("#actionForm");

		  $(".paginate_button.previous a").on("click", function(e) {
		    e.preventDefault();
		    var page = parseInt(actionForm.find("input[name='pageNum']").val());
		    if (page > 1) {
		      actionForm.find("input[name='pageNum']").val(page - 1);
		      actionForm.submit();
		    }
		  });
		  
		  $(".paginate_button.next a").on("click", function(e) {
			    e.preventDefault();
			    var page = parseInt(actionForm.find("input[name='pageNum']").val());
			    var lastPage = parseInt("${pageMaker.realEnd}");
			    if (page < lastPage) {
			        actionForm.find("input[name='pageNum']").val(page + 1);
			        actionForm.submit();
			    }
			});

		  $(".paginate_button:not(.previous, .next) a").on("click", function(e) {
		    e.preventDefault();
		    actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		    actionForm.submit();
		  });
		});

	</script>
	
	

</body>
<%@include file="../includes/footer.jsp"%>
</html>
