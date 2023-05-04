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
    	margin: 0.5em;
		padding: 0.5rem 2.0rem;
	    font-size: 1.0rem;
	    line-height: 1.5;
	    border-radius: 1rem;
	}
	textarea {
		width: 700px;
		height: 300px;
		padding: 10px;
		box-sizing: border-box;
		border: solid 2px #1E90FF;
		border-radius: 5px;
		font-size: 16px;
		resize: none;
    	overflow: hidden;
	}
	.btn-div {
		float:right;
	}
	
	.contentArea {
		white-space: pre-wrap;
		border : 1px solid black;
		text-align: left;
		padding : 30px;
		border-radius: 1rem;
	}
	
</style>

</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%>

<body>
	<div class="cd2">
		<input id="csrfToken" type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
		<div class="list">
			<p>공지사항</p>

			<div class='pull-right'>
				<input type="hidden" id="csrfToken" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<table>
					<tr>
						<td>번호</td>
						<td class="input-content">
  							${board.noticeNo}
						</td>
					</tr>
					
					<tr>
						<td>제목</td>
						<td class="input-content">
  							${board.title}
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
						</td>
					</tr>
					
					<tr>
						<td>수정날짜</td>
						<td class="input-content">
							<img src="resources/image/calendar.png" id="datepicker-trigger">
							${board.updatedDate}
						</td>
					</tr>
					
					<tr>
						<td>내용</td>
						<td class="input-content">
							<div class="contentArea"><c:out value="${board.content.trim()}" /></div>
						</td>
					</tr>
				</table>
				</div>
			<div class="btn-div">
				<!-- 모달창 -->
				<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="deleteModalLabel">공지사항 삭제</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        정말로 공지사항을 삭제하시겠습니까?
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				        <button type="button" class="btn btn-danger" onclick="deleteNotice()">삭제</button>
				      </div>
				    </div>
				  </div>
				</div>
			
				<c:if test="${board.userId == loginUser.userId}">
				    <!-- userId와 board.userId가 일치할 때만 수정/삭제 버튼을 보여줌 -->
				    <button data-oper='modify' class="btnForModal btn btn-outline-primary btn-lg">공지사항 수정</button>
				    <button type="button" class="btnForModal btn btn-outline-primary btn-lg" onclick="if(confirm('정말로 삭제하시겠습니까?')) { location.href='/deleteNotice?noticeNo=${board.noticeNo}'; }">공지사항 삭제</button>
				</c:if>
                <button type="button" class="btnForModal btn btn-outline-primary btn-lg" onclick="location.href='/noticeBoard'">목록으로</button>
				<form id='operForm' action="updateNotice" method="get">
                    <input type='hidden' id='noticeNo' name='noticeNo' value='<c:out value="${board.noticeNo}"/>'>
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
				operForm.attr("action","/updateNotice").submit();
			});
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

		function deleteNotice() {
		    // notice 삭제 요청을 보내는 AJAX 요청 코드
		    $.ajax({
		        url: '/deleteNotice',
		        type: 'POST',
		        data: { noticeNo: '${board.noticeNo}' },
		        success: function(result) {
		            // 삭제가 성공한 경우
		            window.location.href = '/noticeBoard';
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
			deleteNotice();
		});
        
	</script>

</body>
<%@include file="../includes/footer.jsp"%>
</html>
