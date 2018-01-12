<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>템플릿에 메뉴 등록</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/assets/css/registration.css" />

<!-- Favicon and touch icons -->
<link rel="icon" href="${pageContext.servletContext.contextPath}/resources/ico/home_iot.png">
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
		<li><a href="menu_info.html">메뉴관리?</a></li>
		<li><a href="elements.html">빅데이터</a></li>
		<li><a href="noticeboard.html">게시판</a></li>
		<li><a href="index_admin.html">Admin Only</a></li>
	</ul>
	</nav>

	<!-- Main -->
	<div id="main">
		<section class="wrapper">
		<div class="inner">
			<header class="align-center">
			<h2>Menu Board Management</h2>
			<p>메뉴보드 윈도우에 표시할 메뉴를 등록하세요. 수정 및 삭제도 가능합니다.</p>
			</header>
		</div>
		</section>

		<section class="wrapper style1">
		<div class="inner">
			<div class="row">
				<div class="3u 12u$(medium)">
					<div class="box">
						<p align="center">
							<strong>김수빈</strong> 님 반갑습니다.
						</p>
						<a href="loginmain.html" class="button special">로그인 페이지 이동</a> <a
							href="#" class="button alt">로그 아웃</a>
					</div>
					<div class="box">
						<ul class="actions vertical">
							<li><a href="dmb_menu.html" class="button">메뉴보드</a></li>
							<li><a href="dmb_event.html" class="button">이벤트보드</a></li>
							<li><a href="iot_control.html" class="button">실내 환경</a></li>
							<li><a href="store_management.html" class="button">매장관리
									처음으로 이동</a></li>
							<li><a href="mypage.html" class="button">마이페이지로 이동</a></li>
						</ul>
					</div>
				</div>
				<div class="9u$ 12u$(medium)">
					<div class="box">
						<form method="post" action="#">
							<div class="row uniform">

								<div class="3u 12u$(xsmall)">
									<h4>메뉴 템플릿</h4>
								</div>
								<div class="5u 12u$(xsmall)">
									<div class="select-wrapper">
										<select id="template" name="template">
											<option id="templateType">- 템플릿을 선택하세요 -</option>
											<option id="templateType1">${template.templateType}</option>
											<option id="templateType2">${template.templateType}</option>
										</select>
									</div>
								</div>
								<div class="2u$ 12u$(xsmall)">
									<div class="actions">
										<a href="#" class="button">이미지보기</a>
									</div>
								</div>

								<div class="3u 12u$(xsmall)">
									<h4>템플릿 이름</h4>
								</div>
								<div class="5u$ 12u$(xsmall)">
									<input type="text" name="templateTitle" id="templateTitle"
										value="" placeholder="${template.templateTitle}" />
								</div>

								<div class="3u 12u$(xsmall)">
									<h4>메뉴 영역 설정</h4>
								</div>
								<div class="5u 12u$(xsmall)">
									<div class="select-wrapper">
										<select class="select_templateArea" name="template"
											id="template">
											<option value="">- 설정할 메뉴를 선택하세요 -</option>
											<!-- jstl foreach문 처리 -->
											<option value="templateArea1">${template.templateArea}</option>
										</select>
									</div>
								</div>

								<div class="12u$">
									<div class="box">
										<div class="row">
											<!-- 이 부분을 메뉴가 가지고 있는 이미지 출력 영역으로 하겠습니다 -->
											<div class="6u 12u$(small)">
												<img class="image fit" id="output" alt="menu image" />
											</div>
											<!-- 영역 시작 이 select option 형식으로 메뉴 타입 으로 하나 더 해주세요 -->
											<!-- 영역 끝 -->
											<div class="6u$ 12u$(small)">
												<!-- 이 부분을 select option 형식으로 해주세요 -->
												<div class="input-group input-group-lg">
													<span class="input-group-addon" id="basic-addon1">메뉴명</span>
													<input class="form-control" type="text" name="menu_title"
														id="menuTitle" value="" placeholder="메뉴 이름을 입력하세요" />
												</div>

												<div class="input-group">
													<span class="input-group-addon" id="basic-addon2">가격</span>
													<input class="form-control" type="text" name="menu_price"
														id="menuPrice" value="" placeholder="메뉴 가격을 입력하세요" />
												</div>
												<div class="input-group">
													<span class="input-group-addon" id="basic-addon3">열량</span>
													<input class="form-control" type="text" name="menu_cal"
														id="menuCal" value="" placeholder="열량을 입력하세요" />
												</div>
												<div class="input-group">
													<div class="input-group-btn">
														<button type="button"
															class="btn btn-default dropdown-toggle"
															data-toggle="dropdown" aria-haspopup="true"
															aria-expanded="false">
															선택 <span class="caret"></span>
														</button>
														<ul class="dropdown-menu">
															<li><a href="#">Beef</a></li>
															<li><a href="#">Pork</a></li>
															<li><a href="#">Chicken</a></li>
															<li><a href="#">Vegetarian</a></li>
															<li><a href="#">Salad</a></li>
															<li><a href="#">Soup</a></li>
															<li><a href="#">Noodle</a></li>
															<li><a href="#">Rice</a></li>
															<li><a href="#">Desert</a></li>
															<li><a href="#">Drink</a></li>
														</ul>
													</div>
													<input type="text" class="form-control" name="menud_list"
														id="menudList" value="" placeholder="분류를 선택하세요">
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- Break -->
								<div class="12u$">
									<ul class="actions">
										<li><input type="submit" value="메뉴 등록정보 적용" /></li>
										<li><input type="reset" value="등록 취소" class="alt" /></li>
										<li><input type="button" value="삭제"
											class="button special" /></li>
									</ul>
								</div>
							</div>
						</form>
					</div>
				</div>
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


	}

	</script>
	<script src="${pageContext.servletContext.contextPath}/resources/assets/js/jquery.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/resources/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/resources/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/resources/assets/js/skel.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/resources/assets/js/util.js"></script>
	<script src="${pageContext.servletContext.contextPath}/resources/assets/js/main.js"></script>
	<script src="${pageContext.servletContext.contextPath}/resources/assets/js/bootstrap.min.js"></script>

</body>

</html>