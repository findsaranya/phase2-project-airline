<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.entity.Flights,java.util.*"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flights List</title>
<style>
td{
 text-align:center;
}

</style>
</head>
<body>
<h1>Flights list</h1>
<jsp:useBean id="flightDAO" class="com.dao.FlightDAOImpl"></jsp:useBean>
<%
List<Flights> list = flightDAO.getFlightList();
request.setAttribute("list",list);

%>
<a href="addFlightForm.jsp">Add New Flight</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="home.jsp">Home</a>
<br><br/>
<table border="1" width="50%">
<thead>
<tr>
<th>Name</th>
<th>Airline</th>
<th>Way</th>
<th>Price</th>
<th>Edit</th>
<th>Delete</th>
</tr>
</thead>
<c:choose>
<c:when test="${!list.isEmpty()}">
<c:forEach items="${list}" var="u">
<tr>
<td><c:out value="${u.getFlightName() }"></c:out></td>
<td><c:out value="${u.getAirline().getAirlineName() }"></c:out></td>
<td><c:out value="${u.getSource().getCode().concat(' - ').concat(u.getDestination().getCode()) }"></c:out></td>
<td><c:out value="${u.getPrice() }"></c:out></td>
<td><a href='addFlightForm.jsp?id=<c:out value="${u.getFlight_Id() }"></c:out>'>Edit</a></td>
<td><a href='deleteFlight.jsp?id=<c:out value="${u.getFlight_Id() }"></c:out>'>Delete</a></td>
</tr>
</c:forEach>
</c:when>
<c:otherwise>
<tr>
		<td colspan=6>No Data</td>
		</tr>
</c:otherwise>
</c:choose>

</table>
</body>
</html>