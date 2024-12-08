<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2024-11-19
  Time: 오전 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script>
    window.addEventListener("load", () => {
      document.getElementById("pay-btn").addEventListener("click", e => {
        const final = document.getElementById("final").textContent;


            window.opener.payment(final);

            alert("결제 완료");
          self.close();
      });
      document.getElementById("cancel-btn").addEventListener("click", e=>{
          self.close();
      })
    });
  </script>
    <link rel="stylesheet" href="/resources/css/orders/order-popup.css">
    <title>EATCH - 결제창</title>
</head>
<body>
  <div class="container">
      <div class="pay-area">
      <div class="pay-title-area">
          <h3>결제하기</h3>
      </div>
      <div class="text-area">
        <span id="final"></span><span class="won">원 결제</span>
        <label><input class="final" type="hidden" readonly></label>
      </div>
      <div class="btn-group">
        <button id="pay-btn">결제하기</button>
          <button type="button" id="cancel-btn">취소</button>
      </div>
      </div>
  </div>
</body>
</html>
