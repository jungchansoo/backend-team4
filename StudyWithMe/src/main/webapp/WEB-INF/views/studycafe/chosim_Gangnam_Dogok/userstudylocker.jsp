<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Study With Me</title>
<style>
.emptyarea {
	margin-top: 30px;
}
.emptyarea2 {
	margin-bottom: 70px;
}

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

#lockerreservation {
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

#lockercheck, #returnlocker, #reservationsuccess, #timefail, #usefail, #returnlockersuccess, #returnlockerfail, #alreadyuse, #room, #locker{
	width :600px;
	text-align: center;
	font-family: "paybooc-Light", sans-serif;
	font-size:25px;
}

.check{
	cursor: pointer;
}

</style>
</head>
<body>
	<%@include file="../../includes/header.jsp"%>
	<div class="emptyarea"></div>
	
	
	<%@include file="locker.jsp"%>
	
	<div id="lockercheck" class="modal">
		<p class="lockernum"></p>
		<a class="yes" onclick="reservation()">예</a> <a class="no"
			onClick="location.reload();">아니오</a>
	</div>

	<div id="lockerreservation" class="modal">
		<p>사물함 예약</p>
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
		<p>보유 사물함이용시간</p>
		<p>${time}</p>
		<button class="reservation outline" onclick="timecheck()">예약</button>
	</div>

	<div id="reservationsuccess" class="modal">
		<p class="checkmessage">사물함 예약이 완료되었습니다.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>

	<div id="usefail" class="modal">
		<p class="checkmessage">사물함 예약에 실패하였습니다.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>

	<div id="timefail" class="modal">
		<p class="checkmessage">보유시간이 부족합니다.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>

	<div id="returnlocker" class="modal">
		<p class="lockernum">해당 사물함을 반납 하시겠습니까?</p>
		<a class="yes" onclick="returnlockerdb()">예</a> 
		<a class="no" onClick="location.reload()">아니오</a>
	</div>

	<div id="returnlockersuccess" class="modal">
		<p class="checkmessage">사물함 반납이 완료되었습니다.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	
	<div id="returnlockerfail" class="modal">
		<p class="checkmessage">사물함 반납이 실패하였습니다.</p>
		<p class="checkmessage">잠시 후 다시 시도해 주세요.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	
	<div id="alreadyuse" class="modal">
		<p class="checkmessage">사용중인 사물함을 반납후 이용해 주세요.</p>
		<p>지점명 : ${map.NAME}</p>
		<p>사물함번호 : ${map.NUM_USING}</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	
	<div id="returnlockerfail" class="modal">
		<p class="checkmessage">사물함 반납이 실패하였습니다.</p>
		<p class="checkmessage">잠시 후 다시 시도해 주세요.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	<input id="csrfToken" type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	
	
	
	<div class="emptyarea2"></div>
	<%@include file="../../includes/footer.jsp"%>
	
	<script>
	var lockernum;
	var dateString;
	var timeString;
	function clicklocker(num) {
		
		<c:if test="${map == null}">
			lockernum = arguments[0];
			$('.lockernum').text(arguments[0] + '번 사물함을 예약 하시겠습니까?');
			$('#lockercheck').modal({backdrop: 'static', keyboard: false});
		</c:if>
		
		<c:if test="${map != null}">
		$('#alreadyuse').modal({backdrop: 'static', keyboard: false});
		</c:if>
		
	}
	
	function reservation() {
		today();
		$('#lockerreservation').modal({backdrop: 'static', keyboard: false});
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
		var remaininglockerTime = '${time}';
		if('${long_time}' <= 0){
			$('#timefail').modal({backdrop: 'static', keyboard: false});
		}else{
			send();
		}
	}
	
	(function() {
		<c:forEach items='${lists}' var='item'>
			var locker = 'locker_' + '${item.num_using}';
			var lockernum = document.getElementById(locker);
			if('${id}' == '${item.user_id}'){
				document.getElementById(locker).style.backgroundColor = "red";
				lockernum.setAttribute("onClick", "returnlocker()");
				
			}else{
				lockernum.style.backgroundColor = "orange";
				lockernum.style.pointerEvents = "none";
			}
		</c:forEach>
		
	})();
	
	function returnlocker() {
		$('#returnlocker').modal({backdrop: 'static', keyboard: false});
	}
	
	function returnlockersuccess() {
		$('#returnlockersuccess').modal({backdrop: 'static', keyboard: false});
	}
	
	function send() {
		const csrfTokenValue = $('#csrfToken').val();
		$.ajax({
			type : 'post',
			url : "/userstudylocker/reservation",
			headers : {
				'X-CSRF-TOKEN' : csrfTokenValue
			},
		
			data : {
				num_using : lockernum,
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
	
	function returnlockerdb() {
		const csrfTokenValue = $('#csrfToken').val();
		$.ajax({
			type : 'post',
			url : "/userstudylocker/return",
			headers : {
				'X-CSRF-TOKEN' : csrfTokenValue
			},
			data : {
				user_id : '${id}'
			},
			success : function(result) {
				$('#returnlockersuccess').modal({backdrop: 'static', keyboard: false});
			},
			error : function(jqXHR, textStatus, errorThrown) {
				$('#returnlockerfail').modal({backdrop: 'static', keyboard: false});
			}
			
		});
	}
	</script>
</body>
</html>