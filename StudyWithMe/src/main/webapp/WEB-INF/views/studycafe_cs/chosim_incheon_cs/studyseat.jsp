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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
body {
	font-size: 10px;
}

#seatimage {
	position: relative;
	width: 402px;
	height: 423px;
	background: url("resources/image/studyseat.jpg");
	background-repeat: no-repeat;
	margin: 0 auto;
}

#seatimage>div {
	position: absolute;
	width: 22px;
	height: 22px;
	cursor: pointer;
	opacity: 0.5;
}

#seatimage>#seat_1 {
	top: 63px;
	left: 9px;
}

#seatimage>#seat_2 {
	top: 63px;
	left: 32px;
}

#seatimage>#seat_3 {
	top: 63px;
	left: 71px;
}

#seatimage>#seat_4 {
	top: 63px;
	left: 94px;
}

#seatimage>#seat_5 {
	top: 63px;
	left: 133px;
}

#seatimage>#seat_6 {
	top: 63px;
	left: 156px;
}

#seatimage>#seat_7 {
	top: 63px;
	left: 195px;
}

#seatimage>#seat_8 {
	top: 86px;
	left: 9px;
}

#seatimage>#seat_9 {
	top: 86px;
	left: 32px;
}

#seatimage>#seat_10 {
	top: 86px;
	left: 71px;
}

#seatimage>#seat_11 {
	top: 86px;
	left: 94px;
}

#seatimage>#seat_12 {
	top: 86px;
	left: 133px;
}

#seatimage>#seat_13 {
	top: 86px;
	left: 156px;
}

#seatimage>#seat_14 {
	top: 86px;
	left: 195px;
}

#seatimage>#seat_15 {
	top: 147px;
	left: 142px;
}

#seatimage>#seat_16 {
	top: 147px;
	left: 182px;
}

#seatimage>#seat_17 {
	top: 147px;
	left: 206px;
}

#seatimage>#seat_18 {
	top: 170px;
	left: 142px;
}

#seatimage>#seat_19 {
	top: 170px;
	left: 182px;
}

#seatimage>#seat_20 {
	top: 170px;
	left: 206px;
}

#seatimage>#seat_21 {
	top: 40px;
	right: 145px;
}

#seatimage>#seat_22 {
	top: 40px;
	right: 122px;
}

#seatimage>#seat_23 {
	top: 40px;
	right: 99px;
}

#seatimage>#seat_24 {
	top: 40px;
	right: 76px;
}

#seatimage>#seat_25 {
	top: 40px;
	right: 53px;
}

#seatimage>#seat_26 {
	top: 40px;
	right: 30px;
}

#seatimage>#seat_27 {
	top: 40px;
	right: 7px;
}

#seatimage>#seat_28 {
	top: 115px;
	right: 145px;
}

#seatimage>#seat_29 {
	top: 115px;
	right: 122px;
}

#seatimage>#seat_30 {
	top: 115px;
	right: 99px;
}

#seatimage>#seat_31 {
	top: 115px;
	right: 53px;
}

#seatimage>#seat_32 {
	top: 115px;
	right: 30px;
}

#seatimage>#seat_33 {
	top: 115px;
	right: 7px;
}

#seatimage>#seat_34 {
	top: 138px;
	right: 145px;
}

#seatimage>#seat_35 {
	top: 138px;
	right: 122px;
}

#seatimage>#seat_36 {
	top: 138px;
	right: 99px;
}

#seatimage>#seat_37 {
	top: 138px;
	right: 53px;
}

#seatimage>#seat_38 {
	top: 138px;
	right: 30px;
}

#seatimage>#seat_39 {
	top: 138px;
	right: 7px;
}

#seatimage>#seat_40 {
	top: 215px;
	right: 145px;
}

#seatimage>#seat_41 {
	top: 215px;
	right: 122px;
}

#seatimage>#seat_42 {
	top: 215px;
	right: 99px;
}

#seatimage>#seat_43 {
	top: 215px;
	right: 53px;
}

#seatimage>#seat_44 {
	top: 215px;
	right: 30px;
}

#seatimage>#seat_45 {
	top: 215px;
	right: 7px;
}

#seatimage>#seat_46 {
	top: 293px;
	right: 145px;
}

#seatimage>#seat_47 {
	top: 293px;
	right: 122px;
}

#seatimage>#seat_48 {
	top: 293px;
	right: 99px;
}

#seatimage>#seat_49 {
	top: 293px;
	right: 53px;
}

#seatimage>#seat_50 {
	top: 293px;
	right: 30px;
}

#seatimage>#seat_51 {
	top: 293px;
	right: 7px;
}

#seatimage>#seat_52 {
	top: 365px;
	right: 145px;
}

#seatimage>#seat_53 {
	top: 365px;
	right: 122px;
}

#seatimage>#seat_54 {
	top: 365px;
	right: 99px;
}

#seatimage>#seat_55 {
	top: 365px;
	right: 76px;
}

#seatimage>#seat_56 {
	top: 365px;
	right: 53px;
}

#seatimage>#seat_57 {
	top: 365px;
	right: 30px;
}

#seatimage>#seat_58 {
	top: 365px;
	right: 7px;
}

#seatimage>#room_1 {
	position: absolute;
	width: 68px;
	height: 70px;
	top: 212px;
	left: 5px;
}

#seatimage>#locker_1 {
	position: absolute;
	width: 34px;
	height: 13px;
	top: 144px;
	left: 7px;
}

