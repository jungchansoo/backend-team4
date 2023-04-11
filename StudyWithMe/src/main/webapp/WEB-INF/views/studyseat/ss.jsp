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
        top : 45px;
        right : 200px;
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
	</div>
</body>
</html>