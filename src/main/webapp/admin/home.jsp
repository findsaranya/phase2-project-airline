<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Welcome Admin</h1>
<c:out value="${pageContext.request.contextPath }"></c:out>
<a href='changePasswordForm.jsp'>Change Password</a>
<a href='logout.jsp'>Logout</a>
</body>
</html>