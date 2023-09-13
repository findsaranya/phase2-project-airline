package com.auth.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

		    HttpServletRequest httpRequest = (HttpServletRequest) request;
		    HttpServletResponse httpResponse = (HttpServletResponse) response;
	        
		    HttpSession session = httpRequest.getSession(false);
	        
	        boolean isLoggedIn = (session != null && session.getAttribute("loggedIn") != null) ? (boolean) session.getAttribute("loggedIn") : false; ;
	        
	        String loginURI = httpRequest.getContextPath() + "/admin/login.jsp";
	 
	        boolean isLoginRequest = httpRequest.getRequestURI().equals(loginURI);
	 
	        boolean isLoginPage = httpRequest.getRequestURI().endsWith("loginForm.jsp");
	 
	        if (isLoggedIn && (isLoginRequest || isLoginPage) ) {	            
	            httpResponse.sendRedirect(httpRequest.getContextPath()+"/admin/home.jsp");
	            
	 
	        } 
	        else if (isLoggedIn || isLoginRequest || isLoginPage) {
	        	
	            chain.doFilter(request, response);
	 
	        } 	        
	        else {
	        	httpResponse.sendRedirect(httpRequest.getContextPath()+"/admin/loginForm.jsp");
	        	
	 
	        }

		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
