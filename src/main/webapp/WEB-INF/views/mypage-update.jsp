<%--
  Created by IntelliJ IDEA.
  User: super
  Date: 2024-12-08
  Time: 오후 7:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EATCH - 내 정보 수정</title>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />
  <link rel="stylesheet" href="/resources/css/myPage-update.css">
</head>
<body>
<div id="nav">
  <jsp:include page="nav.jsp"></jsp:include>
</div>
<div class="container">
  <div class="middle">
    <div class="info-title">
      <span>내 정보 수정</span>
    </div>
    <form method="post">
    <div class="my-info">
      <div class="labels">
        <label>아이디 : </label>
        <label>비밀번호 : </label>
        <label>이름 : </label>
        <label>나이 : </label>
        <label>연락처 : </label>
      </div>
      <div class="inputs">
        <input type="text" value="${item.custId}" name="custId">
        <input type="text" value="${item.custPasswd}" name="custPasswd">
        <input type="text" name="custName" value="${item.custName}">
        <input type="number" value="${item.custAge}" name="custAge">
        <input type="text" name="custPhone" value="${item.custPhone}">
      </div>
    </div>
    <div class="btn-group">
      <button class="confirm-btn">수정완료</button>
      <button type="button" id="back-btn" onclick="location.href='mypage'">취소</button>
    </div>
    </form>
  </div>
</div>
</body>
</html>
