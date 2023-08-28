package com.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ISourceDAO;
import com.dao.SourceDAOImpl;
import com.entity.Source;

public class Servlet1 extends HttpServlet{
	 Source source = new Source();
     ISourceDAO sourceDAOImpl = new SourceDAOImpl();
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException {
		PrintWriter pw = res.getWriter();
		pw.println("<h1>Welcome</h1>");
		source.setName("source 1");
		int result = sourceDAOImpl.createSource(source);
		pw.println("Result = "+result);
	}

}
