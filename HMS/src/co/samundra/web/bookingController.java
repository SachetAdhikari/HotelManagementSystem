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
	@WebServlet("/booking")
	public class bookingController extends HttpServlet {
		private static final long serialVersionUID = 1L;
	    public bookingController() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("in bookingcontroller");
			PrintWriter out= response.getWriter();
			String Hotel = request.getParameter("Hotel");
			System.out.println(Hotel);
			String ac_nac = request.getParameter("room-type");
			System.out.println(ac_nac);
			String noofguest=request.getParameter("NoOfGuests");
			System.out.println(noofguest);
			String cin=request.getParameter("CinDate");
			System.out.println(cin);
			String cout=request.getParameter("CoutDate");
			System.out.println(cout);
			String room=request.getParameter("roomnumber");
			HttpSession session=request.getSession();
			String email = (String) session.getAttribute("email");
			System.out.println(email);
			//String email = request.getParameter("email");
			//String name = request.getParameter("fullname");
			//String cpassword = request.getParameter("cpassword");
			user_credentialsDAO uc = new user_credentialsDAO();
			//boolean result = uc.authenticateUser(email,password);
			if(Hotel!=null && room!=null){
				//uc.inputUserdetails(name,email,password);
				
				//HttpSession session= request.getSession();
				//session.setAttribute("email", email);
				uc.bookingDetails(Hotel,ac_nac,room,noofguest,cin,cout,email);
				//response.sendRedirect("./index.jsp");
				out.print("Success");
			}
			else{
				//response.sendRedirect("./signup.jsp");
				out.print("Nope");
			}
			
		}
}
