<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class='navir'>
	<nav id="menu">
		<ul class="links">
			<li><c:choose>
					<c:when test="${loginBranchMaster == null}">
						<a href="${pageContext.request.contextPath}/auth/form.html">로그인 </a>
					</c:when>
					<c:when test="${loginBranchMaster != null}">
						<a href='${pageContext.request.contextPath}/auth/logout.do'>로그아웃 </a>
						<div id='login'>
							${loginBranchMaster.name}(${loginBranchMaster.email}) 
								
						</div>
					</c:when>
				</c:choose> </a></li>
			<li><a href="${pageContext.request.contextPath}/auth/index.html">메인</a></li>
			<li><a href='${pageContext.request.contextPath}/auth/mypage'>마이페이지</a></li>
			<li><a href="${pageContext.request.contextPath}/storeManagement/main">매장관리</a></li>
			<li><a href="bigdatatest.html">빅데이터</a></li>
			<li><a href="noticeboard.html">게시판</a></li>
			<li><a href="index_admin.html">Admin Only</a></li>
		</ul>
	</nav>
</div>