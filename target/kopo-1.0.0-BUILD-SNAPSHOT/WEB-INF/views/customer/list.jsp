<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EATCH - Customer List</title>
<script src="/resources/js/customer/list.js"></script>
<link rel="stylesheet" href="/resources/css/customer/list.css">
</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	<div class="container">
		<div class="middle">
			<div class="title-area">
				<h3>고객명단</h3>
			</div>
			<div class="search-form-box">
			<form class="search-form">
				<div>
					<select name="movieSearch" id="movie-search-box">
						<option value="1">이름</option>
						<option value="2">아이디</option>
						<option value="3">역할번호</option>
					</select>
				</div>

				<div><input type="text" name="movieKeyword" id="search-box"></div>
					<div><button id="search-btn">검색</button></div>
			</form>
			</div>

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
								<button type="button" onclick="location.href='update/${item.custNum}'" id="update-btn">변경</button>
								<button class="delete-btn" type="button" 
								data-custnum = "${item.custNum}" id="delete-btn">삭제</button>
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
			<button id="add-btn" type="button" onclick="location.href='add'">추가하기</button>
			<button id="back-btn" type="button" onclick="location.href='/'">이전으로</button>
		</div>
	</div>
</body>
</html>