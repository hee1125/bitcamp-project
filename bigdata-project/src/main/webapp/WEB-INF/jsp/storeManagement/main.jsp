<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html lang="ko">
<head>
<title>Store Mgt 메인</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/assets/css/submain.css" />
<!-- 배너 백그라운드 변경 -->

<!-- Favicon and touch icons -->
<link rel="icon"
	href="${pageContext.servletContext.contextPath}/ico/home_iot.png">
</head>

<body>
	<!-- Header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- Nav -->
	<jsp:include page="../navi.jsp"></jsp:include>


	<!-- Banner -->
	<section id="banner">
		<div class="inner">
			<header>
				<h1>Store Management</h1>
				<p>디지털 보드의 메뉴관리 시스템 및 매장내 환경 IoT 시스템을 보다 스마트하게 관리할 수 있습니다.</p>
			</header>
			<a href="#main" class="button big scrolly">Move Menu</a>
		</div>
	</section>

	<!-- Main -->
	<div id="main">
		<!-- Section -->
		<section class="wrapper style1">
			<div class="inner">
				<div class="flex flex-2">
					<div class="col col1">
						<div class="image round fit">
							<a href="generic.html" class="link"><img
								src="${pageContext.servletContext.contextPath}/images/menu_board09.jpg"
								alt="" /></a>
						</div>
					</div>
					<div class="col col2">
						<h3>Digital Menu Board</h3>
						<p>메뉴보드 윈도우로서 등록할 템플릿을 선택하세요. 고객께서 선택한 타입으로 메뉴화면이 구성됩니다.</p>
						<a href="dmb_menu.html" class="button">Menu Board Management</a>
						<hr />
						<p>이벤트보드 윈도우에 표시할 페이지를 등록하세요. 수정 및 삭제도 가능합니다.</p>
						<a href="${pageContext.request.contextPath}/event/eventRequestPage" class="button">Event Board
							Management</a>
					</div>
				</div>
			</div>
		</section>
		<!-- Section -->
		<section class="wrapper style2">
			<div class="inner">
				<div class="flex flex-2">
					<div class="col col2">
						<h3>Indoor Environment</h3>
						<p>
							매장내의 현재 실내환경을 확인할 수 있습니다.<br> IoT기기를 통한 온도, 습도, 미세먼지를 관리합니다.<br>
							제어방식에는 자동셋팅과 수동셋팅이 존재합니다.<br> 스마트폰으로 챗봇을 통해 서비스를 이용할 수도
							있습니다.
						</p>
						<a href="iot_control.html" class="button">실내환경 확인 및 설정</a>
					</div>
					<div class="col col1 first">
						<div class="image round fit">
							<a href="generic.html" class="link"><img
								src="${pageContext.servletContext.contextPath}/images/bigdata03.jpg" alt="" /></a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Footer -->
	<jsp:include page="../footer2.jsp"></jsp:include>

	<!-- Scripts -->
	<script
		src="${pageContext.servletContext.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/assets/js/skel.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/assets/js/util.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/assets/js/main.js"></script>

</body>
</html>