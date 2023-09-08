<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="flightDAO" class="com.dao.FlightDAOImpl"></jsp:useBean>
<%  
String id = request.getParameter("id");
out.println(id);
int result = flightDAO.deleteFlight(Integer.parseInt(id));
if(result == 1){
	response.sendRedirect("viewFlights.jsp");
} 
%> 