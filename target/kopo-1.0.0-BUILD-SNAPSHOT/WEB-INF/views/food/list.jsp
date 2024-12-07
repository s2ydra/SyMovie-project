<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/food/list.js"></script>
<link rel="stylesheet" href="/resources/css/food/list.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />
</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	<div class="container">	

		<div class="movie-info-box">
			<div class="text-group">
				<div class="text1-box">
					<span class="movie-info-text1">Food</span>
				</div>
				<div class="text2-box">
					<span
						class="movie-info-text2">원하시는 먹거리를 골라주세요.<br>(총
						${pager.total.intValue()}개의 검색결과)
					</span>
				</div>
			</div>
		</div>

		<div class="middle">
			<div class="search-form-box">
			<form class="search-form">
				<div>
					<select name="foodSearch" id="movie-search-box">
						<option value="5">먹거리번호</option>
						<option value="6">먹거리명</option>
						<option value="7">먹거리유형</option>
					</select>
				</div>

				<div><input type="text" name="foodKeyword" id="search-box"></div>
					<div><button id="search-btn">검색</button></div>
			</form>
		</div>
			<div class="genre-select-box">
				<span class="genre-select-text">유형별 모아보기</span>
			</div>
			<div class="genre-select-button-group">
				
			
				<div>
					<button class="type-btn ${pager.foodKeyword == '팝콘' ? 'pushed' : ''}" type="button" 
					onclick="location.href='/food/list?foodSearch=7&foodKeyword=팝콘'">
						<span class="genre-text">팝콘</span>
					</button>
				</div>
				
				<div>
					<button class="type-btn ${pager.foodKeyword == '간식류' ? 'pushed' : ''}" 
					onclick="location.href='/food/list?foodSearch=7&foodKeyword=간식류'">
						<span class="genre-text">간식류</span>
					</button>
				</div>
				<div>
					<button class="type-btn ${pager.foodKeyword == '카페음료' ? 'pushed' : ''}" type="button" 
					onclick="location.href='/food/list?foodSearch=7&foodKeyword=카페음료'">
						<span class="genre-text">카페음료</span>
					</button>
				</div>
				<div>
					<button class="type-btn ${pager.foodKeyword == '탄산음료' ? 'pushed' : ''}" type="button" 
					onclick="location.href='/food/list?foodSearch=7&foodKeyword=탄산음료'">
						<span class="genre-text">탄산음료</span>
					</button>
				</div>
				<div>
					<button class="type-btn ${pager.foodKeyword == '간단메뉴' ? 'pushed' : ''}" type="button" 
					onclick="location.href='/food/list?foodSearch=7&foodKeyword=간단메뉴'">
						<span class="genre-text">간단메뉴</span>
					</button>
				</div>
			</div>
			<table class="food-table">
				<thead class="thead-row">
					<tr>
						<th>No.</th>
						<th>사진</th>
						<th>먹거리명</th>
						<th>먹거리 유형</th>
						<th>가격</th>
						<c:if test="${sessionScope.member != null || sessionScope.member.custRole == 99}">
						<th colspan="2">MORE</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1 }">
					<tr>
						<td colspan="6">검색된 먹거리가 없습니다.</td>
					</tr>
					</c:if>
					<c:forEach var="item" items="${list}">
						<tr>
							<td class="food-td">${item.foodNum}</td>
							<td>
							<img style="width: 150px; height:180px;"
							src="/upload/${item.foodImage[0].foodImageFilename}_${item.foodImage[0].foodImageUuid}">
							</td>
							<td class="food-td"><a href="detail/${item.foodNum}">${item.foodName}</a></td>
							<td class="food-td">${item.foodType}</td>
							<td class="food-td">${item.foodPrice}</td>
							<c:if test="${sessionScope.member != null || sessionScope.member.custRole == 99}">
							<td class="food-td">
								<button type="button" class="update-btn" onclick="location.href='update/${item.foodNum}'">수정</button>
								<button class="delete-btn" data-foodnum = "${item.foodNum}" onclick="location.href='delete/${item.foodNum}">삭제</button>
							</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="pages">
			<div>
				<a href="?page=1${pager.query}">처음</a>

			</div>
			<c:forEach var="page" items="${pager.list}">
				<div>
					<a href="?page=${page}${pager.query}" class="pages-num ${pager.page == page? 'active':''}">${page}</a>
				</div>
			</c:forEach>
			<div>
				<a href="?page=${pager.last}${pager.query}">마지막</a>
			</div>
		</div>
		<c:if test="${sessionScope.member.custRole == 99}">
		<div class="btn-group">
			<button class="add-btn" type="button" onclick="location.href='add'">추가하기</button>
			<button class="back-btn" type="button" onclick="location.href='/'">이전으로</button>
		</div>
		</c:if>
		<c:if test="${sessionScope.member == null || sessionScope.member.custRole != 99}">
		<div class="btn-group">
			<button class="back-btn" type="button" onclick="location.href='/'">이전으로</button>
		</div>
		</c:if>
	</div>
</body>
</html>