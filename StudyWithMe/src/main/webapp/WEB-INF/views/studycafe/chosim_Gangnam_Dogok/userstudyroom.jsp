<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.min.js"></script>

<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/css/bootstrap-timepicker.min.css">



<meta charset="UTF-8">
<title>Study With Me</title>

<style>
.list-container {
	width: 70%;
	margin: 0 auto;
	margin-top: 20px;
	border: 1px solid black;
	border-radius: 5px;
	font-size: 20px;
	border: 1px solid black;
	border: 1px solid black;
}

.list-container ul {
	display: flex;
	justify-content: space-between;
}

li {
	list-style-type: none;
	margin-right: 50px;
	margin-top: 10px;
}

select {
	font-size: 20px;
	border: none;
}

#datepicker {
	width: 130px;
	border: none;
	font-size: 20px;
}

#calendar-btn {
	background-color: white;
	background-image: url("resources/image/calendar.png");
	background-size: contain; /* 이미지 크기 유지 */
	width: 20px; /* 버튼 너비 조정 */
	height: 20px; /* 버튼 높이 조정 */
	border: none; /* 버튼 테두리 제거 */
	cursor: pointer; /* 마우스 커서를 손가락 모양으로 변경 */
}

#timepicker {
	font-size: 20px;
	width: 80px;
	border: none;
}

#title {
	height: 50px;
	background-color: #f2f2f2;
	display: flex;
	align-items: center; /* 수직 가운데 정렬 */
	justify-content: center; /* 수평 가운데 정렬 */
}

#header {
	border-bottom: 1px solid black;
}

#header li {
	font-size: 17px;
}

#reservationarea{
	margin-top: 20px;
	text-align: center;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    width:70%;
	height: 50px;
	border-radius: 5px;
    font-family: "paybooc-Light", sans-serif;
    font-size: 20px;
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn-indigo {
    background-color: #94dbff;
    color: white;
}

#emptyoption ,#success ,#fail{
	width: 400px;
	text-align: center;
	font-family: "paybooc-Light", sans-serif;
	font-size: 16px;
	display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.check{
	cursor: pointer;
}
.ui-dialog {
  border-radius: 10px;
}
.ui-dialog-titlebar {
  display: none;
}
</style>


</head>
<body>
	<%@include file="../../includes/header.jsp"%>

	<div id="studyroomname" class="list-container">
		<ul>
			<li class="list">스터디룸</li>
			<li class="list">
			<select id="roomno">
					<option value="1">스터디룸1</option>
					<option value="2">스터디룸2</option>
			</select>
			</li>
		</ul>
	</div>


	<div id="reservationdate" class="list-container">

		<ul>
			<li class="list">예약일자</li>
			<li class="list">
			<input type="text" id="datepicker" readonly="true">
			<button id="calendar-btn"></button></li>
		</ul>
	</div>

	<div id="starttime" class="list-container">
		<ul>
			<li class="list">시작시간</li>
			<li class="list"><input type="text" id="timepicker"
				class="form-control"></li>
		</ul>
	</div>
	<div id="usetime" class="list-container">
		<ul>
			<li class="list">사용시간</li>
			<li class="list">
			<select id="usetimes">
					<option value="1">1시간</option>
					<option value="2">2시간</option>
					<option value="3">3시간</option>
			</select></li>
		</ul>
	</div>

	<div id="reservation" class="list-container">
		<div id="title">
			<strong>스터디룸 예약현황</strong>
		</div>
		<div id="header">
			<ul>
				<li id="header1" class="list"><strong>스터디룸번호</strong></li>
				<li id="header2" class="list"><strong>시작시간</strong></li>
				<li id="header3" class="list"><strong>종료시간</strong></li>
				<li id="header4" class="list"><strong>아이디</strong></li>
			</ul>
		</div>
		<div id="content">
			
		</div>
	</div>
	<div id="reservationarea">
		<button id="reservationbutton" class="w-btn w-btn-indigo" onclick="reservation()">예약하기</button>
	</div>


	<div id="emptyoption">
		<p class="checkmessage">예약일 선택 후 다시 예약해 주세요</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	
	<div id="success">
		<p class="checkmessage">예약되었습니다.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	
	<div id="fail">
		<p class="checkmessage">예약에 실패하였습니다.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	<input id="csrfToken" type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
		
	<script>
		$(document).ready(function() {
			$("#datepicker").datepicker({
				dateFormat : 'yy-mm-dd',
				onSelect : function(dateText) {
					$('#datepicker').val(dateText);
				}
			});
			$('#calendar-btn').click(function() {
				$("#datepicker").datepicker("show");
			});
			$('#timepicker').timepicker({
				minuteStep : 10, // 분 단위로 선택할 수 있는 간격
				showMeridian : false
			// 오전/오후 표시 여부
			});
			 $("#emptyoption").dialog({
				    autoOpen: false,
				    modal: true
			});
			 $("#success").dialog({
				    autoOpen: false,
				    modal: true
			});
			 $("#fail").dialog({
				    autoOpen: false,
				    modal: true
			});
			createreservationinfo(1);
		});
		
		document.getElementById("roomno").addEventListener("change", function() {
			  var selectedRoom = document.getElementById("roomno").value;
			  createreservationinfo(selectedRoom);
		});
			  
		function createreservationinfo(roomno) {
			const contentDiv = document.getElementById("content");
			contentDiv.innerHTML = "";
			  
			<c:forEach items='${lists}' var='item'>
				if('${item.num_using}' == roomno){
					var ul = document.createElement("ul");
				    var li1 = document.createElement("li");
				    var li2 = document.createElement("li");
				    var li3 = document.createElement("li");
				    var li4 = document.createElement("li");
				    li1.textContent = '${item.num_using}'
				   	li2.textContent = '${item.start_time}';
				    li3.textContent = '${item.end_time}';
				    li4.textContent = '${item.user_id}';
				    
				    ul.appendChild(li1);
				    ul.appendChild(li2);
				    ul.appendChild(li3);
				    ul.appendChild(li4);
				    
				    contentDiv.appendChild(ul);
				}
			</c:forEach>
		}
		
		function reservation(){
			if (!document.getElementById('datepicker').value) {
				$("#emptyoption").dialog("open");
			}else{
				
				const datetimeString = document.getElementById('datepicker').value + ' ' + document.getElementById('timepicker').value;
				const start_time = new Date(datetimeString);
				const end_time = new Date(datetimeString);
				var usetime =  parseInt(document.getElementById('usetimes').value);
				end_time.setHours(end_time.getHours() + usetime);
				send(roomno,start_time,end_time,usetime);
			}
		}
		
		function send(roomno,start_time, end_time,usetime) {
			const csrfTokenValue = $('#csrfToken').val();
			$.ajax({
				type : 'post',
				url : "/userstudyroom/reservation",
				headers : {
					'X-CSRF-TOKEN' : csrfTokenValue
				},
				data : {
					num_using : roomno.value,
					start_time : start_time,
					end_time : end_time,
					usetime : usetime
				},
				success : function(result) {
					$("#success").dialog("open");
				},
				error : function(jqXHR, textStatus, errorThrown) {
					$("#fail").dialog("open");
				}
				
			}); 
		}
		
	</script>
</body>
</html>