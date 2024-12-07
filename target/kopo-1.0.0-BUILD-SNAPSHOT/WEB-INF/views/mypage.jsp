<%--
  Created by IntelliJ IDEA.
  User: super
  Date: 2024-12-06
  Time: 오후 7:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EATCH - 마이페이지</title>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />
  <link rel="stylesheet" href="/resources/css/myPage.css">
</head>
<body>
<div id="nav">
  <jsp:include page="nav.jsp"></jsp:include>
</div>
  <div class="container">
    <div class="middle">
        <div class="title">
            <h3>${sessionScope.member.custName} 님, 환영합니다!</h3>
            <span>EATCH는 어제도, 오늘도, 내일도 항상 당신과 함께입니다.</span>
        </div>
        <div class="info-title">
        <span>내 정보</span>
        </div>
        <div class="my-info">
            <span>아이디 : ${item.custId}</span>
            <span>이름 : ${item.custName}</span>
            <span>나이 : ${item.custAge}</span>
            <span>연락처 : ${item.custPhone}</span>

        </div>
      <div class="btn-group">
        <button type="button" id="update-btn">내 정보 수정</button>
        <button type="button" id="account-cancel-btn">회원 탈퇴</button>
      </div>
    </div>
  </div>
</body>
</html>
