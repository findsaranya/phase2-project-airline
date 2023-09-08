<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="placeDAO" class="com.dao.PlacesDAOImpl"></jsp:useBean>
<%  
String id = request.getParameter("id");
int result = placeDAO.deletePlace(Integer.parseInt(id));
if(result == 1){
	response.sendRedirect("viewPlaces.jsp");
}
  
%> 