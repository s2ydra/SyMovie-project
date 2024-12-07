<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>

<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="/resources/css/nav.css">
</head>


<header class="head-tap">
			<h3><a href="/">
				<img style="width: 100px; height: 70px" src="/resources/img/logo.svg">
			</a></h3>
			<nav>
				<ul class="global-menu">
					<li><a href="/movie/list">영화</a></li>
					<li><a href="/food/list">먹거리</a></li>
					<li><a href="/set/list">세트상품</a></li>
					<li><a href="/event/list">이벤트</a></li>
					<li><a href="/movieTest">공지사항</a></li>
				</ul>
			</nav>
			<div class="utility-menu">
			<c:if test="${sessionScope.member == null}">
				<a href="/login">Login</a>
				<a href="/signup">Sign-up</a>
				</c:if>
				<c:if test="${sessionScope.member != null}">
				<div class="dropdown">
				<a class="dropbtn">${sessionScope.member.custName} 님</a>
				<div class="dropdown-content">
					<a href="/mypage">내정보</a>
					<a href="/coupon/list">내 보유쿠폰</a>
					<a href="/cart">장바구니</a>
					<a href="/orders/list">나의 예매 현황</a>
					<c:if test="${sessionScope.member.custRole == 99}">
						<a href="/customer/list">고객관리</a>
					</c:if>
				</div>
				</div>
				<a href="/logout">LOGOUT</a>
				</c:if>
			</div>
		</header>