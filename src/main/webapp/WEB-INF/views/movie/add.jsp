<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EATCH - 영화 추가</title>
<link rel="stylesheet" href="/resources/css/nav.css">
<link rel="stylesheet" href="/resources/css/movie/add.css">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>
<script src="/resources/js/movie/add.js"></script>
</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	<div class="container">
		<div class="add-title-frame">
			<span class="add-title">영화 추가하기</span>
		</div>
		<div class="add-box">

			<div>
				<form method="post" id="add-box" enctype="multipart/form-data">
					<div class="movieName-frame">
						<label class="movieName-text">영화제목 :</label> <input type="text"
							name="movieName" class="movieName-input">
					</div>
					<div class="input-group">
						<div>
							<label class="movie-text">장르 :</label> <input type="text"
								name="movieGenre" class="movie-input">
						</div>
						<div>
							<label class="movie-text">감독 :</label> <input type="text"
								name="movieDirector" class="movie-input">
						</div>
					</div>
					<div class="input-group">
						<div>
							<label class="movie-text">개봉일 :</label> <input type="date"
								name="movieOpendate" class="movie-input">
						</div>
						<div>
							<label class="movie-text">연령대 :</label> <input type="text"
								name="movieAgerange" class="movie-input">
						</div>
					</div>
					<div class="input-group">
						<div>
							<label class="movie-text">제작국가 :</label> <input type="text"
								name="movieCountry" class="movie-input">
						</div>
						<div>
							<label class="movie-text">가격 :</label> <input type="number"
								name="moviePrice" class="movie-input">
						</div>
					</div>
					<div class="movieInfo-group">
						<label>영화소개</label>
						<textarea id="movieInfo" name="movieInfo"></textarea>
					</div>
					<div class="upload-group">
						<label>사진첨부</label>
						<input type="file" name="uploadFile">
					</div>
					<div class="btn-group">
						<button type="button" class="add-btn">추가</button>
						<button type="button" onclick="location.href='list'" class="back-btn">이전</button>
					</div>
				</form>
			</div>
		</div>
		<div class="empty-box">
		
		
		
		
		</div>
	</div>
	
	<script type="text/javascript">
		$(() => {
			$("#movieInfo").summernote({
				lang: 'ko-KR',
				height:300,
			});
		});
	</script>
</body>
</html>