<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>event Viewer2</title>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/menu_board.css" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/font-awesome.min.css" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/fonts.googleapis.com.css" />
	<script src="${pageContext.servletContext.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/assets/js/jquery.backstretch.min.js"></script>  
		<style>			
		#content {
				position: absolute;	
				top: 30%;
				left: 30%;
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
				color: greenyellow;
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
		/* 위 속성들을 한 줄로 표기하기 */
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
		<!--[if lt IE 9]>
		  <script src="js/html5shiv.min.js"></script>
		<![endif]-->		
	</head>
	<body> 
			<header id="header">
				<div class="logo"><a href="index.html">BIGDATA3 <span>by Donny</span></a></div>
			</header>
	
		<div id="content">
			<h1>이벤트 진행중<span class="hit"> <i class="fa fa-bell-o" aria-hidden="true"></i>Time Limit!!</span></h1>
			<p>이 메뉴들이 
   		<strong><i class="fa fa-quote-left" aria-hidden="true"></i> 매일 14시 ~ 17시
   		<i class="fa fa-quote-right" aria-hidden="true"></i></strong><br> 단 3시간! 모두 20% 할인!!
    	<br>이번 기회를 놓치지 마세요~  <i class="fa fa-smile-o" aria-hidden="true"></i></p>
	    </div>
		<script>
			$(function(){
				$.backstretch([
					"${pageContext.servletContext.contextPath}/images/menu01.jpg", "${pageContext.servletContext.contextPath}/images/carissa-gan-76325.jpg", "${pageContext.servletContext.contextPath}/images/menu_board02.jpg", "${pageContext.servletContext.contextPath}/images/alex-munsell-18753.jpg"
				], {duration:5000, fade:750});			
			});
		</script>
	</body>
</html>