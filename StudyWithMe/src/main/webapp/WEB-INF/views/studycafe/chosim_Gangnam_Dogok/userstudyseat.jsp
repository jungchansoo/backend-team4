<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study With Me</title>
<style>
.modal-backdrop {
  pointer-events: none;
}

.modal-dialog {
  pointer-events: auto;
  
}

a {
	color: black;
	text-decoration: none;
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
	width: 400px;
	text-align: center;
	font-family: "paybooc-Light", sans-serif;
	font-size: 25px;
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
	margin-right: 145px;
}

ul>.id {
	margin-left: 20px;
	margin-right: 140px;
}

ul>.day {
	margin-right: 65px;
}

ul>.time {
	margin-right: 100px;
}

.outline:hover {
	background-color: #3B71CA;
	color: #e1eef6;
}

.reservation {
	width : 150px;
	border-radius: 15px;
	font-family: "paybooc-Light", sans-serif;
	font-size : 25px;
	border: 3px solid #3B71CA;
	background-color: white;
	color: #4a4948;
	cursor: pointer;
}

#seatcheck, #returnseat, #reservationsuccess, #timefail, #usefail, #returnseatsuccess, #returnseatfail, #alreadyuse, #room, #locker{
	width :600px;
	text-align: center;
	font-family: "paybooc-Light", sans-serif;
	font-size:25px;
}

.check{
	cursor: pointer;
}

.emptyarea{
	margin-top: 10px;
}
</style>

</head>


<body>
	<%@include file ="../../includes/header.jsp" %>
	<div class="emptyarea"></div>
	
	<%@ include file="studyseat.jsp"%>
	
	
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
			<li >${name}</li>
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
		<a class="yes" onclick="returnseatdb()">예</a> 
		<a class="no" onClick="location.reload()">아니오</a>
	</div>

	<div id="returnseatsuccess" class="modal">
		<p class="checkmessage">좌석 반납이 완료되었습니다.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	
	<div id="returnseatfail" class="modal">
		<p class="checkmessage">좌석 반납이 실패하였습니다.</p>
		<p class="checkmessage">잠시 후 다시 시도해 주세요.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	
	<div id="alreadyuse" class="modal">
		<p class="checkmessage">사용중인 좌석을 반납후 이용해 주세요.</p>
		<p>지점명 : ${map.NAME}</p>
		<p>좌석번호 : ${map.NUM_USING}</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	
	<div id="locker" class="modal">
		<p class="checkmessage">상단의 사물함 메뉴를 이용해주세요.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	
	<div id="room" class="modal">
		<p class="checkmessage">상단의 스터디룸 메뉴를 이용해주세요.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	
	<div id="returnseatfail" class="modal">
		<p class="checkmessage">좌석 반납이 실패하였습니다.</p>
		<p class="checkmessage">잠시 후 다시 시도해 주세요.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	<input id="csrfToken" type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	
	<%@include file ="../../includes/footer.jsp" %>
	
	<script>
		var seatnum;
		var dateString;
		var timeString;
		function clickseat(num) {
			
			<c:if test="${map == null}">
				seatnum = arguments[0];
				$('.seatnum').text(arguments[0] + '번 좌석을 예약 하시겠습니까?');
				$('#seatcheck').modal({backdrop: 'static', keyboard: false});
			</c:if>
			
			<c:if test="${map != null}">
			$('#alreadyuse').modal({backdrop: 'static', keyboard: false});
			</c:if>
			
		}

		function clickroom(num) {
			$('#room').modal({backdrop: 'static', keyboard: false});
		}
		function clicklocker(num) {
			$('#locker').modal({backdrop: 'static', keyboard: false});
		}
		function reservation() {
			today();
			$('#seatreservation').modal({backdrop: 'static', keyboard: false});
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
				$('#timefail').modal({backdrop: 'static', keyboard: false});
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
					
				}else{
					seatnum.style.backgroundColor = "orange";
					seatnum.style.pointerEvents = "none";
				}
			</c:forEach>
			
		})();
		
		function returnseat() {
			$('#returnseat').modal({backdrop: 'static', keyboard: false});
		}
		
		function returnseatsuccess() {
			$('#returnseatsuccess').modal({backdrop: 'static', keyboard: false});
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
					$('#reservationsuccess').modal({backdrop: 'static', keyboard: false});
				},
				error : function(jqXHR, textStatus, errorThrown) {
					$('#usefail').modal({backdrop: 'static', keyboard: false});
				}
				
			});
		}
		
		function returnseatdb() {
			const csrfTokenValue = $('#csrfToken').val();
			$.ajax({
				type : 'post',
				url : "/userstudyseat/return",
				headers : {
					'X-CSRF-TOKEN' : csrfTokenValue
				},
				data : {
					user_id : '${id}'
				},
				success : function(result) {
					$('#returnseatsuccess').modal({backdrop: 'static', keyboard: false});
				},
				error : function(jqXHR, textStatus, errorThrown) {
					$('#returnseatfail').modal({backdrop: 'static', keyboard: false});
				}
				
			});
		}
	</script>
</body>

</html>