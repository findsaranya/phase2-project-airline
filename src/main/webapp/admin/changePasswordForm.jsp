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
<h1>Change Password</h1>
<form method="post" action="<c:out value="${pageContext.request.contextPath }"></c:out>/admin/changePassword.jsp">
<input type="hidden" name="adminId" value='<c:out value="${sessionScope.adminDetails.getAdminId() }"></c:out>'/>
<input type="hidden" name="username" value='<c:out value="${sessionScope.adminDetails.getUsername() }"></c:out>'/>
<table>
<tr>
<td>New password</td>
<td><input type="password" name="password"/></td>
</tr>
<tr>
<td>Confirm password</td>
<td><input type="password" name="confirm"/></td>
</tr>
<tr>
<td></td>
<td colspan="2"><input type="submit" value="Save"/></td>
</tr>
</table>
</form>
</body>
</html>