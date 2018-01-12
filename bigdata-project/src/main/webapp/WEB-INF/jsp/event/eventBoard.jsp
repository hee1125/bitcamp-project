<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html>
	<head>
	<!--ì ì í ì´ë²¤í¸ íì´ì§ -->
	<meta charset="utf-8">
	<title>event Viewer1</title>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/menu_board.css" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/fonts.googleapis.com.css" />
	<script src="${pageContext.servletContext.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/assets/js/jquery.backstretch.min.js"></script>

	<style>
		#content {
				position: absolute;	
				top: 30%;
				left: 70%;
				transform: translate(-50%, -50%);
				z-index: 2;
			}
			
			body {
				color:white;				
			}
			h1 {
				font-size:3em;
				color:white;
				text-shadow:2px 2px 3px black;
			}
			p {
				padding-top:20px;
				font-size:2em;
				line-height:1.8em;
				color: mediumvioletred;
				font-weight: 700;
				text-shadow:1px 1px 1px black;
			}
			strong {
				color:yellow;
				text-shadow:1px 1px 1px black;
			}	
		
		.hit {
		animation-name: blink;
		animation-duration: 1.5s;
		animation-timing-function: ease;
		animation-iteration-count: infinite;
		/* ì ìì±ë¤ì í ì¤ë¡ íê¸°íê¸° */
		/* -webkit-animation: blink 1.5s ease infinite; */
	}

	@keyframes blink {
		from {
			color: white;
		}
		30% {
			color: yellow;
		}
		to {
			color: red;
			font-weight: bold;
		}
	</style>
</head>

<body>
	<header id="header">
		<div class="logo"><a href="index.html">BIGDATA3 <span>by Donny</span></a></div>
	</header>

	<div id="content">
		<h1>뉴욕 버거 이벤트<span class="hit"> New!!</span></h1>
		<p><i class="fa fa-volume-up" aria-hidden="true"></i> 출시 기념 행사 진행중 <br>
			<strong>
				<i class="fa fa-quote-left" aria-hidden="true"></i> 볼륨 만점, 맛도 만점
				<i class="fa fa-quote-right" aria-hidden="true"></i>
			</strong>
		
			<br>이벤트 기간중 음료 서비스*^^* <i class="fa fa-heart" aria-hidden="true"></i>
			
	</div>
	<script>
		$(function() {
			$.backstretch(["${pageContext.servletContext.contextPath}/images/menu_board04.jpg"]);
		});
	</script>
</body>
</html>