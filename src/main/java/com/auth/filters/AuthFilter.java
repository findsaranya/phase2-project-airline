package com.auth.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AuthFilter
 */
@WebFilter("/AuthFilter")
public class AuthFilter extends HttpFilter implements Filter {
       
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * @see HttpFilter#HttpFilter()
     */
    public AuthFilter() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		 HttpServletRequest httpRequest = (HttpServletRequest) request;
	        HttpSession session = httpRequest.getSession(false);
	        
	        boolean isLoggedIn = (session != null && session.getAttribute("loggedIn") != null) ? (boolean) session.getAttribute("loggedIn") : false; ;
	        
	        String loginURI = httpRequest.getContextPath() + "/admin/";
	 
	        boolean isLoginRequest = httpRequest.getRequestURI().equals(loginURI);
	 
	        boolean isLoginPage = httpRequest.getRequestURI().endsWith("loginForm.jsp");
	 
	        if (isLoggedIn  ) {
	            // the admin is already logged in and he's trying to login again
	            // then forwards to the admin's homepage
	            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/home.jsp");
	            dispatcher.forward(request, response);
	 
	        } 
//	        else if (isLoggedIn || isLoginRequest) {
//	            // continues the filter chain
//	            // allows the request to reach the destination
//	            chain.doFilter(request, response);
//	 
//	        } 
//	        
	        else {
	            // the admin is not logged in, so authentication is required
	            // forwards to the Login page
	            RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/loginForm.jsp");
	            dispatcher.forward(request, response);
	 
	        }
//		 if(newSession.getAttribute("loggedIn") != null) {
//			 Boolean result = (Boolean) newSession.getAttribute("loggedIn");
//			 if(result == true) {
//				// pass the request along the filter chain
//					chain.doFilter(request, response);
//			 }
//		 }else {
//			 PrintWriter pw = response.getWriter();
//			 pw.println("Access Denied");
//			 request.getRequestDispatcher("index.jsp").forward(req, response);
//		 }
          System.out.println("filter called");
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
