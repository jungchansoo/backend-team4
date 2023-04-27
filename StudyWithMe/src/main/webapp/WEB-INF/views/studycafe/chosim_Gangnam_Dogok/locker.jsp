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

#lockerimage {
	position: relative;
	width: 800px;
	height: 500px;
	margin: 0 auto;
}

#lockerimage>div {
	position: absolute;
	width: 53px;
	height: 53px;
	cursor: pointer;
	
	background-color: #454954;
	color: white;
	font-size: 30px;
	display: flex;
  	justify-content: center;
  	align-items: center;
}

#lockerimage>#locker_1 {
	top: 3px;
	left: 3px;
}

#lockerimage>#locker_2 {
	top: 3px;
	left: 59px;
}

#lockerimage>#locker_3 {
	top: 3px;
	left: 115px;

}

#lockerimage>#locker_4 {
	top: 3px;
	left: 171px;

}

#lockerimage>#locker_5 {
	top: 3px;
	left: 227px;
}

#lockerimage>#locker_6 {
	top: 59px;
	left: 3px;
}

#lockerimage>#locker_7 {
	top: 59px;
	left: 59px;
}

#lockerimage>#locker_8 {
	top: 59px;
	left: 115px;
}

#lockerimage>#locker_9 {
	top: 59px;
	left: 171px;
}

#lockerimage>#locker_10 {
	top: 59px;
	left: 227px;
}

#lockerimage>#locker_11 {
	top: 113px;
	left: 3px;
}

#lockerimage>#locker_12 {
	top: 113px;
	left: 59px;
}

#lockerimage>#locker_13 {
	top: 113px;
	left: 115px;
}

#lockerimage>#locker_14 {
	top: 113px;
	left: 171px;
}

#lockerimage>#locker_15 {
	top: 113px;
	left: 227px;
}

#lockerimage>#locker_16 {
	top: 168px;
	left: 3px;
}

#lockerimage>#locker_17 {
	top: 168px;
	left: 59px;
}

#lockerimage>#locker_18 {
	top: 168px;
	left: 115px;
}

#lockerimage>#locker_19 {
	top: 168px;
	left: 171px;
}

#lockerimage>#locker_20 {
	top: 168px;
	left: 227px;
}

#lockerimage>#locker_21 {
	top: 223px;
	left: 3px;
}

#lockerimage>#locker_22 {
	top: 223px;
	left: 59px;
}

#lockerimage>#locker_23 {
	top: 223px;
	left: 115px;
}

#lockerimage>#locker_24 {
	top: 223px;
	left: 171px;
}

#lockerimage>#locker_25 {
	top: 223px;
	left: 227px;
}

#lockerimage>#locker_26 {
	top: 278px;
	left: 3px;
}

#lockerimage>#locker_27 {
	top: 278px;
	left: 59px;
}

#lockerimage>#locker_28 {
	top: 278px;
	left: 115px;
}

#lockerimage>#locker_29 {
	top: 278px;
	left: 171px;
}

#lockerimage>#locker_30 {
	top: 278px;
	left: 227px;
}

#lockerimage>#locker_31 {
	top: 333px;
	left: 3px;
}

#lockerimage>#locker_32 {
	top: 333px;
	left: 59px;
}

#lockerimage>#locker_33 {
	top: 333px;
	left: 115px;
}

#lockerimage>#locker_34 {
	top: 333px;
	left: 171px;
}

#lockerimage>#locker_35 {
	top: 333px;
	left: 227px;
}

#lockerimage>#locker_36 {
	top: 388px;
	left: 3px;
}

#lockerimage>#locker_37 {
	top: 388px;
	left: 59px;
}

#lockerimage>#locker_38 {
	top: 388px;
	left: 115px;
}

#lockerimage>#locker_39 {
	top: 388px;
	left: 171px;
}

#lockerimage>#locker_40 {
	top: 388px;
	left: 227px;
}

#lockerimage>#locker_41 {
	top: 443px;
	left: 3px;
}

#lockerimage>#locker_42 {
	top: 443px;
	left: 59px;
}

#lockerimage>#locker_43 {
	top: 443px;
	left: 115px;
}

#lockerimage>#locker_44 {
	top: 443px;
	left: 171px;
}

#lockerimage>#locker_45 {
	top: 443px;
	left: 227px;
}
 
#lockerimageheader {
	width: 800px;
	height : 40px;
	margin: 7px auto;
}

