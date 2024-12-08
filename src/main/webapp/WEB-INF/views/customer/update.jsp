<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EATCH - 관리자페이지</title>
</head>
<body>
	<div>
		<div>
			<h3>고객정보변경</h3>
		</div>
		<div>
			<form method="post">
				<div>
					<label>아이디</label>
					<input type="text" name="custId" value="${item.custId}">
				</div>
				<div>
					<label>비밀번호</label>
					<input type="text" name="custPasswd" value="${item.custPasswd}">
				</div>
				<div>
					<label>이름</label>
					<input type="text" name="custName" value="${item.custName}">
				</div>
				<div>
					<label>나이</label>
					<input type="number" name="custAge" value="${item.custAge}">
				</div>
				<div>
					<label>연락처</label>
					<input type="text" name="custPhone" value="${item.custPhone}">
				</div>
				<div>
					<label>역할</label>
					<input type="number" name="custRole" value="${item.custRole}">
				</div>
				<div>
					<button>변경</button>
					<button type="button" onclick="location.href='../list'">이전</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>