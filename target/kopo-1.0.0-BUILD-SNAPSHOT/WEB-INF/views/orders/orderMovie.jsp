<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2024-11-12
  Time: 오후 2:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>SY Movie - Order the Movie</title>
</head>
<body>
  <div>
      <div>
          <h3>영화 주문하기</h3>
      </div>
      <div>
        <div>
            <span>주문내용</span>
        </div>
        <div>
            <form method="post">
                <div>
                    <label>영화번호 : ${item.orderDetail.movieNum}</label>
                </div>
                <div>
                    <label>영화제목 : ${item.movie.movieName}</label>
                </div>
                <div>
                    <label>티켓 매수 : </label>
                    <input type="number" value="${item.orderDetail.movieAmount}">
                </div>
            </form>
        </div>
      </div>
  </div>
</body>
</html>
