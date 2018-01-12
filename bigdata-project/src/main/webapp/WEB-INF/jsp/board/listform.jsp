<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/assets/css/main.css" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/assets/css/board.css" />
<!-- Favicon and touch icons -->
<link rel="icon"
	href="${pageContext.servletContext.contextPath}/resources/ico/home_iot.png">
<style>
@media screen and (max-width: 1280px) {
	.wrapper>.inner {
		width: 70em;
	}
}
</style>
</head>
<body class="subpage">

	<!-- Header -->
	<header id="header">
	<div class="logo">
		<a href="index.html">Donny <span>by TEMPLATED</span></a>
	</div>
	<a href="#menu">Menu</a> </header>

	<!-- Nav -->
	<nav id="menu">
	<ul class="links">
		<li><a href="index.html">메인</a></li>
		<li><a href="loginmain.html">로그인</a></li>
		<li><a href="mypage.html">마이페이지</a></li>
		<li><a href="store_management.html">매장관리</a></li>
		<li><a href="elements.html">빅데이터</a></li>
		<li><a href="noticeboard.html">게시판</a></li>
		<li><a href="index_admin.html">Admin Only</a></li>
	</ul>
	</nav>

	<!-- Main body -->
	<div clsss="container">
		<section class="wrapper">
		<div class="inner">
			<header class="align-center">
			<h1>게시판</h1>
			<p>여기는 모두가 사용 가능한 커미니케이션 공간 입니다.</p>
			</header>
			<div class="table-wrapper">
			${count}
				<table>
					<colgroup>
						<col width="10%" />
						<col width="20%" />
						<col width="20%" />
						<col width="30%" />
						<col width="20%" />
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${boardList}" var="item">
							<tr>
								<td>${item.boardNo}</td>
								<td><a href="../board/detail?boardNo=${item.boardNo}">${item.boardSubject}</a></td>
								<td>${item.boardSubject}</td>
								<td>${item.boardHit}</td>
								<td>${item.updateDate}</td>
							</tr>
						</c:forEach>
						<tr>
            <td colspan="5">
                <c:if test="${paging.curGroup > 1}">
                    <a href="javascript:page('1')">[처음]</a>
                </c:if>
                
                <c:if test="${paging.curGroup > 1}">
                    <a href="javascript:page('${paging.prevPage}')">[이전]</a>
                </c:if>
                
                <c:forEach var="num" begin="${paging.groupStart}" end="${paging.groupEnd}">
                    <c:choose>
                        <c:when test="${num == paging.curPage}">
                            <span style="color: red">${num}</span>&nbsp;
                        </c:when>
                        <c:otherwise>
                            <a href="javascript:page('${num}')">${num}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                
                <c:if test="${paging.curGroup <= paging.totGroup}">
                    <a href="javascript:page('${paging.nextPage}')">[다음]</a>
                </c:if>
                
                <c:if test="${paging.curPage <= paging.totPage}">
                    <a href="javascript:page('${paging.totPage}')">[끝]</a>
                </c:if>
            </td>
        </tr>
					</tbody>
					<div></div>
					<tfoot>
						<tr>
							<td colspan="4"></td>
							<td><a href="../board/writeform" class="button" id="write">글쓰기</a></td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
		</section>
	</div>
	<!-- Footer -->
	<footer id="footer">
	<div class="copyright">
		<ul class="icons">
			<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon fa-instagram"><span
					class="label">Instagram</span></a></li>
			<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
		</ul>
		<p>
			&copy; Untitled. All rights reserved. Design: <a
				href="https://templated.co">TEMPLATED</a>. Images: <a
				href="https://unsplash.com">Unsplash</a>.
		</p>
	</div>
	</footer>

	<!-- Scripts -->
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/jquery.scrollex.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/skel.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/util.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/main.js"></script>
	<script>
		function page(pageNo) {
			location.href = "../board/notice?curPage=" + pageNo;
		}
		$(function() {
			$('#write').click(function() {
				location.href = "../board/writeform";
			})
		})
	</script>
</body>
</html>