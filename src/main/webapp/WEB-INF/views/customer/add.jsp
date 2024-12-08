<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EATCH 관리자페이지</title>
</head>
<body>
	<div>
		<div>
			<h3>고객 추가하기</h3>
		</div>
		<div>
			<form method="post">
				<div>
					<label>아이디</label>
					<input type="text" name="custId">
				</div>
				<div>
					<label>비밀번호</label>
					<input type="text" name="custPasswd">
				</div>
				<div>
					<label>이름</label>
					<input type="text" name="custName">
				</div>
				<div>
					<label>나이</label>
					<input type="number" name="custAge">
				</div>
				<div>
					<label>연락처</label>
					<input type="text" name="custPhone">
				</div>
				<div>
					<label>역할</label>
					<input type="number" name="custRole">
				</div>
				<div>
					<button>추가</button>
					<button type="button" onclick="location.href='list'">이전</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>