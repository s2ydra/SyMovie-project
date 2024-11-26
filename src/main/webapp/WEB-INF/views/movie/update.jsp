<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SY Movie - 관리자페이지</title>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.css"
	rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/movie/update.css">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote-lite.min.js"></script>
</head>
<body>
<jsp:include page="../nav.jsp"></jsp:include>
	<div class="container">
		<div class="update-box">
		<div>
			<h3 class="update-title">영화정보수정</h3>
		</div>
		<div class="form-box">
			<form method="post" enctype="multipart/form-data">
				<div class="movie-name-box">
					<label class="movie-name-lable">영화제목</label>
					<input class="movie-name-input" type="text" name="movieName" value="${item.movieName}">
				</div>
				<div class="inputs">
				<div class="left-inputs">
					<div>
						<label>장르</label>
						<input class="movie-input" type="text" name="movieGenre" value="${item.movieGenre}">
					</div>
					<div>
						<label>개봉일자</label>
						<input class="movie-input" type="date" name="movieOpendate"
							   value="<fmt:formatDate value="${item.movieOpendate}" pattern="yyyy-MM-dd"/>">
					</div>
					<div>
						<label>제작국가</label>
						<input class="movie-input" type="text" name="movieCountry" value="${item.movieCountry}">
					</div>
				</div>
				<div class="right-inputs">
					<div>
						<label>감독</label>
						<input class="movie-input" type="text" name="movieDirector" value="${item.movieDirector}">
					</div>
					<div>
						<label>연령대</label>
						<input class="movie-input" type="text" name="movieAgerange" value="${item.movieAgerange}">
					</div>
					<div>
						<label>가격</label>
						<input class="movie-input" type="number" name="moviePrice" value="${item.moviePrice}">
					</div>
				</div>
				</div>
				<div>
					<label>영화소개</label>
					<textarea id="movieInfo" name="movieInfo">${item.movieInfo}</textarea>
				</div>
				<div class="file-input-box">
					<label>파일 선택</label>
					<input type="file" name="uploadFile">
				</div>
				<div class="btn-group">
					<button class="update-confirm">변경완료</button>
					<button class="cancel-btn" type="button" onclick="location.href='../list'">취소</button>
				</div>
			</form>
		</div>
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