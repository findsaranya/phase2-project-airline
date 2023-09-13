<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Passenger <c:out value='${sessionScope.count == null ? 1 : sessionScope.count}'></c:out> Details</h1>
<%
String flightId = request.getParameter("flightId");
if(flightId != null){
	session.setAttribute("flightId", flightId);
}
%>
<form action="passengerDetails.jsp" method="post">
<table>
<tr>
<td>FullName</td>
<td><input name="fullName" type="text"/></td>
</tr>
<tr>
<td>Email</td>
<td><input name="email" type="email"/></td>
</tr>
<tr>
<td>Mobile</td>
<td><input name="mobile" type="text"/></td>
</tr>
<tr>
<td>Adhar No</td>
<td><input name="adharNo" type="text"  maxlength="12"/></td>
</tr>
<tr>
<td>Age</td>
<td><input name="age" type="number" min=1/></td>
</tr>
<tr>
<tr>

<td colspan=2></td>
<td>
<input value="Reset" type="reset"/>
<%
%>
<input value="Submit" type="submit"/>

</td>
</tr>
</table>
</form>
</body>
</html>