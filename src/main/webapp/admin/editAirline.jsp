<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="airlineDAO" class="com.dao.AirlineDAOImpl"></jsp:useBean>
<jsp:useBean id="airline" class="com.entity.Airline"></jsp:useBean>  
<jsp:setProperty property="*" name="airline"/>  
<%  

 int result = airlineDAO.updateAirline(airline);
out.println(result);
if(result == 1){
	response.sendRedirect("viewAirlines.jsp");
} 
  
%> 