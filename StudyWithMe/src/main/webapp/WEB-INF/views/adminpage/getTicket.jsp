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
    .modal {
		display: none;
		position: fixed;
		z-index: 1;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgba(0, 0, 0, 0.4);
	}
	
	.modal-content {
		background-color: #fefefe;
		margin: 15% auto;
		padding: 20px;
		border: 1px solid #888;
		width: 80%;
	}
	
	.close {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
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
		
		<div class="list">
			<p>이용권</p>
		

			<div class='pull-right'>
				<input type="hidden" id="csrfToken" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<table>
					<tr>
						<td>요금제 이름</td>
						<td class="input-content">
							${ticket.ticketName}
						</td>
					</tr>
					
					<tr>
						<td>공간 구분</td>
						<td class="input-content">
							<c:if test="${ticket.category == 'SEAT'}">일반 좌석</c:if>
							<c:if test="${ticket.category == 'STUDY_ROOM'}">스터디룸</c:if>
							<c:if test="${ticket.category == 'LOCKER'}">사물함</c:if>
						</td>
					</tr>
					
					<tr>
						<td>충전 시간</td>
						<td class="input-content">
							<div>
								<c:if test="${ticket.category == 'SEAT'}"><fmt:formatNumber value="${ticket.chargingTime / 60}" pattern="# '시간'" /></c:if>
								<c:if test="${ticket.category == 'STUDY_ROOM'}"><fmt:formatNumber value="${ticket.chargingTime / 60}" pattern="# '시간'" /></c:if>
								<c:if test="${ticket.category == 'LOCKER'}"><fmt:formatNumber value="${ticket.chargingTime / (60 * 24)}" pattern="# '일'" /></c:if>
							</div>
						</td>
					</tr>
					
					<tr>
						<td>적용 기간</td>
						<td class="input-content">
							<img src="resources/image/calendar.png" id="datepicker-trigger">
							${ticket.startTime}
							&nbsp; - &nbsp; 
							<img src="resources/image/calendar.png" id="datepicker-trigger">
							${ticket.endTime}
						</td>
					</tr>
					
					<tr>
						<td>가격</td>
						<td class="input-content">
							<fmt:formatNumber value="${ticket.price}" pattern="#,##0원" />
						</td>
					</tr>
				</table>
				</div>
			<div>
			
				<!-- 모달창 -->
				<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="deleteModalLabel">이용권 삭제</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        정말로 이용권을 삭제하시겠습니까?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="button" class="btn btn-danger" onclick="deleteTicket()">삭제</button>
				      </div>
				    </div>
				  </div>
				</div>
			
				<button type="button" class="btnForModal btn btn-outline-primary btn-lg" onclick="location.href='/ticketManagement'">목록으로</button>
				<button type="button" class="btnForModal btn btn-outline-primary btn-lg" onclick="if(confirm('정말로 삭제하시겠습니까?')) { location.href='/deleteTicket?ticketNo=${ticket.ticketNo}'; }">이용권 삭제</button>
				
				<button data-oper='modify' class="btnForModal btn btn-outline-primary btn-lg">이용권 수정</button>
				<form id='operForm' action="updateTicket" method="get">
                    <input type='hidden' id='ticketNo' name='ticketNo' value='<c:out value="${ticket.ticketNo}"/>'>
                </form>
			</div>
				
		</div>

		

	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
	<script>
		$(document).ready(function() {
			var operForm = $("#operForm"); 
			$("button[data-oper='modify']").on("click", function(e){
				operForm.attr("action","/updateTicket").submit();
			});
		    
			/* $("button[data-oper='list']").on("click", function(e){
				operForm.find("#bno").remove();
				operForm.attr("action","/board/list")
				operForm.submit();
			});   */
		});
	
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
		
		function confirmDelete() {
		    // 모달창 띄우기
		    $('#deleteModal').modal('show');
		}

		function deleteTicket() {
		    // ticket 삭제 요청을 보내는 AJAX 요청 코드
		    $.ajax({
		        url: '/deleteTicket',
		        type: 'POST',
		        data: { ticketNo: '${ticket.ticketNo}' },
		        success: function(result) {
		            // 삭제가 성공한 경우
		            window.location.href = '/ticketManagement';
		        },
		        error: function(xhr, status, error) {
		            // 삭제가 실패한 경우
		            alert('삭제에 실패하였습니다.');
		        }
		    });
		}
		
		$(document).on("click", "button.btn-danger", function() {
			confirmDelete();
		});

		$(document).on("click", "button#delete-confirm-button", function() {
			deleteTicket();
		});
        

	</script>



</body>
</html>
