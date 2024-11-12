<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/signup.js"></script>
<script>
	let id_check = false;
</script>
<title>SY Movie - SignUp</title>
</head>
<body>
	<div>
		<div>
			<h3>회원가입</h3>
		</div>
		<div>
			<form method="post" id="signup">
				<div>
					<label>아이디</label>
					<input type="text" name="custId" placeholder="사용하실 아이디를 입력하세요.">
					<button id="check_btn" type="button">중복체크</button>
				</div>
				<div>
					<label>비밀번호</label>
					<input type="text" name="custPasswd" placeholder="사용하실 비밀번호를 입력하세요.">
				</div>
				<div>
					<label>비밀번호 확인</label>
					<input type="text" name="custPasswd_check" placeholder="비밀번호를 다시 입력하세요.">
				</div>
				<div>
					<label>이름</label>
					<input type="text" name="custName" placeholder="이름을 입력하세요.">
				</div>
				<div>
					<label>나이</label>
					<input type="number" name="custAge" placeholder="나이를 입력하세요.">
				</div>
				<div>
					<label>연락처</label>
					<input type="text" name="custPhone" placeholder="전화번호를 입력하세요.">
				</div>
				<div>
					<button id="signup_btn">가입하기</button>
					<button type="button" onclick="location.href='/'">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>