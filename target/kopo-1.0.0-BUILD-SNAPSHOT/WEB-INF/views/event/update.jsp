<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>
<title>이벤트 수정 - 관리자 페이지</title>
</head>
<body>
	<div>
		<div>
			<h3>이벤트 수정하기</h3>
		</div>
		<div>
			<form method="post">
				<div>
					<label>이벤트제목</label>
					<input type="text" name="eventTitle" value="${item.eventTitle}">
				</div>
				<div>
					<label>이벤트 내용</label>
					<textarea id="eventInfo" name="eventInfo">${item.eventInfo}</textarea>
				</div>
				<div>
					<label>쿠폰이름</label>
					<input type="text" value="${item.coupon.couponName}">
				</div>
				<div>
					<label>할인율</label>
					<input type="number" value="${item.coupon.discountRate}">
				</div>
				<div>
					<button>수정완료</button>
					<button type="button" onclick="location.href='../list'">BACK</button>	
				</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
		$(() => {
			$("#eventInfo").summernote({
				lang: 'ko-KR',
				height:300,
			});
		});
	</script>
</body>
</html>