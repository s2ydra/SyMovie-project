<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SY Movie</title>
	<script src="/resources/js/index.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />
<link rel="stylesheet" href="/resources/css/index.css">
<link rel="stylesheet" href="/resources/css/nav.css">
</head>
<body>
	<div>
		<jsp:include page="nav.jsp"></jsp:include>
		<div class="main-image">
			<div class="main-text">
				<p class="text-1">영화와 먹거리 주문을 한 번에!</p>
				<p class="text-2">영화를 보기 전,중,후 모두 당신이 주인공입니다.</p>
				<p class="text-3">미리 계획하신 시간을 저희가 특별한 시간으로 더해드리겠습니다.</p>
				<div class="btn-frame">
					<button type="button" class="btn-box"
						onclick="location.href='movie/list'">
						<span class="btn-text">영화 예매 하러가기</span> <span class="btn-simbol">></span>
					</button>
					<button type="button" class="mine-btn-box"
						onclick="location.href='/orders/list'">
						<span class="mine-btn-text">나의 예매현황</span> <span
							class="mine-btn-simbol">></span>
					</button>
				</div>
			</div>
			<div class="search-box">
				<div>
					<span class="search-info-text">원하시는 서비스를 빠르게 찾아보세요!</span>
				</div>
				<div class="search-form-box">
					<form class="movie-form" action="/movie/list?${pager.query}">

						<div>
							<div class="label-box">
								<label class="movie-search-text">찾으시는 영화 있으세요?</label>
							</div>
							<div class="input-group">
								<div>
									<select name="movieSearch" class="movie-select-box">
										<option value="1" autofocus="autofocus">영화번호</option>
										<option value="2">영화제목</option>
										<option value="3">장르</option>
										<option value="4">제작국가</option>
									</select>
								</div>
								<div>
									<input type="text" name="movieKeyword" class="movie-input-box">
								</div>
								<div>
									<button class="search-btn">검색</button>
								</div>
							</div>
						</div>
					</form>
					<form action="food/list">
						<div class="label-box">
							<label class="movie-search-text">먹거리 먼저 고르시겠어요?</label>
						</div>
						<div class="input-group">
							<div>
								<select name="MovieGenre" class="movie-select-box">
									<option value="1" autofocus="autofocus">먹거리명</option>
									<option value="2">유형</option>
								</select>
							</div>
							<div>
								<input type="text" name="foodQuery" class="movie-input-box">
							</div>
							<div>
								<button class="search-btn">검색</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="recent-list-box">
			<div class="recent-list-text-box">
				<p class="recent-list-text">최신 개봉 영화</p>
			</div>
			<div class="recent-img-group-1">
				<c:forEach var="item" items="${list}" begin="0" end="4">
					<div class="recent-img-box">
						<img class="recent-img"
							src="/upload/${item.movieImage.movieImageFilename}_${item.movieImage.movieImageUuid}">
						<div class="img-animate">
							<span>${item.movieName}</span>
							<button class="reserve-btn" data-login = "${sessionScope.member != null}" data-movienum ="${item.movieNum}">예매하기</button>
							<button type="button" class="detail-btn" 
							onclick="location.href='movie/detail/${item.movieNum}'">상세보기</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>