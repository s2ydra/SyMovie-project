<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/coupon/coupon.js"></script>
<title>이벤트 상세보기</title>
</head>
<body>
	<div>
		<div>
			<h3>${items.eventTitle}</h3>
		</div>
		<div>
			<h5>이벤트내용</h5>
			<span>${items.eventInfo}</span>
			
			<h5>증정 쿠폰</h5>
			<span>${items.coupon.couponName}</span>
			
			<h5>할인율</h5>
			<span>${items.coupon.discountRate} %</span>
		</div>
		<div>
			<button type="button" class="coupon-btn" data-coupon="${items.coupon.couponNum}">받기</button>
		</div>
	</div>
</body>
</html>