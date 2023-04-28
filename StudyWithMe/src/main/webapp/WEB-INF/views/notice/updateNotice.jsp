<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" import="java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저관리</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
		border: 3px solid black;
		padding: 20px;
		border-radius: 50px;
	}
	
	.list p {
		text-align: left;
		font-size: 1.2em;
		font-weight: bold;
		text-align: center;
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
	table {
		border: 0px solid black;
	}

	th, td {
		border: 0px solid black;
		padding: 10px 20px;
		text-align: center;
	}
	.datepicker {
	    border: 1px solid #ccc;
	    padding: 5px;
	    font-size: 14px;
	    width: 100px;
    }
    .input-content {
    	float: left;
    }
    .input-content img {
    	height: 20px;
    	weight: 20px;
    }
    .btn-group-lg>.btn, .btn-lg {
    	margin: 0.5em;
		padding: 0.5rem 2.0rem;
	    font-size: 1.0rem;
	    line-height: 1.5;
	    border-radius: 1rem;
	}
	input{
		width: 700px;
		font-size: 15px;
		border: 0;
		border-radius: 15px;
		outline: none;
		padding-left: 10px;
		background-color: rgb(233, 233, 233);
	}
	textarea {
		width: 700px;
		height: 300px;
		padding: 10px;
		box-sizing: border-box;
		border: solid 2px #1E90FF;
		border-radius: 5px;
		font-size: 16px;
		resize: both;
	}
	.btn-div{
		float:right;
	}
	
</style>

</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%>

<body>
	<div class="cd2">
		<input id="csrfToken" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		<div class="list">
			<p>공지사항 수정</p>
		
			<div class='pull-right'>
				<form action="/modifyNotice" method="post">
					<input type="hidden" id="csrfToken" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<table>
						<tr>
							<td>번호</td>
							<td class="input-content">
	  							${board.noticeNo}
	  							
	  							<input type="hidden" name="noticeNo" value="${board.noticeNo}">
							</td>
						</tr>
						
						<tr>
							<td>제목</td>
							<td class="input-content">
	  							<input type="text" id="title" name="title" value="${board.title}" placeholder="제목을 입력" required>
							</td>
						</tr>
						
						<tr>
							<td>작성자</td>
							<td class="input-content">
								${board.userId}
							</td>
						</tr>
						
						<tr>
							<td>등록날짜</td>
							<td class="input-content">
								<img src="resources/image/calendar.png" id="datepicker-trigger">
								${board.createdDate}
								
								<input type="hidden" name="createdDate" value="${board.createdDate}">
							</td>
						</tr>
						
						<tr>
							<td>수정날짜</td>
							<td class="input-content">
	  							<%
								// 현재 날짜 가져오기
								LocalDate currentDate = LocalDate.now();
								
								// 원하는 포맷의 날짜 포매터 생성하기
								DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
								
								// 포맷터를 사용하여 날짜를 원하는 형식으로 변환하기
								String formattedDate = currentDate.format(formatter);
								%>
								
								<img src="resources/image/calendar.png" id="datepicker-trigger">
								
								<!-- 변환된 날짜 출력하기 -->
								<%= formattedDate %>
								<!-- hidden input 태그에 날짜 값 추가하기 -->
	    						<input type="hidden" name="updatedDate" value="<%= formattedDate %>">
	    						
							</td>
						</tr>
						
						<tr>
							<td>내용</td>
							<td class="input-content">
								<div class="form-group">
									<textarea  rows="3" name='content'>${board.content}</textarea>
								</div>
							</td>
						</tr>
						
					</table>
					
					<input type='hidden' id='noticeNo' name='noticeNo' value='<c:out value="${board.noticeNo}"/>'>
					
					<div class="btn-div">
						<button type="submit" data-oper='modify' class="btnForModal btn btn-outline-primary btn-lg">공지사항 수정</button>
						<button type="button" class="btnForModal btn btn-outline-primary btn-lg" onclick="location.href='/noticeBoard'">목록으로</button>
					</div>
					
				</form>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script>
		$(document).ready(function() {
			var formObj = $("form");
			
			$('button').on("click", function(e){
				e.preventDefault(); 
			    
			    var operation = $(this).data("oper");
			    
			    console.log(operation);
			    
				formObj.submit();
			});

		});

			  $('button').on("click", function(e){
	
		$(function() {
			$("#start-date").datepicker();
			$("#end-date").datepicker();
		});
		
		$(function() {
			$(".datepicker").datepicker({
				dateFormat: "yy-mm-dd"
			});
		});
		$(function() {
			$("#datepicker").datepicker({
				dateFormat: "yy-mm-dd",
				onSelect: function(dateText) {
					$("#selected-date").text("Selected date: " + dateText);
				}
		    });
		    
		    $("#datepicker-trigger").click(function() {
		    	$("#datepicker").datepicker("show");
		    });
		});
	</script>

</body>
<%@include file="../includes/footer.jsp"%>
</html>
