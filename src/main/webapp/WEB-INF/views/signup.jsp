<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/signup.js"></script>
	<link rel="stylesheet" href="/resources/css/signup.css">
<script>
	let id_check = false;
</script>
<title>SY Movie - SignUp</title>
</head>
<body>
<div id="nav">
	<jsp:include page="nav.jsp"></jsp:include>
</div>
	<div class="container">
		<div class="signup-box">
		<div class="signup-title-box">
			<h3>회원가입</h3>
		</div>
		<div>
			<form method="post" id="signup">
				<div class="inputs">
				<div class="id-input-box">
					<label>아이디</label>
					<div>
						<input type="text" name="custId" placeholder="사용하실 아이디를 입력하세요.">
						<button id="check_btn" type="button">중복체크</button>
					</div>
				</div>
				<div>
					<div>
					<label>비밀번호</label>
					</div>
					<input type="text" name="custPasswd" placeholder="사용하실 비밀번호를 입력하세요.">
				</div>
				<div>
					<div>
					<label>비밀번호 확인</label>
					</div>
					<input type="text" name="custPasswd_check" placeholder="비밀번호를 다시 입력하세요.">
				</div>
				<div>
					<div>
					<label>이름</label>
					</div>
					<input type="text" name="custName" placeholder="이름을 입력하세요.">
				</div>
				<div>
					<div>
					<label>나이</label>
					</div>
					<input type="number" name="custAge" placeholder="나이를 입력하세요.">
				</div>
				<div>
					<div>
					<label>연락처</label>
					</div>
					<input type="text" name="custPhone" placeholder="전화번호를 입력하세요.">
				</div>
				</div>
				<div class="btn-group">
					<button id="signup_btn">가입하기</button>
					<button id="cancel-btn" type="button" onclick="location.href='/'">취소</button>
				</div>
			</form>
		</div>
		</div>
	</div>
</body>
</html>