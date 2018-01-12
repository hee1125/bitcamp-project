<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table style="width: 700px">
		<c:forEach var="row" items="${reply}">
			<tr>
				<td>${row.userName}(${reply.createDate}) 
				<br> ${reply.content}
					<hr>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>