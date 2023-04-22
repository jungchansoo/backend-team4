<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Study With Me</title>
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

.empty {
	margin-top: 80px;
}
</style>

</head>


<body>
	<!-- 헤더 -->
	<%@include file="../../includes/header.jsp"%>
	<div class="empty"></div>

	<%@ include file="studyseat.jsp"%>
	<div>해당 좌석을 이용중인 사용자를 확인하고 싶으면 클릭하세요</div>
	<!-- 사이드 바 구성 (todo)-->
	<div class="right-side">
		<p class="selectedSeatInfo"></p>
		<ul>
			<li id="userName">유저명 :</li>
			<li class="day">사용시작일자 : <b class="today"></b> <b class="now"></b></li>
			
			<li class="usingTime">사용 시간 : </li><!-- 현재시간 - reservation 에서 가져온 값 -->
			<li class="leftTime">잔여 시간 : </li><!-- reaminingtime - 사용시간 -->
			<li id="phoneNumber">연락처 : </li>

		</ul>
	</div>

	<button id="getOut" onclick="returnseat()">내보내기</button>

	<div id="returnseat" class="modal">
		<p class="seatnum">해당 좌석을 반납 하시겠습니까?</p>
		<a class="yes" onclick="returnseatdb()">예</a> <a class="no"
			onClick="location.reload()">아니오</a>
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
		<p class="checkmessage">상단의 스터디석 메뉴를 이용해주세요.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>

	<div id="returnseatfail" class="modal">
		<p class="checkmessage">좌석 반납이 실패하였습니다.</p>
		<p class="checkmessage">잠시 후 다시 시도해 주세요.</p>
		<a class="check" onClick="location.reload()">확인</a>
	</div>
	<input id="csrfToken" type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />


	<script>
		var seatnum;
		var dateString;
		var timeString;
		
		var clickedSeatNumber;
		var idOnUse;
		var remainingSeatTimeInMinutes

		function clickseat(num) {
		    var clickedElementId = event.target.id;
			clickedSeatNumber = clickedElementId.split('_')[1]; // "seat_2"의 경우 "2"를 얻습니다.
			console.log("clickedSeatNumber: "+clickedSeatNumber);
			setIdOnUse();
			console.log("idOnUse: "+idOnUse);

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
					
		            $("#phoneNumber").text("Phone Number: " + data.phoneNumber);
		            $("#userName").text("User Name: " + data.userName);
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
		/* 사용하고 있는 시트만 가져와서 returnseat()를 셋팅 */
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
		
		function setIdOnUse(){
			<c:forEach items='${lists}' var='item'>
			if(${item.num_using} == clickedSeatNumber){
				console.log("idOnUse: "+idOnUse);
				idOnUse =  '${item.user_id}';
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