<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.model.FlightSearch,com.model.Passenger,java.util.*"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
    <%
    
String flightId = (String)session.getAttribute("flightId");
FlightSearch flightSearch = (FlightSearch)session.getAttribute("search");
int count = session.getAttribute("count") == null ? 2 : (int)session.getAttribute("count")+1;
String name = request.getParameter("fullName");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String adhar = request.getParameter("adharNo");
if(name != null && !name.equals("") && email!=null && !email.equals("") && mobile!=null && !mobile.equals("") && adhar!=null && !adhar.equals("") ){
%>
<jsp:useBean id="passengerInfo" class="com.model.Passenger"></jsp:useBean>
<jsp:setProperty property="*" name="passengerInfo"/>


<% 
List<Passenger> passDetail =(List<Passenger>) session.getAttribute("passengers");
passDetail.add(passengerInfo);
if(count <= flightSearch.getCount() ){
		session.setAttribute("count", count);
		session.setAttribute("passengers", passDetail);
		response.sendRedirect("passengerForm.jsp?count="+count+"&flightId="+flightId);
	}else{
		request.getRequestDispatcher("paymentForm.jsp").forward(request, response);
		
	}
}else{
	out.println("<h4 style='color: red;'>Airline code and name are invalid!!</h4>");
	request.getRequestDispatcher("passengerForm.jsp?count="+count+"&flightId="+flightId).include(request, response);
}
%>
