<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
      body {
        font-size: 5px;
        
      }
      div {
      border: 1px solid red;
      }
      
      .seatimage {
      	position : relative;
        width: 402px;
        height: 423px;
        background: url("resources/image/studyseat.jpg");
        background-repeat : no-repeat;
       	margin: 0 auto;
      }
      .seatimage > div {
      	position : absolute;
        width: 20px;
        height: 20px;
      }
      .seatimage > .seat_1 {
        top : 62px;
        left : 9px;
      }
      .seatimage > .seat_2 {
        top : 62px;
        left : 32px;
      }
      .seatimage > .seat_3 {
        top : 62px;
        left : 71px;
      }
      .seatimage > .seat_4 {
        top : 62px;
        left : 94px;
      }
      .seatimage > .seat_5 {
        top : 62px;
        left : 133px;
      }
      .seatimage > .seat_5 {
        top : 62px;
        left : 133px;
      }
      .seatimage > .seat_6 {
        top : 62px;
        left : 156px;
      }
      .seatimage > .seat_7 {
        top : 62px;
        left : 195px;
      }
      .seatimage > .seat_8 {
        top : 85px;
        left : 9px;
      }
      .seatimage > .seat_9 {
        top : 85px;
        left : 32px;
      }
      .seatimage > .seat_10 {
        top : 85px;
        left : 71px;
      }
      .seatimage > .seat_11 {
        top : 85px;
        left : 94px;
      }
      .seatimage > .seat_12 {
        top : 85px;
        left : 133px;
      }
      .seatimage > .seat_13 {
        top : 85px;
        left : 156px;
      }
      .seatimage > .seat_14 {
        top : 85px;
        left : 195px;
      }
      .seatimage > .seat_15 {
        top : 147px;
        left : 142px;
      }
      .seatimage > .seat_16 {
        top : 147px;
        left : 182px;
      }
      .seatimage > .seat_17 {
        top : 147px;
        left : 205px;
      }
      .seatimage > .seat_18 {
        top : 170px;
        left : 142px;
      }
      .seatimage > .seat_19 {
        top : 170px;
        left : 182px;
      }
      .seatimage > .seat_20 {
        top : 170px;
        left : 205px;
      }
      .seatimage > .seat_21 {
        top : 40px;
        right : 145px;
      }
      .seatimage > .seat_22 {
        top : 40px;
        right : 122px;
      }
      .seatimage > .seat_23 {
        top : 40px;
        right : 99px;
      }
      .seatimage > .seat_24 {
        top : 40px;
        right : 76px;
      }
      .seatimage > .seat_25 {
        top : 40px;
        right : 53px;
      }
      .seatimage > .seat_26 {
        top : 40px;
        right : 30px;
      }
      .seatimage > .seat_27 {
        top : 40px;
        right : 7px;
      }
      .seatimage > .seat_28 {
        top : 115px;
        right : 145px;
      }
      .seatimage > .seat_29 {
        top : 115px;
        right : 122px;
      }
      .seatimage > .seat_30 {
        top : 115px;
        right : 99px;
      }
      .seatimage > .seat_31 {
        top : 115px;
        right : 53px;
      }
      .seatimage > .seat_32 {
        top : 115px;
        right : 30px;
      }
      .seatimage > .seat_33 {
        top : 115px;
        right : 7px;
      }
      .seatimage > .seat_34 {
        top : 138px;
        right : 145px;
      }
      .seatimage > .seat_35 {
        top : 138px;
        right : 122px;
      }
      .seatimage > .seat_36 {
        top : 138px;
        right : 99px;
      }
      .seatimage > .seat_37 {
        top : 138px;
        right : 53px;
      }
      .seatimage > .seat_38 {
        top : 138px;
        right : 30px;
      }
      .seatimage > .seat_39 {
        top : 138px;
        right : 7px;
      }
      .seatimage > .seat_40 {
        top : 215px;
        right : 145px;
      }
      .seatimage > .seat_41 {
        top : 215px;
        right : 122px;
      }
      .seatimage > .seat_42 {
        top : 215px;
        right : 99px;
      }
      .seatimage > .seat_43 {
        top : 215px;
        right : 53px;
      }
      .seatimage > .seat_44 {
        top : 215px;
        right : 30px;
      }
      .seatimage > .seat_45 {
        top : 215px;
        right : 7px;
      }
      .seatimage > .seat_46 {
        top : 293px;
        right : 145px;
      }
      .seatimage > .seat_47 {
        top : 293px;
        right : 122px;
      }
      .seatimage > .seat_48 {
        top : 293px;
        right : 99px;
      }
      .seatimage > .seat_49 {
        top : 293px;
        right : 53px;
      }
      .seatimage > .seat_50 {
        top : 293px;
        right : 30px;
      }
      .seatimage > .seat_51 {
        top : 293px;
        right : 7px;
      }
      .seatimage > .seat_52 {
        top : 365px;
        right : 145px;
      }
      .seatimage > .seat_53 {
        top : 365px;
        right : 122px;
      }
      .seatimage > .seat_54 {
        top : 365px;
        right : 99px;
      }
      .seatimage > .seat_55 {
        top : 365px;
        right : 76px;
      }
      .seatimage > .seat_56 {
        top : 365px;
        right : 53px;
      }
      .seatimage > .seat_57 {
        top : 365px;
        right : 30px;
      }
      .seatimage > .seat_58 {
        top : 365px;
        right : 7px;
      }
      .seatimage > .room_1 {
        position : absolute;
        width: 68px;
        height: 70px;
        top : 212px;
        left : 5px;
      }
      .seatimage > .locker_1 {
        position : absolute;
        width: 33px;
        height: 12px;
        top : 144px;
        left : 7px;
      }
      .seatimage > .locker_2 {
        position : absolute;
        width: 68px;
        height: 12px;
        top : 194px;
        left : 7px;
      }
      
      .mark{
      	position : relative;
      	width: 500px;
      	height: 25px;
      }
      .mark > p{
      	font-size : 5px;
      	width: 80px;
      	height: 15px;
      	left: 30px;
      }
      .mark > div{
     	position : absolute;
        width: 15px;
        height: 15px;
        border : 1px solid black;
      }
      .mark > .using{
     	background-color: yellow;
     	left : 100px;
      }
    </style>
