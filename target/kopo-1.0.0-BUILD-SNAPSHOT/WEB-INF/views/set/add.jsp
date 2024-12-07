<%--
  Created by IntelliJ IDEA.
  User: super
  Date: 2024-12-06
  Time: 오후 12:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EATCH - 세트메뉴 추가(관리자페이지)</title>
    <link rel="stylesheet" href="/resources/css/set/add.css">
    <script src="/resources/js/set/add.js"></script>
    <style>
        .hide{
            display: none;
        }
    </style>
</head>
<body>
<div id="nav">
    <jsp:include page="../nav.jsp"></jsp:include>
</div>
    <div class="container">
        <div class="add-form">
             <div class="title-area">
            <h3>Set Menu 추가</h3>
             </div>
            <div class="form-area">
            <form method="post">
                <div class="name-area">
                    <label class="labels">세트메뉴명 : </label>
                    <input type="text" name="setName" id="name-input">
                </div>
                <div class="movie-area">
                    <button type="button" id="movie-select">영화 선택</button>
                    <div id="selected-movie-table" class="hide">
                        <table>
                            <tbody>
                                <tr id="selected-movie-row">

                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <label class="movie-inputs">
                        <input type="hidden" name="movieNum" id="selected-movie">
                    </label>
                </div>
                <div class="food-area">
                    <button type="button" id="food-select">먹거리 선택</button>
                    <div id="selected-food-table" class="hide">
                        <table>
                            <tbody>
                            <tr id="selected-food-row">

                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <label>
                            <input type="hidden" name="foodNum" id="selected-food">
                        </label>
                    </div>
                </div>
                <div class="sum-area">
                    <label class="labels">합계 총액 : </label>
                    <input type="number" name="setPrice"> <span class="labels"> 원</span>
                </div>
                <div class="btn-group">
                    <button id="confirm-btn">추가하기</button>
                    <button type="button" id="back-btn" onclick="location.href='list'">취소</button>
                </div>
            </form>
        </div>
        </div>
    </div>
</body>
</html>
