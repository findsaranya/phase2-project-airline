<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="airlineDAO" class="com.dao.AirlineDAOImpl"></jsp:useBean>
<%  
String id = request.getParameter("id");
int result = airlineDAO.deleteAirline(Integer.parseInt(id));
if(result == 1){
	response.sendRedirect("viewAirlines.jsp");
}
  
%> 