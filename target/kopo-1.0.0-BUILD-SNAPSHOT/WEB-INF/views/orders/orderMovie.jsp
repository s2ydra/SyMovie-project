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
                    <label>영화번호 : <span id="movie-num">${item.movie.movieNum}</span></label>
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
                    <input type="number" name="movieAmount" value="${item.orderDetail.movieAmount}">
                </div>
                <div>
                    <span>티켓 1매 당 가격 : </span>
                    <span class="movie-price">${item.movie.moviePrice}</span>
                </div>
                <div>
                    <button type="button" id="add-btn">먹거리 추가(적용)하기</button>
                </div>
               <div id= "food-table-box" class="hide">
                    <table border="1" id="food-table">
                        <thead>
                        <tr>
                            <th>먹거리번호</th>
                            <th>먹거리명</th>
                            <th>단가</th>
                            <th>개수설정</th>
                            <th>먹거리당 총가격</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${item.food}">
                            <tr class="food-row">
                                <td class="food-number">${item.foodNum}</td>
                                <td>${item.foodName}
                                <label>
                                    <input type="hidden" name="foodNum" value="${item.foodNum}" readonly>
                                </label></td>
                                <td class="food-price">${item.foodPrice}</td>
                                <td><label>
                                    <input class="food-amount" type="number" value="1">
                                </label></td>
                                <td class="amount-sumPrice"></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
               </div>
                <div id="food-price-box" class="hide">
                    <label>
                        <span id="foodFinalPrice"></span><span>원</span>
                    </label>
                </div>
                <div>
                    <label>
                        <span id="finalPrice"></span><span>원</span>

                        <input id="finalFoodPrice" type="number" name="foodNum">
                        <input id="all-sumPrice" type="number" name="sumPrice" readonly>
                        <input type="text" id="foodNumArr">


                    </label>
                </div>
                <div>
                    <button id="go-btn">주문하기</button>
                    <button type="button" onclick="location.href='/movie/detail/${item.movie.movieNum}'">취소</button>
                </div>
            </form>
        </div>
      </div>
  </div>
</body>
</html>
