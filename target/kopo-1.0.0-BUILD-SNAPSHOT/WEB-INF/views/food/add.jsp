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
	<link rel="stylesheet" href="/resources/css/food/add.css">
<title>EATCH - 관리자페이지</title>
</head>
<body>
	<div id="nav">
		<jsp:include page="../nav.jsp"></jsp:include>
	</div>
	<div class="container">
	<div class="food-update-form-box">
		<div class="food-title-box">
			<h3 class="food-update-title">먹거리 추가하기</h3>
		</div>
			<form method="post" enctype="multipart/form-data">
				<div class="food-update-form">
				<div class="food-name-input">
					<label>먹거리명</label>
					<input type="text" name="foodName">
				</div>
					<div class="food-inputs">
				<div>
					<label>먹거리유형</label>
					<input type="text" name="foodType">
				</div>
				<div>
					<label>가격</label>
					<input type="number" name="foodPrice">
				</div>
					</div>
				<div>
					<label>먹거리소개</label>
					<textarea name="foodInfo" id="foodInfo"></textarea>
				</div>
				<div>
						<label>제품 이미지:</label>
						<button type="button" id="add_photo">추가</button>
					</div>
					<div>

						<ul id="list_photo">
							<li>
								<div>
									<input type="file" name="uploadFile" class="upload">
								</div>
							</li>
						</ul>
					</div>
				<div class="btn-group">
					<button class="confirm-btn">추가하기</button>
					<button class="cancel-btn" type="button" onclick="location.href='list'">취소</button>
				</div>
				</div>
			</form>
		</div>
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