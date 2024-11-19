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
    });
  </script>
    <title>SY Movie - 결제창</title>
</head>
<body>
  <div>
      <div>
          <h3>결제하기</h3>
      </div>
      <div>
        <span id="final"></span><span>원 결제</span>
        <label><input class="final" type="number"></label>
      </div>
      <div>
        <button id="pay-btn">결제하기</button>
      </div>
  </div>
</body>
</html>
