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

<style>
body {
	font-size: 10px;
}

.seatimage {
	position: relative;
	width: 402px;
	height: 423px;
	background: url("resources/image/studyseat.jpg");
	background-repeat: no-repeat;
	margin: 0 auto;
}

.seatimage>div {
	position: absolute;
	width: 20px;
	height: 20px;
	cursor: pointer;
}

.seatimage>.seat_1 {
	top: 62px;
	left: 9px;
}

.seatimage>.seat_2 {
	top: 62px;
	left: 32px;
}

.seatimage>.seat_3 {
	top: 62px;
	left: 71px;
}

.seatimage>.seat_4 {
	top: 62px;
	left: 94px;
}

.seatimage>.seat_5 {
	top: 62px;
	left: 133px;
}

.seatimage>.seat_5 {
	top: 62px;
	left: 133px;
}

.seatimage>.seat_6 {
	top: 62px;
	left: 156px;
}

.seatimage>.seat_7 {
	top: 62px;
	left: 195px;
}

.seatimage>.seat_8 {
	top: 85px;
	left: 9px;
}

.seatimage>.seat_9 {
	top: 85px;
	left: 32px;
}

.seatimage>.seat_10 {
	top: 85px;
	left: 71px;
}

.seatimage>.seat_11 {
	top: 85px;
	left: 94px;
}

.seatimage>.seat_12 {
	top: 85px;
	left: 133px;
}

.seatimage>.seat_13 {
	top: 85px;
	left: 156px;
}

.seatimage>.seat_14 {
	top: 85px;
	left: 195px;
}

.seatimage>.seat_15 {
	top: 147px;
	left: 142px;
}

.seatimage>.seat_16 {
	top: 147px;
	left: 182px;
}

.seatimage>.seat_17 {
	top: 147px;
	left: 205px;
}

.seatimage>.seat_18 {
	top: 170px;
	left: 142px;
}

.seatimage>.seat_19 {
	top: 170px;
	left: 182px;
}

.seatimage>.seat_20 {
	top: 170px;
	left: 205px;
}

.seatimage>.seat_21 {
	top: 40px;
	right: 145px;
}

.seatimage>.seat_22 {
	top: 40px;
	right: 122px;
}

.seatimage>.seat_23 {
	top: 40px;
	right: 99px;
}

.seatimage>.seat_24 {
	top: 40px;
	right: 76px;
}

.seatimage>.seat_25 {
	top: 40px;
	right: 53px;
}

.seatimage>.seat_26 {
	top: 40px;
	right: 30px;
}

.seatimage>.seat_27 {
	top: 40px;
	right: 7px;
}

.seatimage>.seat_28 {
	top: 115px;
	right: 145px;
}

.seatimage>.seat_29 {
	top: 115px;
	right: 122px;
}

.seatimage>.seat_30 {
	top: 115px;
	right: 99px;
}

.seatimage>.seat_31 {
	top: 115px;
	right: 53px;
}

.seatimage>.seat_32 {
	top: 115px;
	right: 30px;
}

.seatimage>.seat_33 {
	top: 115px;
	right: 7px;
}

.seatimage>.seat_34 {
	top: 138px;
	right: 145px;
}

.seatimage>.seat_35 {
	top: 138px;
	right: 122px;
}

.seatimage>.seat_36 {
	top: 138px;
	right: 99px;
}

.seatimage>.seat_37 {
	top: 138px;
	right: 53px;
}

.seatimage>.seat_38 {
	top: 138px;
	right: 30px;
}

.seatimage>.seat_39 {
	top: 138px;
	right: 7px;
}

.seatimage>.seat_40 {
	top: 215px;
	right: 145px;
}

.seatimage>.seat_41 {
	top: 215px;
	right: 122px;
}

.seatimage>.seat_42 {
	top: 215px;
	right: 99px;
}

.seatimage>.seat_43 {
	top: 215px;
	right: 53px;
}

.seatimage>.seat_44 {
	top: 215px;
	right: 30px;
}

.seatimage>.seat_45 {
	top: 215px;
	right: 7px;
}

.seatimage>.seat_46 {
	top: 293px;
	right: 145px;
}

.seatimage>.seat_47 {
	top: 293px;
	right: 122px;
}

.seatimage>.seat_48 {
	top: 293px;
	right: 99px;
}

.seatimage>.seat_49 {
	top: 293px;
	right: 53px;
}

.seatimage>.seat_50 {
	top: 293px;
	right: 30px;
}

.seatimage>.seat_51 {
	top: 293px;
	right: 7px;
}

.seatimage>.seat_52 {
	top: 365px;
	right: 145px;
}

.seatimage>.seat_53 {
	top: 365px;
	right: 122px;
}

.seatimage>.seat_54 {
	top: 365px;
	right: 99px;
}

.seatimage>.seat_55 {
	top: 365px;
	right: 76px;
}

.seatimage>.seat_56 {
	top: 365px;
	right: 53px;
}

.seatimage>.seat_57 {
	top: 365px;
	right: 30px;
}

