<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.entity.Flights,com.entity.Airline,com.entity.Places,java.util.List"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Flight Form</title>
</head>
<body>
<jsp:useBean id="flightDAO" class="com.dao.FlightDAOImpl"></jsp:useBean>
<jsp:useBean id="placeDAO" class="com.dao.PlacesDAOImpl"></jsp:useBean>
<jsp:useBean id="airlineDAO" class="com.dao.AirlineDAOImpl"></jsp:useBean>
<%
String id = request.getParameter("id");
request.setAttribute("id",id );
 Flights src = null;
if(id != null){
	src = flightDAO.getFlightDetail(Integer.parseInt(id));
}
request.setAttribute("src", src);
List<Places> places = placeDAO.getPlaceList();
List<Airline> airlines = airlineDAO.getAirlineList();
request.setAttribute("places", places);
request.setAttribute("airlines", airlines);

%>
<h1><c:if test="${id != null}">
                       Edit a Flight
                   </c:if>
                   <c:if test="${id == null}">
                       Add a New Flight
                   </c:if>
                   </h1>
                   <a href="home.jsp">Back</a>
                   
                 
                  
   <form action="addFlight.jsp"  method="post">    
   <c:if test="${id != null}">
            <input type="hidden" name="flight_Id" value="<c:out value='${src.getFlight_Id()}' />" />
         </c:if>            
                   
                   <table border=1>
<tr>
<td>Flight Name</td>
<td>
           <input type="text" name="flightName" value="<c:out value='${src.getFlightName()}'/>"/>
</td>
</tr>
<tr>
<td>Airline Name</td>
<td>
<select style="width:150px;" name="airline">
<option value="">Select an Airline</option>
  <c:forEach items="${airlines}" var="s">
  <option value="${s.getAirlineId()}" ${s.getAirlineId() == src.getAirline().getAirlineId() ? 'selected="selected"' : ''}>${s.getAirlineName()}</option>
  </c:forEach>
  </select></td>

</tr>
<tr>
<td>Source</td>
<td>
<select style="width:150px;" name="src">
<option value="">Select an Source</option>
  <c:forEach items="${places}" var="p">
  <option value="${p.getPlaceId()}" ${p.getPlaceId() == src.getSource().getPlaceId() ? 'selected="selected"' : ''}>${p.getName()}</option>
  </c:forEach>
  </select></td>

</tr>
<tr>
<td>Destination</td>
<td>
<select style="width:150px;" name="dest">
<option value="">Select a Destination</option>
  <c:forEach items="${places}" var="p">
  <option value="${p.getPlaceId()}" ${p.getPlaceId() == src.getDestination().getPlaceId() ? 'selected="selected"' : ''}>${p.getName()}</option>
  </c:forEach>
  </select></td>

</tr>
<tr>
<td>Price</td>
<td><input type="number" name="price" min="1000"  value="<c:out value='${src.getPrice()}'/>"/></td>
</tr>
<tr>
<td colspan=2 align="center">
<c:if test="${id == null }">
<input type="submit" value="Add"/>
</c:if>
<c:if test="${id != null }">
<input type="submit" value="Update"/>
</c:if>

</td>
</tr>
</table>
                   
</body>
</html>