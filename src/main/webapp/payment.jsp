<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.model.Passenger,com.model.FlightSearch,com.entity.Flights"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>
</head>
<body>
<jsp:useBean id="flightDAO" class="com.dao.FlightDAOImpl"></jsp:useBean>
     <% 
     String flightId = (String)session.getAttribute("flightId");
     FlightSearch flightSearch = (FlightSearch)session.getAttribute("search");
     Flights flightDetails = flightDAO.getFlightDetail(Integer.parseInt(flightId)); 
     request.setAttribute("flightDetails",flightDetails);
     int totalAmount = flightSearch.getCount() * flightDetails.getPrice();
     List<Passenger> passengers =  (List<Passenger>)session.getAttribute("passengers");
     request.setAttribute("passList",  passengers);
     %>
   
    <h1>Thank you, You have successfully paid the amount of Rs.<%=totalAmount %></h1>
    <h4>Below are the flight and Passengers Details</h4>
    <table border="1" width="50%">
<thead>
<tr>
<th>Name</th>
<th>Airline</th>
<th>Source</th>
<th>Destination</th>
<th>Price</th>
</tr>
</thead>
<c:choose>
<c:when test="${flightDetails != null}">
<tr>
<td><c:out value="${flightDetails.getFlightName() }"></c:out></td>
<td><c:out value="${flightDetails.getAirline().getAirlineName() }"></c:out></td>
<td><c:out value="${flightDetails.getSource().getName()}"></c:out></td>
<td><c:out value="${flightDetails.getDestination().getName()}"></c:out></td>
<td><c:out value="${flightDetails.getPrice() }"></c:out></td>
</tr>
</c:when>
<c:otherwise>
<tr>
		<td colspan=6>No Data</td>
		</tr>
</c:otherwise>
</c:choose>
</table> 
<br><br>
    <table border="1" width="50%">
<thead>
<tr>
<th>Name</th>
<th>Age</th>
<th>Email</th>
<th>Mobile No</th>
<th>Adhar No</th>
</tr>
</thead>
<c:choose>
<c:when test="${!passList.isEmpty()}" >
<c:forEach items="${passList}" var="p">
<tr>
<td><c:out value="${p.getFullName() }"></c:out></td>
<td><c:out value="${p.getAge() }"></c:out></td>
<td><c:out value="${p.getEmail() }"></c:out></td>
<td><c:out value="${p.getMobile() }"></c:out></td>
<td><c:out value="${p.getAdharNo() }"></c:out></td>
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
<br><br>
<a href="./">Home</a>
</body>
</html>