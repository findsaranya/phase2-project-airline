<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="airlineDAO" class="com.dao.AirlineDAOImpl"></jsp:useBean>
 
<%  
String name = request.getParameter("airlineName");
String code = request.getParameter("airlineCode");
if(name != null && !name.equals("") && code!=null && !code.equals("")){%>
<jsp:useBean id="airline" class="com.entity.Airline"></jsp:useBean>  
<jsp:setProperty property="*" name="airline"/> 
<%
int result = airlineDAO.createAirline(airline);
if(result > 0){
	response.sendRedirect("viewAirlines.jsp");
}
}else{%>
	<h4 style="color: red;">Airline code and name are invalid!!</h4>
	<jsp:include page="addAirlineForm.jsp"></jsp:include>
<%
}%>
