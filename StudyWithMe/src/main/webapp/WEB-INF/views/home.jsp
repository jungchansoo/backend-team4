<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	margin-top: 20px; border : 1px solid black;
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

#reservation li{
	
}
</style>


</head>
<body>
	<%@include file="includes/header.jsp"%>
	<br>
	<br>
	
	<div id="studyroomname" class="list-container">
		<ul>
			<li class="list">스터디룸</li>
			<li class="list"><select>
					<option value="1">스터디룸1</option>
					<option value="2">스터디룸2</option>
					<option value="3">스터디룸3</option>
			</select></li>
		</ul>
	</div>


	<div id="reservationdate" class="list-container">

		<ul>
			<li class="list">예약일자</li>
			<li class="list"><input type="text" id="datepicker"
				readonly="true">
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
			<li class="list"><select>
					<option value="1">1시간</option>
					<option value="2">2시간</option>
					<option value="3">4시간</option>
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
			<ul>
				<li class="list">1</li>
				<li class="list">2023-04-13 05:50:15</li>
				<li class="list">2023-04-13 05:50:15</li>
				<li class="list">testadmin</li>
			</ul>
		</div>
	</div>

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
		});
	</script>
</body>
</html>