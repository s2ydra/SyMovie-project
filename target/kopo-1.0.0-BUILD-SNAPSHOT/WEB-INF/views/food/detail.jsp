<%--
  Created by IntelliJ IDEA.
  User: super
  Date: 2024-11-25
  Time: 오전 12:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>EATCH - 먹거리 상세보기</title>
    <link rel="stylesheet" href="/resources/css/food/detail.css">
    <script src="/resources/js/food/detail.js"></script>
</head>
<body>
<div id="nav">
    <jsp:include page="../nav.jsp"></jsp:include>
</div>
<div class="container">
    <div class="detail-box">
        <div class="food-detail-title-box">
            <h3>먹거리 상세보기</h3>
        </div>
        <div class="info-box">
            <div class="details">
                <div class="image-area">
                    <div class="main-image">
                        <img src="/upload/${item.foodImage[0].foodImageFilename}_${item.foodImage[0].foodImageUuid}"
                             style="max-width: 300px; max-height: 350px">
                    </div>
                </div>
                <div class="text-area">
                    <div class="food-name-box">
                        <span class="food-name-text">${item.foodName}</span>
                    </div>
                    <div class="food-info-box">
                        <div>
                            <span>유형 : ${item.foodType}</span>
                        </div>
                        <div>
                            <span>가격 : ${item.foodPrice} 원</span>
                        </div>
                    </div>
                    <div class="food-textArea">
                        <span>${item.foodInfo}</span>
                    </div>
                    <div class="btn-group">
                        <label><input type="number" id="food-amount" value="1"></label>
                        <button type="button" id="food-add-btn" data-foodnum="${item.foodNum}"
                        data-price="${item.foodPrice}">내 영화에 적용하기</button>
                        <button type="button" id="back-btn"
                        onclick="location.href='../list'">이전으로</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
