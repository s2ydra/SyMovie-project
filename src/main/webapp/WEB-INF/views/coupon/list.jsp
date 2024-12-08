<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/coupon/list.css">
    <title>EATCH - My Coupon</title>
</head>
<body>
<div id="nav">
    <jsp:include page="../nav.jsp"></jsp:include>
</div>
<div class="container">
    <div class="coupon-list-area">
        <div class="coupon-title-area">
            <h3>${sessionScope.member.custName}님의 보유 쿠폰</h3>
            <c:if test="${list.size() > 0}">
            <span>${list.size()}개의 티켓을 보유 중입니다.</span>
            </c:if>
        </div>
        <div>
            <table>
                <thead>
                <tr>
                    <th>쿠폰번호</th>
                    <th>쿠폰이름</th>
                    <th>할인율</th>
                    <th>사용기한</th>
                    <th>참여이벤트번호</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${list.size() < 1}">
                    <tr>
                        <td colspan="5">보유하신 쿠폰이 없습니다.</td>
                    </tr>
                </c:if>
                <c:forEach var="item" items="${list}">
                    <tr>
                        <td>${item.couponNum}</td>
                        <td>${item.couponName}</td>
                        <td>${item.discountRate}%</td>
                        <td><fmt:formatDate value="${item.couponCustomer[0].expireDate}" pattern="yyyy년 MM월 dd일"
                        ></fmt:formatDate>까지
                        </td>
                        <td>${item.eventNum}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>