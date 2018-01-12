<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container">
	<form action="add.do" method="POST">
		<div class="row">
			<div class="col-xs-12 col-md-4 col-md-offset-4">

				<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-sm" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel">회원가입 정보입력</h4>
							</div>
							<div class="modal-body">
								<form class="pb-modalreglog-form-reg">

									<div class="form-group">
										<label for="email">Email address</label>
										<div class="input-group pb-modalreglog-input-group">
											<span class="input-group-addon"><span
												class="glyphicon glyphicon-inbox"></span></span> <input
												type="email" class="form-control" id="email" name="email"
												placeholder="Email 주소가 ID가 됩니다">
										</div>
									</div>
									<div class="form-group">
										<label for="name">User name</label>
										<div class="input-group pb-modalreglog-input-group">
											<span class="input-group-addon"><span
												class="glyphicon glyphicon-user"></span></span> <input type="text"
												class="form-control" id="name" name="name" placeholder="성함을 입력해 주세요">
										</div>
									</div>
									<div class="form-group">
										<label for="password">Password</label>
										<div class="input-group pb-modalreglog-input-group">
											<span class="input-group-addon"><span
												class="glyphicon glyphicon-lock"></span></span> <input
												type="password" class="form-control" id="password" name="password"
												placeholder="사용하고싶은 패스워드 입력">
										</div>
									</div>
									<div class="form-group">
										<label for="passwordchk">Confirm password</label>
										<div class="input-group pb-modalreglog-input-group">
											<span class="input-group-addon"><span
												class="glyphicon glyphicon-lock"></span></span> <input
												type="password" class="form-control" id="passwordchk"
												placeholder="패스워드 재입력">
										</div>
									</div>
									<div class="form-group">
										<label for="tel">Mobile phone</label>
										<div class="input-group pb-modalreglog-input-group">
											<span class="input-group-addon"><span
												class="glyphicon glyphicon-phone"></span></span> <input type="text"
												class="form-control" id="tel" name="tel" placeholder="개인 연락처 입력">
										</div>
									</div>


								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">닫기</button>
								<button id="signup" class="btn btn-primary" onclick="sendIt()">가입</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<script>
		
	function sendIt(){
			
			var email = document.getElementById("email")
			var password = document.getElementById("password")
			var passwordchk = document.getElementById("passwordchk")
			//아이디 입력여부 검사
			if(email.value=="")
			{
			 alert("아이디를 입력하지 않았습니다.")
			 email.focus()
			 return
			}
			//아이디에 공백 사용하지 않기
			else if (email.value.indexOf(" ")>=0)
			{
			 alert("아이디에 공백을 사용할 수 없습니다.")
			 email.focus()
			 email.select()
			 return
			}

			//비밀번호 입력여부 체크
			else if(password.value=="")
			{
			 alert("비밀번호를 입력하지 않았습니다.")
			 password.focus()
			 return
			}

			//비밀번호 길이 체크(4~8자 까지 허용)
			else if (password.value.length<4 || password.value.length>12)
			{
			 alert ("비밀번호를 4~12자까지 입력해주세요.")
			 password.focus()
			 password.select()
			 return
			}


			//비밀번호와 비밀번호 확인 일치여부 체크
			else if (password.value!=passwordchk.value)
			{
				alert("비밀번호가 일치하지 않습니다")
				password.value=""
				passwordchk.value=""
				password.focus()
			 return
			}
			else if (password.value!=passwordchk.value)
			{
				document.submit()
			}
			
			
		}
		
		
		</script>

</div>