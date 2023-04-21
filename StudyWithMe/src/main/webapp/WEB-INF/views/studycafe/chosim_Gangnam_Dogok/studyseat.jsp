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

.close-modal  {
    display: none !important;
}
body {
	font-family: "paybooc-Light", sans-serif;
	font-size: 25px;
}
#seatimage {
	position: relative;
	width: 714px;
	height: 751px;
	background: url("resources/image/studyseat2.jpg");
	background-repeat: no-repeat;
	margin: 0 auto;
}

#seatimage>div {
	position: absolute;
	width: 39px;
	height: 39px;
	cursor: pointer;
	opacity: 0.5;
}

#seatimage>#seat_1 {
	top: 110px;
	left: 15px;
}

#seatimage>#seat_2 {
	top: 110px;
	left: 56px;
}

#seatimage>#seat_3 {
	top: 110px;
	left: 125px;
}

#seatimage>#seat_4 {
	top: 110px;
	left: 166px;
}

#seatimage>#seat_5 {
	top: 110px;
	left: 236px;
}

#seatimage>#seat_6 {
	top: 110px;
	left: 277px;
}

#seatimage>#seat_7 {
	top: 110px;
	left: 346px;
}

#seatimage>#seat_8 {
	top: 151px;
	left: 15px;
}

#seatimage>#seat_9 {
	top: 151px;
	left: 56px;
}

#seatimage>#seat_10 {
	top: 151px;
	left: 125px;
}

#seatimage>#seat_11 {
	top: 151px;
	left: 166px;
}

#seatimage>#seat_12 {
	top: 151px;
	left: 236px;
}

#seatimage>#seat_13 {
	top: 151px;
	left: 277px;
}

#seatimage>#seat_14 {
	top: 151px;
	left: 346px;
}

#seatimage>#seat_15 {
	top: 261px;
	left: 252px;
}

#seatimage>#seat_16 {
	top: 261px;
	left: 323px;
}

#seatimage>#seat_17 {
	top: 261px;
	left: 364px;
}

#seatimage>#seat_18 {
	top: 302px;
	left: 252px;
}

#seatimage>#seat_19 {
	top: 302px;
	left: 323px;
}

#seatimage>#seat_20 {
	top: 302px;
	left: 364px;
}

#seatimage>#seat_21 {
	top: 70px;
	right: 258px;
}

#seatimage>#seat_22 {
	top: 70px;
	right: 217px;
}

#seatimage>#seat_23 {
	top: 70px;
	right: 176px;
}

#seatimage>#seat_24 {
	top: 70px;
	right: 135px;
}

#seatimage>#seat_25 {
	top: 70px;
	right: 94px;
}

#seatimage>#seat_26 {
	top: 70px;
	right: 53px;
}

#seatimage>#seat_27 {
	top: 70px;
	right: 12px;
}

#seatimage>#seat_28 {
	top: 204px;
	right: 258px;
}

#seatimage>#seat_29 {
	top: 204px;
	right: 217px;
}

#seatimage>#seat_30 {
	top: 204px;
	right: 176px;
}

#seatimage>#seat_31 {
	top: 204px;
	right: 94px;
}

#seatimage>#seat_32 {
	top: 204px;
	right: 53px;
}

#seatimage>#seat_33 {
	top: 204px;
	right: 12px;
}

#seatimage>#seat_34 {
	top: 245px;
	right: 258px;
}

#seatimage>#seat_35 {
	top: 245px;
	right: 217px;
}

#seatimage>#seat_36 {
	top: 245px;
	right: 176px;
}

#seatimage>#seat_37 {
	top: 245px;
	right: 94px;
}

#seatimage>#seat_38 {
	top: 245px;
	right: 53px;
}

#seatimage>#seat_39 {
	top: 245px;
	right: 12px;
}

#seatimage>#seat_40 {
	top: 381px;
	right: 258px;
}

#seatimage>#seat_41 {
	top: 381px;
	right: 217px;
}

#seatimage>#seat_42 {
	top: 381px;
	right: 176px;
}

#seatimage>#seat_43 {
	top: 381px;
	right: 94px;
}

#seatimage>#seat_44 {
	top: 381px;
	right: 53px;
}

#seatimage>#seat_45 {
	top: 381px;
	right: 12px;
}

#seatimage>#seat_46 {
	top: 520px;
	right: 258px;
}

#seatimage>#seat_47 {
	top: 520px;
	right: 217px;
}

#seatimage>#seat_48 {
	top: 520px;
	right: 176px;
}

#seatimage>#seat_49 {
	top: 520px;
	right: 94px;
}

#seatimage>#seat_50 {
	top: 520px;
	right: 53px;
}

#seatimage>#seat_51 {
	top: 520px;
	right: 12px;
}

#seatimage>#seat_52 {
	top: 648px;
	right: 258px;
}

#seatimage>#seat_53 {
	top: 648px;
	right: 217px;
}

#seatimage>#seat_54 {
	top: 648px;
	right: 176px;
}

#seatimage>#seat_55 {
	top: 648px;
	right: 135px;
}

#seatimage>#seat_56 {
	top: 648px;
	right: 94px;
}

#seatimage>#seat_57 {
	top: 648px;
	right: 53px;
}

#seatimage>#seat_58 {
	top: 648px;
	right: 12px;
}

#seatimage>#room_1 {
	position: absolute;
	width: 120px;
	height: 125px;
	top: 375px;
	left: 10px;
}

#seatimage>#locker_1 {
	position: absolute;
	width: 60px;
	height: 20px;
	top: 257px;
	left: 12px;
}

#seatimage>#locker_2 {
	position: absolute;
	width: 125px;
	height: 20px;
	top: 345px;
	left: 12px;
}
#seatimageheader {
	width: 700px;
	height : 30px;
	margin: 7px auto;
}

#state {
width: 690px;
margin-left: 50px;
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
	width: 30px;
	height: 30px;
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
		<div id="room_1" class="room" onclick="clickroom('1')"></div>
		<div id="locker_1" class="locker" onclick="clicklocker('1')"></div>
		<div id="locker_2" class="locker" onclick="clicklocker('2')"></div>
	</div>
</body>

</html>