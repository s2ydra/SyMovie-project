<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>
<script src="/resources/js/movie/add.js"></script>
<title>먹거리정보 수정하기 - 관리자페이지</title>
</head>
<body>
	<div>
		<div>
			<h3>먹거리정보 수정</h3>
		</div>
		<div>
			<form method="post">
				<div>
					<label>먹거리명</label>
					<input type="text" name="foodName" value="${item.foodName}">
				</div>
				<div>
					<label>먹거리유형</label>
					<input type="text" name="foodType" value="${item.foodType}">
				</div>
				<div>
					<label>가격</label>
					<input type="number" name="foodPrice" value="${item.foodPrice}">
				</div>
				<div>
					<label>먹거리소개</label>
					<textarea name="foodInfo" id="foodInfo">${item.foodInfo}</textarea>
				</div>
				<div>
					<button>수정완료</button>
					<button type="button" onclick="location.href='../list'">취소</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(() => {
			$("#foodInfo").summernote({
				lang: 'ko-KR',
				height:300,
			});
		});
	</script>
</body>
</html>