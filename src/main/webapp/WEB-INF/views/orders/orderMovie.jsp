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
    <script src="/resources/js/orders/orderMovie.js"></script>
    <title>SY Movie - Order the Movie</title>
    <style>
        .hide{
            display: none;
        }
    </style>
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
                    <label>영화번호 : ${item.movie.movieNum}</label>
                </div>
                <div>
                    <img style="max-width: 250px; max-height: 280px;"
                            src="/upload/${item.movie.movieImage.movieImageFilename}_
									${item.movie.movieImage.movieImageUuid}" </div>
                <div>
                    <label>영화제목 : ${item.movie.movieName}</label>
                </div>
                <div>
                    <label>티켓 매수 : </label>
                    <input type="number" value="${item.orderDetail.movieAmount}">
                </div>
                <div>
                    <button type="button" id="add-btn">먹거리 추가(적용)하기</button>
                </div>
               <div class="food-number">
                    <input type="text" id="checked-num">
               </div>
                <div>
                    <button>주문하기</button>
                    <button type="button" onclick="location.href'detail/${item.movie.movieNum}'">취소</button>
                </div>
            </form>
        </div>
      </div>
  </div>
</body>
</html>
