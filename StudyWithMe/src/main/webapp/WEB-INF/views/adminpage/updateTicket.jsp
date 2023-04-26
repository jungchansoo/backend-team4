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

	
		
		<!-- <form id="searchForm" action="search" method="get">
			<input type="radio" name="ticketType" value="male">일반 좌석
			<input type="radio" name="ticketType" value="female">스터디룸
			<input type="radio" name="ticketType" value="female">사물함
			<input type="submit" value="조회">
		</form> -->

		<div class="list">
			<p>이용권 수정</p>
		

			<div class='pull-right'>
				<form action="/modifyTicket" method="post">
					<input type="hidden" id="csrfToken" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<table>
						<tr>
							<td>요금제 이름</td>
							<td class="input-content">
	  							<input id="ticketName" name="ticketName" value="${ticket.ticketName}" required>
							</td>
						</tr>
						
						<tr>
							<td>공간 구분</td>
							<td class="input-content">
								<label><input type="radio" name="category" value="SEAT" ${ticket.category == 'SEAT' ? 'checked' : ''} >일반 좌석</label>
						        <label><input type="radio" name="category" value="STUDY_ROOM" ${ticket.category == 'STUDY_ROOM' ? 'checked' : ''} >스터디룸</label>
						        <label><input type="radio" name="category" value="LOCKER" ${ticket.category == 'LOCKER' ? 'checked' : ''} >사물함</label>
							</td>
						</tr>
						
						<tr>
							<td>충전 시간</td>
							<td class="input-content">
								<div>
									<input type="number" id="ChargingTime" name="ChargingTime" placeholder="시간을 입력해주세요" required>
									<select name="timeType">
										<option value="hour" ${ticket.chargingTime < 60*24 ? 'selected' : ''}>시간</option>
										<option value="day" ${ticket.chargingTime >= 60*24 && ticket.chargingTime < 60*24*7 ? 'selected' : ''}>일</option>
										<option value="week" ${ticket.chargingTime >= 60*24*7 && ticket.chargingTime < 60*24*7*4 ? 'selected' : ''}>주</option>
										<option value="month" ${ticket.chargingTime >= 60*24*7*4 ? 'selected' : ''}>개월</option>
							    	</select>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>적용 기간</td>
							<td class="input-content">
								<img src="resources/image/calendar.png" id="datepicker-trigger">
								<input type="text" id="startTime" name="startTime" class="datepicker" value="${ticket.startTime}" required>
								&nbsp; - &nbsp; 
								<img src="resources/image/calendar.png" id="datepicker-trigger">
								<input type="text" id="endTime" name="endTime" class="datepicker" value="${ticket.endTime}" required>
							</td>
						</tr>
						
						<tr>
							<td>가격</td>
							<td class="input-content">
								<input type="number" id="price" name="price" value="${ticket.price}" required> 원
							</td>
						</tr>
					</table>
					
					<input type='hidden' id='ticketNo' name='ticketNo' value='<c:out value="${ticket.ticketNo}"/>'>
					
					<div>
						<button type="button" class="btnForModal btn btn-outline-primary btn-lg" onclick="location.href='/ticketManagement'">목록으로</button>
						<button type="submit" data-oper='modify' class="btnForModal btn btn-outline-primary btn-lg"">이용권 수정</button>
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
