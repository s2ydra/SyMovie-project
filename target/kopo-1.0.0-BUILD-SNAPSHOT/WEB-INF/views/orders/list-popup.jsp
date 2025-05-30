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
    <link rel="stylesheet" href="/resources/css/orders/list-popup.css">
    <script>
        window.addEventListener("load", () => {
            let addBtn =  document.querySelectorAll(".add-food");

            addBtn.forEach(btn => {
                btn.addEventListener("click", e => {
                    const { ordersdetailnum } = e.target.dataset;

                    localStorage.setItem("ordersDetailNum", ordersdetailnum);

                    self.close();
                });
            })
        });
    </script>
    <title>EATCH - 예매 현황</title>
</head>
<body>
<div class="container">
    <div class="order-list-area">
        <div class="order-list-title-area">
            <h3>${sessionScope.member.custName}님의 예매현황</h3>
        </div>
        <div class="table-box">
            <table>
                <thead>
                <tr>
                    <th>주문상세번호</th>
                    <th>주문번호</th>
                    <th>영화제목</th>
                    <th>티켓매수</th>
                    <th>총 금액</th>
                    <th>주문일시</th>
                    <th>상영일시</th>
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
                    <tr>
                        <td>${item.orderDetail.ordersDetailNum}</td>
                        <td>${item.orders.orderNum}</td>
                        <td>${item.movie.movieName}</td>
                        <td>${item.orderDetail.movieAmount}</td>
                        <td>${item.orderDetail.sumPrice}</td>
                        <td><fmt:formatDate value="${item.orders.orderDate}"
                                            pattern="yyyy년 MM월 dd일"></fmt:formatDate></td>
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
                            <button type="button" class="add-food" data-ordersdetailnum = "${item.orderDetail.ordersDetailNum}">적용</button>
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
