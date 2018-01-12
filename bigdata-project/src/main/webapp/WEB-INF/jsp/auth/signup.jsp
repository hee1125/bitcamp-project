<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>회원가입</title>

</head>
<body>

	<h1>회원가입</h1>
	<form id='f' action='add.do' method='POST'>
		이메일:<input type='text' name='email'><br> 암호:<input
			type='password' name='password'><br> 암호확인:<input
			type='password' name='passwordchk'><br>
		<button>
			<a href="#" id="signupBtn" class="label">가입</a>
		</button>
	</form>

</body>
<script>
document.getElementById('signupBtn').addEventListener('click',function sendIt(){
	//아이디 입력여부 검사
	if(document.f.email.value=="")
	{
	 alert("아이디를 입력하지 않았습니다.")
	 document.f.email.focus()
	 return
	}
	//아이디에 공백 사용하지 않기
	if (document.f.email.value.indexOf(" ")>=0)
	{
	 alert("아이디에 공백을 사용할 수 없습니다.")
	 document.f.email.focus()
	 document.f.email.select()
	 return
	}

	//비밀번호 입력여부 체크
	if(document.f.password.value=="")
	{
	 alert("비밀번호를 입력하지 않았습니다.")
	 document.f.password.focus()
	 return
	}

	//비밀번호 길이 체크(4~8자 까지 허용)
	if (document.f.password.value.length<4 || document.f.password.value.length>12)
	{
	 alert ("비밀번호를 4~12자까지 입력해주세요.")
	 document.f.password.focus()
	 document.f.password.select()
	 return
	}


	//비밀번호와 비밀번호 확인 일치여부 체크
	if (document.f.password.value!=document.f.passwordchk.value)
	{
		alert("비밀번호가 일치하지 않습니다")
		document.f.password.value=""
		document.f.passwordchk.value=""
		document.f.password.focus()
	 return
	}
	
	document.f.submit()
}, false);

</script>

</html>