<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Study With Me</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
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
	width: 300px;
	text-align: center;
	font-family: "paybooc-Light", sans-serif;
	font-size: 16px;
}

#state {
	padding: 0px;
	padding-left: 20px;
	list-style: none;
	text-align: center;
}

#state li {
	float: left;
}

#state ul>.name {
	margin-left: 25px;
	margin-right: 45px;
}

#state ul>.id {
	margin-left: 20px;
	margin-right: 40px;
}

#state ul>.day {
	margin-right: 20px;
}

#state ul>.time {
	margin-right: 20px;
}

.outline:hover {
	background-color: #ff5f2e;
	color: #e1eef6;
}

#seatcheck, #returnseat, #reservationsuccess, #timefail, #usefail,
	#returnseatsuccess, #returnseatfail, #alreadyuse, #room, #locker {
	width: 400px;
	text-align: center;
	font-family: "paybooc-Light", sans-serif;
	font-size: 16px;
}

.check {
	cursor: pointer;
}

.emptySpace {
	margin-top: 80px;
}
</style>

</head>

<%@include file="../../includes/header.jsp"%>

<body>
	<!-- 헤더 -->
	<div class="emptySpace"></div>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="studyseat">
					<%@ include file="studyseat.jsp"%>
					<div id="desc">해당 좌석을 이용중인 사용자를 확인하고 싶으면 클릭하세요</div>
				</div>
			</div>
			<!-- 사이드 바 구성 (todo)-->
			<div class="col-md-6">
				<div class="right-side">
					<p class="selectedSeatInfo fs-4">사용자 정보</p>
					<ul class="list-unstyled">
						<li id="userName" class="fs-4">유저명 :</li>
						<li class="day fs-4">사용시작일자 : <b class="today"></b> <b
							class="now"></b></li>
						<li class="usingTime fs-4">사용 시간 :</li>
						<!-- 현재시간 - reservation 에서 가져온 값 -->
						<li class="leftTime fs-4">잔여 시간 :</li>
						<!-- reaminingtime - 사용시간 -->
						<li id="phoneNumber" class="fs-4">연락처 :</li>
					</ul>
					<!-- 외곽선만 있는 버튼 스타일 적용 -->
					<button type="button" class="btn btn-outline-primary" id="getOut"
						onclick="returnseat()">내보내기</button>
				</div>
			</div>
		</div>
	</div>
	<div id="returnseat" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<p class="seatnum">해당 좌석을 반납 하시겠습니까?</p>
				<a class="yes" onclick="returnseatdb()">예</a> <a class="no"
					onClick="location.reload()">아니오</a>
			</div>
		</div>
	</div>

	<div id="returnseatsuccess" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<p class="checkmessage">좌석 반납이 완료되었습니다.</p>
				<a class="check" onClick="location.reload()">확인</a>
			</div>
		</div>
	</div>

	<div id="returnseatfail" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<p class="checkmessage">좌석 반납이 실패하였습니다.</p>
				<p class="checkmessage">잠시 후 다시 시도해 주세요.</p>
				<a class="check" onClick="location.reload()">확인</a>
			</div>
		</div>
	</div>

	<div id="alreadyuse" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<p class="checkmessage">사용중인 좌석을 반납후 이용해 주세요.</p>
				<p>지점명 : ${map.NAME}</p>
				<p>좌석번호 : ${map.NUM_USING}</p>
				<a class="check" onClick="location.reload()">확인</a>
			</div>
		</div>
	</div>

	<div id="locker" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<p class="checkmessage">상단의 사물함 메뉴를 이용해주세요.</p>
				<a class="check" onClick="location.reload()">확인</a>
			</div>
		</div>
	</div>

	<div id="room" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<p class="checkmessage">상단의 스터디석 메뉴를 이용해주세요.</p>
				<a class="check" onClick="location.reload()">확인</a>
			</div>
		</div>
	</div>

	<div id="returnseatfail" class="modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<p class="checkmessage">좌석 반납이 실패하였습니다.</p>
				<p class="checkmessage">잠시 후 다시 시도해 주세요.</p>
				<a class="check" onClick="location.reload()">확인</a>
			</div>
		</div>
	</div>
	<input id="csrfToken" type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
	<script>	
		var seatnum;
		var dateString;
		var timeString;
		
		var clickedSeatNumber;
		var idOnUse;
		var startTime;
		var remainingSeatTimeInMinutes

		function clickseat(num) {
		    var clickedElementId = event.target.id;
			clickedSeatNumber = clickedElementId.split('_')[1]; // "seat_2"의 경우 "2"를 얻습니다.
			console.log("clickedSeatNumber: "+clickedSeatNumber);
			setIdOnUseAndStartTime();
			console.log("idOnUse: "+idOnUse);
			console.log("startTime: "+startTime);

			seatnum = arguments[0];
			$('.selectedSeatInfo').text(arguments[0] + '번 좌석 사용자 정보');
			//UserVO 객체를 가져와야함.
			//toDO
		    // AJAX를 사용하여 UserVO 객체를 가져옵니다.
		    $.ajax({
		        type: "GET",
		        url: "/managerstudyseat/getUserDetail",
		        data: {
		            user_id: idOnUse
		        },
		        success: function (data) {
		            // UserVO 객체를 사용하여 필요한 정보를 표시합니다.
		            console.log("User name: " + data.userName);

		            remainingSeatTimeInMinutes = data.remainingSeatTime;
		            var remainingSeatTimeInHours = remainingSeatTimeInMinutes / 60;
		            var remainingSeatTimeInDays = remainingSeatTimeInHours / 24;
					
		            $("#phoneNumber").text("전화번호 : " + data.phoneNumber);
		            $("#userName").text("유저 이름 : " + data.userName);
		        },
		        error: function (error) {
		            console.log("Error while fetching UserVO: " + JSON.stringify(error));
		        }
		    });


			
		}

		function clickroom(num) {
			$('#room').modal('show');
		}
		function clicklocker(num) {
			$('#locker').modal('show');
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

		//순회하면서 사용중인 시트를 오렌지 색으로 표시
		(function() {
			<c:forEach items='${lists}' var='item'>
				var seat = 'seat_' + '${item.num_using}';
				var seatnum = document.getElementById(seat);
				seatnum.style.backgroundColor = "orange";
			</c:forEach>
		})();
		
 		function returnseat() {

			$('#returnseat').modal('show');
		}
		
		function returnseatsuccess() {
			$('#returnseatsuccess').modal('show');
		}
		
		function setIdOnUseAndStartTime(){
			<c:forEach items='${lists}' var='item'>
			if(${item.num_using} == clickedSeatNumber){
				idOnUse =  '${item.user_id}';
				console.log("idOnUse: "+idOnUse);

				startTime = '${item.start_time}';
				console.log("startTime: "+startTime);

			}
			</c:forEach>
		}
		function returnseatdb() {
			const csrfTokenValue = $('#csrfToken').val();
			$.ajax({
				type : 'post',
				url : "/managerstudyseat/return",
				headers : {
					'X-CSRF-TOKEN' : csrfTokenValue
				},
				data : {
					user_id : idOnUse
				},
				success : function(result) {
					$('#returnseatsuccess').modal('show');
				},
				error : function(jqXHR, textStatus, errorThrown) {
					$('#returnseatfail').modal('show');
				}
				
			});
		}
	</script>
</body>

</html>