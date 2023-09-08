<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.entity.Admin"%>
<jsp:useBean id="adminDAO" class="com.dao.AdminDAOImpl"></jsp:useBean>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String name = request.getParameter("username");
String password = request.getParameter("password");
if(name != null && !name.equals("") && password!=null && !password.equals("")){
	Admin details = adminDAO.getAdminDetails(name, password);
	if(details != null){
		session.setAttribute("loggedIn", true);
		session.setAttribute("adminDetails",details);		
    response.sendRedirect("home.jsp");
}else{%>
<h4 style="color: red;">Invalid Username or Password</h4>
<jsp:include page='loginForm.jsp'></jsp:include>
<% }%>
<%}else{%>
<h4 style="color: red;">Username or Password can't be empty</h4>
<jsp:include page="loginForm.jsp"></jsp:include>
<%}%>