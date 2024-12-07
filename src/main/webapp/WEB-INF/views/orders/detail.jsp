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
</head>
<body>
<div id="nav">
  <jsp:include page="../nav.jsp"></jsp:include>
</div>
  <div class="container">
    <div>
      <h3>주문상세내역</h3>
    </div>
    <div class="middle">
      <div class="title-area">
        <span>주문확인</span>
      </div>
      <div>
        <div class="movie-area">
          <div class="img-area">
            <c:if test="${item.movieImage.movieImageUuid == 'mega'}">
              <img src="${item.movieImage.movieImageFilename}">
            </c:if>
            <c:if test="${item.movieImage.movieImageUuid != 'mega'}">
              <img src="/upload/${item.movieImage.movieImageFilename}_${item.movieImage.movieImageUuid}">
            </c:if>
          </div>
          <div>
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
    </div>
  </div>
</body>
</html>
