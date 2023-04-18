<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	ul {
		list-style-type: none;
		padding: 0px;
		margin: 0px;
		width: 120px;
		background: #efefef;
		height: 100%;
		overflow: auto;
		position: fixed;
	}
	
	li a {
		text-decoration: none;
		padding: 10px;
		display: block;
		color: #000;
		font-weight: bold;
	}
	
	li a:hover {
		background: #333;
		color: #fff;
	}
	
	li a.seat {
		background: #333;
		color: #fff;
	}
	
	div > p {
		font-weight: bold;
	}
	
	.cd1 {
		margin-left: 140px;
	}
	
	table {
		border: 0px solid black;
	}
	
	th, td {
		border: 0px solid black;
	}
	#modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0, 0, 0); /* Fallback color */
		background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	}
	#modal h2 {
		margin:0;
	}
	#modal button {
		display:inline-block;
		width:100px;
	}
	/* Modal Content/Box */
	#modal .modal_content {
		background-color: #fefefe;
		margin: 15% auto; /* 15% from the top and centered */
		padding: 20px;
		border: 1px solid #888;
		width: 40%; /* Could be more or less, depending on screen size */
	}
	#modal .modal_layer {
		position:fixed;
		top:0;
		left:0;
		width:100%;
		height:100%;
		background:rgba(0, 0, 0, 0.5);
		z-index:-1;
	}
	/* The Close Button */
	.close {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	.close:hover, .close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}

</style>
</head>
<body>
	<h1>이용권구매</h1>
	
	<ul>
		<li><a class="seat" href="/paymentSeatPage">스터디석</a></li>
		<li><a class="room" href="/paymentRoomPage">스터디룸</a></li>
		<li><a class="locker" href="/paymentLockerPage">사물함</a></li>
	</ul>
	
	<div class="cd1">스터디석
	<hr>
	<div>
	<!-- <form id="actionForm" method="get"> -->
 
		<div>
			<table>
				<tr>
					<th></th>
					<th>이용권명</th>
					<th>금액</th>
				</tr>
				<tr>
					<td>
						<label>
							<input type="radio" name="product" value="1시간권" checked>
							<input type="hidden" name="price" value="1,500원">
						</label>
					</td>
					<td>1시간권</td>
					<td>1,500원</td>
				</tr>
				<tr>
					<td>
						<label>
							<input type="radio" name="product" value="3시간권">
							<input type="hidden" name="price" value="4,200원">
						</label>
					</td>
					<td>3시간권</td>
					<td>4,200원</td>
				</tr>
				<tr>
					<td>
						<label>
							<input type="radio" name="product" value="6시간권">
							<input type="hidden" name="price" value="8,000원">
						</label>
					</td>
					<td>6시간권</td>
					<td>8,000원</td>
				</tr>
				<tr>
					<td>
						<label>
							<input type="radio" name="product" value="1일권(24시간)">
							<input type="hidden" name="price" value="20,000원">
						</label>
					</td>
					<td>1일권(24시간)</td>
					<td>20,000원</td>
				</tr>
				<tr>
					<td>
						<label>
							<input type="radio" name="product" value="3일권(72시간)">
							<input type="hidden" name="price" value="35,000원">
						</label>
					</td>
					<td>3일권(72시간)</td>
					<td>35,000원</td>
				</tr>
			</table>
		</div>

		<div>
	    	<button type="submit" id="modal_open_btn">결제</button>
		</div>
	
		<div id="modal">
			<div class="modal_content">
				<div>
					<div><p>결제 정보</p></div>
					<div id="select-product">
						
					</div>
				</div>
				
				<div>
					<div><p>결제 방법</p></div>
					<div>
						<table>
							<tr>
								<td><label><input type="radio" name="payMethod" value="kakaoPay" checked></label></td>
								<td>카카오페이</td>
							</tr>
						</table>
					</div>
				</div>
			
				<div>
					<button type="button">결제</button>
					<button type="button" id="modal_close_btn">취소</button>
				</div>
			</div>
			
			<div class="modal_layer"></div>
		</div>

	</div>
    <!-- </form>  -->

	
	</div>
	
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script>
		document.getElementById("modal_open_btn").onclick = function() {
	        document.getElementById("modal").style.display="block";
	        
	     // 선택된 radio 버튼 요소를 가져옴
	        const selectedProduct = document.querySelector('input[name="product"]:checked');
	        
	        // 선택된 radio 버튼의 value와 그에 해당하는 price를 가져옴
	        const product = selectedProduct.value;
	        const price = selectedProduct.closest('tr').querySelector('input[name="price"]').value;
	        
	        $("#select-product").empty();
	        $("#select-product").append("<tr><td><b>이용권 : </b>" + product + "<nbsp></td><td><b>금액 : </b>" + price + "</td></tr>");
	        
	        console.log(selectedProduct);
	        console.log(selectedPrice);
	        
	        selectProduct();
	    }
	   
	    document.getElementById("modal_close_btn").onclick = function() {
	        document.getElementById("modal").style.display="none";
	    }
	    
	    const selectProduct = function() {
			// Ajax 요청으로 스터디카페 리스트 출력
			$.ajax({
				type : "GET",
				url : "/selectProduct",
				data : {
					
				},
				success : function(response) {
					console.log("============");

					$("#select-product").empty();
					$("#select-product").append("<a>" + selectedProduct + "</a>");
				}
			});
		}
	    
	    $("#select-check-btn").click(function() {
			
		});
	    
	</script>
	
</body>
</html>