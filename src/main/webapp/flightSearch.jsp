<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.entity.Source"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="sourceDAO" class="com.dao.SourceDAOImpl"></jsp:useBean>
<%
List<Source> srcList = sourceDAO.getSourceList();
request.setAttribute("srcList", srcList);

%>
<h1>Welcome to Airline Reservation</h1>
  <div>
    <a href="login.html">Admin Login</a>
  </div>
  <form action="/search" method="post">
  <table>
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
  <%out.println(srcList); %>
  <select style="width:150px;">
  <c:forEach items="${srcList}" var="s">
  <option value="${s.getSourceId()}">${s.getName()}</option>
  </c:forEach>
  </select></td>
  </tr>
   <tr>
  <td>
    Destination
  </td>
  <td><select>
  <option>1</option>
  </select></td>
  </tr>
  </table>
   <input type="date" name="date"/>
  </form>
 
</body>
</html>