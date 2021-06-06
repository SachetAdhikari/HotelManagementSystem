package co.samundra.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import co.samundra.web.dao.user_credentialsDAO;

@WebServlet("/pay")
public class payController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    public payController() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{    
    	HttpSession session = request.getSession();
    	String cus_id = String.valueOf(session.getAttribute("loggedInUserId"));
    	user_credentialsDAO uc = new user_credentialsDAO();
    	float total_amount = Float.parseFloat(request.getParameter("pay"));
    	String bill_id = uc.insertIntoBill(total_amount, cus_id);
    	uc.setBookingstatus(cus_id);
    	uc.insertIntoCustomerBill(bill_id, cus_id);
    	uc.deleteFromCustomerFood(cus_id);
    	uc.deleteFromCustomerServices(cus_id);
    	uc.setRoomStatus(cus_id);
    	session.setAttribute("userStatus", "CurrentlyVacant");
    	response.sendRedirect("logout");
    }
}
