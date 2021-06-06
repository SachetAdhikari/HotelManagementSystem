package co.samundra.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import co.samundra.web.dao.user_credentialsDAO;

@WebServlet("/billController")
public class billController extends HttpServlet{
	private static final long serialVersionUID = 1L;
    public billController() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		System.out.println("in billController");
		HttpSession session = request.getSession();
		String cus_id = String.valueOf(session.getAttribute("loggedInUserId"));
		user_credentialsDAO uc = new user_credentialsDAO();
		String billDetail[] = uc.getBillDetails(cus_id);
		request.setAttribute("BookingId", billDetail[0]);
		request.setAttribute("Name", billDetail[1]);
		request.setAttribute("RoomNo", billDetail[2]);
		request.setAttribute("NoOfGuests", billDetail[3]);
		request.setAttribute("CurrentDate", billDetail[4]);
		request.setAttribute("RoomRate", billDetail[5]);
		request.setAttribute("ServiceRate", billDetail[6]);
		request.setAttribute("FoodRate", billDetail[7]);
		request.setAttribute("TotalBill", billDetail[8]);
		request.getRequestDispatcher("bill.jsp").forward(request, response);
	}
}
