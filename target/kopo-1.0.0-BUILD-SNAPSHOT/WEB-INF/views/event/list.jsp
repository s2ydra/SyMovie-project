<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="/resources/css/event/list.css">
<title>SY Movie - Event List</title>
</head>
<body>
<div id="nav">
	<jsp:include page="../nav.jsp"></jsp:include>
</div>
	<div class="container">
		<div class="main-area">
		<div class="list-title">
			<h3>이벤트 목록</h3>
			<span>이벤트에 참여해 할인을 받아보세요!</span>
		</div>
		<div class="table-area">
			<table>
				<thead>
					<tr>
						<th>이벤트 번호</th>
						<th class="event-title-td">이벤트 제목</th>
						<th colspan="2">MORE</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${list.size() < 1}">
					<tr>
						<td colspan="4">검색된 이벤트가 없습니다.</td>
					</tr>
					</c:if>
					<c:forEach var="item" items="${list}">
					<tr>
						<td class="event-td">${item.eventNum}</td>
						<td class="event-td event-title-td">
							<a href="detail/${item.eventNum}" class="event-title">${item.eventTitle}</a>
						</td>
						<td colspan="2" class="event-td">
							<button type="button" class="update-btn" onclick="location.href='update/${item.eventNum}'">수정</button>
							<button type="button" class="delete-btn" onclick="location.href='delete/${item.eventNum}'">삭제</button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div>
			<button type="button" onclick="location.href='add'">추가하기</button>
			<button type="button" onclick="location.href='/'">처음으로</button>
		</div>
		</div>
	</div>
</body>
</html>