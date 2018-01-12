<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
td {
	vertical-align: top
}
</style>
</head>
<body>
	<table>
		<thead>
		</thead>
		<tbody>
			<c:forEach items="${menuInfo}" var="item">
				<tr>
					<td>이미지 영역</td>
					<td>
						<div>
						  <p>메뉴 분류: ${item.menuType}</p>
						  <p>메뉴 이름: ${item.menuName}</p>
						  <p>메뉴 가격: ${item.menuPrice}</p>
						  <p>열량: ${item.menuKcal}</p>
						  <p>메뉴 설명: ${item.menuContent}</p>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>