#seatimage>#locker_2 {
	position: absolute;
	width: 70px;
	height: 13px;
	top: 194px;
	left: 7px;
}
#seatimageheader {
	width: 380px;
	height : 16px;
	margin: 7px auto;
}

#state {
width: 370px;
margin: 7px;
}

#state>li {
	float: left;
	margin-right: 10px;
}

#state>.word {
	float: left;
	margin-right: 30px;
}

#state>.color {
	width: 15px;
	height: 15px;
	border: 1px solid black;
	opacity: 0.6;
}

#state>.use {
	background-color: orange;
}

#state>.empty {
	background-color: white;
}

#state>.me {
	background-color: red;
}
</style>
</head>
<body>
	<div id="seatimageheader">
		<ul id="state">
			<li class="use color"></li>
			<li class="word">사용중인 좌석</li>
			<li class="empty color"></li>
			<li class="word">비어있는 좌석</li>
			<li class="me color"></li>
			<li class="word">내 예약</li>
		</ul>
	</div>
	<div id="seatimage">
		<div id="seat_1" class="seat" onclick="clickseat('1')"></div>
		<div id="seat_2" class="seat" onclick="clickseat('2')"></div>
		<div id="seat_3" class="seat" onclick="clickseat('3')"></div>
		<div id="seat_4" class="seat" onclick="clickseat('4')"></div>
		<div id="seat_5" class="seat" onclick="clickseat('5')"></div>
		<div id="seat_6" class="seat" onclick="clickseat('6')"></div>
		<div id="seat_7" class="seat" onclick="clickseat('7')"></div>
		<div id="seat_8" class="seat" onclick="clickseat('8')"></div>
		<div id="seat_9" class="seat" onclick="clickseat('9')"></div>
		<div id="seat_10" class="seat" onclick="clickseat('10')"></div>
		<div id="seat_11" class="seat" onclick="clickseat('11')"></div>
		<div id="seat_12" class="seat" onclick="clickseat('12')"></div>
		<div id="seat_13" class="seat" onclick="clickseat('13')"></div>
		<div id="seat_14" class="seat" onclick="clickseat('14')"></div>
		<div id="seat_15" class="seat" onclick="clickseat('15')"></div>
		<div id="seat_16" class="seat" onclick="clickseat('16')"></div>
		<div id="seat_17" class="seat" onclick="clickseat('17')"></div>
		<div id="seat_18" class="seat" onclick="clickseat('18')"></div>
		<div id="seat_19" class="seat" onclick="clickseat('19')"></div>
		<div id="seat_20" class="seat" onclick="clickseat('20')"></div>
		<div id="seat_21" class="seat" onclick="clickseat('21')"></div>
		<div id="seat_22" class="seat" onclick="clickseat('22')"></div>
		<div id="seat_23" class="seat" onclick="clickseat('23')"></div>
		<div id="seat_24" class="seat" onclick="clickseat('24')"></div>
		<div id="seat_25" class="seat" onclick="clickseat('25')"></div>
		<div id="seat_26" class="seat" onclick="clickseat('26')"></div>
		<div id="seat_27" class="seat" onclick="clickseat('27')"></div>
		<div id="seat_28" class="seat" onclick="clickseat('28')"></div>
		<div id="seat_29" class="seat" onclick="clickseat('29')"></div>
		<div id="seat_30" class="seat" onclick="clickseat('30')"></div>
		<div id="seat_31" class="seat" onclick="clickseat('31')"></div>
		<div id="seat_32" class="seat" onclick="clickseat('32')"></div>
		<div id="seat_33" class="seat" onclick="clickseat('33')"></div>
		<div id="seat_34" class="seat" onclick="clickseat('34')"></div>
		<div id="seat_35" class="seat" onclick="clickseat('35')"></div>
		<div id="seat_36" class="seat" onclick="clickseat('36')"></div>
		<div id="seat_37" class="seat" onclick="clickseat('37')"></div>
		<div id="seat_38" class="seat" onclick="clickseat('38')"></div>
		<div id="seat_39" class="seat" onclick="clickseat('39')"></div>
		<div id="seat_40" class="seat" onclick="clickseat('40')"></div>
		<div id="seat_41" class="seat" onclick="clickseat('41')"></div>
		<div id="seat_42" class="seat" onclick="clickseat('42')"></div>
		<div id="seat_43" class="seat" onclick="clickseat('43')"></div>
		<div id="seat_44" class="seat" onclick="clickseat('44')"></div>
		<div id="seat_45" class="seat" onclick="clickseat('45')"></div>
		<div id="seat_46" class="seat" onclick="clickseat('46')"></div>
		<div id="seat_47" class="seat" onclick="clickseat('47')"></div>
		<div id="seat_48" class="seat" onclick="clickseat('48')"></div>
		<div id="seat_49" class="seat" onclick="clickseat('49')"></div>
		<div id="seat_50" class="seat" onclick="clickseat('50')"></div>
		<div id="seat_51" class="seat" onclick="clickseat('51')"></div>
		<div id="seat_52" class="seat" onclick="clickseat('52')"></div>
		<div id="seat_53" class="seat" onclick="clickseat('53')"></div>
		<div id="seat_54" class="seat" onclick="clickseat('54')"></div>
		<div id="seat_55" class="seat" onclick="clickseat('55')"></div>
		<div id="seat_56" class="seat" onclick="clickseat('56')"></div>
		<div id="seat_57" class="seat" onclick="clickseat('57')"></div>
		<div id="seat_58" class="seat" onclick="clickseat('58')"></div>
		<div id="room_1"></div>
		<div id="locker_1"></div>
		<div id="locker_2"></div>
	</div>
</body>

</html>