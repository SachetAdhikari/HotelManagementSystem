package co.samundra.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public loginController() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out= response.getWriter();
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		userCredentialsDAO uc = new userCredentialsDAO();
		boolean result = uc.authenticateUser(email,password);
		if(result==true){
			HttpSession session= request.getSession();
			session.setAttribute("email", email);
//			response.sendRedirect(index.jsp);
			out.print("Success");
		}
		else{
//			response.sendRedirect("index.jsp");
			out.print("Nope");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}