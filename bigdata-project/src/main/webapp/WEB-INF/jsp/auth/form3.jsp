<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>

<html lang="ko">
<head>
<title>Bigdata3</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/assets/css/main.css" />
<!-- Favicon and touch icons -->
<link rel="icon"
	href="${pageContext.servletContext.contextPath}/ico/home_iot.png">
<style>
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
	</style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script>
$(document).ready(function()
{
    $.ajax(
            {
                url: '//connect.facebook.net/ko_KR/sdk.js',
                dataType: 'script',
                cache: true,
                success:function(script, textStatus, jqXHR)
                {
                    FB.init(
                        {
                            appId      : '1642835115777308',
                            xfbml      : true,
                            version    : 'v2.8'
                        }
                    );
                     
                    $('#loginbutton,#feedbutton').removeAttr('disabled');
                    FB.getLoginStatus(function(response) {
        				statusChangeCallback(response)
        				if (response.status === 'connected') {
        					//user is authorized
        					//document.getElementById('loginBtn').style.display = 'none';
        					getUserData();
        				} else {
        					//user is not authorized
        				}
        			});
                }
            });
});
</script>	
</head>
<body class="subpage">

	<!-- Header -->
	<jsp:include page="../header.jsp"></jsp:include>

	<!-- Nav -->
	<jsp:include page="../navi.jsp"></jsp:include>

	<!-- Modal -->
	<jsp:include page="../modal.jsp"></jsp:include>


	<!-- Main -->
	<div id="main">
		<section class="wrapper style1">
			<div class="inner">

				<header class="align-center">
					<h2>로그인</h2>
					<p>Email이나 SNS로 로그인 하실 수 있습니다.</p>

				</header>

				<hr class="major" />

				<!-- Login Form -->
				<div class="row 200%">
					<div class="6u 12u$(medium)">

						<h4>Login into Your Email</h4>
						<form action='login.do' method='POST'>

							<div class="4u 12u$(small)">
								<input type="radio" id="priority-low" name="userType"
									value="manager"> <label for="priority-low">관리자</label>
							</div>
							<div class="4u 12u$(small)">
								<input type="radio" id="priority-normal" name="userType"
									value="branchMaster" checked> <label
									for="priority-normal">점주</label>
							</div>
							<form method="post" action="#">
								<div class="row uniform">
									<div class="10u$">
										<i class="fa fa-key"></i> <input type="email" name="email"
											value='${cookie.email.value}' placeholder="Email" />
									</div>
									<div class="10u$">
										<input type="password" name="password" value=""
											placeholder="password" />
									</div>
									<!-- checkbox -->
									<div class="6u 12u$(small)">
										<input type="checkbox" id="copy" name="saveEmail"> <label
											for="copy">Remember me</label>
									</div>
									<div class="12u$">
										<ul class="actions">
											<li><input type="submit" value="Sign-In" /></li>
											<li><a href="#" class="button special icon fa-search">Forgot
													Password</a></li>
										</ul>
									</div>
								</div>
							</form>
						</form>
						<div class="12u$">
							<ul class="actions">
								<li><a href="#" class="button icon fa-download"
									data-toggle="modal" data-target="#myModal2">Create New
										Account</a></li>
							</ul>
						</div>
					</div>

					<div class="6u 12u$(medium)">
						<h4>Facebook Chatbot</h4>
						<div class="col align-center">
							<div class="image round fit">
								<img
									src="${pageContext.servletContext.contextPath}/images/fb-chatbot.png"
									alt="" />
							</div>

							<a href="https://www.mfacebook.com/messages/t/1214050375393430"
								class="button">Run Chatbot</a>
						</div>

					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

	<!-- Scripts -->
	<script
		src="${pageContext.servletContext.contextPath}/assets/js/bootstrap.min.js"></script>
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