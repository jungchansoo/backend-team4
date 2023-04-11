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
        top : 62px;
        left : 9px;
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
	</div>
</body>
</html>