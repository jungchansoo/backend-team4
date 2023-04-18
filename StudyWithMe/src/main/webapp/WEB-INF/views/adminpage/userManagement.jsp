<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form id='searchForm' action="" method='get'>
		<button class='btn btn-default'>Search</button>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>권한</th>
					<th>아이디</th>
					<th>이름</th>
					<th>이메일</th>
					<th>전화번호</th>
					<th>스터디석 잔여시간</th>
					<th>스터디룸 잔여시간</th>
					<th>사물함 잔여시간</th>
					<th></th>
				</tr>
			</thead>

			<tbody>
				<!-- db에 있는 정보를 리스트로 불러오게 수정 -->
				<tr>
					<td>user_no</td>
					<td>role</td>
					<td>user_id</td>
					<td>username</td>
					<td>email</td>
					<td>phone_number</td>
					<td>REMAINING_SEAT_TIME</td>
					<td>REMAINING_STUDY_ROOM_TIME</td>
					<td>REMAINING_LOCKER_TIME</td>
					<td><button onclick="deleteUser('<%=%>')">삭제</button></td>
				</tr>
			</tbody>
		</table>
	</form>

	<script>
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		});
	</script>


</body>
</html>