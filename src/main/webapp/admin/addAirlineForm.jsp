<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.entity.Airline"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add a Airline</title>
</head>
<body>
<jsp:useBean id="airlineDAO" class="com.dao.AirlineDAOImpl"></jsp:useBean>
<%
String id = request.getParameter("id");
request.setAttribute("id",id );
Airline src = null;
if(id != null){
	src = airlineDAO.getAirLineDetail(Integer.parseInt(id));
}
request.setAttribute("src", src);
%>
 <h1><c:if test="${id != null}">
                       Edit a Airline
                   </c:if>
                   <c:if test="${id == null}">
                       Add a New Airline
                   </c:if>
                   </h1>
<a href="home.jsp">Back</a><br>

 <c:if test="${id == null}">
           <form action="addAirline.jsp"  method="post">
         </c:if>
 
 <c:if test="${id != null}">
           <form action="editAirline.jsp" method="post">
            <input type="hidden" name="airlineId" value="<c:out value='${src.getAirlineId()}' />" />
         </c:if>
<table border=1>
<tr>
<td>Airline Name</td>
<td>
           <input type="text" name="airlineName" value="<c:out value='${src.getAirlineName()}'/>"/>
</td>
</tr>
<tr>
<td>Airline Code</td>
<td><input type="text" name="airlineCode" value="<c:out value='${src.getAirlineCode()}'/>"/></td>
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

</form>
</body>
</html>