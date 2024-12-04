<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2024-11-12
  Time: 오후 2:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <script src="/resources/js/orders/orderMovie.js"></script>
    <link rel="stylesheet" href="/resources/css/orders/orderMovie.css">
    <title>SY Movie - Order the Movie</title>
    <%--    <link rel="stylesheet"--%>
    <%--          href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />--%>
    <style>
        .hide {
            display: none;
        }
    </style>
</head>
<body>
<jsp:include page="../nav.jsp"></jsp:include>
<div class="container">
    <div class="order-movie-box">
        <div class="title-box">
            <h3 class="title">영화 주문하기</h3>
            <span class="sub-title">선택하신 영화와 함께하실 먹거리&서비스를 선택해주세요!</span>
        </div>
        <div class="order-select-box">
            <div class="order-info-box">
                <span class="order-info-text">주문내용</span>
            </div>
            <div class="form-container">
                <form id="order-form" method="post">
                    <div class="order-area">
                        <div class="movie-order-select">
                            <c:if test="${item.movie.movieImage != null}">
                                <c:if test="${item.movie.movieImage.movieImageUuid != 'mega'}">
                                    <img class="movie-image"
                                         src="/upload/${item.movie.movieImage.movieImageFilename}_
									${item.movie.movieImage.movieImageUuid}">
                                </c:if>
                                <c:if test="${item.movie.movieImage.movieImageUuid == 'mega'}">
                                    <img class="movie-image"
                                         src="${item.movie.movieImage.movieImageFilename}">
                                </c:if>
                            </c:if>
                            <c:if test="${item.movie.movieImage == null}">
                                <img class="movie-image" src="/resources/img/no-image.png">
                            </c:if>
                        </div>
                        <div class="movie-select">
                            <div>
                                <label class="movie-info-texts">영화제목 : ${item.movie.movieName}</label>
                            </div>
                            <div class="movie-amount-selector">
                                <label class="movie-info-texts">티켓 매수 : </label>
                                <input class="movie-amount-input" type="number" name="movieAmount"
                                       value="${item.orderDetail.movieAmount}">
                            </div>
                            <div>
                                <span class="movie-info-texts">티켓 1매 당 가격 : </span>
                                <span class="movie-price">${item.movie.moviePrice} 원</span>
                            </div>
                            <div>
                                <label class="movie-info-texts">상영시간 설정 : </label>
                                <input type="datetime-local" name="runTime" id="runtime-input">
                            </div>
                        </div>
                    </div>

                    <div class="food-select-box">
                        <div class="add-btn-box">
                            <button type="button" id="add-btn">먹거리 추가(적용)하기 +</button>
                        </div>
                        <div id="food-table-box" class="hide">
                            <div class="food-table-title-box">
                                <span class="food-table-title">먹거리 추가 내용</span>
                            </div>
                            <table id="food-table">
                                <thead class="thead-row">
                                <tr>
                                    <th>먹거리번호</th>
                                    <th>먹거리명</th>
                                    <th>단가</th>
                                    <th>개수설정</th>
                                    <th>먹거리당 총가격</th>
                                </tr>
                                </thead>
                                <tbody class="tbody-row">
                                <c:forEach var="item" items="${item.food}">
                                    <tr class="food-row">
                                        <td class="food-number">${item.foodNum}</td>
                                        <td>${item.foodName}
                                            <label>
                                                <input type="hidden" name="foodNum" value="${item.foodNum}" readonly>
                                            </label></td>
                                        <td class="food-price">${item.foodPrice}</td>
                                        <td><label>
                                            <input name="foodAmount" class="food-amount" type="number" value="1">
                                        </label></td>
                                        <td class="amount-sumPrice"></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div id="food-pickup-select" class="hide">
                            <div>
                                <span>먹거리 수령방식</span>
                            </div>
                            <div class="radio-group">
                                <div>
                                    <input id="pickup-check" class="pickupSelect" name="pickupSelect" type="radio" value="pickup" checked>
                                    <label>픽업하기</label>
                                </div>
                                <div>
                                    <input type="radio" class="pickupSelect" name="pickupSelect" value="setting" id="setting-check">
                                    <label>미리 세팅해놓기</label>
                                </div>
                            </div>
                            <div id="two-case">
                                <div id="pickup-date-select">
                                    <input type="hidden" name="pickupDate" id="pickupDate-input">
                                </div>
                                <div id="setting-info-text" class="hide">
                            <span>세팅을 선택하시면, 영화 상영시간 10분 전에 세팅해드립니다.<br>
                            (시간 변경 희망 시, 해당 영화관으로 문의해주십시오.)</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="food-price-box" class="hide">
                        <label>
                            <span id="foodFinalPrice"></span><span>원</span>
                        </label>
                    </div>
                    <label>
                        <input type="hidden" id="foodNumArr" name="foodList">
                    </label>
                    <label>
                        <input type="hidden" id="coupon-num" name="couponNum">
                    </label>
                    <div>
                        <button type="button" id="add-coupon">쿠폰 적용하기</button>
                        <span class="hide" id="coupon-name"></span>
                    </div>
                    <div class="final-price-box">
                        <label>
                            <span id="finalPrice"></span><span class="won-text">원</span>
                            <input id="all-sumPrice" type="hidden" name="sumPrice" readonly>
                        </label>
                    </div>
                    <div class="btn-group">
                        <button id="go-btn">주문하기</button>
                        <button type="button" onclick="location.href='/movie/detail/${item.movie.movieNum}'"
                                class="cancel-btn">취소
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
