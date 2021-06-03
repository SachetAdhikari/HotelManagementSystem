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
	@WebServlet("/dashboard")
	public class dashboardController extends HttpServlet {
		private static final long serialVersionUID = 1L;
	    public dashboardController() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("in dashboardcontroller");
			PrintWriter out= response.getWriter();
			String foodid=request.getParameter("food");
			String rserviceid=request.getParameter("RemoveService");
			String aserviceid=request.getParameter("AddService");
			user_credentialsDAO uc = new user_credentialsDAO();
			HttpSession session=request.getSession();
			String email = (String) session.getAttribute("email");
			if(rserviceid!=null) {
				uc.removeservice(rserviceid,email);
				response.sendRedirect("./dashboard.jsp");
			}
			else if(foodid!=null) {
				uc.food(foodid,email);
				response.sendRedirect("./dashboard.jsp");
			}
			else if(aserviceid!=null) {
				uc.addservice(aserviceid,email);
				response.sendRedirect("./dashboard.jsp");
			}
			else {
				out.print("Nope");
			}
			//boolean result = uc.authenticateUser(email,password);
//			if(name!=null && email!=null && password.equals(cpassword)){
//				uc.inputUserdetails(name,email,password);
//				HttpSession session= request.getSession();
//				session.setAttribute("email", email);
//				response.sendRedirect("./dashboard.jsp");
//				out.print("Success");
//			}
//			else{
//				//response.sendRedirect("./signup.jsp");
//				out.print("Nope");
//			}
			
		}
}
