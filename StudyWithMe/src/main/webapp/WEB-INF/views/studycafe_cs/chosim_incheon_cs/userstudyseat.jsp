<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />

<title>Study With Me</title>
<style>
a {
	color: black;
	text-decoration: none;
}

#seatcheck, #returnseat {
	width: 230px;
	text-align: center;
}

.yes {
	margin-left: 0px;
	margin-right: 40px;
	cursor: pointer;
}

.no {
	cursor: pointer;
}

#seatreservation {
	padding: 0px;
	padding-bottom: 10px;
	width: 200px;
	text-align: center;
	font-size: 12px;
}

ul {
	padding: 0px;
	padding-left: 20px;
	list-style: none;
	text-align: center;
}

li {
	float: left;
}

ul>.name {
	margin-left: 25px;
	margin-right: 45px;
}

ul>.id {
	margin-left: 20px;
	margin-right: 40px;
}

ul>.day {
	margin-right: 20px;
}

ul>.time {
	margin-right: 20px;
}

.outline:hover {
	background-color: #ff5f2e;
	color: #e1eef6;
}

.reservation {
	width: 80px;
	height: 30px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	border: 3px solid #ff5f2e;
	background-color: white;
	color: #4a4948;
	cursor: pointer;
}

#reservationsuccess, #timefail, #usefail, #returnseatsuccess {
	width: 230px;
	text-align: center;
}

.check{
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="studyseat.jsp"%>
	<!-- Modal HTML embedded directly into document -->
	<div id="seatcheck" class="modal">
		<p class="seatnum"></p>
		<a class="yes" onclick="reservation()">예</a> <a class="no"
			onClick="location.reload();">아니오</a>
	</div>

	<div id="seatreservation" class="modal">
		<p>좌석 예약</p>
		<hr>
		<ul>
			<li class="name">이름</li>
			<li>${name}</li>
		</ul>
		<br>
		<ul>
			<li class="id">아이디</li>
			<li>${id}</li>
		</ul>
		<br>
		<ul>
			<li class="day">사용시작일자</li>
			<li class="today"></li>
		</ul>
		<br>
		<ul>
			<li class="time">사용시작일시</li>
			<li class="now"></li>
		</ul>
		<br>
		<p>보유 좌석이용시간</p>
		<p>${time}</p>
		<button class="reservation outline" onclick="timecheck()">예약</button>
	</div>

	<div id="reservationsuccess" class="modal">
		<p class="checkmessage">좌석 예약이 완료되었습니다.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>

	<div id="usefail" class="modal">
		<p class="checkmessage">좌석 예약에 실패하였습니다.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>

	<div id="timefail" class="modal">
		<p class="checkmessage">보유시간이 부족합니다.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>

	<div id="returnseat" class="modal">
		<p class="seatnum">해당 좌석을 반납 하시겠습니까?</p>
		<a class="yes" onclick="returnseatsuccess()">예</a> <a class="no"
			onClick="location.reload()">아니오</a>
	</div>

	<div id="returnseatsuccess" class="modal">
		<p class="checkmessage">좌석 반납이 완료되었습니다.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	<input id="csrfToken" type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	<script>
		var seatnum;
		var dateString;
		var timeString;
		var useseat;
		function clickseat(num) {
			if(useseat == "ture"){
				
			}
			else{
				seatnum = arguments[0];
				$('.seatnum').text(arguments[0] + '번 좌석을 예약 하시겠습니까?');
				$('#seatcheck').modal('show');
			}
		}

		function reservation() {
			today();
			$('#seatreservation').modal('show');
		}

		function today() {
			var today = new Date();

			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);

			var hours = ('0' + today.getHours()).slice(-2); 
			var minutes = ('0' + today.getMinutes()).slice(-2);
			
			dateString = year + '-' + month + '-' + day;
			timeString = hours + ':' + minutes;
			
			$('.today').text(dateString);
			$('.now').text(timeString);
		}
		function timecheck(){
			var remainingSeatTime = '${time}';
			if('${long_time}' <= 0){
				$('#timefail').modal('show');
			}else{
				send();
			}
		}
		
		(function() {
			<c:forEach items='${lists}' var='item'>
				var seat = 'seat_' + '${item.num_using}';
				var seatnum = document.getElementById(seat);
				if('${id}' == '${item.user_id}'){
					document.getElementById(seat).style.backgroundColor = "red";
					seatnum.setAttribute("onClick", "returnseat()");
					useseat = "true";
				}else{
					seatnum.style.backgroundColor = "orange";
					seatnum.style.pointerEvents = "none";
				}
			</c:forEach>
		})();
		
		function returnseat() {
			$('#returnseat').modal('show');
		}
		
		function returnseatsuccess() {
			$('#returnseatsuccess').modal('show');
		}
		
		function send() {
			const csrfTokenValue = $('#csrfToken').val();
			$.ajax({
				type : 'post',
				url : "/userstudyseat/reservation",
				headers : {
					'X-CSRF-TOKEN' : csrfTokenValue
				},
			
				data : {
					num_using : seatnum,
					cafe_no : '${cafeno}'
				},
				success : function(result) {
					$('#reservationsuccess').modal('show');
				},
				error : function(jqXHR, textStatus, errorThrown) {
					$('#usefail').modal('show');
				}
				
			});
		}
	</script>
</body>

</html>