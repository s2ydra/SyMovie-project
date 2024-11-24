<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer List</title>
<script src="/resources/js/customer/list.js"></script>
<link rel="stylesheet" href="/resources/css/customer/list.css">
</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	<div class="container">	

		<div class="movie-info-box">
			<div class="text-group">
				<div class="text1-box">
					<span class="movie-info-text1">MOVIE</span>
				</div>
				<div class="text2-box">
					<img src="/resources/img/movie-info-line.jpg"> <span
						class="movie-info-text2">원하시는 영화를 골라주세요.<br>(총
						${pager.total.intValue()}개의 검색결과)
					</span>
				</div>
			</div>
		</div>

		<div class="middle">
			<div class="search-form-box">
			<form class="search-form">
				<div>
					<select name="movieSearch">
						<option value="1">영화번호</option>
						<option value="2">명화제목</option>
						<option value="3">장르</option>
						<option value="4">제작국가</option>
					</select>
				</div>

				<div><input type="text" name="movieKeyword"></div>
					<div><button id="search-btn">검색</button></div>
			</form>

			<table class="customer-table">
				<thead class="thead-row">
					<tr>
						<th>고객번호</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>고객명</th>
						<th>나이</th>
						<th>연락처</th>
						<th>역할</th>
						<th colspan="2">관리</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="9">검색된 고객이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.custNum}</td>
							<td>${item.custId}</td>
							<td>${item.custPasswd}</td>
							<td>${item.custName}</td>
							<td>${item.custAge}</td>
							<td>${item.custPhone}</td>
							<td>${item.custRole}</td>
							<td colspan="2">
								<button type="button" onclick="location.href='update/${item.custNum}'">변경</button>
								<button class="delete-btn" type="button" 
								data-custnum = "${item.custNum}">삭제</button>
							</td>
						</tr>
					</c:forEach>			
				</tbody>
			</table>
		</div>
		<div>
			<button type="button" onclick="location.href='add'">추가하기</button>
			<button type="button" onclick="location.href='/'">이전으로</button>
		</div>
	</div>
</body>
</html>