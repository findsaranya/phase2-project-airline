<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.entity.Places"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Source</title>
</head>
<body>
<jsp:useBean id="placeDAO" class="com.dao.PlacesDAOImpl"></jsp:useBean>
<%
String id = request.getParameter("id");
request.setAttribute("id",id );
Places src = null;
if(id != null){
	src = placeDAO.getPlaceDetail(Integer.parseInt(id));
}
request.setAttribute("src", src);
%>
 <h1><c:if test="${id != null}">
                       Edit Place
                   </c:if>
                   <c:if test="${id == null}">
                       Add New Place
                   </c:if>
                   </h1>
<a href="home.jsp">Back</a>
 <c:if test="${id == null}">
           <form action="addPlaces.jsp"  method="post">
         </c:if>
 
 <c:if test="${id != null}">
           <form action="editPlaces.jsp" method="post">
            <input type="hidden" name="placeId" value="<c:out value='${src.getPlaceId()}' />" />
         </c:if>
<table border=1>
<tr>
<td>Place Name</td>
<td>
           <input type="text" name="name" value="<c:out value='${src.getName()}'/>"/>
</td>
</tr>
<tr>
<td>Code</td>
<td><input type="text" name="code" value="<c:out value='${src.getCode()}'/>"/></td>
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