<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- 새 풋터 추가 필요! -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/css/Footer-with-button-logo.css">
<footer id="myFooter">
	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<span class="image"><img src="${pageContext.request.contextPath}/images/bigdata02.jpg" style="width: auto; height: auto; max-width: 170px; max-height: 160px;" alt="" /></span>
			</div>
			<div class="col-sm-2">
				<h5>Get started</h5>
				<ul>
					<li><a href="${pageContext.request.contextPath}/auth/index.html">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/auth/form.html">Sign up</a></li>
					<li><a href="#">Downloads</a></li>
				</ul>
			</div>
			<div class="col-sm-2">
				<h5>About us</h5>
				<ul>
					<li><a href="#">Company Information</a></li>
					<li><a href="https://aws.amazon.com/ko/">Technical Cooperation</a></li>
					<li><a href="#">Reviews</a></li>
				</ul>
			</div>
			<div class="col-sm-2">
				<h5>Support</h5>
				<ul>
					<li><a href="#">FAQ</a></li>
					<li><a href="#">Help desk</a></li>
					<li><a href="noticeboard.html">Community</a></li>
				</ul>
			</div>
			<div class="col-sm-3">
				<div class="social-networks">
					<a href="#" id="loginBtn" class="facebook"><i class="fa fa-facebook"></i></a>
					<a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
					<a href="#" class="github"><i class="fa fa-github"></i></a>
				</div>
				<button type="button" class="btn btn-default">Contact us</button>
			</div>
		</div>
	</div>
	<div class="footer-copyright">
		<p>© 2017 Copyright Bigdata3 </p>
	</div>
</footer>

	<script>
		function getUserData() {
			/* FB.api('/me', function(response) {
			    document.getElementById('response').innerHTML = 'Hello ' + response.name;
			    console.log(response);
			}); */
			FB.api('/me', {
				fields : 'name,email,gender,id'
			}, function(response) {
				console.log(JSON.stringify(response));
				$("#name").text("이름 : " + response.name);
				$("#email").text("이메일 : " + response.email);
				$("#gender").text("성별 : " + response.gender);
				console.log('aaa');
				
				$.post("/auth/facebooklogin", {
					name: response.name,
					email: response.email,
					gender: response.gender,
					id: response.id
				}, function(responseText) {
					console.log(responseText);
				})
			});
			console.log('bbb');
		}
		
		function statusChangeCallback(response){
			console.log('statusChangeCallback');
			console.log(response);
			
			if(response.status === 'connected'){
				testAPI();
			}else{
				//document.getElementById('status').innerHTML = 'Please log' + 'into this app.';
			}
		}
		
		function facebookRegist(){
			FB.getLoginStatus(function (response){
				if(response.status == "connected"){
					
					handleFacebookRegist(response);
				}else if(response.status == "not_authorized"){
					
					FB.login(function (response){
						handleFacebookRegist(response);
					},
					{scope: 'publish_stream, email, user_birthday'});
				} else {
					FB.login(function(response){
						handleFacebookRegist(response);
					},
					{scope: 'publish_stream, email, user_birthday'});
				}
			});
		}
		
		function handleFacebookRegist(response){
			
			var accessToken = response.authResponse.accessToken;
			var userId, userName, fbId, userBirth;
			
			FB.api('/me', function(user){
				userId = user.email;
				userName = user.name;
				fbId = user.id;
				userBirth=user.birthday;
				
				alert(userId);
				alert(userName);
				alert(userBirth);
				
				$('input[name=fbAceessToken]').val(accessToken);
				return;
				
				$.ajax({
					type: "post",
					url: "https://localhost:8080/auth/form",
					dataType: "jsonp",
					json: "callback",
					data:{
						userId: userId
					},
					beforeSend: function(){
						$('#ajax_load_indicator').fadeIn('fast');
						
					},
					success: function(data){
						if(data.result == true){
							alert("이미 가입이 되어있습니다.");
							return;
						}else{
							if(confirm("Facebook 계정으로 가입하시겠습니까?\n\nFacebook 계정으로 가입시 추가정보를 입력하셔야 합니다.")){
								
								var $form = $("<form></form>");
								$form.attr("action","페이스북에서 받은 정보를 post로 넘길 url");
								$form.attr("method", "post");
								$form.appendTo("body");
								//$form.append("<input type ="hidden" name="userName" value=""+userName +"">");
								$form.append("");
								$form.append("");
								$form.append("");
								$form.submit();
								
							}
							return;
						}
					},
					error: function(data, status, err){
						alert("서버와의 통시이 실패했습니다.");
						return;
					},
					complete: function(){
						$('ajax_load_indicator').fadeOut();
					}
				
				});
			});
		}
		
		
		function testAPI(){
			console.log('========================> WELLCOME');
			FB.api('/me', function(response){
				console.log('Successful login for : '+ response.name);
				//document.getElementById('status').innerHTML='Thanks for logging in, '+ response.name + '!';
			});
		}
		
		function checkLoginState(){
			FB.getLoginStatus(function(response){
				statusChangeCallback(response);
			});
		}

		window.fbAsyncInit = function() {
			//SDK loaded, initialize it
			FB.init({
				appId : '1642835115777308',
				cookie : true, // enable cookies to allow the server to access
				// the session
				xfbml : true, // parse social plugins on this page
				version : 'v2.8' // use graph api version 2.8
			});

			//check user session and refresh it
			/*
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
			*/
		};

		//load the JavaScript SDK
		/*
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.com/ko_KR/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		*/
		//add event listener to login button
		document.getElementById('loginBtn').addEventListener('click',
				function() {
					//do the login
					FB.login(function(response) {
						if (response.authResponse) {
							access_token = response.authResponse.accessToken; //get access token
							user_id = response.authResponse.userID; //get FB UID
							console.log('access_token = ' + access_token);
							console.log('user_id = ' + user_id);
							$("#access_token").text("접근 토큰 : " + access_token);
							$("#user_id").text("FB UID : " + user_id);
							//user just authorized your app
							//document.getElementById('loginBtn').style.display = 'none';
							getUserData();
						}
					}, {
						scope : 'email,public_profile',
						return_scopes : true
					});
				}, false);
	</script>
</div>