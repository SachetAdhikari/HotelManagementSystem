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
	@WebServlet("/signup")
	public class SignupController extends HttpServlet {
		private static final long serialVersionUID = 1L;
	    public SignupController() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("in signupcontroller");
			PrintWriter out= response.getWriter();
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			//String address = request.getParameter("address");
			String name = request.getParameter("fullname");
			String cpassword = request.getParameter("cpassword");
			user_credentialsDAO uc = new user_credentialsDAO();
			//boolean result = uc.authenticateUser(email,password);
			if(name!=null && email!=null && password.equals(cpassword)){
				int cus_id = uc.inputUserdetails(name,email,password);
				HttpSession session= request.getSession();
				session.setAttribute("email", email);
				session.setAttribute("loggedInUserId", cus_id);
				session.setAttribute("userStatus", "NewUser");
				response.sendRedirect("./index.jsp#hotels");
			}
			else{
				//response.sendRedirect("./signup.jsp");
				out.print("Nope");
			}
			
		}
}
