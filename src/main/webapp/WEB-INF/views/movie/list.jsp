<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SY Movie - Movie List</title>

<script src="/resources/js/movie/list.js"></script>
<link rel="stylesheet" href="/resources/js/orders/orderMovie.js">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@4.0.1/reset.min.css" />

<link rel="stylesheet" href="/resources/css/movie/list.css">
<link rel="stylesheet" href="/resources/css/nav.css">
	<script src="/resources/js/movie/list.js"></script>
<script>
	let agerangeSort = false;
</script>
</head>
<body>
	<div id="nav">
	<jsp:include page="../nav.jsp"></jsp:include>
	</div>
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
		</div>
			<div class="genre-select-box">
				<span class="genre-select-text">장르별 모아보기</span>
			</div>
			<div class="genre-select-button-group">
				
			
				<div>
					<button class="genre-btn ${pager.movieKeyword == '액션' ? 'pushed' : ''}" type="button" 
					onclick="location.href='/movie/list?movieSearch=3&movieKeyword=액션'">
						<span class="genre-text">액션</span>
					</button>
				</div>
				
				<div>
					<button class="genre-btn ${pager.movieKeyword == '로맨스' ? 'pushed' : ''}" 
					onclick="location.href='/movie/list?movieSearch=3&movieKeyword=로맨스'">
						<span class="genre-text">로맨스</span>
					</button>
				</div>
				<div>
					<button class="genre-btn ${pager.movieKeyword == '멜로' ? 'pushed' : ''}" 
					onclick="location.href='/movie/list?movieSearch=3&movieKeyword=멜로'">
						<span class="genre-text">멜로</span>
					</button>
				</div>
				<div>
					<button class="genre-btn ${pager.movieKeyword == '판타지' ? 'pushed' : ''}" 
					onclick="location.href='/movie/list?movieSearch=3&movieKeyword=판타지'">
						<span class="genre-text">판타지</span>
					</button>
				</div>
				<div>
					<button class="genre-btn ${pager.movieKeyword == '공포' ? 'pushed' : ''}" 
					onclick="location.href='/movie/list?movieSearch=3&movieKeyword=공포'">
						<span class="genre-text">공포</span>
					</button>
				</div>
				<div>
					<button class="genre-btn ${pager.movieKeyword == '코미디' ? 'pushed' : ''}" 
					onclick="location.href='/movie/list?movieSearch=3&movieKeyword=코미디'">
						<span class="genre-text">코미디</span>
					</button>
				</div>
				<div>
					<button class="genre-btn ${pager.movieKeyword == '다큐멘터리' ? 'pushed' : ''}" 
					onclick="location.href='/movie/list?${pager.query}&movieSearch=3&movieKeyword=다큐멘터리'">
						<span class="genre-text">다큐멘터리</span>
					</button>
				</div>
			</div>
			
			
			<div class="movie-table-box">
				<table class="movie-table">
					<thead>
						<tr class="thead-row">
							<th>No.</th>
							<th>영화포스터</th>
							<th>영화제목</th>
							<th>장르</th>
							<th><a id="agerange-sort">연령대</a></th>
							<th>제작국가</th>
							<th>개봉일</th>
							<th>가격</th>
							<th colspan="2">MORE</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${list.size() < 1}">
							<tr class="tbody-row">
								<td colspan="9">검색된 영화가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="item" items="${list}">
							<tr class="tbody-row">
								<td>${item.movieNum}</td>
								<c:if test="${item.movieImage == null}">
									<td>
										No Image
									</td>
								</c:if>
								<c:if test="${item.movieImage != null}">
								<td>
									<img class="movie-image"
									src="/upload/${item.movieImage.movieImageFilename}_
									${item.movieImage.movieImageUuid}">
								</td>
								</c:if>
								<td><a href="detail/${item.movieNum}"
									style="color: black;">${item.movieName}</a></td>
								<td>${item.movieGenre}</td>
								<td>${item.movieAgerange}</td>
								<td>${item.movieCountry}</td>
								<td><fmt:formatDate value="${item.movieOpendate}"
										pattern="yyyy년 MM월 dd일" /></td>
								<td>${item.moviePrice} 원</td>
								<c:if test="${sessionScope.member.custRole == 99 }">
								<td colspan="2">
									<button type="button" class="action cart-btn" data-login = "${sessionScope.member != null}"
											data-type="cart" data-movienum ="${item.movieNum}" >장바구니</button>
										<button type="button" class="action order-btn" data-login = "${sessionScope.member != null}" data-type="order"
												data-movienum ="${item.movieNum}" id="order-btn">예매하기</button>
									<button type="button" class="update-btn"
										onclick="location.href='update/${item.movieNum}'">변경</button>
									<button class="delete-btn" type="button"
										data-movienum="${item.movieNum}">삭제</button>
								</td>
								</c:if>
								<c:if test="${sessionScope.member.custRole != 99 || sessionScope.member == null}">
								<td colspan="2">
									<button type="button" class="action cart-btn" id="cart-btn"
											data-movienum ="${item.movieNum}" data-type="cart" data-login = "${sessionScope.member != null}">장바구니</button>
										<button type="button" class="action order-btn" data-login = "${sessionScope.member != null}" data-type="order"
												data-movienum ="${item.movieNum}">예매하기</button>
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
			
		</div>
		<c:if test="${sessionScope.member.custRole == 99}">
		<div class="add-btn-box">
				<div class="add-btn-frame">
					<button type="button" onclick="location.href = 'dummy'">대량추가(페이지 테스트)</button>
					<button type="button" onclick="location.href = 'init'">대량삭제(페이지 테스트)</button>
					<button type="button" onclick="location.href='add'" class="add-btn">추가하기</button>
				</div>
			</div>
		</c:if>
		<c:if test="${sessionScope.member == null || sessionScope.member.custRole != 99}">
			<div class="cust-btn-group">
				<button class="back-btn" type="button" onclick="location.href='..'">이전으로</button>
			</div>
		</c:if>
	</div>
</body>
</html>