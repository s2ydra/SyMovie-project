<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/nav.css">
<link rel="stylesheet" href="/resources/css/movie/detail.css">
<script src="/resources/js/movie/detail.js"></script>
<meta charset="UTF-8">
<title>영화 상세보기</title>
</head>
<body>
	<div id="nav">
	<jsp:include page="../nav.jsp"></jsp:include>
	</div>
	<div class="container">


		<div class="detail-box">
			<div class="title-box">
				<span class="title">영화 상세보기</span>
			</div>
			<div class="detail-data-box">
				<div class="img-box">
					<img class="detail-img"
						src="/upload/${item.movieImage.movieImageFilename}_
									${item.movieImage.movieImageUuid}">
				</div>

				<div class="include-btn">
					<div class="detail-text">
						<div class="movie-title-box">
							<span class="movie-title">영화제목 : ${item.movieName}</span>
						</div>

						<div class="detail-group-box">
							<div class="detail-group">
								<div>
									<span>장르 : ${item.movieGenre}</span>
								</div>
								<div>
									<span>개봉일 : <fmt:formatDate
											value="${item.movieOpendate}" pattern="yyyy년 MM월 dd일" />
									</span>
								</div>
								<div>
									<span>제작국가 : ${item.movieCountry}</span>
								</div>
							</div>

							<div class="detail-group">
								<div>
									<span>감독 : ${item.movieDirector}</span>
								</div>
								<div>
									<span>연령대 : ${item.movieAgerange}</span>
								</div>
								<div style="display:flex; gap:10px;">
									<span>가격 :</span><span id="moviePrice">${item.moviePrice}</span><span>원</span>
								</div>
							</div>
						</div>
						<div>
							<span class="movie-info">영화소개 : ${item.movieInfo}</span>
						</div>
					</div>
					<div class="order-form">
						<form action="../../orders/orderMovie/${item.movieNum}">
							<div class="amount-box">
								<div class="amount-number">
									<label>매수</label> <input type="number" name="movieAmount" value="1">
								</div>
								<div>
									<span class="amount-text">총액 :</span>
									<span id="sum-price">${item.moviePrice}</span><span class="amount-text">원</span>
								</div>
							</div>
							<div class="btn-form">
								<button id="reserve-btn"
										 data-movienum ="${item.movieNum}" data-type="buy"
								data-login = "${sessionScope.member != null}">예매하기</button>

								<button id="cart-btn" type="button" data-movienum ="${item.movieNum}" data-type="cart"
								class="action" data-login = "${sessionScope.member != null}">장바구니</button>
								<button id="back-btn" type="button"
									onclick="location.href='../list'">BACK</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>