<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Admin Login</h1>
<form action='<c:out value="${pageContext.request.contextPath }"></c:out>/admin/login.jsp' method="post">
<table>
<tr>
<td>Username</td>
<td><input type="text" name="username"/></td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" name="password"/></td>
</tr>
<tr>
<td colspan=2><input type="submit" value="LogIn"/></td>
</tr>
</table>

</form>

</body>
</html>