<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.entity.Places,java.util.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Places List</title>
<style>
td{
 text-align:center;
}

</style>
</head>
<body>
<h1>Places Details</h1>
<jsp:useBean id="placeDAO" class="com.dao.PlacesDAOImpl"></jsp:useBean>
<%List<Places> list = placeDAO.getPlaceList();
request.setAttribute("list",list);

%>
<br />
	<a href="addPlacesForm.jsp">Add New Place</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="home.jsp">Home</a><br/><br>
<table border="1" width="50%">
		<tr>
			<th>Name</th>
			<th>Code</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<c:choose>
		<c:when test="${!list.isEmpty()}">
		<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getName()}</td>
				<td>${u.getCode()}</td>
				<td><a href="addPlacesForm.jsp?id=${u.getPlaceId()}">Edit</a></td>  
<td><a href="deletePlaces.jsp?id=${u.getPlaceId()}">Delete</a></td>
				
			</tr>
		</c:forEach>
		
		</c:when>
		<c:otherwise>
		
		<tr>
		<td colspan=4>No Data</td>
		</tr></c:otherwise>
		</c:choose>
		
	</table>
</body>
</html>