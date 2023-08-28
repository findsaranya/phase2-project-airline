<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.entity.Source"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Source</title>
</head>
<body>
<jsp:useBean id="sourceDAO" class="com.dao.SourceDAOImpl"></jsp:useBean>
<%
String id = request.getParameter("id");
request.setAttribute("id",id );
Source src = null;
if(id != null){
	src = sourceDAO.getSourceDetail(Integer.parseInt(id));
	out.println("sources" + src);
}
request.setAttribute("src", src);
%>
 <h1><c:if test="${id != null}">
                       Edit Source
                   </c:if>
                   <c:if test="${id == null}">
                       Add New Source
                   </c:if>
                   </h1>
<%-- <jsp:include page="sourceForm.html"></jsp:include> --%>

 <c:if test="${id == null}">
           <form action="addSource.jsp"  method="post">
         </c:if>
 
 <c:if test="${id != null}">
           <form action="editSource.jsp" method="post">
            <input type="hidden" name="sourceId" value="<c:out value='${src.getSourceId()}' />" />
         </c:if>
<table>
<tr>
<td>Source Name</td>
<td>
<%-- <c:if test="${src != null}"> --%>
           <input type="text" name="name" value="<c:out value='${src.getName()}'/>"/>
        <%--  </c:if>
<c:if test="${src == null}">
           <input type="text" name="name" />
         </c:if> --%>

</td>
</tr>
<tr>
<td>City</td>
<td><input type="text" name="city" value="<c:out value='${src.getCity()}'/>"/></td>
</tr>
<tr>
<td>State</td>
<td><input type="text" name="state" value="<c:out value='${src.getState()}'/>"/></td>
</tr>
<tr>
<td>Country</td>
<td><input type="text" name="country" value="<c:out value='${src.getCountry()}'/>"/></td>
</tr>
<tr>
<td colspan="2">
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