<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet"
		  href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />

	<link rel="stylesheet" href="/resources/css/movie/list.css">
	<link rel="stylesheet" href="/resources/css/nav.css">
	<script src="${pageContext.request.contextPath}/resources/js/movie/list.js"></script>
<title>SY Movie - Movie List</title>

<script>
	let agerangeSort = false;
</script>
</head>
<body>
	<div id="nav">
	<jsp:include page="../nav.jsp"></jsp:include>
	</div>
	<div class="container">
		<div class="movie-info-box">
			<div class="text-group">
				<div class="text1-box">
					<span class="movie-info-text1">MOVIE</span>
				</div>
				<div class="text2-box">
					<span
						class="movie-info-text2">원하시는 영화를 골라주세요.<br>(총
						${pager.total.intValue()}개의 검색결과)
					</span>
				</div>
			</div>
		</div>

		<div class="middle">
			<div class="search-form-box">
			<form class="search-form">
				<div>
					<select name="movieSearch" id="movie-search-box">
						<option value="1">영화번호</option>
						<option value="2">명화제목</option>
						<option value="3">장르</option>
						<option value="4">제작국가</option>
					</select>
				</div>

				<div><input type="text" name="movieKeyword" id="search-box"></div>
					<div><button id="search-btn">검색</button></div>
			</form>
		</div>
			<div class="genre-select-box">
				<span class="genre-select-text">연령별 모아보기</span>
			</div>
			<div class="genre-select-button-group">
				<div>
					<button class="genre-btn ${pager.movieKeyword == '전체관람가' ? 'pushed' : ''}"
							onclick="location.href='/movie/list?movieSearch=5&movieKeyword=전체관람가'">
						<span class="genre-text">전체관람가</span>
					</button>
				</div>
				<div>
					<button class="genre-btn ${pager.movieKeyword == '12세이상관람가' ? 'pushed' : ''}" type="button"
					onclick="location.href='/movie/list?movieSearch=5&movieKeyword=12세이상관람가'">
						<span class="genre-text">12세이상관람가</span>
					</button>
				</div>
				
				<div>
					<button class="genre-btn ${pager.movieKeyword == '15세이상관람가' ? 'pushed' : ''}"
					onclick="location.href='/movie/list?movieSearch=5&movieKeyword=15세이상관람가'">
						<span class="genre-text">15세이상관람가</span>
					</button>
				</div>

				<div>
					<button class="genre-btn ${pager.movieKeyword == '청소년관람불가' ? 'pushed' : ''}"
					onclick="location.href='/movie/list?movieSearch=5&movieKeyword=청소년관람불가'">
						<span class="genre-text">청소년관람불가</span>
					</button>
				</div>
			</div>

			<div class="recent-img-group-1">
				<c:forEach var="item" items="${list}">
					<div class="item-box">
					<div class="recent-img-box">
						<c:if test="${item.movieImage != null}">
							<c:if test="${item.movieImage.movieImageUuid != 'mega'}">
								<img class="recent-img"
									 src="/upload/${item.movieImage.movieImageFilename}_${item.movieImage.movieImageUuid}">
							</c:if>
							<c:if test="${item.movieImage.movieImageUuid == 'mega'}">
								<img class="recent-img"
									 src="${item.movieImage.movieImageFilename}">
							</c:if>
						</c:if>
						<c:if test="${item.movieImage == null}">
							<img class="recent-img" src="/resources/img/no-image.png">
						</c:if>
						<div class="img-animate" onclick="location.href='/movie/detail/${item.movieNum}'">
							<span class="animate-title">${item.movieName}</span>
							<span class="animate-text">${item.movieInfo}</span>
						</div>
					</div>
						<div class="text-area">
							<div class="title-area">
								<a class="title" href="/movie/detail/${item.movieNum}">${item.movieName}</a>
							</div>
							<div class="texts">
								<span>${item.movieAgerange}</span>
								<span><fmt:formatNumber value="${item.moviePrice}" pattern="##,###"></fmt:formatNumber> 원</span>
							</div>
							<div class="btns">
								<button class="action reserve-btn" data-login = "${sessionScope.member != null}" data-movienum ="${item.movieNum}"
										data-type="order" id="order-btn">예매하기</button>
								<button type="button" class="action cart-btn" id="cart-btn"
										data-movienum ="${item.movieNum}" data-type="cart" data-login = "${sessionScope.member != null}">장바구니</button>
								<c:if test="${sessionScope.member.custRole == 99}">
									<div class="admin-btns">
									<button type="button" onclick="location.href='update/${item.movieNum}'" class="update-btn">수정</button>
									<button type="button" class="delete-btn">삭제</button>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>





			<div class="pages">
				<div>
					<a href="?page=1${pager.query}">처음</a>
					
				</div>
				<c:forEach var="page" items="${pager.list}">
					<div>
						<a href="?page=${page}${pager.query}" class="pages-num ${pager.page == page? 'active':''}">${page}</a>
					</div>
				</c:forEach>
					<div>
						<a href="?page=${pager.last}${pager.query}">마지막</a>
					</div>
			</div>
			
		</div>
		<c:if test="${sessionScope.member.custRole == 99}">
		<div class="add-btn-box">
				<div class="add-btn-frame">
					<button id="megabox-btn">Top 20 영화 목록 추가</button>
					<button type="button" onclick="location.href='add'" class="add-btn">추가하기</button>
				</div>
			</div>
		</c:if>
		<c:if test="${sessionScope.member == null || sessionScope.member.custRole != 99}">
			<div class="cust-btn-group">
				<button class="back-btn" type="button" onclick="location.href='..'">이전으로</button>
			</div>
		</c:if>
	</div>
</body>
</html>