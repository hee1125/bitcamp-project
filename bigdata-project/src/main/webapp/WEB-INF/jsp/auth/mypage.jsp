<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

<html lang="ko">
	<head>
	<title>My Page Main</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/registration.css" />
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/Footer-with-button-logo.css">

	<!-- Favicon and touch icons -->
	<link rel="icon" href="${pageContext.servletContext.contextPath}/ico/home_iot.png">
</head>
<style>
	.modal-dialog {
		position: relative width:600px;
		margin: 45px auto;
	}

	.pb-modalreglog-input-group {
		margin: auto;
	}

	.pb-modalreglog-submit {
		margin-left: 5px;
	}

	.pb-modalreglog-form-reg {
		text-align: center;
	}

	.pb-modalreglog-footer p {
		text-align: center;
		margin-top: 20px;
	}

	@media (min-width: 768px) .modal-sm {
		width: 400px;
	}

	@media (min-width: 768px) .modal-dialog {
		margin: 80px auto;
	}

	.modal-footer .btn+.btn {
		margin-bottom: 0;
		margin: auto;
	}
</style>

<body class="subpage">

	<!-- Header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- Nav -->
	<jsp:include page="../navi.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-md-4 col-md-offset-4">

				<div class="modal fade" id="passModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-sm" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel">패스워드 재설정</h4>
							</div>
							<div class="modal-body">
								<form class="pb-modalreglog-form-reg">

									<div class="form-group">
										<label for="email">Email(ID) 입력</label>
										<div class="input-group pb-modalreglog-input-group">
											<span class="input-group-addon"><span class="glyphicon glyphicon-inbox"></span></span>
											<input type="email" class="form-control" id="inputEmail" placeholder="Email주소(ID)입력">
										</div>
									</div>
									<div class="form-group">
										<label for="password">기존 패스워드</label>
										<div class="input-group pb-modalreglog-input-group">
											<span class="input-group-addon"><span class="glyphicon glyphicon-floppy-disk"></span></span>
											<input type="password" class="form-control" id="inputPws" placeholder="현재의 패스워드입력">
										</div>
									</div>
									<div class="form-group">
										<label for="password">변경할 패스워드</label>
										<div class="input-group pb-modalreglog-input-group">
											<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
											<input type="password" class="form-control" id="inputNewPws" placeholder="새로운 패스워드 입력">
										</div>
									</div>
									<div class="form-group">
										<label for="confirmpassword">패스워드 재입력</label>
										<div class="input-group pb-modalreglog-input-group">
											<span class="input-group-addon"><span class="glyphicon glyphicon-repeat"></span></span>
											<input type="password" class="form-control" id="inputNewConfirmPws" placeholder="패스워드 재입력">
										</div>
									</div>

								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
								<button type="button" class="btn btn-primary">적용</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

	<!-- Main -->
	<div id="main">
		<section class="wrapper">
			<div class="inner">
				<header class="align-center">
					<h2>My Page</h2>
					<p>개인정보 및 각종 서비스 정보를 확인할 수 있습니다. 자세한 정보를 등록하지 않으면 서비스 이용에 제한적일 수 있습니다.</p>
				</header>
			</div>
		</section>

		<section class="wrapper style1">
			<div class="inner">
				<div class="row">
					<div class="3u 12u$(medium)">
						<div class="box">
							<p align="center">
								<strong>'${loginBranchMaster.name}'</strong> 님 반갑습니다.
							</p>
							<a href="loginmain.html" class="button special">로그인 페이지 이동</a>
							<a href="${pageContext.request.contextPath}/auth/logout.do" class="button alt" onclick="">로그 아웃</a>
						</div>
						<div class="box">
							<ul class="actions vertical">
								<li><a href="#" class="button" data-toggle="modal" data-target="#passModal">패스워드재설정</a></li>
								<li><a href="store_retouch.html" class="button">매장정보</a></li>
								<li><a href="iot_retouch.html" class="button">기기정보</a></li>
								<li><a href="menu_retouch.html" class="button">메뉴정보</a></li>
								<li><a href="writed_bd.html" class="button">내가 쓴 게시글</a></li>
								<li><a href="delete_user.html" class="button">회원탈퇴</a></li><!-- 모달창으로 구현? -->
							</ul>
						</div>
					</div>
					<div class="9u$ 12u$(medium)">
						<div class="box">
							<form method="post" action="update">
								<div class="row uniform">


									<div class="2u 12u$(xsmall)">
										<h4>아이디</h4>
									</div>
									<div class="5u$ 12u$(xsmall)">
										<input type="email" name="email" id="email" value="${loginBranchMaster.email}" placeholder="Id" readonly />
									</div>

									<div class="2u 12u$(xsmall)">
										<h4>성명</h4>
									</div>
									<div class="5u$ 12u$(xsmall)">
										<input type="text" name="name" id="name" value="${loginBranchMaster.name}" placeholder="Name" />
									</div>
									<div class="2u 12u$(xsmall)">
										<h4>개인연락처</h4>
									</div>
									<div class="5u$ 12u$(xsmall)">
										<input type="text" name="tel" id="tel" value="${loginBranchMaster.tel}" placeholder="휴대전화번호" />
									</div>
									<div class="2u 12u$(xsmall)">
										<h4>매장명</h4>
									</div>
									<div class="5u$ 12u$(xsmall)">
										<div class="select-wrapper">
											<select name="branchSelect" id="branchSelect">
															<c:forEach items="${branchList}" var="branch">
															<option value="${branch.no}">${branch.name}</option>
															</c:forEach>
														</select>
										</div>
									</div>
									<div class="2u 12u$(xsmall)">
										<h4>매장넘버</h4>
									</div>
									<div class="5u$ 12u$(xsmall)">
										<input type="text" name="bno" id="bno" value="" placeholder="등록매장넘버" readonly />
									</div>
									<div class="2u 12u$(xsmall)">
										<h4>매장연락처</h4>
									</div>
									<div class="5u$ 12u$(xsmall)">
										<input type="text" name="btel" id="btel" value="" placeholder="매장전화번호" readonly />
									</div>

									<div class="3u 12u$(xsmall)">
										<h4>기기등록상태</h4>
									</div>
									<div class="3u 12u$(small)">
										<input type="radio" id="priority-low" name="priority" checked>
										<label for="priority-low">등록완료</label>
									</div>
									<div class="3u 12u$(small)">
										<input type="radio" id="priority-normal" name="priority">
										<label for="priority-normal">일부만 등록</label>
									</div>
									<div class="3u$ 12u$(small)">
										<input type="radio" id="priority-high" name="priority">
										<label for="priority-high">미등록</label>
									</div>


									<!-- Break -->
									<div class="3u 12u$(xsmall)"></div>
									<div class="6u$ 12u$(small)">
										<ul class="actions">
											<li><input type="submit" value="회원정보수정" /></li>
											<li><input type="reset" value="취소" class="alt" /></li>
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
	<jsp:include page="../footer2.jsp"></jsp:include>


	<!-- Scripts -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/assets/js/bootstrap.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/assets/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/assets/js/jquery.scrollex.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/assets/js/skel.min.js"></script>
	<script src="${pageContext.servletContext.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.servletContext.contextPath}/assets/js/main.js"></script>
	<script>
		var branchList = {};
        
        <c:forEach items="${branchList}" var="branch">
        branchList['${branch.no}'] = {
        	no: '${branch.no}',
        	name: '${branch.name}',
        	tel: '${branch.tel}'
        };
        </c:forEach>
        
        
        var branchNo = $('#branchSelect').prop('value');
        
        var bno = document.getElementById("bno");
        var btel = document.getElementById("btel");
        bno.value = (branchList[branchNo].no);
        btel.value = (branchList[branchNo].tel);
        
    	$('#branchSelect').on('change', function() {
    		var branchNo = $(this).prop('value');
    		
    		bno.value = (branchList[branchNo].no);
    		btel.value = (branchList[branchNo].tel);
    	})
	</script>

</body>
</html>