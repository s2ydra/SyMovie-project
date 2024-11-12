<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />
<link rel="stylesheet" href="/resources/css/login.css">
<script src="/resources/js/login.js"></script>
<title>SY Movie - Login</title>
</head>
<body>
	<main class="container">

		<div class="login-div">
			<div class="mainText-box">
				<p class="login-mainText">LOGIN</p>
			</div>
			<form id="login-form" method="post">
				<div class="id-text-box"><label>아이디</label></div>
				<div class="id-box-box"><input class="id-box" type="text" name="custId"
				placeholder="아이디를 입력하세요."></div>
				<div class="passwd-text-box"><label>비밀번호</label></div>
				<div class="passwd-box-box"><input class="passwd-box" type="password" name="custPasswd"
				placeholder="비밀번호를 입력하세요."></div>
				<div class="btn-group">
					<div><button class="login-btn"><span>LOGIN</span></button></div>
					<div><button type="button" class="back-btn" onclick="location.href='/'"><span>BACK</span></button></div>
				</div>
				<div class="signup-text-box">
					<span class="signup-text">회원이 아니신가요?</span>
				</div>
				<div class="signup-btn-box">
					<button type="button" class="signup-btn" onclick="location.href='signup'">SIGN-UP</button>
				</div>
			</form>
		</div>
			
	</main>
</body>
</html>