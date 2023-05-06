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
	margin: auto;
	width: 70%;
	min-height: 500px; /* 최소 높이 지정 */
	padding: 20px;
}

.cd2 p {
	text-align: center;
	font-size: 1.2em;
	font-weight: bold;
	padding-top: 20px;
	padding-down: 20px;
}

.table thead th {
	text-align: center;
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

		<p id="titleHead">리뷰 목록</p>


		<div class="list">
			<div class="table-responsive">

				<table class="table">
					<thead>
						<tr>
							<th class="col-1 text-center">번호</th>
							<th class="col-7 text-start">제목</th>
							<th class="col-1 text-center">작성자</th>
							<th class="col-2 text-center">작성일</th>
							<th class="col-1 text-center">댓글</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="review" items="${reviewList}">
							<tr>
								<td class="col-1 text-center">${review.reviewNo}</td>
								<td class="col-7 text-start"><a class='move' href='<c:out value="${review.reviewNo}"/>'>
										<c:out value="${review.title}" />
									</a></td>
								<td class="col-1 text-center">${review.userId}</td>
								<td class="col-2 text-center">${review.createdDate}</td>
								<td class="col-1 text-center">${review.replyCnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
		<div class="d-flex flex-row justify-content-end">
			<button type="button" class="btnForModal btn btn-outline-primary btn-lg" onclick="location.href='/insertReview'">새글 등록</button>
		</div>

		<div class='pull-right'>
			<ul class="pagination d-flex flex-row justify-content-center">
				<c:if test="${pageMaker.prev}">
					<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active':''}"><a href="${num}" style="${pageMaker.cri.pageNum == num ? 'font-weight: bold;':''}">${num}</a></li>
				</c:forEach>

				<c:if test="${pageMaker.next}">
					<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
				</c:if>

			</ul>
		</div>
		<div class="d-flex flex-row justify-content-center">

			<!-- 검색 기능 -->
			<form id='searchForm' class="d-flex" action="reviewlist" method='get'>
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

		</div>

		<form id="actionForm" action="reviewlist" method="get">
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type="hidden" name='amount' value='${pageMaker.cri.amount}'>
			<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'>
			<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
		</form>



	</div>

	<input id="csrfToken" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

	<!-- js 파일 경로 -->
<!-- 	<script type="text/javascript" src="/resources/js/reviewList.js">
		
	</script>
	
	 -->
<script type="text/javascript">
/**
 * 
 */
$(document).ready(
    function () {
        history.replaceState({}, null, null);
        var searchForm = $("#searchForm");
        $("#searchForm button").on("click",
            function (e) {
                if (!searchForm.find(
                    "input[name='keyword']").val()) {
                        alert("키워드를 입력하세요");
                    return false;
                }
                searchForm.find("input[name='pageNum']").val("1");
                e.preventDefault();
                searchForm.submit();
            });

        var actionForm = $("#actionForm");
        $(".paginate_button.previous a").on("click", function (e) {
            e.preventDefault();
            var page = parseInt(actionForm.find("input[name='pageNum']").val());
            var startPage = parseInt("${pageMaker.startPage}");
            if (page > 1) {
                actionForm.find("input[name='pageNum']").val(startPage - 1);
                actionForm.submit();
            }
        });

        $(".paginate_button.next a").on("click", function (e) {
            e.preventDefault();
            var page = parseInt(actionForm.find("input[name='pageNum']").val());
            var endPage = parseInt("${pageMaker.endPage}");
            var lastPage = parseInt("${pageMaker.total / pageMaker.cri.amount + (pageMaker.total % pageMaker.cri.amount == 0 ? 0 : 1)}");
            if (page < lastPage) {
                actionForm.find("input[name='pageNum']").val(endPage + 1);
                actionForm.submit();
            }
        });
        $(".paginate_button:not(.previous, .next) a").on("click",
            function (e) {
                e.preventDefault();
                actionForm.find("input[name='pageNum']").val($(this).attr("href"));
                actionForm.submit();
            });
        $(".move").on("click",
            function (e) {
                e.preventDefault();
                actionForm.append("<input type='hidden' name='reviewNo' value='" + $(this).attr("href") + "'>");
                actionForm.attr("action", "/getReview");
                actionForm.submit();
            });

    });
</script>
</body>

<%@include file="../includes/footer.jsp"%>


</html>