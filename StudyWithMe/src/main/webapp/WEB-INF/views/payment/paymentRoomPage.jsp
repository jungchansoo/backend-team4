<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">

<!-- 헤드 태그 안에 들어가는 공통코드 -->

<link rel="stylesheet" href="resources/css/paymentRoomPage.css" type="text/css">
<link rel="stylesheet" href="resources/css/userMainPage.css" type="text/css">
</head>
<!-- 헤더 -->
<%@include file="../includes/header.jsp"%>

<body>
	<div id="parent">
		<div class="sideMenu">
			<h1>이용권구매</h1>
			<ul>
				<li><a class="seat" href="/paymentSeatPage">스터디석</a></li>
				<li><a class="room" href="/paymentRoomPage">스터디룸</a></li>
				<li><a class="locker" href="/paymentLockerPage">사물함</a></li>
			</ul>
		</div>
	
		<div class="cd1"><h2>스터디룸</h2>
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
					
					<c:forEach items="${ticketList}" var="ticket">
						<tr>
							<td>
								<label>
									<input type="radio" name="product" value="${ticket.ticketName}">
									<input type="hidden" name="price" value="${ticket.price}">
									<input type="hidden" name="amount" value="<fmt:formatNumber value="${ticket.price}" pattern="#,##0원" />">
								</label>
							</td>
							
							<td>${ticket.ticketName}</td>
							<td><fmt:formatNumber value="${ticket.price}" pattern="#,##0원" /></td>
						</tr>
					</c:forEach>
					
				</table>
			</div>
	
			<div class="positionBtn">
		    	<button type="submit" id="modal_open_btn" class="paymentBtn">결제</button>
			</div>
		
			<div id="modal">
				<div class="modal_content">
					<div>
						<div><p>결제 정보</p></div>
						<div id="select-product"></div>
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
					
					<div class="findBtn">
						<form method="get" action="/kakaoPay">
							<input type="hidden" name="product" id="product">
							<input type="hidden" name="price" id="price">
							<button id="pay-btn" class="paymentBtn">결제</button>
						</form>
	
						<button type="button" id="modal_close_btn" class="paymentBtn">취소</button>
					</div>
				</div>
				
				<div class="modal_layer"></div>
			</div>
		</div>
		
		</div>
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
	        const amount = selectedProduct.closest('tr').querySelector('input[name="amount"]').value;
	        
	        $("#select-product").empty();
	        $("#select-product").append("<tr><td><b>이용권 : </b>" + product + "<nbsp></td><td><b>금액 : </b>" + amount + "</td></tr>");
	    }
	   
		document.getElementById("pay-btn").onclick = function() {
			const selectedProduct = document.querySelector('input[name="product"]:checked');
	        
	        // 선택된 radio 버튼의 value와 그에 해당하는 price를 가져옴
	        const product = selectedProduct.value;
	        const price = selectedProduct.closest('tr').querySelector('input[name="price"]').value;
			
			$('#product').val(product);
            $('#price').val(price);
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
					$("#select-product").empty();
					$("#select-product").append("<a>" + selectedProduct + "</a>");
				}
			});
		}
	    
	    $("#kaobtn").click(function() {
			$.ajax({
				type : 'get',
				url : '/pay/ready',
				data : {
					item_name : product,
					quantity : "1",
					total_amount : price,
					tax_free_amount : "0"
				},
				success : function(res) {
					location.href = res.next_redirect_pc_url;
				}
			});
		});
	    
	</script>
	
</body>
<%@include file="../includes/footer.jsp"%>
</html>