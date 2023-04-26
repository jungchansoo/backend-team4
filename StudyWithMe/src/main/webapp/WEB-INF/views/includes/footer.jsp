<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<style>
.footer {
	width: 65%;
	padding: 20px 0;
	margin: 0 auto;
	font-size: 17px;
}

.footer-container {
	padding-top: 50px;
}

.footer-line {
	border: 0;
	height: 1px;
	background-color: #ccc;
	margin-bottom: 20px;
}

.footer-content {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
}

.footer-left {
	display: flex;
	gap: 10px;
	align-items: center;
}

.footer-logo {
	height: 70px;
	width: auto;
}

.footer-contact {
	margin-left: 35px;
	display: flex;
	justify-content: flex-end;
	gap: 10px;
	flex-direction: column;
	
}

.footer-right {
	display: flex;
	align-items: flex-end;
	gap: 10px;
	flex-direction: column;
}

.footer-right-link {
	display: flex;
	justify-content: flex-end;
	gap: 10px;
	
}



.footer-right a {
	text-decoration: none;
	color: #333;
}

.footer-contact a:hover {
	text-decoration: underline;
}

.footer-contact a {
	text-decoration: none;
	color: #333;
}

.footer-right a:hover {
	text-decoration: underline;
}
</style>

<!-- Footer 시작 -->
<footer class="footer">
	<div class="footer-container">
		<hr class="footer-line">
		<div class="footer-content">
			<div class="footer-left">
				<img class="footer-logo" src="resources/image/logo.png"
					alt="StudyWithMe Logo">
				<div class="footer-contact">
					<a href="mailto:StudyWithMeForEgg4@gmail.com">Contact :
						StudyWithMeForEgg4@gmail.com</a>
					<p>Project team member: 정찬수, 조수빈, 황호선, 김지훈</p>
				</div>
			</div>
			<div class="footer-right">
				<div class="footer-right-link">
					<a href="#">개인정보 처리방침</a> <a href="#">회사소개</a> <a href="#">개인정보보호정책</a>
					<a href="#">이용약관</a>
				</div>
				<p>Copyrightⓒ 2023 All rights reserved StudyWithMe</p>
			</div>
		</div>
	</div>
</footer>
<!-- Footer 끝 -->
