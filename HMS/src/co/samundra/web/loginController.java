package co.samundra.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.samundra.web.dao.user_credentialsDAO;

@WebServlet("/login")
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public loginController() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("in logincontroller");
		PrintWriter out= response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		user_credentialsDAO uc = new user_credentialsDAO();
		boolean result = uc.authenticateUser(email,password);
		if(result==true){
			HttpSession session= request.getSession();
			session.setAttribute("email", email);
			response.sendRedirect("./booking.jsp");
			//out.print("Success");
		}
		else{
//			response.sendRedirect("index.jsp");
			out.print("Nope");
		}
		
	}
}
