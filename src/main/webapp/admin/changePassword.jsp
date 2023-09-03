<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="adminDAO" class="com.dao.AdminDAOImpl"></jsp:useBean>
     <%
     String newPassword = request.getParameter("password");
     String confirmPassword = request.getParameter("confirm");
     if(newPassword != null && !newPassword.isBlank() && !newPassword.isEmpty() && confirmPassword != null 
    		 && !confirmPassword.isBlank() && !confirmPassword.isEmpty() ){
    		 if(newPassword.equals(confirmPassword)){%>
   <jsp:useBean id="admin" class="com.entity.Admin"></jsp:useBean>
   <jsp:setProperty property="*" name="admin"/>
    		<%
    		int result = adminDAO.updateAdminPassword(admin);
    		 if(result == 1){
    			 out.println("updated successfully");
    		 }
    		 }else{ out.println("password not matching");%>
    		 
    			 <jsp:include page="changePasswordForm.jsp"></jsp:include> 
    			 
    		<%  }
    		 
    		 
    		 %>
                                                                                                                                                                                                                                              
    	 
  
     
     <%}else{
     out.println("new and confirm can't be empty");
     %>
     
   <jsp:include page="changePasswordForm.jsp"></jsp:include>
     <%}
     
     %>
    