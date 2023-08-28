<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.entity.Source,java.util.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Sources Details</h1>
<jsp:useBean id="sourceDAO" class="com.dao.SourceDAOImpl"></jsp:useBean>
<%List<Source> list = sourceDAO.getSourceList();
request.setAttribute("list",list);

%>
<c:if test="${!list.isEmpty()}">
<table border="1">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>City</th>
			<th>State</th>
			<th>Country</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getSourceId()}</td>
				<td>${u.getName()}</td>
				<td>${u.getCity()}</td>
				<td>${u.getState()}</td>
				<td>${u.getCountry()}</td>
				<td><a href="addSourceForm.jsp?id=${u.getSourceId()}">Edit</a></td>  
<td><a href="deleteSource.jsp?id=${u.getSourceId()}">Delete</a></td>
				
			</tr>
		</c:forEach>
	</table>
	</c:if>
	
	<br />
	<a href="addSourceForm.jsp">Add New Source</a>
</body>
</html>