package com.airline.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.FlightDAOImpl;
import com.model.FlightSearch;

public class FlightSearchServlet extends HttpServlet {

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		res.setContentType("text/html");
		String travelDate = req.getParameter("travelDate");
		String src = req.getParameter("src");
		String dest = req.getParameter("dest");
		String totalCount = req.getParameter("totalCount");
		PrintWriter out = res.getWriter();
		FlightDAOImpl flightDAO = new FlightDAOImpl();
		if(travelDate != null && !travelDate.equals("") && src!=null && !src.equals("")
				&& dest!=null && !dest.equals("") && totalCount!=null && !totalCount.equals("")	
				){
			FlightSearch flightSearch = new FlightSearch(travelDate,src,dest,Integer.parseInt(totalCount));
			 HttpSession session=req.getSession();  
			 session.setAttribute("search", flightSearch);
			 //req.setAttribute("search", flightSearch);
//		out.println("pass");
//		out.println(travelDate);
//		out.println(src);
//		out.println(dest);
//		out.println(totalCount);
//		out.println(flightDAO.searchFlights(src, dest));
			req.getRequestDispatcher("flightDetails.jsp").forward(req, res);	
			
		}else {
			out.println("<h4 style='color: red;'>Fields's can't be empty!!</h4>");
			req.getRequestDispatcher("flightSearch.jsp").include(req, res);
		}
	}
}
