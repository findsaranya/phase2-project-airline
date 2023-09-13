package com.airline.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.FlightSearch;
import com.model.Passenger;

public class FlightSearchServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		res.setContentType("text/html");
		String travelDate = req.getParameter("travelDate");
		String src = req.getParameter("src");
		String dest = req.getParameter("dest");
		String totalCount = req.getParameter("totalCount");
		PrintWriter out = res.getWriter();
		if(travelDate != null && !travelDate.equals("") && src!=null && !src.equals("")
				&& dest!=null && !dest.equals("") && totalCount!=null && !totalCount.equals("")	
				){
			FlightSearch flightSearch = new FlightSearch(travelDate,src,dest,Integer.parseInt(totalCount));
			 HttpSession session=req.getSession(); 
			 List<Passenger> passengers = new LinkedList<Passenger>();
			 session.setAttribute("search", flightSearch);
			 session.setAttribute("count", 1);
			 session.setAttribute("passengers", passengers);
			req.getRequestDispatcher("flightDetails.jsp").forward(req, res);	
			
		}else {
			out.println("<h4 style='color: red;'>Fields's can't be empty!!</h4>");
			req.getRequestDispatcher("flightSearch.jsp").include(req, res);
		}
	}
}
