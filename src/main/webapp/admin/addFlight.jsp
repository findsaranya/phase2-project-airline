<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.entity.Flights,com.entity.Airline,com.entity.Places"%>
<jsp:useBean id="flightDAO" class="com.dao.FlightDAOImpl"></jsp:useBean>
<jsp:useBean id="airlineDAO" class="com.dao.AirlineDAOImpl"></jsp:useBean>  
<jsp:useBean id="placeDAO" class="com.dao.PlacesDAOImpl"></jsp:useBean> 
<jsp:useBean id="flight" class="com.entity.Flights"></jsp:useBean> 
 
<%  
String id = request.getParameter("flight_Id");
String name = request.getParameter("flightName");
String airId = request.getParameter("airline");
String src = request.getParameter("src");
String dest = request.getParameter("dest");
int price = Integer.parseInt(request.getParameter("price"));
Airline airlineResult = airlineDAO.getAirLineDetail(Integer.parseInt(airId));
Places srcResult = placeDAO.getPlaceDetail(Integer.parseInt(src));
Places destResult = placeDAO.getPlaceDetail(Integer.parseInt(dest));
flight.setFlightName(name);
flight.setAirline(airlineResult);
flight.setSource(srcResult);
flight.setDestination(destResult);
flight.setPrice(price);

if(id != null){
	flight.setFlight_Id(Integer.parseInt(id));
	 flightDAO.updateFlight(flight);
}else{
	 flightDAO.createFlight(flight);
}

	response.sendRedirect("viewFlights.jsp");

%>