#state {
	width: 700px;
	display: flex;
  justify-content: center;
}

#state>li {
	float: left;
}

#state>.word {
	font-size: 25px;
	margin-right: 20px;
}

#state>.color {
	width: 15px;
	height: 15px;
	border: 1px solid black;
}

#state>.use {
	background-color: orange;
}

#state>.empty {
	background-color: #454954;
}

li{
	list-style-type: none;
}
</style>
</head>
<body>
	<div id="lockerimageheader">
		<ul id="state">
			<li class="use color"></li>
			<li class="word">사용중인 사물함</li>
			<li class="empty color"></li>
			<li class="word">비어있는 사물함</li>
		</ul>
	</div>
	<div id="lockerimage">
		<div id="locker_1" class="locker" onclick="clicklocker('1')">1</div>
		<div id="locker_2" class="locker" onclick="clicklocker('2')">2</div>
		<div id="locker_3" class="locker" onclick="clicklocker('3')">3</div>
		<div id="locker_4" class="locker" onclick="clicklocker('4')"></div>
		<div id="locker_5" class="locker" onclick="clicklocker('5')"></div>
		<div id="locker_6" class="locker" onclick="clicklocker('6')"></div>
		<div id="locker_7" class="locker" onclick="clicklocker('7')"></div>
		<div id="locker_8" class="locker" onclick="clicklocker('8')"></div>
		<div id="locker_9" class="locker" onclick="clicklocker('9')"></div>
		<div id="locker_10" class="locker" onclick="clicklocker('10')"></div>
		<div id="locker_11" class="locker" onclick="clicklocker('11')"></div>
		<div id="locker_12" class="locker" onclick="clicklocker('12')"></div>
		<div id="locker_13" class="locker" onclick="clicklocker('13')"></div>
		<div id="locker_14" class="locker" onclick="clicklocker('14')"></div>
		<div id="locker_15" class="locker" onclick="clicklocker('15')"></div>
		<div id="locker_16" class="locker" onclick="clicklocker('16')"></div>
		<div id="locker_17" class="locker" onclick="clicklocker('17')"></div>
		<div id="locker_18" class="locker" onclick="clicklocker('18')"></div>
		<div id="locker_19" class="locker" onclick="clicklocker('19')"></div>
		<div id="locker_20" class="locker" onclick="clicklocker('20')"></div>
		<div id="locker_21" class="locker" onclick="clicklocker('21')"></div>
		<div id="locker_22" class="locker" onclick="clicklocker('22')"></div>
		<div id="locker_23" class="locker" onclick="clicklocker('23')"></div>
		<div id="locker_24" class="locker" onclick="clicklocker('24')"></div>
		<div id="locker_25" class="locker" onclick="clicklocker('25')"></div>
		<div id="locker_26" class="locker" onclick="clicklocker('26')"></div>
		<div id="locker_27" class="locker" onclick="clicklocker('27')"></div>
		<div id="locker_28" class="locker" onclick="clicklocker('28')"></div>
		<div id="locker_29" class="locker" onclick="clicklocker('29')"></div>
		<div id="locker_30" class="locker" onclick="clicklocker('30')"></div>
		<div id="locker_31" class="locker" onclick="clicklocker('31')"></div>
		<div id="locker_32" class="locker" onclick="clicklocker('32')"></div>
		<div id="locker_33" class="locker" onclick="clicklocker('33')"></div>
		<div id="locker_34" class="locker" onclick="clicklocker('34')"></div>
		<div id="locker_35" class="locker" onclick="clicklocker('35')"></div>
		<div id="locker_36" class="locker" onclick="clicklocker('36')"></div>
		<div id="locker_37" class="locker" onclick="clicklocker('37')"></div>
		<div id="locker_38" class="locker" onclick="clicklocker('38')"></div>
		<div id="locker_39" class="locker" onclick="clicklocker('39')"></div>
		<div id="locker_40" class="locker" onclick="clicklocker('40')"></div>
		<div id="locker_41" class="locker" onclick="clicklocker('41')"></div>
		<div id="locker_42" class="locker" onclick="clicklocker('42')"></div>
		<div id="locker_43" class="locker" onclick="clicklocker('43')"></div>
		<div id="locker_44" class="locker" onclick="clicklocker('44')"></div>
		<div id="locker_45" class="locker" onclick="clicklocker('45')"></div>
	</div>
</body>

</html>