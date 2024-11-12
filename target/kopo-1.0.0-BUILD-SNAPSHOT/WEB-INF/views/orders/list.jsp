<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2024-11-12
  Time: 오후 3:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
              <th>주문번호</th>
              <th>영화번호</th>
              <th>티켓매수</th>
              <th>주문자</th>
              <th>세트메뉴 여부</th>
              <th>주문일시</th>
              <th colspan="2">MORE</th>
            </tr>
          </thead>
        </table>
      </div>
  </div>
</body>
</html>
