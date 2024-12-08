<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="/resources/js/coupon/coupon.js"></script>
    <link rel="stylesheet" href="/resources/css/event/detail.css">
    <title>EATCH - 이벤트 상세보기</title>
</head>
<body>
<div id="nav">
    <jsp:include page="../nav.jsp"></jsp:include>
</div>
<div class="container">
    <div class="event-info-box">
        <div class="event-title-area">
            <h3>${items.eventTitle}</h3>
        </div>
        <div class="event-info-area">
            <h5>이벤트내용</h5>
            <div class="event-info-text-box">
                <span>${items.eventInfo}</span>
            </div>
            <div class="coupon-info-area">
                <h5>증정 쿠폰</h5>
                <div class="get-coupon-area">
                <span>${items.coupon.couponName}</span>
                <button type="button" class="coupon-btn" data-coupon="${items.coupon.couponNum}">받기</button>
                </div>
            </div>
            <div class="back-btn-area">
                <button type="button" onclick="location.href='../list'">목록으로</button>
            </div>
        </div>
        <div>

        </div>
    </div>
</div>
</body>
</html>