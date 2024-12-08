<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/nav.css">
<link rel="stylesheet" href="/resources/css/movie/detail.css">
<script src="/resources/js/movie/detail.js"></script>
<meta charset="UTF-8">
<title>EATCH - 영화 상세보기</title>
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
					<c:if test="${item.movieImage != null}">
						<c:if test="${item.movieImage.movieImageUuid != 'mega'}">
					<img class="detail-img"
						src="/upload/${item.movieImage.movieImageFilename}_${item.movieImage.movieImageUuid}">
						</c:if>
						<c:if test="${item.movieImage.movieImageUuid == 'mega'}">
							<img class="detail-img"
								 src="${item.movieImage.movieImageFilename}">
						</c:if>
					</c:if>
					<c:if test="${item.movieImage == null}">
						<img class="detail-img" src="/resources/img/no-image.png">
					</c:if>
				</div>

				<div class="include-btn">
					<div class="detail-text">
						<div class="movie-title-box">
							<span class="movie-title">영화제목 : ${item.movieName}</span>
						</div>

						<div class="detail-group-box">
							<div class="detail-group">
								<div>
									<span class="detail-titles">장르 : </span><span class="detail-datas">${item.movieGenre}</span>
								</div>
								<div>
									<span class="detail-titles">개봉일 :
									</span>
									<span class="detail-datas">
										<fmt:formatDate
												value="${item.movieOpendate}" pattern="yyyy년 MM월 dd일" />
									</span>
								</div>
								<div>
									<span class="detail-titles">제작국가 : </span><span class="detail-datas">${item.movieCountry}</span>
								</div>
							</div>

							<div class="detail-group">
								<div>
									<span class="detail-titles">감독 : </span><span class="detail-datas">${item.movieDirector}</span>
								</div>
								<div>
									<span class="detail-titles">연령대 : </span><span class="detail-datas">${item.movieAgerange}</span>
								</div>
								<div style="display:flex; gap:10px;">
									<span class="detail-titles">가격 :</span><span id="moviePrice" class="detail-datas">${item.moviePrice}</span><span class="detail-datas"> 원</span>
								</div>
							</div>
						</div>
						<div class="info-area">
							<span class="movie-info" id="info-title">영화소개 : </span><span class="movie-info">${item.movieInfo}</span>
						</div>
					</div>
					<div class="order-form">
						<form action="../../orders/orderMovie/${item.movieNum}" id="order-form">
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
								<button id="order-btn" class="action"
										 data-movienum ="${item.movieNum}" data-type="order"
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