.seatimage>.seat_58 {
	top: 365px;
	right: 7px;
}

.seatimage>.room_1 {
	position: absolute;
	width: 68px;
	height: 70px;
	top: 212px;
	left: 5px;
}

.seatimage>.locker_1 {
	position: absolute;
	width: 33px;
	height: 12px;
	top: 144px;
	left: 7px;
}

.seatimage>.locker_2 {
	position: absolute;
	width: 68px;
	height: 12px;
	top: 194px;
	left: 7px;
}
.seatimageheader {
	width: 345px;
	height : 16px;
	margin: 7px auto;
}

.state {
width: 335px;
margin: 0px;
}

.state>li {
	float: left;
	margin-right: 10px;
}

.state>.word {
	float: left;
	margin-right: 30px;
}

.state>.color {
	width: 15px;
	height: 15px;
	border: 1px solid black;
}

.state>.use {
	background-color: orange;
}

.state>.empty {
	background-color: white;
}

.state>.me {
	background-color: red;
}
</style>
</head>
<body>
	<div class="seatimageheader">
		<ul class="state">
			<li class="use color"></li>
			<li class="word">사용중인 좌석</li>
			<li class="empty color"></li>
			<li class="word">비어있는 좌석</li>
			<li class="me color"></li>
			<li class="word">내 예약</li>
		</ul>
	</div>
	<div class="seatimage">
		<div class="seat_1" onclick="modal('1')"></div>
		<div class="seat_2" onclick="modal('2')"></div>
		<div class="seat_3" onclick="modal('3')"></div>
		<div class="seat_4" onclick="modal('4')"></div>
		<div class="seat_5" onclick="modal('5')"></div>
		<div class="seat_6" onclick="modal('6')"></div>
		<div class="seat_7" onclick="modal('7')"></div>
		<div class="seat_8" onclick="modal('8')"></div>
		<div class="seat_9" onclick="modal('9')"></div>
		<div class="seat_10" onclick="modal('10')"></div>
		<div class="seat_11" onclick="modal('11')"></div>
		<div class="seat_12" onclick="modal('12')"></div>
		<div class="seat_13" onclick="modal('13')"></div>
		<div class="seat_14" onclick="modal('14')"></div>
		<div class="seat_15" onclick="modal('15')"></div>
		<div class="seat_16" onclick="modal('16')"></div>
		<div class="seat_17" onclick="modal('17')"></div>
		<div class="seat_18" onclick="modal('18')"></div>
		<div class="seat_19" onclick="modal('19')"></div>
		<div class="seat_20" onclick="modal('20')"></div>
		<div class="seat_21" onclick="modal('21')"></div>
		<div class="seat_22" onclick="modal('22')"></div>
		<div class="seat_23" onclick="modal('23')"></div>
		<div class="seat_24" onclick="modal('24')"></div>
		<div class="seat_25" onclick="modal('25')"></div>
		<div class="seat_26" onclick="modal('26')"></div>
		<div class="seat_27" onclick="modal('27')"></div>
		<div class="seat_28" onclick="modal('28')"></div>
		<div class="seat_29" onclick="modal('29')"></div>
		<div class="seat_30" onclick="modal('30')"></div>
		<div class="seat_31" onclick="modal('31')"></div>
		<div class="seat_32" onclick="modal('32')"></div>
		<div class="seat_33" onclick="modal('33')"></div>
		<div class="seat_34" onclick="modal('34')"></div>
		<div class="seat_35" onclick="modal('35')"></div>
		<div class="seat_36" onclick="modal('36')"></div>
		<div class="seat_37" onclick="modal('37')"></div>
		<div class="seat_38" onclick="modal('38')"></div>
		<div class="seat_39" onclick="modal('39')"></div>
		<div class="seat_40" onclick="modal('40')"></div>
		<div class="seat_41" onclick="modal('41')"></div>
		<div class="seat_42" onclick="modal('42')"></div>
		<div class="seat_43" onclick="modal('43')"></div>
		<div class="seat_44" onclick="modal('44')"></div>
		<div class="seat_45" onclick="modal('45')"></div>
		<div class="seat_46" onclick="modal('46')"></div>
		<div class="seat_47" onclick="modal('47')"></div>
		<div class="seat_48" onclick="modal('48')"></div>
		<div class="seat_49" onclick="modal('49')"></div>
		<div class="seat_50" onclick="modal('50')"></div>
		<div class="seat_51" onclick="modal('51')"></div>
		<div class="seat_52" onclick="modal('52')"></div>
		<div class="seat_53" onclick="modal('53')"></div>
		<div class="seat_54" onclick="modal('54')"></div>
		<div class="seat_55" onclick="modal('55')"></div>
		<div class="seat_56" onclick="modal('56')"></div>
		<div class="seat_57" onclick="modal('57')"></div>
		<div class="seat_58" onclick="modal('58')"></div>
		<div class="room_1"></div>
		<div class="locker_1"></div>
		<div class="locker_2"></div>
	</div>

</body>

</html>