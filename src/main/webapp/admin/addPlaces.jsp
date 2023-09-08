<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="placeDAO" class="com.dao.PlacesDAOImpl"></jsp:useBean>
<%  
String name = request.getParameter("name");
String code = request.getParameter("code");
if(name != null && !name.equals("") && code!=null && !code.equals("")){%>
<jsp:useBean id="place" class="com.entity.Places"></jsp:useBean>  
<jsp:setProperty property="*" name="place"/>  
<%  
int result = placeDAO.createPlace(place);
if(result > 0){
	response.sendRedirect("viewPlaces.jsp");
}
}else{%>
<h4 style="color: red;">Place code and name are invalid!!</h4>
<jsp:include page="addPlacesForm.jsp"></jsp:include>
<%
}%> 
