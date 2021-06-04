package co.samundra.web;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.sun.tools.javac.util.List;

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
			HttpSession session = request.getSession();
		    String Hotel = (String)session.getAttribute("Hotel");
		    String ac_nac = (String)session.getAttribute("room-type");
		    String cin = (String)session.getAttribute("CinDate");
		    String cout = (String)session.getAttribute("CoutDate");
		    String noofguest=(String)session.getAttribute("NoOfGuests");
		    String s1=(String)session.getAttribute("service1");
		    String s2=(String)session.getAttribute("service2");
		    String s3=(String)session.getAttribute("service3");
		    String room=request.getParameter("roomno");
		    System.out.println(Hotel);
		    System.out.println(ac_nac);
		    System.out.println(cin);
		    System.out.println(cout);
		    System.out.println(noofguest);
		    System.out.println(s1);
		    System.out.println(s2);
		    System.out.println(s3);
//			String Hotel = request.getParameter("Hotel");
//			System.out.println(Hotel);
//			String ac_nac = request.getParameter("room-type");
//			System.out.println(ac_nac);
//			String noofguest=request.getParameter("NoOfGuests");
//			System.out.println(noofguest);
//			String cin=request.getParameter("CinDate");
//			System.out.println(cin);
//			String cout=request.getParameter("CoutDate");
//			System.out.println(cout);
//			String room=request.getParameter("RoomNumber");
//			System.out.println(room);
//			HttpSession session=request.getSession();
			String email = (String) session.getAttribute("email");
			
//			System.out.println(email);
//			String s1= request.getParameter("service1");
//			String s2=request.getParameter("service2");
//			String s3=request.getParameter("service3");
			//String email = request.getParameter("email");
			//String name = request.getParameter("fullname");
			//String cpassword = request.getParameter("cpassword");
			user_credentialsDAO uc = new user_credentialsDAO();
			//boolean result = uc.authenticateUser(email,password);
			if(room!=null){
				//uc.inputUserdetails(name,email,password);
				
				//HttpSession session= request.getSession();
				//session.setAttribute("email", email);
				uc.bookingDetails (Hotel,ac_nac,room,noofguest,cin,cout,email,s1,s2,s3);
				response.sendRedirect("./dashboard.jsp");
				//out.print("Success");
			}
			else{
				//response.sendRedirect("./signup.jsp");
				out.print("Nope");
			}
			
		}
}
