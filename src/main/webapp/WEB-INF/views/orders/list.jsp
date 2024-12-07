<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2024-11-12
  Time: 오후 3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/orders/list.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />
    <script src="/resources/js/orders/list.js"></script>
    <title>EATCH - 예매 현황</title>
</head>
<body>
<div id="nav">
    <jsp:include page="../nav.jsp"></jsp:include>
</div>
<div class="container">
    <div class="order-list-area">
        <div class="order-list-title-area">
            <h3>${sessionScope.member.custName}님의 예매현황</h3>
        </div>
        <div class="table-box">
            <table>
                <thead>
                <tr class="thead-row">
                    <th>주문상세번호</th>
                    <th>영화제목</th>
                    <th>티켓매수</th>
                    <th>총 금액</th>
                    <th>주문일시</th>
                    <th>상영일시</th>
                    <th>먹거리 수령시간</th>
                    <th colspan="2">MORE</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${orderList.size() < 1}">
                    <tr>
                        <td colspan="8">주문하신 내역이 없습니다.</td>
                    </tr>
                </c:if>
                <c:forEach var="item" items="${ordersList}">
                    <tr class="item-row" onclick="location.href='detail/${item.orderDetail.ordersDetailNum}'">
                        <td>${item.orderDetail.ordersDetailNum}</td>
                        <td>${item.movie.movieName}</td>
                        <td>${item.orderDetail.movieAmount}</td>
                        <td><fmt:formatNumber value="${item.orderDetail.sumPrice}" pattern="##,###"></fmt:formatNumber> 원</td>
                        <td><fmt:formatDate value="${item.orders.orderDate}"
                                            pattern="yyyy년 MM월 dd일"></fmt:formatDate></td>
                        <td>
                            <fmt:formatDate value="${item.orderDetail.runTime}"
                                            pattern="yyyy.MM.dd
                                             HH시 mm분"></fmt:formatDate>
                        </td>
                        <td>
                        <c:if test="${item.orderDetail.foodOrderingNum != null && item.orderDetail.pickupDate != null}">
                            <fmt:formatDate value="${item.orderDetail.pickupDate}"
                                            pattern="yyyy.MM.dd HH시 mm분"></fmt:formatDate>
                        </c:if>
                        <c:if test="${item.orderDetail.foodOrderingNum == null && item.orderDetail.pickupDate == null}">
                                먹거리 주문 없음
                        </c:if>
                        <c:if test="${item.orderDetail.foodOrderingNum != null && item.orderDetail.pickupDate == null}">
                                먹거리 세팅 예정
                        </c:if>
                        </td>
                        <td>
                            <button type="button" class="cancel-btn" data-ordersdetailnum = "${item.orderDetail.ordersDetailNum}">취소</button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