</head>
<body>
	<div class="mark">
	<div class="using"></div >
	<p class="useseat">사용중인 좌석</p>
	
	<div class="empty"></div >
	<p class="emptyseat">비어있는 좌석</p>
	
	<div class="my_reservation"></div >
	<p calss="myseat">내 예약</p>
	
	</div>
	<div class="seatimage">
		<div class="seat_1"></div>
		<div class="seat_2"></div>
		<div class="seat_3"></div>
		<div class="seat_4"></div>
		<div class="seat_5"></div>
		<div class="seat_6"></div>
		<div class="seat_7"></div>
		<div class="seat_8"></div>
		<div class="seat_9"></div>
		<div class="seat_10"></div>
		<div class="seat_11"></div>
		<div class="seat_12"></div>
		<div class="seat_13"></div>
		<div class="seat_14"></div>
		<div class="seat_15"></div>
		<div class="seat_16"></div>
		<div class="seat_17"></div>
		<div class="seat_18"></div>
		<div class="seat_19"></div>
		<div class="seat_20"></div>
		<div class="seat_21"></div>
		<div class="seat_22"></div>
		<div class="seat_23"></div>
		<div class="seat_24"></div>
		<div class="seat_25"></div>
		<div class="seat_26"></div>
		<div class="seat_27"></div>
		<div class="seat_28"></div>
		<div class="seat_29"></div>
		<div class="seat_30"></div>
		<div class="seat_31"></div>
		<div class="seat_32"></div>
		<div class="seat_33"></div>
		<div class="seat_34"></div>
		<div class="seat_35"></div>
		<div class="seat_36"></div>
		<div class="seat_37"></div>
		<div class="seat_38"></div>
		<div class="seat_39"></div>
		<div class="seat_40"></div>
		<div class="seat_41"></div>
		<div class="seat_42"></div>
		<div class="seat_43"></div>
		<div class="seat_44"></div>
		<div class="seat_45"></div>
		<div class="seat_46"></div>
		<div class="seat_47"></div>
		<div class="seat_48"></div>
		<div class="seat_49"></div>
		<div class="seat_50"></div>
		<div class="seat_51"></div>
		<div class="seat_52"></div>
		<div class="seat_53"></div>
		<div class="seat_54"></div>
		<div class="seat_55"></div>
		<div class="seat_56"></div>
		<div class="seat_57"></div>
		<div class="seat_58"></div>
		<div class="room_1"></div>
		<div class="locker_1"></div>
		<div class="locker_2"></div>
	</div>
</body>
</html>