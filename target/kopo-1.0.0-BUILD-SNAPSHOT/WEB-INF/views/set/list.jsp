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

	<link rel="stylesheet" href="/resources/css/set/list.css">
	<link rel="stylesheet" href="/resources/css/nav.css">
	<script src="${pageContext.request.contextPath}/resources/js/movie/list.js"></script>
<title>EATCH - Set Menu</title>
</head>
<body>
	<div id="nav">
	<jsp:include page="../nav.jsp"></jsp:include>
	</div>
	<div class="container">
		<div class="set-info-box">
			<div class="text-group">
				<div class="text1-box">
					<span class="movie-info-text1">Set Menu</span>
				</div>
				<div class="text2-box">
					<span class="movie-info-text2">세트 메뉴로 좀 더 간편하게 이용해보세요!<br>(총
						${pager.total.intValue()}개의 검색결과)
					</span>
				</div>
			</div>
		</div>

		<div class="middle">
			<div class="search-form-box">
			<form class="search-form">
				<div>
					<select name="setSearch" id="movie-search-box">
						<option value="1">세트이름</option>
						<option value="2">영화제목</option>
						<option value="3">먹거리이름</option>
					</select>
				</div>

				<div><input type="text" name="movieKeyword" id="search-box"></div>
					<div><button id="search-btn">검색</button></div>
			</form>
		</div>
			<c:if test="${list.size() < 1}">
				<div class="none-menu">
					<span>검색된 메뉴가 없습니다.</span>
				</div>
			</c:if>


			<div class="recent-img-group-1">
				<c:forEach var="item" items="${list}">
					<div class="item-box">
					<div class="recent-img-box">
						<div class="set-img-area">
							<div class="movie-img-box">
						<c:if test="${item.movie.movieImage != null}">
							<c:if test="${item.movie.movieImage.movieImageUuid != 'mega'}">
								<img class="recent-img-box"
									 src="/upload/${item.movie.movieImage.movieImageFilename}_${item.movie.movieImage.movieImageUuid}">
							</c:if>
							<c:if test="${item.movie.movieImage.movieImageUuid == 'mega'}">
								<img class="recent-img"
									 src="${item.movie.movieImage.movieImageFilename}">
							</c:if>
						</c:if>
						<c:if test="${item.movie.movieImage == null}">
							<img class="recent-img" src="/resources/img/no-image.png">
						</c:if>
							</div>
							<div class="food-img-box">
								<img class="food-img" src="/upload/${item.food[0].foodImage[0].foodImageFilename}_${item.food[0].foodImage[0].foodImageUuid}" alt="">
							</div>
						</div>
						<div class="img-animate" onclick="location.href='/set/detail/${item.setNum}'">
							<span class="animate-title">${item.setName}</span>
							<span class="animate-text">${item.movie.movieName}(${item.movieAmount} 매) + ${item.food[0].foodName}(${item.foodAmount} 개)</span>
						</div>
					</div>
						<div class="text-area">
							<div class="title-area">
								<a class="title" href="/set/detail/${item.setNum}">${item.setName}</a>
							</div>
							<div class="texts">
								<span><fmt:formatNumber value="${item.setPrice}" pattern="##,###"></fmt:formatNumber> 원</span>
							</div>
							<div class="btns">
								<button class="action reserve-btn" data-login = "${sessionScope.member != null}" data-movienum ="${item.movie.movieNum}"
										data-type="order" id="order-btn">예매하기</button>
								<button type="button" class="action cart-btn" id="cart-btn"
										data-movienum ="${item.movie.movieNum}" data-type="cart" data-login = "${sessionScope.member != null}">장바구니</button>
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
					<button type="button" onclick="location.href='add'" class="add-btn">추가하기</button>
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