<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/cart/cart.js"></script>
	<link rel="stylesheet" href="/resources/css/cart.css">
<title>EATCH - 장바구니</title>
</head>
<body>
<div id="nav">
	<jsp:include page="nav.jsp"></jsp:include>
</div>
	<div class="container">
		<div class="cart-area">
			<div class="cart-title-area">
			<h3>${sessionScope.member.custName}님의 장바구니</h3>
			</div>
			<div class="table-area">
				<table>
				<thead>
					<tr>
						<th>영화번호</th>
						<th>영화 포스터</th>
						<th>영화제목</th>
						<th>티켓 가격</th>
						<th>수량</th>
						<th>총 금액</th>
						<th>MORE</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1 }">
						<tr>
							<td colspan="8">장바구니 담긴 영화가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="item" items="${list}">
						<c:set var="amount" value="${cart.cart.get(item.movieNum)}"></c:set>
						<c:if test="${amount >= 1}">
						<tr>
							<td>${item.movieNum}</td>
							<td>
								<c:if test="${item.movieImage.movieImageUuid != 'mega'}">
								<img style="width: 150px; height: 250px;" class="movie-image"
									src="/upload/${item.movieImage.movieImageFilename}_
									${item.movieImage.movieImageUuid}">
								</c:if>
								<c:if test="${item.movieImage.movieImageUuid == 'mega'}">
									<img style="width: 150px; height: 250px;" class="movie-image"
										 src="${item.movieImage.movieImageFilename}">
								</c:if>
							</td>
							<td>${item.movieName}</td>
							<td>${item.moviePrice}</td>
							<td>${amount}</td>
							<td>${item.moviePrice * amount}</td>
							<td>
								<button type="button" class="order-btn"
										onclick="location.href='orders/orderMovie/${item.movieNum}'">예매하기</button>
								<button type="button" class="delete-btn" data-movienum="${item.movieNum}"
								data-moviename="${item.movieName}">삭제하기</button>
							</td>
						</tr>
						</c:if>
					</c:forEach>
				</tbody>
					</table>
			</div>
		</div>
	</div>
</body>
</html>