<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: super
  Date: 2024-12-07
  Time: 오후 6:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EATCH - 주문상세내용</title>
  <link rel="stylesheet" href="/resources/css/orders/detail.css">
</head>
<body>
<div id="nav">
  <jsp:include page="../nav.jsp"></jsp:include>
</div>
  <div class="container">
    <div class="middle">
      <div class="title-area">
         <h3>주문상세내역</h3>
        </div>
        <div class="movie-area">
          <div class="movie-info-area">
            <span>영화 상세</span>
          </div>
          <div class="movie-box">
            <div class="img-area">
               <c:if test="${item.movieImage.movieImageUuid == 'mega'}">
                <img src="${item.movieImage.movieImageFilename}">
                </c:if>
                <c:if test="${item.movieImage.movieImageUuid != 'mega'}">
                <img src="/upload/${item.movieImage.movieImageFilename}_${item.movieImage.movieImageUuid}">
                </c:if>
            </div>
            <div class="movie-order-info-area">
              <div>
                <span>선택하신 영화 : </span>
                <span>${item.movie.movieName}</span>
              </div>
            <div>
              <span>티켓 매수 : </span>
              <span>${item.orderDetail.movieAmount}</span>
            </div>
            <div>
              <span>티켓 당 가격 : </span>
              <span><fmt:formatNumber value="${item.movie.moviePrice}" pattern="###,###"></fmt:formatNumber> </span>
            </div>
            <div>
              <span>상영시간 : </span>
              <span><fmt:formatDate value="${item.orderDetail.runTime}" pattern="yyyy. MM. dd HH시 mm분"></fmt:formatDate></span>
            </div>
            </div>
          </div>
        </div>
      <div>
      <c:if test="${orderFoods.size() >= 1}">
       <div class="food-info-area">
          <span>먹거리 상세</span>
          </div>
          <div class="food-list">
          <c:forEach var="orderFood" items="${orderFoods}">
            <div class="food-info">
                <img src="/upload/${orderFood.foodList[0].foodImage[0].foodImageFilename}_${orderFood.foodList[0].foodImage[0].foodImageUuid}" alt="">
              <div class="food-info-group">
                <div>
                 <span>먹거리명 : </span>
                <span>${orderFood.foodList[0].foodName}</span>
                </div>
                <div>
                  <span>개당 가격 : </span>
                 <span><fmt:formatNumber value="${orderFood.foodList[0].foodPrice}" pattern="###,###"></fmt:formatNumber>  원</span>
                </div>
                <div>
                  <span>개수 : </span>
                  <span>${orderFood.amount}</span>
                </div>
             </div>
            </div>
          </c:forEach>
          <c:if test="${item.orderDetail.pickupDate != null}">
            <div class="pickup-date-area">
              <span>먹거리 픽업일시 : </span>
             <span><fmt:formatDate value="${item.orderDetail.pickupDate}" pattern="yyyy. MM. dd HH시 mm분"></fmt:formatDate> </span>
            </div>
          </c:if>
            </c:if>
        <c:if test="${orderFoods.size() < 1}">
          <div class="food-info-area">
            <span>먹거리 상세</span>
          </div>
          <div class="none-order-food">
            <span>먹거리 선택사항 없음.</span>
          </div>
        </c:if>
          </div>
        <div class="sum-price-area">
          <span class="sum-price-text">총액 : </span><span class="sum-price"><fmt:formatNumber value="${item.orderDetail.sumPrice}" pattern="###,###"></fmt:formatNumber> 원</span>
        </div>
      </div>
      </div>
  </div>
  <div class="btn-group">
    <button type="button" id="back-btn" onclick="location.href='../list'">뒤로가기</button>
  </div>
</body>
</html>
