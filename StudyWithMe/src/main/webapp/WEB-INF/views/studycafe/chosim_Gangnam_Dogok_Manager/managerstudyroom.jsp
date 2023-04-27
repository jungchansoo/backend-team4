<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
	font-size: 25px;
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
	font-size: 20px;
}

#reservationarea {
	margin-top: 20px;
	text-align: center;
}

.w-btn {
	position: relative;
	border: none;
	display: inline-block;
	padding: 15px 30px;
	width: 70%;
	height: 50px;
	border-radius: 5px;
	font-family: "paybooc-Light", sans-serif;
	font-size: 20px;
	text-decoration: none;
	font-weight: 600;
	transition: 0.25s;
}

.w-btn-indigo {
	background-color: #2196F3;
	color: white;
}

#emptyoption, #reservationsuccess, #reservationfail, #canclesuccess,
	#canclefail, #emptytime, #returnroom, #timeout, #timedateerror {
	text-align: center;
	font-family: "paybooc-Light", sans-serif;
	font-size: 25px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	margin-top: 40px;
}

#reservationfail, #canclefail, #emptytime{
	margin-top: 25px;
}

.check {
	cursor: pointer;
}

.ui-dialog {
	border-radius: 10px;
}

.ui-dialog-titlebar {
	display: none;
}

.ui-dialog {
	top: 50% !important;
	left: 50% !important;
	transform: translate(-50%, -50%) !important;
}

.ui-dialog.ui-corner-all.ui-widget.ui-widget-content.ui-front.ui-draggable.ui-resizable
	{
	width: 700px !important;
	height: 200px !important;
}

#header2> * {
margin-left : -140px;
  /* 마진값으로 간격을 조정 */
}
#header4> * {
  margin-right : 10px;
  /* 마진값으로 간격을 조정 */
}

#content li:first-child {
	margin-left : 50px;
	margin-right: -5px;
}

footer {
	width: 100%;
    position: absolute;  
    bottom: 0;
    left: 0;
}
</style>


</head>
<body>
	<%@include file="../../includes/header.jsp"%>

	
	<div id="studyroomname" class="list-container">
		<ul>
			<li class="list">스터디룸</li>
			<li class="list"><select id="roomno">
					<option value="1">스터디룸1</option>
					<option value="2">스터디룸2</option>
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
		<div id="content"></div>
	</div>


<!-- modal창 -->
<div id="canclesuccess">
		<p class="checkmessage">예약취소 되었습니다.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>

	<div id="canclefail">
		<p class="checkmessage">예약취소 실패하였습니다.</p>
		<p class="checkmessage">잠시후 다시 시도해주세요.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>

	<div id="emptytime">
		<p class="checkmessage">보유시간이 부족합니다.</p>
		<p class="checkmessage">현재보유시간 : ${remainingRoomTime} </p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>

	<div id="returnroom">
		<p class="checkmessage">해당 스터디룸 예약을 취소하시겠습니까?</p>
		<a class="check" onClick="returnroom()">확인</a>
	</div>

	<div id="timeout">
		<p class="checkmessage">사용중인 룸은 예약취소가 불가능합니다.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	
	<div id="timedateerror">
		<p class="checkmessage">현재시간 보다 이후 시간으로 예약해주세요.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	<input id="csrfToken" type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />

	<%@include file="../../includes/footer.jsp"%>

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
			 $("#reservationsuccess").dialog({
				    autoOpen: false,
				    modal: true
			});
			 $("#reservationfail").dialog({
				    autoOpen: false,
				    modal: true
			});
			 $("#canclesuccess").dialog({
				    autoOpen: false,
				    modal: true
			});
			 $("#canclefail").dialog({
				    autoOpen: false,
				    modal: true
			});
			 $("#emptytime").dialog({
				    autoOpen: false,
				    modal: true
			});
			 $("#returnroom").dialog({
				    autoOpen: false,
				    modal: true
			});
			 $("#timeout").dialog({
				    autoOpen: false,
				    modal: true
			});
			 $("#timedateerror").dialog({
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
			     
			    	ul.setAttribute("data-num-using", "${item.num_using}");
				    ul.setAttribute("data-start-time", "${item.start_time}");
				    ul.setAttribute("data-end-time", "${item.end_time}");
				    ul.setAttribute("data-user-id", "${item.user_id}");
				    ul.onclick = function() {
				      click(this.getAttribute("data-num-using"), this.getAttribute("data-start-time"), this.getAttribute("data-end-time"), this.getAttribute("data-user-id"));
				    };
				    ul.style.cursor = "pointer";
				}
			</c:forEach>
		}
		var num_using;
		var start_time;
		var end_time;
		var user_id;
		function click(num, start, end, id){
			num_using = num;
			start_time = start;
			end_time = end;
			user_id = id;
			$("#returnroom").dialog("open");
		}
		function returnroom(){
			$("#returnroom").dialog("close");
			const currentTime = new Date();
			const startTime = new Date(start_time);
			const endTime = new Date(end_time);
			if (currentTime >= startTime && currentTime <= endTime) {
				$("#timeout").dialog("open");
			} else {
				returnsend(num_using,startTime,endTime,user_id);	
			}
		}
		
		function returnsend(num_using,starttime,endtime,user_id) {
			const csrfTokenValue = $('#csrfToken').val();
			$.ajax({
				type : 'post',
				url : "/managerstudyroom/return",
				headers : {
					'X-CSRF-TOKEN' : csrfTokenValue
				},
				data : {
					num_using : num_using,
					start_time : starttime,
					end_time : endtime,
					user_id : user_id
				},
				success : function(result) {
					$("#canclesuccess").dialog("open");
				},
				error : function(jqXHR, textStatus, errorThrown) {
					$("#canclefail").dialog("open");
				}

			});
		}
	</script>
</body>
</html>