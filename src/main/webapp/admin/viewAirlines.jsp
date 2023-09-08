<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.entity.Airline,java.util.*"%>
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
<h1>Airlines List</h1>
<jsp:useBean id="airlineDAO" class="com.dao.AirlineDAOImpl"></jsp:useBean>
<%List<Airline> list = airlineDAO.getAirlineList();
request.setAttribute("list",list);

%>

	<a href="addAirlineForm.jsp">Add New Airline</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="home.jsp">Home</a></br>
<br/>
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
				<td>${u.getAirlineName()}</td>
				<td>${u.getAirlineCode()}</td>
				<td><a href="addAirlineForm.jsp?id=${u.getAirlineId()}">Edit</a></td>  
<td><a href="deleteAirline.jsp?id=${u.getAirlineId()}">Delete</a></td>
				
			</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
		<tr>
		<td colspan=4>No Data</td>
		</tr>
		</c:otherwise>
		</c:choose>
		
		
	</table>
</body>
</html>