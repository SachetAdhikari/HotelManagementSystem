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
	@WebServlet("/selectHotel")
	public class selecthotel extends HttpServlet {
		private static final long serialVersionUID = 1L;
	    public selecthotel() {
	        super();
	        // TODO Auto-generated constructor stub
	    }
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("in selecthotelcontroller");
			response.sendRedirect("./index.jsp");
			
		}
}
