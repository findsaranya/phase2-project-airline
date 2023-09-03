<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="sourceDAO" class="com.dao.SourceDAOImpl"></jsp:useBean>
<jsp:useBean id="source" class="com.entity.Source"></jsp:useBean>  
<jsp:setProperty property="*" name="source"/> 
<%  
String id = request.getParameter("id");
int result = sourceDAO.deleteSource(Integer.parseInt(id));
if(result == 1){
	response.sendRedirect("viewSources.jsp");
}
  
%> 