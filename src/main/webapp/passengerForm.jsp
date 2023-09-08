<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
out.println(session.getAttribute("search"));
%>
<form>
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
<td><input name="mobile" type="number" min="7" max="10"/></td>
</tr>
<tr>
<td>Adhar No</td>
<td><input name="adharNo" type="text"  maxlength="12"/></td>
</tr>
<tr>
<td colspan=2></td>
<td>
<input value="Reset" type="reset"/>
<%
%>
<input value="Next" type="submit"/>

</td>
</tr>
</table>
</form>
</body>
</html>