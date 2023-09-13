<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.model.FlightSearch,java.util.*,com.entity.Flights"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Result</title>
<style>
td{
 text-align:center;
}

</style>
</head>
<body>

<jsp:useBean id="flightDAO" class="com.dao.FlightDAOImpl"></jsp:useBean>
<%

FlightSearch result =  (FlightSearch )session.getAttribute("search");
 List<Flights> search = flightDAO.searchFlights(result.getSrc(), result.getDest());
request.setAttribute("search", search);

%>
<h1>Flights Search Result</h1>
<a href="flightSearch.jsp">Back</a>
 <table border="1" width="50%">
<thead>
<tr>
<th>Name</th>
<th>Airline</th>
<th>Way</th>
<th>Price</th>
<th>Action</th>
</tr>
</thead>
<c:choose>
<c:when test="${!search.isEmpty()}">
<c:forEach items="${search}" var="u">
<tr>
<td><c:out value="${u.getFlightName() }"></c:out></td>
<td><c:out value="${u.getAirline().getAirlineName() }"></c:out></td>
<td><c:out value="${u.getSource().getCode().concat(' - ').concat(u.getDestination().getCode()) }"></c:out></td>
<td><c:out value="${u.getPrice() }"></c:out></td>
<td><a href="passengerForm.jsp?flightId=${u.getFlight_Id() }">Book</a></td>

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