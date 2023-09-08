<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.entity.Places"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="placeDAO" class="com.dao.PlacesDAOImpl"></jsp:useBean>
<%
List<Places> srcList = placeDAO.getPlaceList();
request.setAttribute("srcList", srcList);

%>
<h1>Welcome to Airline Reservation</h1>
  <div>
    <a href="admin/loginForm.jsp">Admin Login</a>
  </div>
  <form action="search" method="post">
  <table border=1>
  <tr>
  <td>
    Date of Travel
  </td>
  <td><input type="date" name="travelDate" /></td>
  </tr>
    <tr>
  <td>
    Source
  </td>
  <td>
  <select style="width:150px;" name="src">
  <option value="">Select a Source</option>
  <c:forEach items="${srcList}" var="s">
  <option value="${s.getPlaceId()}">${s.getName()}</option>
  </c:forEach>
  </select></td>
  </tr>
   <tr>
  <td>
    Destination
  </td>
  <td><select style="width:150px;" name="dest">
  <option value="">Select an option</option>
  <c:forEach items="${srcList}" var="s">
  <option value="${s.getPlaceId()}">${s.getName()}</option>
  </c:forEach>
  </select></td>
  </tr>
  <tr>
  <td>No of Persons</td>
  <td><input type="number" min="1" name="totalCount"/></td>
  </tr>
  <tr>
  <td colspan=2 align="center">
  <input type="submit" value="search"/>
  <input type="reset" value="Reset"/>
  </td>
  </tr>
  </table>
  </form>
 
</body>
</html>