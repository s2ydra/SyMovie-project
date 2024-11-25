<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2024-11-12
  Time: 오후 3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>SY Movie - 예매 현황</title>
</head>
<body>
  <div>
      <div>
        <h3>${sessionScope.member.custName}님의 예매현황</h3>
      </div>
      <div>
        <table border="1">
          <thead>
            <tr>
                <th>주문상세번호</th>
              <th>주문번호</th>
              <th>영화제목</th>
              <th>티켓매수</th>
              <th>총 금액</th>
              <th>주문일시</th>
                <th>임시</th>
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
                    <td><fmt:formatDate value="${item.orders.orderDate}" pattern="yyyy년 MM월 dd일"></fmt:formatDate></td>
                    <td>
                        ${item.orderDetail.foodOrderingNum}
                    </td>
                    <td>
                        <button type="button" id="cancel-btn">취소</button>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
      </div>
  </div>
</body>
</html>
