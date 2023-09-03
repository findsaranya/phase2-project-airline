<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Airline Reservation</title>
</head>
<body>
<jsp:useBean id="adminDAO" class="com.dao.AdminDAOImpl"></jsp:useBean>
<% 
Long result = adminDAO.getAdminRowCount();
out.println("session login" + session.getAttribute("loggedIn"));
if(result == 0){
%>
<jsp:useBean id="admin" class="com.entity.Admin"></jsp:useBean>  
<jsp:setProperty property="username" name="admin" value="admin"/>
<jsp:setProperty property="password" name="admin" value="admin!23"/>
<%
int row = adminDAO.createAdmin(admin);
out.println("admin row" + row);
} %>
<h1>Welcome to Airline Reservation</h1>
<%out.println(request.getContextPath()); %>
<c:out value="${pageContext.request.contextPath }"></c:out>
<a href="<c:out value="${pageContext.request.contextPath }"></c:out>/admin/addSourceForm.jsp">Add Source Details</a>
<a href="<c:out value="${pageContext.request.contextPath }"></c:out>/admin/viewSources.jsp">View Sources</a>
<a href="flightSearch.jsp">Flight Search</a>
<c:choose>
<c:when test="${sessionScope.loggedIn == null }">

<a href='<c:out value="${pageContext.request.contextPath }"></c:out>/admin/loginForm.jsp'>Admin Login</a>
</c:when>
<c:otherwise>
<a href="<c:out value="${pageContext.request.contextPath }"></c:out>/admin/changePasswordForm.jsp">Change Password</a>
<a href="<c:out value="${pageContext.request.contextPath }"></c:out>/admin/logout.jsp">Logout</a>
</c:otherwise>

</c:choose>

</body>
</html>