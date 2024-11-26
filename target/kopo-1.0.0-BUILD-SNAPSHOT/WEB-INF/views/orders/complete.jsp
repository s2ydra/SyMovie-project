<%--
  Created by IntelliJ IDEA.
  User: super
  Date: 2024-11-26
  Time: 오전 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/orders/complete.css">
    <title>EATCH</title>
</head>
<body>
<div id="nav">
    <jsp:include page="../nav.jsp"></jsp:include>
</div>
    <div class="container">
        <div class="complete-box">
            <div class="img-area">
                <img id="complete-img" src="/resources/img/complete-icon.svg">
            </div>
            <div class="text-area">
                <span class="complete-text1">주문이 완료되었습니다!</span>
                <span class="complete-text2">상영시간 및 픽업/세팅 시간을 잘 확인하시고 서비스를 이용해보세요!</span>
            </div>
            <div class="btn-group">
                <button id="index-btn" type="button" onclick="location.href='../'">메인페이지로 이동하기</button>
                <button id="order-list-btn" type="button" onclick="location.href='list'">나의 예매현황 확인하기</button>
            </div>
        </div>
    </div>
</body>
</html>
