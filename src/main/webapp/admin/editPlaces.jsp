<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="placeDAO" class="com.dao.PlacesDAOImpl"></jsp:useBean>
<jsp:useBean id="place" class="com.entity.Places"></jsp:useBean>  
<jsp:setProperty property="*" name="place"/>  
<%  

 int result = placeDAO.updatePlace(place);
out.println(result);
if(result == 1){
	response.sendRedirect("viewPlaces.jsp");
} 
  
%> 