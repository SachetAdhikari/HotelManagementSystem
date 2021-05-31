package co.samundra.web.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//@WebFilter({ "/dashboard.jsp", "/booking.jsp" })
public class sessionCheckFilter implements Filter {

    public sessionCheckFilter() {
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
		PrintWriter out= response.getWriter();
		
		HttpServletRequest req =(HttpServletRequest) request;
//		String email = request.getParameter("email");
		HttpSession session= req.getSession();
//		String email= session.getAttribute("email");
		if(session.getAttribute("email")!=null )
			chain.doFilter(request, response);
		else
			out.println("Login to continue");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
