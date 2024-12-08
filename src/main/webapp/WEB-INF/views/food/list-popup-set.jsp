<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EATCH</title>
<script src="/resources/js/orders/orderMovie.js"></script>
	<script>
		window.addEventListener("load", () => {
			const selectBtn = document.querySelectorAll(".select-btn");

			selectBtn.forEach(btn =>{
				btn.addEventListener("click", e =>{
					const { foodnum } = e.target.dataset;

					localStorage.setItem("foodNum", foodnum);

					self.close();
				});
			})
		});
	</script>
<link rel="stylesheet" href="/resources/css/food/list-popup-set.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />
</head>
<body>
	<div class="container">
		<div class="movie-info-box">
			<div class="text-group">
				<div class="text1-box">
					<span class="movie-info-text1">Food</span>
				</div>
				<div class="text2-box">
					<img src="/resources/img/movie-info-line.jpg"> <span
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
					<select name="foodSearch">
						<option value="5">먹거리번호</option>
						<option value="6">먹거리명</option>
						<option value="7">먹거리유형</option>
					</select>
				</div>

				<div><input type="text" name="foodKeyword"></div>
					<div><button id="search-btn">검색</button></div>
			</form>
		</div>
			<div class="genre-select-box">
				<span class="genre-select-text">장르별 모아보기</span>
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
						<th colspan="2">MORE</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1 }">
					<tr>
						<td colspan="6">검색된 먹거리가 없습니다.</td>
					</tr>
					</c:if>
					<c:forEach var="item" items="${list}">
						<tr class="item-row">
							<td>${item.foodNum}</td>
							<td>
							<img style="width: 150px; height:180px;"
							src="/upload/${item.foodImage[0].foodImageFilename}_${item.foodImage[0].foodImageUuid}">
							</td>
							<td>${item.foodName}</td>
							<td>${item.foodType}</td>
							<td>${item.foodPrice}</td>
							<td>
								<button type="button" class="select-btn" data-foodnum="${item.foodNum}"}>추가하기</button>
							</td>
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
		<div class="btn-group">
			<button type="button" id="add-btn" class="popup-apply-btn">적용</button>
			<button type="button" id="close-btn" class="popup-cancel-btn">취소</button>
		</div>

	</div>
</body>
</html>